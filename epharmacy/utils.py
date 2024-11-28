from collections import defaultdict
import re

def parse_querydict(query_dict):
    parsed_data = {}

    for key, value in query_dict.items():
        if key == 'csrfmiddlewaretoken':
            continue  # Skip CSRF token if present
        
        try:
            idx,k = key.split("__")
            parsed_data.setdefault(idx,{})
            parsed_data[idx][k] = value
        except:
            pass

    return parsed_data