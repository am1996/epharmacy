from django.contrib import admin
from .models import InventoryItem,InventoryItemDispensed

# Register your models here.
admin.site.register(InventoryItem)
admin.site.register(InventoryItemDispensed)