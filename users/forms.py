from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import UserProfile
from django.contrib.auth.forms import PasswordChangeForm
from inventory.models import InventoryItemDispensed

class PasswordChangeCustomForm(PasswordChangeForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
            
class LoginForm(forms.Form):
    username = forms.CharField(label='Username', max_length=100,widget=forms.TextInput(attrs={'class':'form-control'}))
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class':'form-control'}),label='Password')

class UserEditForm(forms.ModelForm):
    email = forms.EmailField(widget=forms.EmailInput(attrs={'class':'form-control'}),label='email address')
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email']  # Fields from the User model

class ProfileEditForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
    class Meta:
        model = UserProfile
        fields = ['photo', 'address', 'phone_number', 'gender']  # Fields from the Profile model

class RegisterationForm(UserCreationForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email']

class InventoryItemDispensedForm(forms.ModelForm):
    class Meta:
        model = InventoryItemDispensed
        fields = "__all__"
