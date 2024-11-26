from django.db import models
from django.conf import settings
# Create your models here.

class UserProfile(models.Model):
    photo = models.FileField()
    address = models.CharField(max_length=400)
    phone_number = models.CharField(max_length=200)
    gender = models.IntegerField(choices=(
        (1,"Male"),
        (2,"Female")
    ))
    role = models.IntegerField(choices=(
        (1,"Admin"),
        (2,"Pharmacist"),
        (3,"Client"),
    ))
    user_id = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete= models.CASCADE)

    def __str__(self):
        return self.user_id.username
