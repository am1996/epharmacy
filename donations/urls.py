from django.urls import path, include
from .views import *

app_name="donations"

urlpatterns = [
    path('', DonationsListView.as_view(),name='donations_list'),
    path('<int:pk>/', DonationsDetailView.as_view(),name='donations_detail'),
    path('<int:pk>/approve', DonationsApproveView.as_view(),name='donations_approve'),
    path('<int:pk>/request', DonationsApproveView.as_view(),name='donations_approve'),
    path('create/', DonationsCreateView.as_view(),name='donations_create'),
]