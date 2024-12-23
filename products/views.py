from django.views.generic import CreateView,ListView,DetailView,DeleteView,UpdateView
from django.urls import reverse_lazy
from .models import Drug
from .forms import ProductForm
# Create your views here.

class IndexView(ListView):
    paginate_by = 10
    model = Drug
    template_name = "./products/index.html"
    context_object_name = 'drugs'

class DetailsDrugView(DetailView):
    model = Drug
    template_name = "./products/details.html"
    context_object_name = "drug"

class CreateDrugView(CreateView):
    model = Drug
    template_name = "./products/create.html"
    form_class = ProductForm
    success_url = reverse_lazy("products:index_drug")

class DeleteDrugView(DeleteView):
    model = Drug
    success_url = reverse_lazy("products:index_drug")
    template_name = "./products/confirm_delete.html"

class UpdateDrugView(UpdateView):
    model = Drug
    form_class = ProductForm
    success_url = reverse_lazy("products:index_drug")
    template_name = "./products/update.html"
