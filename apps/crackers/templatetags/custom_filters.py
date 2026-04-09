from django import template

register = template.Library()

@register.filter
def multiply(value, arg):
    try:
        return value * arg
    except (ValueError, TypeError):
        return 0

@register.filter
def get_item(dictionary, key):
    return dictionary.get(key)

@register.filter
def replace_quotes(value):
    if isinstance(value, str):
        return value.replace('\\"', '"')
    return value
