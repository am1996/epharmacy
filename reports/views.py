from django.shortcuts import render,HttpResponse
from django.views.generic import ListView,View,DetailView
from django.views.generic import View
from orders.models import OrderItem,Order
from django.contrib.auth.models import User
from inventory.models import InventoryItem
from django.db.models import Sum,Count,Subquery,OuterRef
from donations.models import *
from epharmacy.mixins import PharmacistRequiredMixin
from .forms import SearchForm
# Create your views here.

class ReportsIndexView(PharmacistRequiredMixin,View):
    def get(self,request):
        return render(request,"./reports/index.html")
    

class ReportsUsersView(PharmacistRequiredMixin,View):
    def get(self,request):
        return render(request,"./reports/users.html")
    
    def post(self,request):
        form = SearchForm(self.request.POST)

        if form.is_valid():
            cleaned_data = form.cleaned_data
            limit = cleaned_data["limit"]
            start_date = cleaned_data["start_date"]
            end_date = cleaned_data["end_date"]
            if cleaned_data["search_type"] == "hou":
                f = Order.objects.filter(order_date__range=(start_date,end_date),created_by=OuterRef("pk"))
                users = User.objects.filter(profile__role=3).annotate(count=Count('created_orders',
                                                                filter=Subquery(f.values('pk')))).order_by('-count')[:limit]
                return render(request,"./reports/users_report.html",{"heading":"Highest Ordering Users","users":users,"item":"Orders"})
            elif cleaned_data["search_type"] == "lou":        
                f = Order.objects.filter(order_date__range=(start_date,end_date),created_by=OuterRef("pk"))
                users = User.objects.filter(profile__role=3).annotate(count=Count('created_orders',
                                                                filter=Subquery(f.values('pk')))).order_by('count')[:limit]
                return render(request,"./reports/users_report.html",{"heading":"Lowest Ordering Users","users":users,"item":"Orders"})
            
            elif cleaned_data["search_type"] == "hdu":
                f = Donation.objects.filter(created_at__range=(start_date,end_date),donated_by=OuterRef("pk"))
                users = User.objects.filter(profile__role=3).annotate(count=Count('donations',
                                                                filter=Subquery(f.values('pk')))).order_by('-count')[:limit]
                return render(request,"./reports/users_report.html",{"heading":"Highest Donating Users","users":users,"item":"Donations"})
            elif cleaned_data["search_type"] == "ldu":
                f = Donation.objects.filter(created_at__range=(start_date,end_date),donated_by=OuterRef("pk"))
                users = User.objects.filter(profile__role=3).annotate(count=Count('donations',
                                                                filter=Subquery(f.values('pk')))).order_by('count')[:limit]
                return render(request,"./reports/users_report.html",{"heading":"Lowest Donating Users","users":users,"item":"Donations"})
            elif cleaned_data["search_type"] == "hurd":
                f = DonationRequest.objects.filter(created_at__range=(start_date,end_date),requested_by=OuterRef("pk"))
                users = User.objects.filter(profile__role=3).annotate(count=Count('donation_requests',
                                                                filter=Subquery(f.values('pk')))).order_by('-count')[:limit]
                return render(request,"./reports/users_report.html",{"heading":"Highest Users Requesting Donations","users":users,"item":"Donation Requests"})
            elif cleaned_data["search_type"] == "lurd":
                f = DonationRequest.objects.filter(created_at__range=(start_date,end_date),requested_by=OuterRef("pk"))
                users = User.objects.filter(profile__role=3).annotate(count=Count('donation_requests',
                                                                filter=Subquery(f.values('pk')))).order_by('count')[:limit]
                return render(request,"./reports/users_report.html",{"heading":"Lowest Users Requesting Donations","users":users,"item":"Donation Requests"})

class ReportsProductsView(PharmacistRequiredMixin, View):
    def get(self,request):
        return render(request,"./reports/products.html")

    def post(self,request):
        form = SearchForm(self.request.POST)

        if form.is_valid():
            cleaned_data = form.cleaned_data
            if cleaned_data["search_type"] == "tps":
                limit = cleaned_data["limit"]
                top_ordered = OrderItem.objects.filter(order_id__order_date__gte=cleaned_data["start_date"],order_id__order_date__lte=cleaned_data["end_date"]).annotate(total_quantity=Sum('quantity')).order_by('-total_quantity')[:limit]
                print(top_ordered)
                return render(request,"./reports/products_report.html",{"result":top_ordered,"heading":"Top Ordered Products"})
            elif cleaned_data["search_type"] == "lps":
                limit = cleaned_data["limit"]
                top_ordered = OrderItem.objects.filter(order_id__order_date__gte=cleaned_data["start_date"],order_id__order_date__lte=cleaned_data["end_date"]).annotate(total_quantity=Sum('quantity')).order_by('total_quantity')[:limit]
                print(top_ordered)
                return render(request,"./reports/products_report.html",{"result":top_ordered,"heading":"Lowest Ordered Products"})
            elif cleaned_data["search_type"] == "tpis":
                limit = cleaned_data["limit"]
                result = InventoryItem.objects.filter(created_at__range=(cleaned_data["start_date"], cleaned_data["end_date"]),quantity__gt=0).order_by("-quantity")[:limit]
                return render(request,"./reports/products_report.html",{"result":result,"heading":"Products With The Highest Stock"})
            elif cleaned_data["search_type"] == "lpis":
                limit = cleaned_data["limit"]
                result = InventoryItem.objects.filter(created_at__range=(cleaned_data["start_date"], cleaned_data["end_date"]),quantity__gt=0).order_by("quantity")[:limit]
                return render(request,"./reports/products_report.html",{"result":result,"heading":"Products With The Highest Stock"})
        else:
            return HttpResponse("Something went wrong 504.")
        

class ReportsDonationsView(PharmacistRequiredMixin, View):
    def get(self,request):
        return render(request,"./reports/donations.html")
    
    def post(self,request):
        form = SearchForm(self.request.POST)
        if form.is_valid():
            cleaned_data = form.cleaned_data
            if cleaned_data["search_type"] == "tds":
                limit = cleaned_data["limit"]
                result = Donation.objects.filter(created_at__range=(cleaned_data["start_date"], cleaned_data["end_date"])).order_by("-quantity")[:limit]
                return render(request,"./reports/donations_report.html",{"result":result})
            elif cleaned_data["search_type"] == "tdrs":
                limit = cleaned_data["limit"]
                result = DonationRequest.objects.filter(created_at__range=(cleaned_data["start_date"], cleaned_data["end_date"])).order_by("quantity")[:limit]
                return render(request,"./reports/donation_requests_report.html",{"result":result})
            elif cleaned_data["search_type"] == "ldrs":
                limit = cleaned_data["limit"]
                result = DonationRequest.objects.filter(created_at__range=(cleaned_data["start_date"], cleaned_data["end_date"])).order_by("quantity")[:limit]
                return render(request,"./reports/donation_requests_report.html",{"result":result})
        else:
            return HttpResponse("Something went wrong 504.")