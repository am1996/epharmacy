from django.urls import path, include
from .views import *

app_name="donations"

urlpatterns = [
    path('admin/', admin.site.urls),
]