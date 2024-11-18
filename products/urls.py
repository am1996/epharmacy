from django.urls import path, include
from .views import CreateDrugView

app_name="products"

urlpatterns = [
    path("drugs/create",CreateDrugView.as_view(),name="create_drug"),
]