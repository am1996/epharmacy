from django import template
from django.core.serializers.json import DjangoJSONEncoder

register = template.Library()

@register.filter
def queryset_to_json(queryset):
    """
    Converts a QuerySet to a JSON string.
    """
    return DjangoJSONEncoder().encode(list(queryset.values()))