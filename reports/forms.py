from django import forms
from django.utils.dateparse import parse_date
from datetime import datetime

class SearchForm(forms.Form):
    search_type = forms.CharField()
    limit = forms.IntegerField(initial=10,required=False)
    start_date = forms.DateField(required=False)
    end_date = forms.DateField(required=False)

    def clean(self):
        cleaned_data = super().clean()
        start_date = cleaned_data.get('start_date')
        end_date = cleaned_data.get('end_date')
        if not start_date and not end_date:
            # Default date range
            end_date = datetime.now()
            start_date = end_date.replace(year=end_date.year - 1)  # Last year

        if start_date and end_date and start_date > end_date:
            raise forms.ValidationError("Start date must be before the end date.")

        # Set default end date if missing
        if start_date and not end_date:
            end_date = start_date.replace(hour=23, minute=59, second=59)

        # Set default start date if missing
        if not start_date and end_date:
            start_date = end_date.replace(hour=0, minute=0, second=0)

        cleaned_data['start_date'] = start_date
        cleaned_data['end_date'] = end_date
        return cleaned_data