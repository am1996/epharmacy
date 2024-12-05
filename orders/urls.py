from django.urls import path, include
from .views import *

app_name="orders"

urlpatterns = [
    path("",IndexOrdersView.as_view(),name="index_orders"),
]