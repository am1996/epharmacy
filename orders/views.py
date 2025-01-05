from django.shortcuts import render,redirect
from django.views.generic import ListView,View,DetailView
from inventory.models import InventoryItem
from .models import Order,OrderItem
from django.db.models import Sum,Max
from products.models import Drug
from django.shortcuts import get_object_or_404
import json
import uuid
from epharmacy.mixins import ClientRequiredMixin
# Create your views here.

## Accessible only by client.

class DetailOrderView(ClientRequiredMixin,View):
    def get(self,request,pk):
        item = InventoryItem.objects.values("drug_id","drug_id__img","drug_id__name","drug_id__company","drug_id__data").annotate(total_quantity=Sum("quantity"),max=Max("public_price")).filter(drug_id=pk)
        item = item[0] if item else {}
        if not item:
            drug = get_object_or_404(Drug,pk=pk)
            item = {
                "drug_id": drug.id,
                "drug_id__img": drug.img,
                "drug_id__name": drug.name,
                "drug_id__company": drug.company,
                "drug_id__data":drug.data,
                "total_quantity": 0,
                "max": drug.price
            }
        return render(request,"./orders/details.html",{"drug": item})
    
    def post(self, request, *args, **kwargs):
        mutable_querydict = request.POST.copy() 
        mutable_querydict.pop("csrfmiddlewaretoken",None)
        cookie_value = request.COOKIES.get("epharmacy_cart",[])
        if isinstance(cookie_value, str):
            cookie_value = json.loads(cookie_value)
        mutable_querydict["uid"] = str(uuid.uuid4())
        mutable_querydict["user"] = str(request.user.id)
        cookie_value.append(mutable_querydict)
        j = json.dumps(cookie_value)
        response = redirect("/orders")
        response.set_cookie("epharmacy_cart",j,httponly= True)
        return response

class IndexOrdersView(ClientRequiredMixin,ListView):
    model = InventoryItem
    template_name = "./orders/index.html"
    context_object_name = "inventory"
    paginate_by = 10
    
    def get_context_data(self, **kwargs):
        inventory = InventoryItem.objects.values("drug_id","drug_id__name","drug_id__img").annotate(total_quantity=Sum("quantity")).filter(total_quantity__gt=0)
        user_id = str(self.request.user.id)
        most_ordered = OrderItem.objects.filter(order_id__created_by=user_id) \
            .annotate(total_quantity=Sum('quantity')) \
            .order_by('-total_quantity')[:10]
        return {
            "inventory": inventory,
            'most_ordered': most_ordered
        }
    
class OrderedOrderDetailsView(ClientRequiredMixin,DetailView):
    model = Order
    pk_url_kwarg = "pk"
    template_name = "users/order_details.html"
    context_object_name = "order"