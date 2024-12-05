from django.db import models
from inventory.models import InventoryItem
from django.conf import settings

# Create your models here.
class Order(models.Model):
    order_date = models.DateField()
    status = models.CharField(choices= [
        (1,"Pending"),
        (2,"Under Delivery"),
        (3,"Done")
    ],max_length=30)
    dispensed_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE,related_name='dispensed_orders')
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE,related_name='created_orders')

class OrderItem(models.Model):
    quantity = models.IntegerField()
    order_id = models.ForeignKey(Order,on_delete=models.CASCADE)
    inventory_id = models.ForeignKey(InventoryItem,on_delete=models.CASCADE)