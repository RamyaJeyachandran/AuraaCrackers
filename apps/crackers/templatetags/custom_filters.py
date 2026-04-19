from django import template

register = template.Library()

@register.filter
def multiply(value, arg):
    try:
        res = float(value) * float(arg)
        return "{:.2f}".format(res)
    except (ValueError, TypeError):
        return "0"

@register.filter
def get_item(dictionary, key):
    return dictionary.get(key)

@register.filter
def replace_quotes(value):
    if isinstance(value, str):
        return value.replace('\\"', '"')
    return value

@register.filter
def get_range(value):
    """
    Returns a range object for loops.
    """
    try:
        return range(int(value))
    except (ValueError, TypeError):
        return range(0)
