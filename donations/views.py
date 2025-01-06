from django.shortcuts import render,redirect,get_object_or_404
from django.views.generic import ListView,DetailView,DeleteView,UpdateView,CreateView
from django.views import View
from products.models import Drug
from epharmacy.utils import parse_querydict
from .forms import *
from .models import Donation,DonationRequest
from django.urls import reverse_lazy
from .forms import DonationForm
from django.contrib import messages
from epharmacy.mixins import PharmacistRequiredMixin,ClientRequiredMixin
# Create your views here.

class DonationsListView(ListView):
    model = Donation
    template_name = 'donations/donations_list.html'
    context_object_name = 'donations'
    paginate_by = 10
    order_by = '-created_at'

    def get_queryset(self):
        return Donation.objects.filter(status=2)
    
class DonationsCreateView(CreateView):
    model = Donation
    template_name = 'donations/donations_create.html'
    form_class = DonationForm
    success_url = reverse_lazy('donations:donations_list')
    
    def form_valid(self, form):
        form.instance.donated_by = self.request.user
        messages.success(self.request, 'Donation Created Successfully')
        return super().form_valid(form)

class DonationsDetailView(DetailView):
    model = Donation
    template_name = 'donations/donations_detail.html'
    context_object_name = 'donation'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['donation_request'] = DonationRequest.objects.filter(donation=self.get_object())
        return context

class DonationsApproveView(PharmacistRequiredMixin,View):
    def post(self, request, *args, **kwargs):
        donation = get_object_or_404(Donation,pk=self.kwargs['pk'])
        donation.status = 2
        donation.approved_by = self.request.user
        donation.save()
        messages.success(self.request, 'Donation Approved Successfully')
        return redirect('donations:donations_list')

class DonationsRequestView(ClientRequiredMixin,View):
    def post(self, request, *args, **kwargs):
        donation = get_object_or_404(Donation,pk=self.kwargs['pk'])
        donation_request = DonationRequest.objects.create(
            donation=donation,
            attachment=request.FILES['attachment'],
            quantity=request.POST['quantity'],
            requested_by=self.request.user
        )
        messages.success(self.request, 'Donation Requested Successfully')
        return redirect('donations:donations_list')