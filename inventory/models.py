from django.db import models
from products.models import Drug
from django.conf import settings
from django.db.models import Max

# Create your models here.

class InventoryItem(models.Model):
    id = models.BigAutoField(primary_key=True)
    quantity = models.IntegerField()
    batch_no = models.CharField(max_length=100)
    pharmacist_price = models.FloatField()
    public_price = models.FloatField()
    manufacturing_date = models.DateField()
    expiry_date = models.DateField()
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    drug_id = models.ForeignKey(Drug, related_name="drugId",on_delete=models.CASCADE)
    
    def __str__(self):
        return str(self.id) + " | " + self.drug_id.name

class InventoryItemDispensed(models.Model):
    inventory_item = models.ForeignKey(InventoryItem, on_delete=models.CASCADE, related_name='dispensed_items', null=True)
    order = models.ForeignKey('orders.Order', on_delete=models.CASCADE, related_name='dispensed_items',null=True)  # Link to the order
    quantity = models.PositiveIntegerField()  # Quantity dispensed
    dispensed_by = models.ForeignKey('auth.User', on_delete=models.SET_NULL, null=True,blank=True)
    dispensed_at = models.DateTimeField(auto_now_add=True) 

    def __str__(self):
        return f"{self.quantity} of {self.inventory_item.product_name} dispensed"

    def save(self, *args, **kwargs):
        # Automatically deduct quantity from inventory
        if self.pk is None:  # Ensure this is a new record
            print(self.inventory_item.quantity)
            if self.inventory_item.quantity < self.quantity:
                raise ValueError("Not enough inventory to dispense this quantity.")
            self.inventory_item.quantity -= self.quantity
            self.inventory_item.save()
        super().save(*args, **kwargs)