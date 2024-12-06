from django.shortcuts import render,HttpResponse
from django.views.generic import ListView,View
from inventory.models import InventoryItem
from django.db.models import Sum
import json
# Create your views here.

class DetailOrderView(View):
    def get(self,request,pk):
        item = InventoryItem.objects.values("drug_id","public_price","drug_id__img","drug_id__name","drug_id__company","drug_id__data").annotate(total_quantity=Sum("quantity")).filter(id=pk)
        item = item[0] if item else {}
        return render(request,"./orders/details.html",{"drug": item})
    def post(self,request,**kwargs):
        print(request.POST)
        j = json.dumps(request.POST)
        return HttpResponse(j)
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