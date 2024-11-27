from collections import defaultdict
import re

def parse_querydict(query_dict):
    parsed_data = {}

    for key, value in query_dict.items():
        if key == 'csrfmiddlewaretoken':
            continue  # Skip CSRF token if present

        # Extract nested keys using regex (e.g., 'drugs[0][drug_id]' -> ['drugs', '0', 'drug_id'])
        parts = re.split(r'\[|\]', key)
        parts = [p for p in parts if p]  # Remove empty strings caused by splitting

        # Build the nested dictionary structure
        current = parsed_data
        for part in parts[:-1]:  # Traverse until the second-to-last part
            if part not in current:
                current[part] = {}
            current = current[part]
        
        # Assign the value to the last key
        current[parts[-1]] = value[0]  # Use the first element of the list

    return parsed_data