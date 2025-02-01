from .models import Donation,DonationRequest
from django import forms

class DonationRequestForm(forms.ModelForm):
    def __init__(self, donation=None,*args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['donation'].initial = donation
        self.fields['donation'].widget.attrs['disabled'] = True
        self.fields['quantity'].widget.attrs['min'] = 1
        self.fields['quantity'].widget.attrs['max'] = donation.quantity
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
    class Meta:
        model = DonationRequest
        fields = ['donation','attachment','quantity','comment']

class DonationForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
    class Meta:
        model = Donation
        fields = ['product_name','quantity','comment','image']