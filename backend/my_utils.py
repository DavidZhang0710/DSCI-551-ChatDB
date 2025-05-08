import json, re

def get_JSON_data(result):
    json_str_result = re.search(r"\{.*\}", result, re.DOTALL).group(0)
    json_data = json.loads(json_str_result)
    return json_data