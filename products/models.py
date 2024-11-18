from django.db import models
from django.conf import settings
# Create your models here.

class Drug(models.Model):
    name = models.CharField(max_length=1000)
    active_ingrendients = models.CharField(max_length=5000,null=False,blank=False,default="")
    price = models.CharField(max_length=500,null=False,blank=False,default="")
    company = models.CharField(max_length=1000,null=False,blank=False,default="")
    group = models.CharField(max_length=1000,null=False,blank=False,default="")
    data = models.TextField(null=False,blank=False,default="")
    route = models.CharField(max_length=1000,null=False,blank=False,default="")

class Order(models.Model):
    order_date = models.DateField()
    status = models.CharField(choices= [
        (1,"Pending"),
        (2,"Under Delivery"),
        (3,"Done")
    ],max_length=30)
    dispensed_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE,related_name='dispensed_orders')
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE,related_name='created_orders')

class InventoryItem(models.Model):
    quantity = models.IntegerField()
    batch_no = models.CharField(max_length=100)
    price = models.FloatField()
    manufacturing_date = models.DateField()
    expiry_date = models.DateField()
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    drug_id = models.ForeignKey(Drug, related_name="drugId",on_delete=models.CASCADE)

class OrderItem(models.Model):
    quantity = models.IntegerField()
    order_id = models.ForeignKey(Order,on_delete=models.CASCADE)
    inventory_id = models.ForeignKey(InventoryItem,on_delete=models.CASCADE)