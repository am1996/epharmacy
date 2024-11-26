from django.shortcuts import render
from django.views.generic import CreateView,ListView,DetailView,DeleteView,UpdateView
from django.views import View
from .models import InventoryItem
from products.models import *
# Create your views here.

class IndexView(ListView):
    model = InventoryItem
    template_name = "./inventory/index.html"
    context_object_name = "inventory"

class InventoryCreateView(View):
    def get(self,request,*args,**kwargs):
        return render(request,template_name="./inventory/index.html")