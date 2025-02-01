from django.shortcuts import render, redirect
from django.views.generic import View
from products.models import Drug
from orders.models import OrderItem,Order
import json
from .forms import UserAddForm,ProfileAddForm
from django.views.generic import ListView,DetailView
from epharmacy.mixins import ClientRequiredMixin,AdminRequiredMixin
from django.contrib.auth import get_user_model

## Accessible only by client.
class CartIndexView(ClientRequiredMixin,View):
    def get(self,request,*args,**kwargs):
        cookies = request.COOKIES.get("epharmacy_cart")
        cart_data = json.loads(cookies) if cookies != None else []
        cart_data = list(filter(lambda item: item.get("user","") == str(request.user.id), cart_data))
        total = sum(float(item["quantity"]) * float(item["price"]) for item in cart_data) if cart_data else 0
        return render(request,"./main/index.html",{
            "cart": cart_data,
            "total": total
        })

    def post(self,request, *arg, **kwargs):
        cookies = request.COOKIES.get("epharmacy_cart")
        cart_data = json.loads(cookies) if cookies != None else []
        response = redirect("/cart")
        if not cart_data:
            return response
        else:
            cart_data = list(
                filter(
                    lambda item: item["uid"] != request.POST["uid"],
                    cart_data
            ))
            cart_data = json.dumps(cart_data)
            response.set_cookie("epharmacy_cart",cart_data,httponly=True)
            return response

## Accessible only by client.
class PlaceOrderView(ClientRequiredMixin,View):
    def post(self,request,*args,**kwargs):
        order_items = []
        cookies = request.COOKIES.get("epharmacy_cart")
        cart_data = json.loads(cookies) if cookies != None else []
        if cart_data:
            order = Order.objects.create(created_by=request.user)
            for item in cart_data:
                order_items.append(OrderItem(drug_id=int(item["drug_id"]),
                                             quantity= int(item["quantity"]),
                                             order_id = order))
            OrderItem.objects.bulk_create(order_items)
        response = redirect("/cart")
        response.delete_cookie("epharmacy_cart")
        return response

class AdminUserListView(AdminRequiredMixin,ListView):
    model = get_user_model()
    template_name = 'main/user_list.html'
    context_object_name = 'users'
    ordering = 'username'
    paginate_by = '10'

class AdminUserDetailView(AdminRequiredMixin,DetailView):
    model = get_user_model()
    template_name = 'main/user_details.html'
    context_object_name = 'user'
    pk_url_kwarg = 'pk'

class AdminUserCreateView(AdminRequiredMixin,View):
    template_name = 'main/add_user.html'

    def get(self, request, *args, **kwargs):
        user_form = UserAddForm()
        profile_form = ProfileAddForm()
        return render(request, self.template_name, {
            'user_form': user_form,
            'profile_form': profile_form,
        })

    def post(self, request, *args, **kwargs):
        user_form = UserAddForm(request.POST)
        profile_form = ProfileAddForm(request.POST)

        if user_form.is_valid() and profile_form.is_valid():
            user_form.save()
            profile_form.save()
            return redirect('home') # Redirect to the home page

        return render(request, self.template_name, {
            'user_form': user_form,
            'profile_form': profile_form,
        })

class DrugListView(ListView):
    model = Drug
    template_name = "index.html"
    context_object_name = "drugs"
    ordering = 'name'
    paginate_by = "10"

