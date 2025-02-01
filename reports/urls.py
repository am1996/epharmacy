from django.urls import path, include
from .views import *

app_name="reports"

urlpatterns = [
    path("",ReportsIndexView.as_view(),name="index_reports"),
    path("donations",ReportsDonationsView.as_view(),name="donations_reports"),
    path("products",ReportsProductsView.as_view(),name="products_reports"),
    path("users",ReportsUsersView.as_view(),name="users_reports"),
]