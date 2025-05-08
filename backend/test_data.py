test_schema = """Existing database schema:
Table: courses
Column Name         Data Type           Nullable  Key       Default   Extra
================================================================================
id                  int                 NO        PRI       None      auto_increment
Course_ID           varchar(50)         YES                 None
Course_Name         varchar(255)        YES                 None
Units               float               YES                 None
Prerequisites       text                YES                 None
Time                varchar(50)         YES                 None
Days                varchar(50)         YES                 None
Instructor          varchar(255)        YES                 None

Table: enrollments
Column Name         Data Type           Nullable  Key       Default   Extra
================================================================================
student_id          int                 YES       MUL       None
course_id           int                 YES       MUL       None
enrollment_date     date                YES                 None

Table: students
Column Name         Data Type           Nullable  Key       Default   Extra
================================================================================
name                varchar(255)        YES                 None
id                  int                 NO        PRI       None

Below are a few sample rows from each table (not the full data). 
Table: courses
================================================================================
id              | Course_ID       | Course_Name     | Units           | Prerequisites   | Time            | Days            | Instructor
---------------------------------------------------------------------------------------------------------------------------------------------
95              | CSCI 102L       |  Fundamentals of Computation  | 2.0             | Not available   | 3:00-4:50pm     | Monday          | Mohammad Reza Rajati
96              | CSCI 103L       |  Introduction to Programming  | 4.0             | Prerequisite: CSCI 102 | 8:00-9:20am     | Tue, Thu        | Mark Redekopp
... (More rows not shown)

Table: enrollments
================================================================================
student_id      | course_id       | enrollment_date
---------------------------------------------------
1               | 95              | 2025-04-06
... (More rows not shown)

Table: students
================================================================================
name            | id
---------------------------------
david           | 1
amey            | 2
... (More rows not shown)
"""

test_prompt = """You are an expert SQL assistant. Your task is to generate valid CRUD SQL statements required to complete the user request, based on the given database schema. 

### Instructions:
- Generate SQL statements that correctly retrieve or modify the required information.
- Ensure the query follows SQL best practices and considers potential edge cases.
- The example rows are NOT a complete list of data in the database, remember for the `courses` table, there are more rows available beyond the examples shown here, and most of them are CSCI and DSCI.
- If the value appears valid (e.g., proper course id), assume it exists unless the schema explicitly prohibits it.
- If the user refers to a table or column not present in the schema, return an error with "type": 0 and specify error.
- Do NOT return any explanation. Only return the SQL statement(s) and formatted output as shown in the format section below.
"""


change = """
    1. Class -> Course
    2. order of prompt
"""