from django.db import models
from django.conf import settings
# Create your models here.


def user_directory_path(instance, filename):
    return 'profile_images/drug_{0}'.format(instance.id)

class UserProfile(models.Model):
    photo = models.FileField(default="profile_images/default_profile.png",upload_to=user_directory_path)
    address = models.CharField(max_length=400)
    phone_number = models.CharField(max_length=200)
    gender = models.IntegerField(choices=(
        (1,"Male"),
        (2,"Female")
    ),default=1)
    role = models.IntegerField(choices=(
        (1,"Admin"),
        (2,"Pharmacist"),
        (3,"Client"),
    ),default= 3)
    user = models.OneToOneField(settings.AUTH_USER_MODEL,on_delete= models.CASCADE, null=True,related_name="profile")

    def __str__(self):
        return self.user.username

