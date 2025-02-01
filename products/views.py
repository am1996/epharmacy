from django.views.generic import CreateView,ListView,DetailView,DeleteView,UpdateView
from django.urls import reverse_lazy
from .models import Drug
from .forms import ProductForm
from epharmacy.mixins import PharmacistRequiredMixin
# Create your views here.

class IndexView(ListView):
    paginate_by = 10
    model = Drug
    template_name = "./products/index.html"
    ordering = "name"
    context_object_name = 'drugs'

class SearchView(ListView):
    paginate_by = 10
    model = Drug
    template_name = "./products/index.html"
    ordering = "name"
    context_object_name = 'drugs'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["query"] = self.request.GET.get('q','')
        return context
    

    def get_queryset(self):
        query = self.request.GET.get('q', '')
        if query:
            return Drug.objects.filter(name__iregex=query)
        else:
            return Drug.objects.all()

class DetailsDrugView(DetailView):
    model = Drug
    template_name = "./products/details.html"
    context_object_name = "drug"

#allowed only to pharmacist
class CreateDrugView(PharmacistRequiredMixin,CreateView):
    model = Drug
    template_name = "./products/create.html"
    form_class = ProductForm
    success_url = reverse_lazy("products:index_drug")

#allowed only to pharmacist
class DeleteDrugView(PharmacistRequiredMixin,DeleteView):
    model = Drug
    success_url = reverse_lazy("products:index_drug")
    template_name = "./products/confirm_delete.html"

#allowed only to pharmacist
class UpdateDrugView(PharmacistRequiredMixin,UpdateView):
    model = Drug
    form_class = ProductForm
    success_url = reverse_lazy("products:index_drug")
    template_name = "./products/update.html"
