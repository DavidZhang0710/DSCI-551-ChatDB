from flask import Flask, jsonify, request
from flask_cors import CORS
from pymongo import MongoClient

from database import Database
from LLMs.gemini_api import LLM
from my_utils import get_JSON_data

app = Flask(__name__)
CORS(app)

db = Database(host="localhost",
              user="root",
              password="Root",
              databases=["project551_usc_courses", "project551_hospital_ratings", "project551_movie_rental"])
# client = MongoClient("mongodb+srv://your_url/?appName=Cluster0")
client = MongoClient("your_mongodb_connection_url")
users_collection = client["551-project"]["user"]
llm_api = LLM()

@app.route('/api/login', methods=['post'])
def login():
    data = request.get_json()
    user = data.get('user')
    pwd = data.get('password')
    if not user or not pwd:
        return jsonify({"message": "Missing username or password"}), 400
    user_doc = users_collection.find_one({"username": user})
    print(user_doc)
    if user_doc and user_doc.get("password") == pwd:
        return jsonify({"success": True}), 200
    else:
        return jsonify({"message": "Invalid username or password"}), 400


@app.route('/api/query', methods=['post'])
def query():
    schema = db.get_all_schema_prompt()
    # print(schema)
    query = request.get_json().get('query')
    result = llm_api.get_SQL_response(schema, query)
    json_data = get_JSON_data(result)
    print(json_data)
    if json_data["type"] != 0:
        database = json_data["database"]
        SQL_query = json_data["data"]
        try:
            statements, SQL_result = db.execute_by_step(database, SQL_query)
        except Exception as e:
            SQL_result = f"{e}"
            return jsonify({"error": SQL_result}), 400
        result = llm_api.get_response_from_SQL_result(db.get_one_schema_prompt(database), "\n".join(statements) + str(SQL_result), query)
        # print("========SQL_query========\n", SQL_query)
        # print("========SQL_result========\n", SQL_result)
        # print("========Result========\n", result)
        return jsonify({"Database": database, "SQL_query": SQL_query, "SQL_result": SQL_result, "result": result}), 200
    else:
        print(json_data["data"])
        return jsonify({"error": json_data["data"]}), 400

@app.route('/api/tables', methods=['get'])
def get_tables():
    try:
        tables = db.get_all_table_data()
        return jsonify(tables), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, use_reloader=False)