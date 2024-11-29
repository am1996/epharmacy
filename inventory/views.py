from django.shortcuts import render,redirect
from django.views.generic import CreateView,ListView,DetailView,DeleteView,UpdateView
from django.views import View
from products.models import Drug
from epharmacy.utils import parse_querydict
from .forms import InventoryItemForm
from .models import InventoryItem
# Create your views here.

class IndexView(ListView):
    model = InventoryItem
    paginate_by = 10
    template_name = "./inventory/index.html"

class InventoryCreateView(View):
    def get(self,request,*args,**kwargs):
        context = {"drugs": Drug.objects.values('id','name')}
        return render(request,"./inventory/create.html",context)
    
    def post(self,request,*args,**kwargs):
        data = parse_querydict(request.POST)
        inv_items = []
        for inv_item in data.values():
            inv_item["created_by"] = request.user.id
            form = InventoryItemForm(inv_item)
            if form.is_valid():
                inv = form.save()
                inv_items.append(inv)
            else:
                context = {"drugs": Drug.objects.values('id','name'),"errors":form.errors}
                return render(request,"./inventory/create.html",context)
        return redirect("/inventory")