from django.db import models
from products.models import Drug
from django.conf import settings
from inventory.models import InventoryItem
# Create your models here.

class Order(models.Model):
    order_date = models.DateField(auto_now=True)
    status = models.CharField(choices= [
        (1,"Pending"),
        (2,"Under Delivery"),
        (3,"Done")
    ],max_length=30,default=1)
    dispensed_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE,related_name='dispensed_orders', default= None,null= True)
    updated_at = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE,related_name='created_orders')

    def __str__(self):
        return "Order No #" + str(self.id)

class OrderItem(models.Model):
    quantity = models.IntegerField()
    order_id = models.ForeignKey(Order,on_delete=models.CASCADE,related_name="order_items")
    drug_id = models.IntegerField()
    inventory_id = models.ForeignKey(InventoryItem,on_delete=models.CASCADE,default=None, null= True)

    def __str__(self):
        return str(self.id) + " | Quantity: " + str(self.quantity)

    @property
    def drug(self):
        try:
            return Drug.objects.get(pk=self.drug_id)
        except Drug.DoesNotExist:
            return None