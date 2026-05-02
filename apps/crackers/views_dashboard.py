from django.views.generic import ListView, DetailView, TemplateView
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib.auth import login, logout
from django.shortcuts import redirect, get_object_or_404
from django.urls import reverse_lazy
from django.http import HttpResponse, JsonResponse
import csv
import json
import decimal
from django.views import View
from django.db import transaction
from django.db.models import Q, Prefetch, IntegerField, Value, Min, Case, When, Sum, Count
from django.db.models.functions import Cast, Coalesce, LPad
from .models import Category, Product, OnlineSales, OnlineSalesItem, Customer, Pricelist, PricelistItem, Coupon, CustomerAddress, Banner
from .services import OrderService
from apps.users.models import User

class AdminRequiredMixin(UserPassesTestMixin):
    def test_func(self):
        return self.request.user.is_authenticated and self.request.user.role and self.request.user.role.name in ['Admin', 'Super Admin']

class DashboardCategoryListView(LoginRequiredMixin, AdminRequiredMixin, ListView):
    model = Category
    template_name = 'dashboard/categories.html'
    context_object_name = 'categories'
    paginate_by = 30
    
    def get_queryset(self):
        qs = Category.objects.filter(is_active=True).order_by('order')
        query = self.request.GET.get('q')
        if query:
            qs = qs.filter(name__icontains=query)
        return qs

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['search_query'] = self.request.GET.get('q', '')
        return context


class DashboardProductListView(LoginRequiredMixin, AdminRequiredMixin, ListView):
    model = Product
    template_name = 'dashboard/products.html'
    context_object_name = 'products'
    # paginate_by = 50
    
    def get_queryset(self):
        qs = Product.objects.filter(is_active=True, category__is_active=True).select_related('category')
        
        # Filter: code exists
        qs = qs.filter(code__isnull=False).exclude(code='')
        
        # Annotation for numerical sorting by code
        qs = qs.annotate(
            padded_code=LPad('code', 10, Value('0'))
        ).order_by('padded_code')
        
        category_name = self.request.GET.get('category')
        if category_name and category_name != 'All':
            qs = qs.filter(category__name=category_name)

        status = self.request.GET.get('status')
        if status == 'Enabled' or status == 'Active':
            qs = qs.filter(is_disabled=0)
        elif status == 'Disabled' or status == 'Inactive':
            qs = qs.filter(is_disabled=1)
            
        query = self.request.GET.get('q')
        if query:
            qs = qs.filter(Q(name__icontains=query) | Q(code__icontains=query))
        return qs

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['categories'] = Category.objects.filter(is_active=True).order_by('order')
        context['selected_category'] = self.request.GET.get('category', 'All')
        context['selected_status'] = self.request.GET.get('status', 'All')
        context['search_query'] = self.request.GET.get('q', '')
        return context

class ProductToggleActiveView(LoginRequiredMixin, AdminRequiredMixin, View):
    def post(self, request, pk):
        try:
            product = Product.objects.get(pk=pk)
            # is_disabled: 0 = Enabled, 1 = Disabled
            product.is_disabled = 1 if product.is_disabled == 0 else 0
            product.save()
            return JsonResponse({'status': 'success', 'is_enabled': product.is_disabled == 0})
        except Product.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Product not found'}, status=404)

class DashboardOrderListView(LoginRequiredMixin, AdminRequiredMixin, ListView):
    model = OnlineSales
    template_name = 'dashboard/orders.html'
    context_object_name = 'orders'
    paginate_by = 20
    
    def get_queryset(self):
        qs = OnlineSales.objects.all().select_related('customer', 'customer_address').order_by('-trans_dt')
        status = self.request.GET.get('status')
        if status and status != 'All':
            # Support case-insensitive matching for robust filtering
            status_upper = status.upper()
            if status_upper == 'ORDERED':
                qs = qs.filter(Q(status__iexact='ORDERED') | Q(status__iexact='ordered') | Q(status__iexact='New'))
            elif status_upper == 'PACKED':
                qs = qs.filter(Q(status__iexact='PACKED') | Q(status__iexact='packed') | Q(status__iexact='Progressing'))
            elif status_upper == 'DISPATCHED':
                qs = qs.filter(Q(status__iexact='DISPATCHED') | Q(status__iexact='dispatched') | Q(status__iexact='distached') | Q(status__iexact='Shipped'))
            elif status_upper == 'DELIVERED':
                qs = qs.filter(Q(status__iexact='DELIVERED') | Q(status__iexact='delivered') | Q(status__iexact='deliveryed'))
            elif status_upper == 'IN TRANSIT':
                qs = qs.filter(Q(status__iexact='IN TRANSIT') | Q(status__iexact='inTransit'))
            else:
                qs = qs.filter(status__iexact=status)
            
        category = self.request.GET.get('category')
        if category and category != 'All':
            qs = qs.filter(items__product__category__name=category).distinct()
            
        year = self.request.GET.get('year')
        query = self.request.GET.get('q')

        # Default to current year only if no explicit year and no search query
        if not year and not query:
            from datetime import datetime
            year = str(datetime.now().year)
            
        if year and year != 'All' and not query:
            qs = qs.filter(trans_no__startswith=year)
            
        if query:
            qs = qs.filter(Q(trans_no__icontains=query) | Q(customer__name__icontains=query))
            
        return qs

    def get_context_data(self, **kwargs):
        from datetime import datetime
        context = super().get_context_data(**kwargs)
        context['search_query'] = self.request.GET.get('q', '')
        context['selected_status'] = self.request.GET.get('status', 'All')
        context['selected_category'] = self.request.GET.get('category', 'All')
        
        current_year = datetime.now().year
        context['selected_year'] = self.request.GET.get('year', str(current_year))
        
        context['statuses'] = ['ORDERED', 'PACKED', 'DISPATCHED', 'IN TRANSIT', 'DELIVERED', 'ON HOLD', 'CANCELLED']
        context['categories'] = Category.objects.filter(is_active=True).order_by('order')
        # Generate years from 2024 to current year
        context['years'] = [str(y) for y in range(2024, current_year + 1)]
        return context

class DashboardOrderDetailView(LoginRequiredMixin, AdminRequiredMixin, DetailView):
    model = OnlineSales
    template_name = 'dashboard/order_detail.html'
    context_object_name = 'order'
    slug_field = 'trans_no'
    slug_url_kwarg = 'trans_no'
    
    def get_context_data(self, **kwargs):
        from django.db.models import Sum
        context = super().get_context_data(**kwargs)
        # Optimize by pre-fetching products for all items in one go
        items = self.object.items.all().select_related('product', 'product__category').order_by('item_code')
        context['items'] = items
        context['total_qty'] = items.aggregate(Sum('qty'))['qty__sum'] or 0
        return context

from django.utils.decorators import method_decorator
from django.views.decorators.clickjacking import xframe_options_exempt

@method_decorator(xframe_options_exempt, name='dispatch')
class DashboardOrderEstimateView(LoginRequiredMixin, AdminRequiredMixin, DetailView):
    model = OnlineSales
    template_name = 'dashboard/order_estimate.html'
    context_object_name = 'order'
    slug_field = 'trans_no'
    slug_url_kwarg = 'trans_no'
    
    def get_context_data(self, **kwargs):
        from django.db.models import Sum
        context = super().get_context_data(**kwargs)
        items = self.object.items.all().select_related('product').order_by('item_code')
        
        # Pre-calculate values for the template to match the image columns
        for item in items:
            item.unit_rate = item.rate
            # Image shows Discount per unit? Let's check: 540 rate, 270 disc, 270 final, 540 amt for 2 qty.
            # (540 - 270) * 2 = 540. So yes, discount in image is per unit.
            if item.qty > 0:
                item.unit_discount = item.discount_amt / item.qty
                item.final_rate = item.item_total / item.qty
            else:
                item.unit_discount = 0
                item.final_rate = 0
        
        context['items'] = items
        context['total_qty'] = items.aggregate(Sum('qty'))['qty__sum'] or 0
        context['total_items'] = items.count()
        return context

class DashboardOrderDownloadView(LoginRequiredMixin, AdminRequiredMixin, DetailView):
    model = OnlineSales
    slug_field = 'trans_no'
    slug_url_kwarg = 'trans_no'
    
    def get(self, request, *args, **kwargs):
        from django.template.loader import get_template
        from xhtml2pdf import pisa
        from io import BytesIO
        from django.http import HttpResponse
        from django.db.models import Sum
        
        self.object = self.get_object()
        template = get_template('dashboard/order_estimate_pdf.html')
        
        items = self.object.items.all().select_related('product').order_by('item_code')
        for item in items:
            item.unit_rate = item.rate
            if item.qty > 0:
                item.unit_discount = item.discount_amt / item.qty
                item.final_rate = item.item_total / item.qty
            else:
                item.unit_discount = 0
                item.final_rate = 0

        context = {
            'order': self.object,
            'items': items,
            'total_qty': items.aggregate(Sum('qty'))['qty__sum'] or 0,
            'total_items': items.count(),
        }
        
        html = template.render(context)
        result = BytesIO()
        pdf = pisa.pisaDocument(BytesIO(html.encode("UTF-8")), result)
        
        if not pdf.err:
            response = HttpResponse(result.getvalue(), content_type='application/pdf')
            response['Content-Disposition'] = f'attachment; filename="Estimate_{self.object.trans_no}.pdf"'
            return response
        return HttpResponse('Error generating PDF', status=400)

class DashboardCustomerListView(LoginRequiredMixin, AdminRequiredMixin, ListView):
    model = Customer
    template_name = 'dashboard/customers.html'
    context_object_name = 'customers'
    paginate_by = 50
    
    def get_queryset(self):
        from django.db.models import Count
        qs = Customer.objects.all().prefetch_related('addresses', 'addresses__state', 'users').annotate(
            order_count=Count('sales')
        )
        
        # Sorting
        sort = self.request.GET.get('sort', 'name')
        direction = self.request.GET.get('dir', 'desc')
        prefix = '-' if direction == 'desc' else ''
        
        if sort == 'orders':
            qs = qs.order_by(f'{prefix}order_count', 'name')
        else: 
            qs = qs.order_by('name')
        
        # Status Filter
        status = self.request.GET.get('status')
        if status == 'Enabled' or status == 'Active':
            qs = qs.filter(is_active=True)
        elif status == 'Disabled' or status == 'Inactive':
            qs = qs.filter(is_active=False)
            
        # Orders Filter
        order_filter = self.request.GET.get('orders')
        if order_filter == 'With':
            qs = qs.filter(order_count__gt=0)
        elif order_filter == 'None':
            qs = qs.filter(order_count=0)
            
        # Search Filter
        query = self.request.GET.get('q')
        if query:
            qs = qs.filter(
                Q(name__icontains=query) | 
                Q(contact_person_no__icontains=query) |
                Q(users__phone_number__icontains=query)
            ).distinct()
            
        return qs

    def get_context_data(self, **kwargs):
        from django.db.models import Count, Sum
        context = super().get_context_data(**kwargs)
        context['search_query'] = self.request.GET.get('q', '')
        context['selected_status'] = self.request.GET.get('status', 'All')
        context['selected_orders'] = self.request.GET.get('orders', 'All')
        context['sort_by'] = self.request.GET.get('sort', 'name')
        context['sort_dir'] = self.request.GET.get('dir', 'asc')
        
        # Calculate total orders across all customers (filtered by search/status if desired, but usually global)
        context['total_customers'] = Customer.objects.count()
        context['total_orders'] = OnlineSales.objects.count()
        
        from .models import State
        context['states'] = State.objects.filter(is_active=True).order_by('name')
        
        return context

class DashboardCustomerExportView(DashboardCustomerListView):
    def get_paginate_by(self, queryset):
        return None  # Disable pagination for export

    def get(self, request, *args, **kwargs):
        response = HttpResponse(content_type='text/csv')
        response['Content-Disposition'] = 'attachment; filename="customers_full_report.csv"'
        
        writer = csv.writer(response)
        writer.writerow(['S.No', 'Name', 'Phone', 'Email', 'Address', 'City', 'State', 'Pincode', 'Orders Count', 'Status'])
        
        queryset = self.get_queryset()
        for i, customer in enumerate(queryset, 1):
            addr = customer.addresses.first()
            user = customer.users.first()
            writer.writerow([
                i,
                customer.name,
                addr.phone if addr else customer.contact_person_no,
                addr.email if addr else '',
                f"{addr.address1} {addr.address2}" if addr else '',
                addr.city_name if addr else '',
                addr.state.name if addr and addr.state else '',
                addr.pincode if addr else '',
                customer.order_count,
                'Active' if customer.is_active else 'Inactive'
            ])
            
        return response

class CustomerToggleActiveView(LoginRequiredMixin, AdminRequiredMixin, View):
    def post(self, request, pk):
        try:
            customer = Customer.objects.get(pk=pk)
            customer.is_active = not customer.is_active
            customer.save()
            
            # Optionally also deactivate associated user
            # User.objects.filter(online_customer=customer).update(is_active=customer.is_active)
            
            return JsonResponse({'status': 'success', 'is_active': customer.is_active})
        except Customer.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Customer not found'}, status=404)

class CustomerDetailAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def get(self, request, pk):
        try:
            customer = Customer.objects.prefetch_related('addresses').get(pk=pk)
            addr = customer.addresses.first()
            user = customer.users.first()
            
            data = {
                'id': customer.id,
                'name': customer.name,
                'company': customer.company or '',
                'contact_person': customer.contact_person or '',
                'contact_person_no': customer.contact_person_no or (user.phone_number if user else ''),
                'email': addr.email if addr else '',
                'address1': addr.address1 if addr else '',
                'address2': addr.address2 if addr else '',
                'city_name': addr.city_name if addr else '',
                'pincode': addr.pincode if addr else '',
                'state_id': addr.state_id if addr and addr.state else '',
                'is_active': customer.is_active,
                'username': user.username if user else '',
            }
            return JsonResponse({'status': 'success', 'data': data})
        except Customer.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Customer not found'}, status=404)

class CustomerUpdateAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def post(self, request, pk):
        import json
        try:
            customer = Customer.objects.get(pk=pk)
            data = json.loads(request.body)
            
            customer.name = data.get('name', customer.name)
            # Remove company and contact_person update logic if not needed, 
            # but keeping it in DB is fine as long as UI is removed.
            customer.save()
            
            # Update Address
            addr = customer.addresses.first()
            if addr:
                addr.email = data.get('email', addr.email)
                addr.address1 = data.get('address1', addr.address1)
                addr.address2 = data.get('address2', addr.address2)
                addr.city_name = data.get('city_name', addr.city_name)
                addr.pincode = data.get('pincode', addr.pincode)
                if data.get('state_id'):
                    addr.state_id = data.get('state_id')
                addr.save()
            
            return JsonResponse({'status': 'success', 'message': 'Customer updated successfully'})
        except Customer.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Customer not found'}, status=404)
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

class DashboardCustomerPrintView(DashboardCustomerListView):
    template_name = 'dashboard/customers_print.html'
    
    def get_paginate_by(self, queryset):
        return None # Disable pagination for printing

class AdminActiveCategoryListView(LoginRequiredMixin, AdminRequiredMixin, ListView):
    model = Category
    template_name = 'admin/active_categories.html'
    context_object_name = 'categories'
    
    def get_queryset(self):
        qs = Category.objects.filter(is_active=True).order_by('order')
        query = self.request.GET.get('q')
        if query:
            qs = qs.filter(name__icontains=query)
        return qs

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['search_query'] = self.request.GET.get('q', '')
        return context

class DashboardAnalysisView(LoginRequiredMixin, AdminRequiredMixin, TemplateView):
    template_name = 'dashboard/analysis.html'

class DashboardReportCreateView(LoginRequiredMixin, AdminRequiredMixin, TemplateView):
    template_name = 'dashboard/report_create.html'

class DashboardPricelistListView(LoginRequiredMixin, AdminRequiredMixin, ListView):
    model = Pricelist
    template_name = 'dashboard/pricelists.html'
    context_object_name = 'pricelists'
    
    def get_queryset(self):
        from django.db.models import Count
        qs = Pricelist.objects.all().annotate(items_count=Count('items')).order_by('list_name')
        query = self.request.GET.get('q')
        if query:
            qs = qs.filter(Q(list_name__icontains=query) | Q(list_desc__icontains=query))
        return qs

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['search_query'] = self.request.GET.get('q', '')
        return context

class PricelistToggleActiveView(LoginRequiredMixin, AdminRequiredMixin, View):
    def post(self, request, pk):
        try:
            pricelist = Pricelist.objects.get(pk=pk)
            # is_active is Integer (1 or 0)
            pricelist.is_active = 0 if pricelist.is_active == 1 else 1
            pricelist.save()
            return JsonResponse({'status': 'success', 'is_active': pricelist.is_active == 1})
        except Pricelist.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Pricelist not found'}, status=404)

class DashboardPricelistCreateView(LoginRequiredMixin, AdminRequiredMixin, TemplateView):
    template_name = 'dashboard/pricelist_create.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Fetch products grouped by category, ordered by sortNo
        product_qs = Product.objects.filter(is_active=True).select_related('unit').order_by('sort_no', 'name')
        
        # Categories ordered by their order field (sortNo in DB)
        context['categories'] = Category.objects.filter(is_active=True).prefetch_related(
            Prefetch('products', queryset=product_qs)
        ).order_by('order', 'name')

        # Get all unique pricelist names for the "View Pricelist" dropdown
        context['existing_pricelists'] = Pricelist.objects.values_list('list_name', flat=True).distinct().order_by('list_name')

        # Add pricelist counts for the footer
        all_pricelists = Pricelist.objects.all()
        context['total_pricelists'] = all_pricelists.count()
        context['active_pricelists'] = all_pricelists.filter(is_active=1).count()
        context['inactive_pricelists'] = all_pricelists.filter(is_active=0).count()
        
        return context

def get_next_pl_version(current_version):
    try:
        # Simple format: 1.0, 2.0, 3.0...
        major, minor = map(int, current_version.split('.'))
        return f"{major + 1}.0"
    except (ValueError, AttributeError, IndexError):
        return "1.0"

class PricelistSaveView(LoginRequiredMixin, AdminRequiredMixin, View):
    def post(self, request):
        import json
        from django.db import transaction
        try:
            data = json.loads(request.body)
            name = data.get('name')
            desc = data.get('description', '')
            items_data = data.get('items', [])
            save_mode = data.get('save_mode', 'NEW_PRICELIST') # NEW_PRICELIST, NEW_VERSION
            
            if not name:
                return JsonResponse({'status': 'error', 'message': 'Pricelist name is required'}, status=400)

            with transaction.atomic():
                version = "1.0"
                if save_mode == 'NEW_VERSION':
                    latest_pl = Pricelist.objects.filter(list_name=name).order_by('-created_at').first()
                    if latest_pl:
                        version = get_next_pl_version(latest_pl.pl_version)
                
                # Double check uniqueness for the calculated version
                if Pricelist.objects.filter(list_name=name, pl_version=version).exists():
                    # If it somehow already exists, it might be due to race conditions or manual entry
                    # In a real app we might want to loop until unique, but here we return error
                    return JsonResponse({
                        'status': 'error', 
                        'message': f'Version {version} for "{name}" already exists.'
                    }, status=400)

                # 1. Create the Pricelist Header
                pricelist = Pricelist.objects.create(
                    list_name=name,
                    pl_version=version,
                    list_desc=desc,
                    is_active=1
                )

                # 2. Bulk Insert Items
                items_to_create = []
                for item in items_data:
                    try:
                        # Optimization: We assume product exists if passed from frontend
                        items_to_create.append(PricelistItem(
                            pricelist=pricelist,
                            product_id=item.get('product_id'),
                            unit=item.get('unit', ''),
                            purchase_rate=item.get('purchase_rate', 0),
                            purchase_rate_inc=item.get('purchase_rate_inc', 0),
                            selling_price=item.get('selling_price', 0),
                            customer_sp=item.get('customer_sp', 0),
                            shown_values=item.get('shown_values', 0),
                            shown_value_disc=item.get('shown_value_disc', 0),
                            sales_cost=item.get('sales_cost', 0)
                        ))
                    except Exception:
                        continue
                
                if items_to_create:
                    PricelistItem.objects.bulk_create(items_to_create)

            return JsonResponse({
                'status': 'success', 
                'message': f'Pricelist "{name}" (v{version}) saved successfully!',
                'redirect_url': f'/dashboard/pricelists/{pricelist.id}/'
            })
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

class DashboardPricelistDetailView(LoginRequiredMixin, AdminRequiredMixin, DetailView):
    model = Pricelist
    template_name = 'dashboard/pricelist_detail.html'
    context_object_name = 'pricelist'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Fetch items grouped by category for better display
        items = self.object.items.all().select_related('product', 'product__category')
        
        # Group items by category name
        categories_data = {}
        for idx, item in enumerate(items, 1):
            item.global_index = idx # Add global index for continuous numbering
            cat_name = item.product.category.name if item.product.category else "Uncategorized"
            if cat_name not in categories_data:
                categories_data[cat_name] = {'items': [], 'total_pr': 0}
            categories_data[cat_name]['items'].append(item)
            categories_data[cat_name]['total_pr'] += (item.purchase_rate or 0)
        
        context['grouped_items'] = categories_data
        return context

class DashboardPricelistEditView(LoginRequiredMixin, AdminRequiredMixin, DetailView):
    model = Pricelist
    template_name = 'dashboard/pricelist_edit.html'
    context_object_name = 'pricelist'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Fetch products grouped by category, ordered by sortNo
        product_qs = Product.objects.filter(is_active=True).select_related('unit').order_by('sort_no', 'name')
        
        # Categories ordered by their order field (sortNo in DB)
        context['categories'] = Category.objects.filter(is_active=True).prefetch_related(
            Prefetch('products', queryset=product_qs)
        ).order_by('order', 'name')
        
        # Get current items for this pricelist to pre-populate
        current_items = {item.product_id: item for item in self.object.items.all()}
        context['current_items'] = current_items
        context['current_product_ids'] = list(current_items.keys())
        
        # Get all versions for this pricelist name
        context['all_versions'] = Pricelist.objects.filter(list_name=self.object.list_name).order_by('-created_at')

        # Add pricelist counts for the footer
        all_pricelists = Pricelist.objects.all()
        context['total_pricelists'] = all_pricelists.count()
        context['active_pricelists'] = all_pricelists.filter(is_active=1).count()
        context['inactive_pricelists'] = all_pricelists.filter(is_active=0).count()
        
        return context

class PricelistUpdateView(LoginRequiredMixin, AdminRequiredMixin, View):
    def patch(self, request, pk):
        return self.post(request, pk)

    def post(self, request, pk):
        import json
        from django.db import transaction
        try:
            current_pricelist = Pricelist.objects.get(pk=pk)
            data = json.loads(request.body)
            name = data.get('name')
            desc = data.get('description', '')
            items_data = data.get('items', [])
            save_mode = data.get('save_mode', 'OVERWRITE') # OVERWRITE, NEW_VERSION, NEW_PRICELIST
            
            with transaction.atomic():
                if save_mode == 'OVERWRITE':
                    # Check if name/version unique if name changed
                    if name != current_pricelist.list_name:
                        if Pricelist.objects.filter(list_name=name, pl_version=current_pricelist.pl_version).exists():
                             return JsonResponse({'status': 'error', 'message': f'Version {current_pricelist.pl_version} for "{name}" already exists.'}, status=400)
                    
                    current_pricelist.list_name = name
                    current_pricelist.list_desc = desc
                    current_pricelist.save()
                    
                    # Update items
                    PricelistItem.objects.filter(pricelist=current_pricelist).delete()
                    target_pricelist = current_pricelist
                
                elif save_mode == 'NEW_VERSION':
                    # Incrementing the version (handling 1.10 -> 2.0 logic)
                    latest_v = Pricelist.objects.filter(list_name=name).order_by('-created_at').first()
                    version = get_next_pl_version(latest_v.pl_version if latest_v else "1.0")
                    
                    target_pricelist = Pricelist.objects.create(
                        list_name=name,
                        pl_version=version,
                        list_desc=desc,
                        is_active=1
                    )
                
                else: # NEW_PRICELIST (name changed and user wants to start fresh v1.0)
                    target_pricelist = Pricelist.objects.create(
                        list_name=name,
                        pl_version="1.0",
                        list_desc=desc,
                        is_active=1
                    )

                # Insert items
                items_to_create = []
                for item in items_data:
                    items_to_create.append(PricelistItem(
                        pricelist=target_pricelist,
                        product_id=item.get('product_id'),
                        unit=item.get('unit', ''),
                        purchase_rate=item.get('purchase_rate', 0),
                        purchase_rate_inc=item.get('purchase_rate_inc', 0),
                        selling_price=item.get('selling_price', 0),
                        customer_sp=item.get('customer_sp', 0),
                        shown_values=item.get('shown_values', 0),
                        shown_value_disc=item.get('shown_value_disc', 0),
                        sales_cost=item.get('sales_cost', 0)
                    ))
                
                if items_to_create:
                    PricelistItem.objects.bulk_create(items_to_create)

            return JsonResponse({
                'status': 'success', 
                'message': f'Pricelist updated successfully!',
                'redirect_url': f'/dashboard/pricelists/{target_pricelist.id}/'
            })
        except Pricelist.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Pricelist not found'}, status=404)
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

class PricelistCheckNameAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def get(self, request):
        name = request.GET.get('name')
        if not name:
            return JsonResponse({'status': 'error', 'message': 'Name is required'}, status=400)
        
        pricelists = Pricelist.objects.filter(list_name=name)
        if pricelists.exists():
            # Sort versions according to user requirement: 1.0, 1.1... 1.10, 2.0
            def sort_key(v):
                parts = v.split('.')
                return [int(p) for p in parts]
            
            versions = [p.pl_version for p in pricelists]
            versions.sort(key=sort_key)
            latest = versions[-1]
            
            return JsonResponse({
                'exists': True, 
                'latest_version': latest,
                'count': len(versions)
            })
        return JsonResponse({'exists': False})

class PricelistVersionDetailAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def get(self, request):
        name = request.GET.get('name')
        version = request.GET.get('version')
        
        if not name:
            return JsonResponse({'status': 'error', 'message': 'Name is required'}, status=400)
            
        filters = {'list_name': name}
        if version:
            filters['pl_version'] = version
        
        pricelist = Pricelist.objects.filter(**filters).order_by('-created_at').first()
        if not pricelist:
            return JsonResponse({'status': 'error', 'message': 'Pricelist version not found'}, status=404)
            
        items = pricelist.items.all().values(
            'product_id', 'purchase_rate', 'purchase_rate_inc', 
            'selling_price', 'customer_sp', 'shown_values', 
            'shown_value_disc', 'sales_cost'
        )
        
        # Get all versions for this name for population if needed
        all_versions = Pricelist.objects.filter(list_name=name).values_list('pl_version', flat=True).distinct()
        
        return JsonResponse({
            'status': 'success',
            'id': pricelist.id,
            'name': pricelist.list_name,
            'version': pricelist.pl_version,
            'description': pricelist.list_desc,
            'items': list(items),
            'all_versions': list(all_versions)
        })

class DashboardCouponListView(LoginRequiredMixin, AdminRequiredMixin, ListView):
    model = Coupon
    template_name = 'dashboard/coupons.html'
    context_object_name = 'coupons'
    
    def get_queryset(self):
        from django.conf import settings
        return Coupon.objects.filter(
            website_id=settings.WEBSITE_ID,
            company_id=settings.COMPANY_ID,
            branch_id=settings.BRANCH_ID
        ).order_by('-created_at')

class CouponToggleActiveView(LoginRequiredMixin, AdminRequiredMixin, View):
    def post(self, request, pk):
        try:
            coupon = Coupon.objects.get(pk=pk)
            coupon.is_active = not coupon.is_active
            coupon.save()
            return JsonResponse({'status': 'success', 'is_active': coupon.is_active})
        except Coupon.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Coupon not found'}, status=404)
class PricelistListAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def get(self, request):
        names = Pricelist.objects.all().values_list('list_name', flat=True).distinct().order_by('list_name')
        return JsonResponse({'status': 'success', 'names': list(names)})

class CustomerAutocompleteAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def get(self, request):
        query = request.GET.get('q', '')
        if len(query) < 2:
            return JsonResponse({'status': 'success', 'results': []})
            
        customers = Customer.objects.filter(
            Q(name__icontains=query) | 
            Q(contact_person_no__icontains=query) |
            Q(users__phone_number__icontains=query)
        ).distinct().prefetch_related('users')[:10]
        
        results = []
        for c in customers:
            phone = c.contact_person_no
            if not phone:
                u = c.users.first()
                phone = u.phone_number if u else ''
                
            results.append({
                'id': c.id,
                'name': c.name,
                'phone': phone
            })
            
        return JsonResponse({'status': 'success', 'results': results})

class CustomerResetPasswordAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def post(self, request, pk):
        try:
            customer = Customer.objects.get(pk=pk)
            data = json.loads(request.body)
            new_password = data.get('password')
            
            if not new_password:
                return JsonResponse({'status': 'error', 'message': 'Password is required'}, status=400)
                
            # Update all users associated with this customer
            for user in customer.users.all():
                user.set_password(new_password)
                user.save()
                
            return JsonResponse({'status': 'success', 'message': 'Password reset successfully'})
        except Customer.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Customer not found'}, status=404)
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

class ProductAutocompleteAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def get(self, request):
        query = request.GET.get('q', '')
        if len(query) < 2:
            return JsonResponse({'status': 'success', 'results': []})
            
        products = Product.objects.filter(
            Q(name__icontains=query) | 
            Q(code__icontains=query)
        ).filter(is_active=True)[:10]
        
        results = [{'id': p.id, 'name': p.name, 'code': p.code} for p in products]
        return JsonResponse({'status': 'success', 'results': results})

class CategoryAutocompleteAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def get(self, request):
        query = request.GET.get('q', '')
        if len(query) < 2:
            return JsonResponse({'status': 'success', 'results': []})
            
        categories = Category.objects.filter(
            name__icontains=query,
            is_active=True
        )[:10]
        
        results = [{'id': c.id, 'name': c.name} for c in categories]
        return JsonResponse({'status': 'success', 'results': results})

class OrderAutocompleteAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def get(self, request):
        query = request.GET.get('q', '')
        if len(query) < 2:
            return JsonResponse({'status': 'success', 'results': []})
            
        orders = OnlineSales.objects.filter(
            Q(trans_no__icontains=query) | 
            Q(customer__name__icontains=query)
        ).select_related('customer')[:10]
        
        results = [{
            'id': o.id, 
            'trans_no': o.trans_no, 
            'customer_name': o.customer.name,
            'name': o.trans_no
        } for o in orders]
        return JsonResponse({'status': 'success', 'results': results})

class PricelistAutocompleteAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def get(self, request):
        query = request.GET.get('q', '')
        if len(query) < 2:
            return JsonResponse({'status': 'success', 'results': []})
            
        pricelists = Pricelist.objects.filter(
            list_name__icontains=query
        ).distinct()[:10]
        
        results = [{'id': p.id, 'name': p.name} for p in pricelists]
        return JsonResponse({'status': 'success', 'results': results})


class DashboardOrderUpdateStatusAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def post(self, request, trans_no):
        try:
            status = request.POST.get('status')
            order = OnlineSales.objects.get(trans_no=trans_no)
            order.status = status
            order.save()
            return JsonResponse({'status': 'success', 'message': f'Order {trans_no} updated to {status}'})
        except OnlineSales.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Order not found'}, status=404)
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

class DashboardOrderEditView(LoginRequiredMixin, AdminRequiredMixin, TemplateView):
    template_name = 'dashboard/order_edit.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        trans_no = self.kwargs.get('trans_no')
        order = get_object_or_404(OnlineSales, trans_no=trans_no)
        
        # Load all products and categories like in ProductListView
        product_qs = Product.objects.filter(is_active=True, category__is_active=True).select_related('category')
        
        # Filter: code exists
        product_qs = product_qs.filter(code__isnull=False).exclude(code='')
        
        # Annotation for numerical sorting by code
        product_qs = product_qs.annotate(
            padded_code=LPad('code', 10, Value('0'))
        ).order_by('category__order', 'padded_code')
        
        # Pre-fill current items with historical pricing from tbl_onlinesales_items
        order_items_dict = {}
        for item in order.items.all():
            # Use product_id (itemId in DB) as the primary key for matching
            if item.product_id:
                order_items_dict[str(item.product_id)] = {
                    'qty': float(item.qty),
                    'mrp': float(item.mrp) if item.mrp is not None else None,
                    'rate': float(item.rate) if item.rate is not None else None
                }
        
        # Attach order-specific data to each product for the template
        products_list = list(product_qs)
        for product in products_list:
            item_data = order_items_dict.get(str(product.id), {})
            product.initial_qty = int(item_data.get('qty', 0))
            
            # Pricing mapping
            product.initial_mrp = item_data.get('mrp')
            if product.initial_mrp is None:
                product.initial_mrp = float(product.purchase_rate or product.original_price or product.price or 0)
                
            product.initial_rate = item_data.get('rate')
            if product.initial_rate is None:
                product.initial_rate = float(product.price or 0)
            
            product.initial_total = product.initial_qty * product.initial_rate

        context['products'] = products_list
        context['categories'] = Category.objects.filter(is_active=True).order_by('order')
        context['order'] = order
        context['order_items_data'] = order_items_dict
        
        return context

class DashboardOrderUpdateAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def post(self, request, trans_no):
        order = get_object_or_404(OnlineSales, trans_no=trans_no)
        try:
            data = json.loads(request.body)
            items_data = data.get('items', []) # List of {product_id, quantity}
            
            with transaction.atomic():
                # Clear existing items and re-add
                order.items.all().delete()
                
                new_items = []
                for item in items_data:
                    try:
                        product = Product.objects.get(id=item['product_id'])
                        qty = decimal.Decimal(str(item['quantity']))
                        if qty > 0:
                            rate = product.price
                            new_items.append(OnlineSalesItem(
                                sales=order,
                                product=product,
                                item_name=product.name,
                                item_code=product.code,
                                rate=rate,
                                mrp=product.original_price or product.purchase_rate or product.price,
                                qty=qty,
                                item_total=rate * qty,
                                is_active=True,
                                created_by=request.user
                            ))
                    except Product.DoesNotExist:
                        continue
                
                if new_items:
                    OnlineSalesItem.objects.bulk_create(new_items)
                
                # Recalculate order totals using Service
                OrderService.recalculate_existing_order(order)
                
            return JsonResponse({'status': 'success', 'message': 'Order updated successfully'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

class DashboardCustomerImpersonateView(LoginRequiredMixin, AdminRequiredMixin, View):
    def get(self, request, pk):
        customer = get_object_or_404(Customer, pk=pk)
        user = customer.users.first()
        if not user:
            return HttpResponse("No user account found for this customer", status=400)
        
        # Logout admin and login as the selected user
        logout(request)
        login(request, user)
        return redirect('home')

class DashboardBannerListView(LoginRequiredMixin, AdminRequiredMixin, ListView):
    model = Banner
    template_name = 'dashboard/banners.html'
    context_object_name = 'banners'
    
    def get_queryset(self):
        from django.conf import settings
        return Banner.objects.filter(
            website_id=settings.WEBSITE_ID,
            company_id=settings.COMPANY_ID,
            branch_id=settings.BRANCH_ID
        ).order_by('-created_at')

class BannerToggleActiveView(LoginRequiredMixin, AdminRequiredMixin, View):
    def post(self, request, pk):
        try:
            banner = Banner.objects.get(pk=pk)
            banner.is_active = not banner.is_active
            banner.save()
            return JsonResponse({'status': 'success', 'is_active': banner.is_active})
        except Banner.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Banner not found'}, status=404)

class BannerDetailAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def get(self, request, pk):
        try:
            banner = Banner.objects.get(pk=pk)
            data = {
                'id': banner.id,
                'name': banner.name,
                'content': banner.content,
                'is_show': banner.is_show,
                'is_active': banner.is_active,
            }
            return JsonResponse({'status': 'success', 'data': data})
        except Banner.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Banner not found'}, status=404)

class BannerSaveAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def post(self, request):
        import json
        from django.conf import settings
        try:
            data = json.loads(request.body)
            banner_id = data.get('id')
            
            if banner_id:
                banner = Banner.objects.get(pk=banner_id)
                banner.updated_by = request.user.id
            else:
                banner = Banner(
                    website_id=settings.WEBSITE_ID,
                    company_id=settings.COMPANY_ID,
                    branch_id=settings.BRANCH_ID,
                    created_by=request.user.id
                )
            
            banner.name = data.get('name')
            banner.content = data.get('content')
            banner.is_show = data.get('is_show', True)
            # is_active is handled by the toggle view usually, but we can set it here too if needed
            if not banner_id:
                banner.is_active = True
                
            banner.save()
            
            return JsonResponse({
                'status': 'success', 
                'message': f'Banner {"updated" if banner_id else "created"} successfully'
            })
        except Banner.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Banner not found'}, status=404)
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

class BannerDeleteAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def post(self, request, pk):
        try:
            banner = Banner.objects.get(pk=pk)
            banner.delete()
            return JsonResponse({'status': 'success', 'message': 'Banner deleted successfully'})
        except Banner.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Banner not found'}, status=404)

class CouponDetailAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def get(self, request, pk):
        try:
            coupon = Coupon.objects.get(pk=pk)
            data = {
                'id': coupon.id,
                'name': coupon.name,
                'code': coupon.code,
                'percentage': str(coupon.percentage),
                'description': coupon.description,
                'is_active': coupon.is_active,
            }
            return JsonResponse({'status': 'success', 'data': data})
        except Coupon.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Coupon not found'}, status=404)

class CouponSaveAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def post(self, request):
        import json
        from django.conf import settings
        try:
            data = json.loads(request.body)
            coupon_id = data.get('id')
            
            if coupon_id:
                coupon = Coupon.objects.get(pk=coupon_id)
                coupon.updated_by = request.user
            else:
                coupon = Coupon(
                    website_id=settings.WEBSITE_ID,
                    company_id=settings.COMPANY_ID,
                    branch_id=settings.BRANCH_ID,
                    created_by=request.user
                )
            
            coupon.name = data.get('name')
            coupon.code = data.get('code')
            coupon.percentage = data.get('percentage')
            coupon.description = data.get('description')
            
            if not coupon_id:
                coupon.is_active = True
                
            coupon.save()
            
            return JsonResponse({
                'status': 'success', 
                'message': f'Coupon {"updated" if coupon_id else "created"} successfully'
            })
        except Coupon.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Coupon not found'}, status=404)
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

class CouponDeleteAPIView(LoginRequiredMixin, AdminRequiredMixin, View):
    def post(self, request, pk):
        try:
            coupon = Coupon.objects.get(pk=pk)
            coupon.delete()
            return JsonResponse({'status': 'success', 'message': 'Coupon deleted successfully'})
        except Coupon.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Coupon not found'}, status=404)
