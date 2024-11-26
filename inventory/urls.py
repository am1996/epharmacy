from django.urls import path, include
from .views import *

app_name="inventory"

urlpatterns = [
    path("",IndexView.as_view(),name="index_inventory"),
    path("add/",InventoryCreateView.as_view(),name="create_drug"),
]