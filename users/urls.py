from django.urls import path, include
from .views import *

app_name="user"

urlpatterns = [
    path("login",UserLoginView.as_view(),name="user")
]