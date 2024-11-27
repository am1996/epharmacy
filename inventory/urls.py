from django.urls import path, include
from .views import *

app_name="inventory"

urlpatterns = [
    path("add/",InventoryCreateView.as_view(),name="index_inventory"),
]