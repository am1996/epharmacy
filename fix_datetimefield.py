import django
import os
from django.apps import apps
from django.utils.dateparse import parse_datetime
from django.db import transaction

# Setup Django environment if running outside manage.py shell
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "your_project.settings")
django.setup()

# Function to fix all DateTimeField values
def fix_datetime_fields():
    for model in apps.get_models():
        datetime_fields = [field.name for field in model._meta.fields if field.get_internal_type() == "DateTimeField"]
        if not datetime_fields:
            continue  # Skip models with no DateTimeField
        
        with transaction.atomic():  # Use transactions for efficiency
            for obj in model.objects.all():
                updated = False
                for field_name in datetime_fields:
                    value = getattr(obj, field_name)
                    if isinstance(value, str):  # Convert string to datetime
                        parsed_value = parse_datetime(value)
                        if parsed_value:
                            setattr(obj, field_name, parsed_value)
                            updated = True
                if updated:
                    obj.save(update_fields=datetime_fields)  # Save only updated fields

    print("✅ All datetime fields have been fixed!")

# Run the function
fix_datetime_fields()
