import json
from django.shortcuts import render,redirect
from django.views import View
from django.http import Http404, HttpResponse
from django.contrib.auth import authenticate,login
from django.urls import reverse_lazy
from django.views.generic import ListView,DetailView,TemplateView
from django.contrib.auth.views import PasswordChangeView
from django.views.generic.edit import CreateView
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth import logout
from orders.models import *
from .forms import *
from django.contrib import messages
from django.db import transaction
from epharmacy.utils import parse_querydict

class UserLogoutView(View):
    def get(self, request, *args, **kwargs):
        logout(request)
        return redirect('user:login')

class UserDashboardView(ListView):
    model = Order
    template_name = "users/dashboard.html"
    def return_paginator(self,queryset,page_param="page"):
        paginator = Paginator(queryset,10)
        page = self.request.GET.get("page")
        try:
            queryset = paginator.page(page)
        except PageNotAnInteger:
            queryset = paginator.page(1)
        except EmptyPage:
            queryset = paginator.page(paginator.num_pages)
        return queryset
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        if self.request.user.profile.role == 2 or self.request.user.profile.role == 1:
            orders_under_dispensing_query_set = Order.objects.all().filter(status=1).order_by("-order_date")
            orders_under_delivery_query_set = Order.objects.all().filter(status=2).order_by("-order_date")
            orders_done_query_set = Order.objects.all().filter(status=3).order_by("-order_date")
            orders_under_dispensing = self.return_paginator(orders_under_dispensing_query_set)
            orders_under_delivery = self.return_paginator(orders_under_delivery_query_set)
            orders_done = self.return_paginator(orders_done_query_set)
            context["orders_under_dispensing"] = orders_under_dispensing
            context["orders_under_delivery"] = orders_under_delivery
            context["orders_done"] = orders_done
        else:
            my_orders = Order.objects.all().filter(created_by=self.request.user).order_by("-updated_at")
            my_orders = self.return_paginator(my_orders)
            context["my_orders"] = my_orders
        return context

class UserProfileView(TemplateView):
    template_name = "users/profile.html"

class CustomPasswordChangeView(PasswordChangeView):
    form_class = PasswordChangeCustomForm
    template_name = 'users/password_change.html' 
    success_url = reverse_lazy('users:profile')

class UserProfileEditView(View):
    template_name = 'users/edit_profile.html'

    def get(self, request, *args, **kwargs):
        user_form = UserEditForm(instance=request.user)
        profile_form = ProfileEditForm(instance=request.user.profile)
        return render(request, self.template_name, {
            'user_form': user_form,
            'profile_form': profile_form,
        })

    def post(self, request, *args, **kwargs):
        user_form = UserEditForm(request.POST, instance=request.user)
        profile_form = ProfileEditForm(request.POST, instance=request.user.profile)

        if user_form.is_valid() and profile_form.is_valid():
            user_form.save()
            profile_form.save()
            return redirect('profile')  # Redirect to a profile page or success page

        return render(request, self.template_name, {
            'user_form': user_form,
            'profile_form': profile_form,
        })

class UserRegisterView(CreateView):
    form_class = RegisterationForm

    success_url = reverse_lazy('login')
    template_name = 'users/register.html'

class UserLoginView(View):
    def get(self,request):
        return render(request,"users/login.html",{"login_form":LoginForm})

    def post(self,request):
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']

            user = authenticate(request, username=username, password=password)

            if user is not None:
                login(request, user)
                return redirect('home')

        else:
            form = LoginForm()

        return render(request, 'login.html', {'form': form})

class OrderDetailsView(DetailView):
    model = Order
    pk_url_kwarg = "pk"
    template_name = "users/order_details.html"
    context_object_name = "order"

class OrderDispenseView(View):
    def get(self,request,*args,**kwargs):
        try:
            order = Order.objects.get(pk=kwargs["pk"])
        except Order.DoesNotExist:
            raise Http404("Object does not exist.")
        inventory = []
        for order_item in order.order_items.all():
            inventory.append( list(order_item.inventory_data_as_list) )
        
        return render(request,"users/order_dispense.html",{
            "order": order,
            "inventory": json.dumps(inventory,ensure_ascii=False)
        })

    @transaction.atomic
    def post(self,request,*args,**kwargs):
        data = parse_querydict(request.POST)
        items = []
        try:
            order = Order.objects.get(pk=kwargs["pk"])
        except Order.DoesNotExist:
            raise Http404("Object does not exist.")
        for inv_item in data.values():
            print(inv_item)
            form = InventoryItemDispensedForm(inv_item)
            if form.is_valid():
                inv = form.save(commit=False)
                items.append(inv)
            else:
                context = {"errors":form.errors,"order":order}
                return render(request,"users/order_dispense.html",context)
        InventoryItemDispensed.objects.bulk_create(items)
        Order.objects.filter(pk=kwargs["pk"]).update(status=2,comment=request.POST["comment"],dispensed_by=request.user)
        messages.success(request,f"Order No. {order.pk} was dispensed.")
        return redirect("/user/dashboard")