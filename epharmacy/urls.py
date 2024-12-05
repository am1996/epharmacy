from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from .views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    path('products/',include("products.urls",namespace="products")),
    path('inventory/',include("inventory.urls",namespace="inventory")),
    path('user/',include("users.urls",namespace="user")),
    path('', index,name="home"),
]+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
