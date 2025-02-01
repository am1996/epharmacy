from django.shortcuts import render,redirect
from django.views.generic import ListView,DetailView,DeleteView,UpdateView
from django.views import View
from products.models import Drug
from epharmacy.utils import parse_querydict
from .forms import *
from .models import InventoryItem
from django.urls import reverse_lazy
from django.contrib import messages
from epharmacy.mixins import PharmacistRequiredMixin
# Create your views here.

class InventoryDetailView(PharmacistRequiredMixin, DetailView):
    model = InventoryItem
    context_object_name = "inventory_item"
    template_name = "./inventory/details.html"

class DeleteDrugView(PharmacistRequiredMixin, DeleteView):
    model = InventoryItem
    success_url = reverse_lazy("inventory:index_inventory")
    template_name = "./inventory/confirm_delete.html"

class InventoryEditView(PharmacistRequiredMixin, UpdateView):
    model = InventoryItem
    form_class = InventoryItemEditForm
    template_name = "./inventory/update.html"
    success_url = reverse_lazy("inventory:index_inventory")

class IndexInventoryView(PharmacistRequiredMixin, ListView):
    model = InventoryItem
    ordering = "-quantity"
    context_object_name = "inventory_items"
    paginate_by = 10
    template_name = "./inventory/index.html"

class InventoryCreateView(PharmacistRequiredMixin, View):
    def get(self,request,*args,**kwargs):
        context = {"drugs": Drug.objects.values('id','name').order_by('name')}
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
        messages.success(request,"Successfully added to inventory.")
        return redirect("/inventory")