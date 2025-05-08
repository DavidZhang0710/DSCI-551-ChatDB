# ChatDB

## 1. Initial Setup

Before running the project, set up the required configuration:

- Replace the API_KEY for LLMs in the `backend/LLMs/gemeni.py`:

  ```python
  GEMINI_API_KEY = "YOUR_GEMINI_API_KEY"
  ```

- For relational databases (MySQL), update the Database initialization in the `backend/app.py`:
  ```python
  db = Database(host="localhost",
                user="root",
                password="Root",
                databases=["database1", "database2", "database3"])
  ```

- For MongoDB (used for authorition), set up the connection URI and collection in the `backend/app.py`, make sure that the collection contains valid documents with both username and password fields:
  ```python
  client = MongoClient("your_mongodb_connection_url")
  users_collection = client["551-project"]["user"]
  ```

- (Optional) Update the apiBaseURL in `environment.ts` file in the `frontend/src/environments/` directory for frontend environment variables:

  ```typescript
  export const environment = {
    apiBaseUrl: 'http://localhost:5000/api'
  };
  ```

> Make sure to replace the placeholders with your actual API keys and settings.


## 2. Running the Backend (Flask)

Navigate to the `backend/` folder and install dependencies:

```bash
cd backend
pip install -r requirements.txt
```

Start the Flask server:

```bash
python app.py
```

By default, the server will be running at `http://localhost:5000/`.


## 3. Running the Frontend (Angular)

Navigate to the `frontend/` folder and install dependencies:

```bash
cd frontend
npm install
```

Start the Angular development server:

```bash
ng serve
```

By default, the app will be available at `http://localhost:4200/`.


## 4. Test Data and Sample Inputs
- **Test Database Initialization**:  
  Load sample data into your MySQL and MongoDB databases for testing.  
  Example SQL file: `dataset/project_*.sql`

- **Test Case**:  
  There are some test queries in the `dataset/testcase.md`

# Notes

- Make sure the backend is running before using the frontend.
- If the backend and frontend are on different ports, consider setting up CORS properly in Flask.
- Make sure that the MongoDB collection contains valid documents with both username and password fields for login.