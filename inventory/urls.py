from django.urls import path, include
from .views import *

app_name="inventory"

urlpatterns = [
    path("",IndexInventoryView.as_view(),name="index_inventory"),
    path("<int:pk>/",InventoryDetailView.as_view(),name="details_inventory"),
    path("<int:pk>/edit",InventoryEditView.as_view(),name="update_inventory"),
    path("<int:pk>/delete",DeleteDrugView.as_view(),name="delete_inventory"),
    path("add/",InventoryCreateView.as_view(),name="create_inventory"),
]