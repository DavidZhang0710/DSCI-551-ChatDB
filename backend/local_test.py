from database import Database
from LLMs.gemini_api import LLM
from my_utils import get_JSON_data
from test_data import test_schema, test_prompt

if __name__ == "__main__":
    test = False

    if not test:
        db = Database(databases=["project551_usc_courses", "project551_hospital_ratings", "project551_movie_rental"])
        llm_api = LLM()
        schema = db.get_all_schema_prompt()
        # print(schema)
        # print(llm_api.prompt)

    else: 
        llm_api = LLM(test_prompt)
        schema = test_schema

    # query on single table
    # query = "Retrieve the schedule for the DSCI 551 course."
    # query = "Check the prerequisites of CSCI 420 courses."

    # insert, update on single table
    # query = "Please add a new student with the ID 3 and the name angela."
    # query = "Please update the name of the student with ID 1 to Huangyu"

    # CURD on multi-table
    # query = "Create a table to record students' course enrollments."
    # query = "Enroll student David in the course DSCI 551 at today."
    # query = "Help david to drop all courses"

    # query on multi-table, interesting
    # query = "Calculate the total number of credits David has enrolled in."
    # query = "If David needs 32 credits to graduate, calculate how many credits he is still short."

    # wrong query
    # query = "Get the age of student david"
    # query = "Get detailed information from professor of DSCI 551"

    # query = "Please delete hospital having id 123456"
    query = "Please show the schema of database usc_courses"

    result = llm_api.get_SQL_response(schema, query)
    json_data = get_JSON_data(result)
    print('\033[32m' + "\n")
    print(json_data)

    if not test:
        if json_data["type"] != 0:
            database = json_data["database"]
            SQL_query = json_data["data"]
            SQL_result = db.execute_by_step(database, SQL_query)
            result = llm_api.get_response_from_SQL_result(db.get_one_schema_prompt(database), SQL_query + str(SQL_result), query)
            print("========SQL_query========\n", SQL_query)
            print("========SQL_result========\n", SQL_result)
            print("========Result========\n", result)
        else:
            print(json_data["data"])