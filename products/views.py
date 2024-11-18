from django.shortcuts import render
from django.views.generic import CreateView
from .models import Drug
from .forms import ProductForm
# Create your views here.

class CreateDrugView(CreateView):
    model = Drug
    template_name = "./products/create.html"
    form_class = ProductForm

