from django.db import models
from products.models import Drug
from django.conf import settings

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