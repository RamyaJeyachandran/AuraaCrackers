from django.views.generic import ListView, DetailView, TemplateView
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.shortcuts import redirect
from django.urls import reverse_lazy
from django.http import JsonResponse
from django.views import View
from django.db.models import Q
from .models import Category, Product, OnlineSales, Customer, Pricelist, PricelistItem, Coupon
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
        return Category.objects.filter(is_active=True).order_by('order')

class DashboardProductListView(LoginRequiredMixin, AdminRequiredMixin, ListView):
    model = Product
    template_name = 'dashboard/products.html'
    context_object_name = 'products'
    paginate_by = 50
    
    def get_queryset(self):
        qs = Product.objects.all().select_related('category').order_by('category__order', 'sort_no', 'name')
        
        category_name = self.request.GET.get('category')
        if category_name and category_name != 'All':
            qs = qs.filter(category__name=category_name)

        status = self.request.GET.get('status')
        if status == 'Active':
            qs = qs.filter(is_disabled=0)
        elif status == 'Inactive':
            qs = qs.filter(is_disabled=1)
            
        query = self.request.GET.get('q')
        if query:
            qs = qs.filter(name__icontains=query)
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
        qs = OnlineSales.objects.all().select_related('customer').order_by('-trans_dt')
        status = self.request.GET.get('status')
        if status and status != 'All':
            qs = qs.filter(status=status)
            
        category = self.request.GET.get('category')
        if category and category != 'All':
            qs = qs.filter(items__product__category__name=category).distinct()
            
        query = self.request.GET.get('q')
        if query:
            qs = qs.filter(Q(trans_no__icontains=query) | Q(customer__name__icontains=query))
            
        return qs

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['search_query'] = self.request.GET.get('q', '')
        context['selected_status'] = self.request.GET.get('status', 'All')
        context['selected_category'] = self.request.GET.get('category', 'All')
        context['statuses'] = ['New', 'Progressing', 'Shipped', 'Delivered', 'Cancelled']
        context['categories'] = Category.objects.filter(is_active=True).order_by('order')
        return context

class DashboardOrderDetailView(LoginRequiredMixin, AdminRequiredMixin, DetailView):
    model = OnlineSales
    template_name = 'dashboard/order_detail.html'
    context_object_name = 'order'
    slug_field = 'trans_no'
    slug_url_kwarg = 'trans_no'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Optimize by pre-fetching products for all items in one go
        context['items'] = self.object.items.all().select_related('product', 'product__category')
        return context

class DashboardCustomerListView(LoginRequiredMixin, AdminRequiredMixin, ListView):
    model = Customer
    template_name = 'dashboard/customers.html'
    context_object_name = 'customers'
    paginate_by = 50
    
    def get_queryset(self):
        qs = Customer.objects.all().order_by('name')
        
        # Status Filter
        status = self.request.GET.get('status')
        if status == 'Active':
            qs = qs.filter(is_active=True)
        elif status == 'Inactive':
            qs = qs.filter(is_active=False)
            
        # Search Filter
        query = self.request.GET.get('q')
        if query:
            qs = qs.filter(
                Q(name__icontains=query) | 
                Q(contact_person_no__icontains=query)
            )
            
        return qs

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['search_query'] = self.request.GET.get('q', '')
        context['selected_status'] = self.request.GET.get('status', 'All')
        return context

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
        # Fetch products grouped by category
        context['categories'] = Category.objects.filter(is_active=True).prefetch_related('products').order_by('order')
        return context

class PricelistSaveView(LoginRequiredMixin, AdminRequiredMixin, View):
    def post(self, request):
        import json
        from django.db import transaction
        try:
            data = json.loads(request.body)
            name = data.get('name')
            desc = data.get('description', '')
            items_data = data.get('items', [])

            if not name:
                return JsonResponse({'status': 'error', 'message': 'Pricelist name is required'}, status=400)

            # Check if name already exists
            if Pricelist.objects.filter(list_name=name).exists():
                return JsonResponse({'status': 'error', 'message': 'A pricelist with this name already exists.'}, status=400)

            with transaction.atomic():
                # 1. Insert into tbl_pricelist
                pricelist = Pricelist.objects.create(
                    list_name=name,
                    list_desc=desc,
                    is_active=1, # Default active
                    # Use default values for other fields as per models
                )

                # 2. Insert items into tbl_pricelist_items
                for item in items_data:
                    # Fetch product to get unit
                    try:
                        product = Product.objects.get(id=item.get('product_id'))
                        PricelistItem.objects.create(
                            pricelist=pricelist,
                            product=product,
                            unit=product.unit or '',
                            purchase_rate=item.get('purchase_rate', 0),
                            purchase_rate_inc=item.get('purchase_rate_inc', 0),
                            selling_price=item.get('selling_price', 0),
                            customer_sp=item.get('customer_sp', 0),
                            shown_values=item.get('shown_values', 0),
                            shown_value_disc=item.get('shown_value_disc', 0),
                            sales_cost=item.get('sales_cost', 0)
                        )
                    except Product.DoesNotExist:
                        continue # Skip invalid products

            return JsonResponse({'status': 'success', 'message': 'Pricelist saved successfully!'})

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
                categories_data[cat_name] = []
            categories_data[cat_name].append(item)
        
        context['grouped_items'] = categories_data
        return context

class DashboardPricelistEditView(LoginRequiredMixin, AdminRequiredMixin, DetailView):
    model = Pricelist
    template_name = 'dashboard/pricelist_edit.html'
    context_object_name = 'pricelist'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Get all categories like in create view
        context['categories'] = Category.objects.filter(is_active=True).prefetch_related('products').order_by('order')
        
        # Get current items for this pricelist to pre-populate
        current_items = {item.product_id: item for item in self.object.items.all()}
        context['current_items'] = current_items
        return context

class PricelistUpdateView(LoginRequiredMixin, AdminRequiredMixin, View):
    def post(self, request, pk):
        import json
        from django.db import transaction
        try:
            pricelist = Pricelist.objects.get(pk=pk)
            data = json.loads(request.body)
            name = data.get('name')
            desc = data.get('description', '')
            items_data = data.get('items', [])

            if not name:
                return JsonResponse({'status': 'error', 'message': 'Pricelist name is required'}, status=400)

            # Check if name already exists (excluding current)
            if Pricelist.objects.filter(list_name=name).exclude(pk=pk).exists():
                return JsonResponse({'status': 'error', 'message': 'A pricelist with this name already exists.'}, status=400)

            with transaction.atomic():
                # 1. Update tbl_pricelist
                pricelist.list_name = name
                pricelist.list_desc = desc
                pricelist.save()

                # 2. Update items - simplest is delete and re-insert
                PricelistItem.objects.filter(pricelist=pricelist).delete()
                
                for item in items_data:
                    from .models import Product
                    try:
                        product = Product.objects.get(id=item.get('product_id'))
                        PricelistItem.objects.create(
                            pricelist=pricelist,
                            product=product,
                            unit=product.unit or '',
                            purchase_rate=item.get('purchase_rate', 0),
                            purchase_rate_inc=item.get('purchase_rate_inc', 0),
                            selling_price=item.get('selling_price', 0),
                            customer_sp=item.get('customer_sp', 0),
                            shown_values=item.get('shown_values', 0),
                            shown_value_disc=item.get('shown_value_disc', 0),
                            sales_cost=item.get('sales_cost', 0)
                        )
                    except Product.DoesNotExist:
                        continue

            return JsonResponse({'status': 'success', 'message': 'Pricelist updated successfully!'})

        except Pricelist.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Pricelist not found'}, status=404)
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

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
