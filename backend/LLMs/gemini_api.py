import requests
from LLMs import prompt_data

GEMINI_API_KEY = "YOUR_GEMINI_API_KEY"

class LLM:
    def __init__(self, prompt = prompt_data.prompt):
        self.url = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key={GEMINI_API_KEY}"
        self.headers = {"Content-Type": "application/json"}
        self.prompt = prompt
        self.format = prompt_data.format
        self.instruction = prompt_data.instruction

    def get_general_response(self, query):
        data = {
            "contents": [{
                "parts": [{"text": query}]
            }]
        }
        response = requests.post(self.url, headers=self.headers, json=data)
        if response.status_code == 200:
            result = response.json()
            text = result.get("candidates", [{}])[0].get("content", {}).get("parts", [{}])[0].get("text", "No response")
            return text
        else:
            return f"!!!Error: {response.status_code}, {response.text}"

    def get_SQL_response(self, db_schema, query):
        data = {
            "contents": [
                {"parts": [
                        {"text": f"### Databases Schema and example data:\n{db_schema}"},
                        {"text": self.prompt},
                        {"text": self.format},
                        {"text": f"### User Query:\n{query}"}]
                }
            ]
        }
        response = requests.post(self.url, headers=self.headers, json=data)
        if response.status_code == 200:
            result = response.json()
            text = result.get("candidates", [{}])[0].get("content", {}).get("parts", [{}])[0].get("text", "No response")
            return text
        else:
            return f"!!!Error: {response.status_code}, {response.text}"
    
    def get_response_from_SQL_result(self, db_schema, SQL_result, query):
        data = {
            "contents": [
                {"parts": [
                        {"text": f"### Databases Schema:\n{db_schema}"},
                        {"text": f"### SQL Query Result:\n{SQL_result}"},
                        {"text": self.instruction},
                        {"text": f"### User Query:\n{query}"}]
                }
            ]
        }
        response = requests.post(self.url, headers=self.headers, json=data)
        if response.status_code == 200:
            result = response.json()
            text = result.get("candidates", [{}])[0].get("content", {}).get("parts", [{}])[0].get("text", "No response")
            return text
        else:
            return f"!!!Error: {response.status_code}, {response.text}"

if __name__ == "__main__":
    with open("data/db_schema.txt", "r", encoding="utf-8") as file:
        db_schema = file.read().strip()
    query = "I want to query all data from table users"
    llm_api = LLM()
    print(llm_api.get_SQL_response(db_schema, query))