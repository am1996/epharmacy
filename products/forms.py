from django.forms import ModelForm
from .models import Drug

class ProductForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'

    class Meta:
        model = Drug
        fields = ('name', 'active_ingrendients', 'img','price','company','group','data','route')