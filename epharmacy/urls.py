from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from .views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    path('products/',include("products.urls",namespace="products")),
    path('inventory/',include("inventory.urls",namespace="inventory")),
    path('orders/',include("orders.urls",namespace="orders")),
    path('user/',include("users.urls",namespace="user")),
    path('donations/',include("donations.urls",namespace="donations")),
    path('cart/',CartIndexView.as_view()),
    path('cart/placeorder',PlaceOrderView.as_view()),
    path('', DrugListView.as_view(),name="home"),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)