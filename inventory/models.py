from django.db import models
from products.models import Drug
from django.conf import settings
from django.db.models import Max
from django.db.models import F
from django.utils import timezone
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
    created_at = models.DateTimeField(auto_now_add=True)  # Automatically set on creation
    updated_at = models.DateTimeField(auto_now=True,blank=True,null=True)  
    
    def __str__(self):
        return str(self.id) + " | " + self.drug_id.name

class InventoryManager(models.Manager):
    def save(self, *args, **kwargs):
        # Automatically deduct quantity from inventory
        if self._state.adding:
            print(f"Before: {self.inventory_item.quantity}")
            if self.inventory_item.quantity < self.quantity:
                raise ValueError("Not enough inventory to dispense this quantity.")
            self.inventory_item.quantity -= self.quantity
            InventoryItem.objects.filter(pk=self.inventory_item.pk).update(quantity=F('quantity') - self.quantity)
            self.inventory_item.refresh_from_db()
            print(f"After: {self.inventory_item.quantity}")
        super().save(*args, **kwargs)
    
    def bulk_create(self, objs, **kwargs):
        for obj in objs:
            if obj._state.adding:
                if obj.inventory_item.quantity < obj.quantity:
                    raise ValueError("Not enough inventory to dispense this quantity.")
                obj.inventory_item.quantity -= obj.quantity
                InventoryItem.objects.filter(pk=obj.inventory_item.pk).update(
                    quantity=F('quantity') - obj.quantity
                )
        # Use the default bulk_create after applying the logic
        return super().bulk_create(objs, **kwargs)

class InventoryItemDispensed(models.Model):
    inventory_item = models.ForeignKey(InventoryItem, on_delete=models.CASCADE, related_name='dispensed_items', null=True)
    order = models.ForeignKey('orders.Order', on_delete=models.CASCADE, related_name='dispensed_items',null=True)  # Link to the order
    quantity = models.PositiveIntegerField()  # Quantity dispensed
    dispensed_by = models.ForeignKey('auth.User', on_delete=models.SET_NULL, null=True,blank=True)
    dispensed_at = models.DateTimeField(auto_now_add=True) 
    objects = InventoryManager()  # Attach custom manager

    def __str__(self):
        return f"{self.quantity} of {self.inventory_item.drug_id.name} dispensed"