from django.shortcuts import render
from django.views.generic import ListView
from inventory.models import InventoryItem
# Create your views here.

class IndexOrdersView(ListView):
    model = InventoryItem
    template_name = "./templates/index.html"
    context_object_name = "inventory"
    paginate_by = 10
    
    def get_context_data(self, **kwargs):
        return InventoryItem.objects.values("drug_id").annotate(stock="quantity")