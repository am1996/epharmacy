from django.shortcuts import HttpResponse,render
from products.models import Drug

def index(request):
    drugs = Drug.objects.all()
    return render(request,"index.html",{"drugs":drugs})

