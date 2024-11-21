from django.urls import path, include
from .views import *

app_name="products"

urlpatterns = [
    path("",IndexView.as_view(),name="create_drug"),
    path("<int:pk>",DrugDetailsView.as_view(),name="detail_drug"),
    path("create/",CreateDrugView.as_view(),name="create_drug"),
]