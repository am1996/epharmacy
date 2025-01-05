from django.db import models

# Create your models here.
class Donation(models.Model):
    donated_by = models.ForeignKey('auth.User', on_delete=models.CASCADE, related_name='donations')
    product_name = models.CharField(max_length=300)
    quantity = models.IntegerField(min=1)
    comment = models.TextField()
    image = models.ImageField(upload_to='donations/')
    status = models.CharField(choices= [
        (1,"Pending"),
        (2,"Under Approval"),
        (3,"Approved And Received"),
        (4,"Donation Sent")
    ],max_length=30,default=1)
    approved_by = models.ForeignKey('auth.User', on_delete=models.CASCADE, related_name='approved_donations', null=True)
    received_by = models.ForeignKey('auth.User',on_delete=models.CASCADE,related_name='received_donations',null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name