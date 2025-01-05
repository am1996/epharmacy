from django.shortcuts import render,redirect
from django.views.generic import ListView,DetailView,DeleteView,UpdateView
from django.views import View
from products.models import Drug
from epharmacy.utils import parse_querydict
from .forms import *
from .models import InventoryItem
from django.urls import reverse_lazy
from django.contrib import messages
from epharmacy.mixins import PharmacistRequiredMixin
# Create your views here.