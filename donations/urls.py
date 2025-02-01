from django.urls import path, include
from .views import *

app_name="donations"

urlpatterns = [
    path('', DonationsAvailableListView.as_view(),name='donations_list'),
    path('pending/', DonatinosPendingApprovalList.as_view(),name='donations_pending_approval_list'),
    path('requests/', DonationsRequestedListView.as_view(),name='donations_request_list'),
    path('requests/<int:pk>/', DonationRequestDetailView.as_view(),name='donations_request_detail'),
    path('<int:pk>/', DonationsDetailView.as_view(),name='donations_detail'),
    path('<int:pk>/approve', DonationsApproveView.as_view(),name='donations_approve'),
    path('<int:pk>/reject', DonationsRejectView.as_view(),name='donations_reject'),
    path('<int:pk>/request', DonationsRequestView.as_view(),name='donations_request'),
    path('create/', DonationsCreateView.as_view(),name='donations_create'),
]