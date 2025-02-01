from django.db import models
import uuid,os
# Create your models here.
def upload_to_donated(instance,filename):
    if not filename:  # If filename is None or empty
        filename = 'default.jpg'  # Provide a default name or handle gracefully
    ext = filename.split('.')[-1]
    return os.path.join('donations/donated', f'{uuid.uuid4().hex}.{ext}')

def upload_to_requested(instance,filename):
    if not filename:  # If filename is None or empty
        filename = 'default.jpg'  # Provide a default name or handle gracefully
    ext = filename.split('.')[-1]
    return os.path.join('donations/requested', f'{uuid.uuid4().hex}.{ext}')

class Donation(models.Model):
    donated_by = models.ForeignKey('auth.User', on_delete=models.CASCADE, related_name='donations')
    product_name = models.CharField(max_length=300)
    quantity = models.IntegerField()
    comment = models.TextField()
    image = models.ImageField(upload_to=upload_to_donated)
    status = models.CharField(choices= [
        ('0',"Rejected"),
        ('1',"Pending"),
        ('2',"Approved"),
        ('3',"Requested"),
        ('4',"Donation Sent")
    ],max_length=30,default=1)
    approved_by = models.ForeignKey('auth.User', on_delete=models.CASCADE, related_name='approved_donations', null=True)
    received_by = models.ForeignKey('auth.User',on_delete=models.CASCADE,related_name='received_donations',blank=True,null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    @property
    def get_status(self):
        if self.status == "0":
            return "Rejected"
        elif self.status == "1":
            return "Pending"
        elif self.status == "2":
            return "Approved"
        elif self.status == "3":
            return "Requested"
        elif self.status == "4":
            return "Donation Sent"
    
    def __str__(self):
        return self.product_name

class DonationRequest(models.Model):
    donation = models.ForeignKey(Donation, on_delete=models.CASCADE)
    attachment = models.FileField(upload_to=upload_to_requested,null=True,blank=True)
    quantity = models.IntegerField(default=1)
    comment = models.TextField(null=True,blank=True)
    status = models.IntegerField(choices=[
        (0,"Rejected"),
        (1,"Pending"),
        (2,"Approved"),
        (3,"Sent")
    ],default=1)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    requested_by = models.ForeignKey('auth.User', on_delete=models.CASCADE,related_name="donation_requests")

    @property
    def get_status(self):
        if self.status == 0:
            return "Rejected"
        elif self.status == 1:
            return "Pending"
        elif self.status == 2:
            return "Approved"
        elif self.status == 3:
            return "Sent"