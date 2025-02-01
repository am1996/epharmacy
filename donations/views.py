from django.shortcuts import render,redirect,get_object_or_404
from django.views.generic import ListView,DetailView,DeleteView,UpdateView,CreateView
from django.views import View
from django.core.paginator import Paginator
from epharmacy.utils import parse_querydict
from .forms import *
from .models import Donation,DonationRequest
from django.urls import reverse_lazy
from .forms import DonationForm,DonationRequestForm
from django.contrib import messages
from epharmacy.mixins import PharmacistRequiredMixin,ClientRequiredMixin
from django.db import transaction
# Create your views here.

class DonationsAvailableListView(ListView):
    model = Donation
    template_name = 'donations/donations_list.html'
    context_object_name = 'donations'
    paginate_by = 10
    order_by = '-created_at'
    def get_queryset(self):
        return Donation.objects.filter(status=2)

class DonatinosPendingApprovalList(PharmacistRequiredMixin,ListView):
    model = Donation
    template_name = 'donations/donations_pending_approval_list.html'
    context_object_name = 'donations'
    paginate_by = 10
    order_by = '-created_at'
    def get_queryset(self):
        return Donation.objects.filter(status=1)

class DonationsRequestedListView(PharmacistRequiredMixin,View):
    def get_paginator(self, request, status, page_number, page_name):
        item = DonationRequest.objects.filter(status=status).order_by('-created_at')
        item = Paginator(item,page_number)
        item_page_number = request.GET.get(page_name)
        item = item.get_page(item_page_number)
        return item

    def get(self, request, *args, **kwargs):
        #sent requests
        don_req_rejected = self.get_paginator(request,0,10,'drr')

        #pending requests
        don_req_pending = self.get_paginator(request,1,10,'drp')

        #approved requests
        don_req_approved = self.get_paginator(request,2,10,'dra')

        #sent requests
        don_req_sent = self.get_paginator(request,3,10,'drs')
        print(don_req_sent.object_list)
        return render(request, 'donations/donations_request_list.html', {
                'don_req_pending':don_req_pending,
                'don_req_approved':don_req_approved,
                'don_req_rejected':don_req_rejected,
                'don_req_sent':don_req_sent
            })

class DonationRequestDetailView(PharmacistRequiredMixin,DetailView):
    model = DonationRequest
    template_name = 'donations/donations_request_detail.html'
    context_object_name = 'donation_request'

    @transaction.atomic
    def dispense_from_donation(self,donation_request):
        if donation_request.quantity > donation_request.donation.quantity:
            raise ValueError("Not enough donation inventory to dispense this quantity.")
        donation_request.donation.quantity -= donation_request.quantity
        donation_request.donation.save()
        donation_request.save()
        

    def post(self, request, *args, **kwargs):
        id = kwargs.get('pk','')
        status = request.POST.get('status')
        donation_request = get_object_or_404(DonationRequest,pk=id)
        if status == '2':
            donation_request.status = 2
            self.dispense_from_donation(donation_request)
            messages.success(self.request, 'Donation Request Approved Successfully')
        elif status == '0' and donation_request.status == 1:
            donation_request.status = 0
            donation_request.save()
            messages.warning(self.request, 'Donation Request Rejected Successfully.')
        elif status == '3' and donation_request.status == 2:
            donation_request.status = 3
            donation_request.save()
            messages.success(self.request, 'Donation Request Sent Successfully')
        else:
            messages.success(self.request, 'Wrong Status')
        return redirect("donations:donations_request_list")

class DonationsCreateView(ClientRequiredMixin,CreateView):
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

class DonationsRejectView(PharmacistRequiredMixin,View):
    def post(self, request, *args, **kwargs):
        donation = get_object_or_404(Donation,pk=self.kwargs['pk'])
        donation.status = 0
        donation.approved_by = self.request.user
        donation.save()
        messages.success(self.request, 'Donation Rejected Successfully')
        return redirect('donations:donations_list')

class DonationsRequestView(ClientRequiredMixin,View):
    def get(self, request, *args, **kwargs):
        donation = get_object_or_404(Donation,pk=self.kwargs['pk'])
        if donation.status != '2':
            messages.error(self.request, 'Donation is not available for request')
            return redirect('donations:donations_list')
        donation_form = DonationRequestForm(donation=donation)
        return render(request, 'donations/donations_request.html', {'donation_form':donation_form})
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