from django.urls import path, include
from .views import *

app_name="user"

urlpatterns = [
    path("",UserProfileView.as_view(),name="profile"),
    path("changepassword/",CustomPasswordChangeView.as_view(),name="changepassword"),
    path("logout/",UserLogoutView.as_view(), name="logout"),
    path("login/",UserLoginView.as_view(),name="login"),
    path("register/",UserRegisterView.as_view(),name="register"),
    path("dashboard/",UserDashboardView.as_view(),name="dashboard"),
    path("profile/edit",UserProfileEditView.as_view(),name="profile_edit"),
]