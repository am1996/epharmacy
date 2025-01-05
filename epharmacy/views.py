from django.shortcuts import render, redirect
from django.views.generic import View
from products.models import Drug
from orders.models import OrderItem,Order
import json
from django.views.generic import ListView
from epharmacy.mixins import AdminRequiredMixin, PharmacistRequiredMixin, ClientRequiredMixin

## Accessible only by client.
class CartIndexView(ClientRequiredMixin,View):
    def get(self,request,*args,**kwargs):
        cookies = request.COOKIES.get("epharmacy_cart")
        cart_data = json.loads(cookies) if cookies != None else []
        cart_data = list(filter(lambda item: item.get("user","") == str(request.user.id), cart_data))
        total = sum(float(item["quantity"]) * float(item["price"]) for item in cart_data) if cart_data else 0
        return render(request,"./cart/index.html",{
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

class DrugListView(ListView):
    model = Drug
    template_name = "index.html"
    context_object_name = "drugs"
    paginate_by = "10"

