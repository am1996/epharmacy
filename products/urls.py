from django.urls import path, include
from .views import *

app_name="products"

urlpatterns = [
    path("",IndexView.as_view(),name="index_drug"),
    path("<int:pk>",DetailsDrugView.as_view(),name="detail_drug"),
    path("<int:pk>/delete",DeleteDrugView.as_view(),name="delete_drug"),
    path("<int:pk>/update",UpdateDrugView.as_view(),name="update_drug"),
    path("create/",CreateDrugView.as_view(),name="create_drug"),
    path("search/",SearchView.as_view(),name="search_drug"),
]