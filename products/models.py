from django.db import models
from django.conf import settings
# Create your models here.


def user_directory_path(instance, filename):
    return 'drug_{0}'.format(instance.id)

class Drug(models.Model):
    name = models.CharField(max_length=1000)
    active_ingrendients = models.CharField(max_length=5000,null=False,blank=False,default="")
    price = models.CharField(max_length=500,null=False,blank=False,default="")
    company = models.CharField(max_length=1000,null=False,blank=False,default="")
    group = models.CharField(max_length=1000,null=False,blank=False,default="")
    data = models.TextField(null=False,blank=False,default="")
    route = models.CharField(max_length=1000,null=False,blank=False,default="")
    img = models.FileField(upload_to=user_directory_path,default="drug_default.png")
    def __str__(self):
        return self.name