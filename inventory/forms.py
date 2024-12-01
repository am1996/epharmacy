from django.forms import ModelForm
from django import forms
from .models import InventoryItem

class InventoryItemForm(ModelForm):
    class Meta:
        model = InventoryItem
        exclude = ['id']
        required = True
    
    def clean_pharmacist_price(self):
        try:
            data = float(self.cleaned_data["pharmacist_price"])
        except:
            raise forms.ValidationError('pharmacist price is not valid.')
        return data
    
    def clean_public_price(self):
        try:
            public_price = float(self.cleaned_data["public_price"])
            pharmacist_price = float(self.cleaned_data["pharmacist_price"])
        except:
            raise forms.ValidationError('pharmacist price or public price is not valid.')
        if pharmacist_price > public_price:
            raise forms.ValidationError('pharmacist price must be less than or equal to public price.')
        return public_price
    
    def clean_manufacturing_date(self):
        try:
            data = self.cleaned_data["manufacturing_date"]
        except:
            raise forms.ValidationError('invalid manufacturing date.')
        return data

    def clean_expiry_date(self):
        try:
            expiry_date = self.cleaned_data["expiry_date"]
            manufacturing_date = self.cleaned_data["manufacturing_date"]
        except:
            raise forms.ValidationError('invalid expiry date or manufacturing date.')
        if manufacturing_date > expiry_date:
            raise forms.ValidationError('manufacturing date must be less than or equal to expiry date.')
        return expiry_date

    def clean_quantity(self):
        try:
            quantity = int(self.cleaned_data["quantity"])
        except:
            raise forms.ValidationError('Invalid quantity')
        if quantity <= 0:
            raise forms.ValidationError('Quantity can not be less than or equal to 0.')
        return quantity
    
class InventoryItemEditForm(InventoryItemForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
    class Meta:
        model = InventoryItem
        exclude = ['id','drug_id','created_by']
        required = True
    expiry_date = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
    manufacturing_date = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))