from django.db import models
from django.conf import settings
# Create your models here.

class UserProfile(models.Model):
    photo = models.FileField()
    address = models.CharField(max_length=400)
    phone_number = models.CharField(max_length=200)
    gender = models.CharField(choices=(
        (1,"Male"),
        (2,"Female")
    ),max_length=10)
    role = models.CharField(choices=(
        (1,"Admin"),
        (2,"Pharmacist"),
        (3,"Client"),
    ),max_length=10)
    user_id = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete= models.CASCADE)

    def __str__(self):
        return self.user_id.username
