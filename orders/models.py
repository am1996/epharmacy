from django.db import models
from products.models import Drug
from django.conf import settings
from inventory.models import InventoryItem,InventoryItemDispensed
# Create your models here.

class Order(models.Model):
    order_date = models.DateField(auto_now=True)
    status = models.CharField(choices= [
        (1,"Pending"),
        (2,"Under Delivery"),
        (3,"Done")
    ],max_length=30,default=1)
    comment = models.TextField(null=True,blank=True)
    dispensed_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE,related_name='dispensed_orders', default= None,null= True)
    updated_at = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE,related_name='created_orders')

    def __str__(self):
        return "Order No #" + str(self.id)

class OrderItem(models.Model):
    quantity = models.IntegerField()
    order_id = models.ForeignKey(Order,on_delete=models.CASCADE,related_name="order_items")
    drug_id = models.IntegerField()

    def __str__(self):
        return str(self.id) + " | Quantity: " + str(self.quantity)

    @property
    def inventory(self):
        try:
            inv = InventoryItem.objects.filter(drug_id=self.drug_id)
            items = list(inv)
            return items
        except InventoryItem.DoesNotExist:
            return None


    @property
    def inventory_data_as_list(self):
        try:
            inv = InventoryItem.objects.filter(drug_id=self.drug_id,quantity__gt=0)  # Use self.id instead of self.drug_id
            items = [
                {
                    'id': item.id,
                    'quantity': item.quantity, 
                    'batch_no' : item.quantity,
                    'pharmacist_price' : item.pharmacist_price,
                    'public_price' : item.public_price,
                    'manufacturing_date' : item.manufacturing_date.isoformat(),
                    'expiry_date': item.expiry_date.isoformat(),
                    'drug_id': item.drug_id.id,
                    'drug_name': item.drug_id.name
                } 
                for item in inv
            ]
            return items
        except InventoryItem.DoesNotExist:
            return None

    @property
    def drug(self):
        try:
            return Drug.objects.get(pk=self.drug_id)
        except Drug.DoesNotExist:
            return None