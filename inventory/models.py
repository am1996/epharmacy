from django.db import models
from products.models import Drug
from django.conf import settings

# Create your models here.

class InventoryItem(models.Model):
    quantity = models.IntegerField()
    batch_no = models.CharField(max_length=100)
    price = models.FloatField()
    manufacturing_date = models.DateField()
    expiry_date = models.DateField()
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    drug_id = models.ForeignKey(Drug, related_name="drugId",on_delete=models.CASCADE)