from django.shortcuts import render,redirect
from django.views.generic import ListView,View
from inventory.models import InventoryItem
from django.db.models import Sum,Max
import json
import uuid
# Create your views here.

class DetailOrderView(View):
    def get(self,request,pk):
        item = InventoryItem.objects.values("drug_id","drug_id__img","drug_id__name","drug_id__company","drug_id__data").annotate(total_quantity=Sum("quantity"),max=Max("public_price")).filter(drug_id=pk)
        item = item[0] if item else {}
        return render(request,"./orders/details.html",{"drug": item})
    
    def post(self, request, *args, **kwargs):
        mutable_querydict = request.POST.copy() 
        mutable_querydict.pop("csrfmiddlewaretoken",None)
        cookie_value = request.COOKIES.get("epharmacy_cart",[])
        if isinstance(cookie_value, str):
            cookie_value = json.loads(cookie_value)
        mutable_querydict["uid"] = str(uuid.uuid4())
        cookie_value.append(mutable_querydict)
        j = json.dumps(cookie_value)
        response = redirect("/orders")
        response.set_cookie("epharmacy_cart",j,httponly= True)
        return response

class IndexOrdersView(ListView):
    model = InventoryItem
    template_name = "./orders/index.html"
    context_object_name = "inventory"
    paginate_by = 10
    
    def get_context_data(self, **kwargs):
        inventory = InventoryItem.objects.values("drug_id","drug_id__name","drug_id__img").annotate(total_quantity=Sum("quantity"))
        return {
            "inventory": inventory
        }