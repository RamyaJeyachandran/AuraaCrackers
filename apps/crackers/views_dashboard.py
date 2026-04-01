from django.views.generic import ListView, DetailView, TemplateView
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.shortcuts import redirect
from django.urls import reverse_lazy
from django.http import JsonResponse
from django.views import View
from django.db.models import Q, Prefetch, IntegerField, Value, Min
from django.db.models.functions import Cast, Coalesce
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
        # Fetch products grouped by category, ordered by integer code (numerical sorting)
        product_qs = Product.objects.filter(is_active=True).select_related('unit').annotate(
            code_int=Cast(Coalesce('code', Value('0')), output_field=IntegerField())
        ).order_by('code_int')
        
        # Categories ordered by their lowest product code (matching frontend logic)
        context['categories'] = Category.objects.filter(is_active=True).annotate(
            cat_min_code_int=Coalesce(
                Min(Cast(Coalesce('products__code', Value('0')), output_field=IntegerField())),
                Value(2147483647) # Push empty categories to the end
            )
        ).prefetch_related(
            Prefetch('products', queryset=product_qs)
        ).order_by('cat_min_code_int', 'name')

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
        # Fetch products grouped by category, ordered by integer code (numerical sorting)
        product_qs = Product.objects.filter(is_active=True).select_related('unit').annotate(
            code_int=Cast(Coalesce('code', Value('0')), output_field=IntegerField())
        ).order_by('code_int')
        
        # Categories ordered by their lowest product code (matching frontend logic)
        context['categories'] = Category.objects.filter(is_active=True).annotate(
            cat_min_code_int=Coalesce(
                Min(Cast(Coalesce('products__code', Value('0')), output_field=IntegerField())),
                Value(2147483647) # Push empty categories to the end
            )
        ).prefetch_related(
            Prefetch('products', queryset=product_qs)
        ).order_by('cat_min_code_int', 'name')
        
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
