from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from users.models import UserProfile

class UserAddForm(forms.ModelForm):
    email = forms.EmailField(widget=forms.EmailInput(attrs={'class':'form-control'}),label='email address')
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class':'form-control'}),label='Password')
    confirm_password = forms.CharField(widget=forms.PasswordInput)
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get("password")
        confirm_password = cleaned_data.get("confirm_password")

        if password and confirm_password and password != confirm_password:
            raise forms.ValidationError("Passwords do not match.")

        return cleaned_data
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username','email','password']  # Fields from the User model

class ProfileAddForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
    class Meta:
        model = UserProfile
        fields = ['role','address', 'phone_number', 'gender']  # Fields from the Profile model