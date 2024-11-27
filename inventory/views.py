from django.shortcuts import render,redirect
from django.views.generic import CreateView,ListView,DetailView,DeleteView,UpdateView
from pprint import pprint
from django.views import View
from .models import InventoryItem
from products.models import *
from epharmacy.utils import parse_querydict
# Create your views here.

class InventoryCreateView(View):
    def get(self,request,*args,**kwargs):
        context = {"drugs": Drug.objects.values('id','name')}
        return render(request,"./inventory/index.html",context)
    
    def post(self,request,*args,**kwargs):
        pprint(parse_querydict(request.POST))
        return redirect("/")