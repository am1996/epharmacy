from django.shortcuts import render
from django.views.generic import CreateView,ListView,DetailView
from .models import Drug
from .forms import ProductForm
# Create your views here.

class IndexView(ListView):
    model = Drug
    template_name = "./products/index.html"
    context_object_name = 'drugs'

class DrugDetailsView(DetailView):
    model = Drug
    template_name = "./products/details.html"
    context_object_name = "drug"

class CreateDrugView(CreateView):
    model = Drug
    template_name = "./products/create.html"
    form_class = ProductForm

