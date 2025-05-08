# ChatDB

## 1. Initial Setup

Before running the project, set up the required configuration:

- Replace the API key and the corresponding API URL in `backend/LLMs/gemeni.py`. By default, the current URL is set to use the gemini-1.5-flash model. Specifically, update the following lines:

  ```python
  GEMINI_API_KEY = "YOUR_GEMINI_API_KEY"

  self.url = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key={GEMINI_API_KEY}"
  ```

- For relational databases (MySQL), update the Database initialization in the `backend/app.py`. The databases parameter specifies the list of databases to be used as datasets.
  ```python
  db = Database(host="localhost",
                user="root",
                password="Root",
                databases=["database1", "database2", "database3"])
  ```

- For MongoDB (used for authorition), set up the connection URL, database name, and collection name in the `backend/app.py`. Make sure that the collection contains valid documents with both username and password fields:
  ```python
  client = MongoClient("your_mongodb_connection_url")
  users_collection = client["551-project"]["user"]
  ```

- (Optional) Update the apiBaseURL in the `environment.ts` file located in `frontend/src/environments/` to ensure that the frontend can correctly connect to the backend server:

  ```typescript
  export const environment = {
    apiBaseUrl: 'http://localhost:5000/api'
  };
  ```

Make sure to replace the placeholders with your actual API keys and settings.


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

If you don't have Node.js installed, you can download it from the official website:
[Download Node.js](https://nodejs.org/). Follow the installation instructions based on your operating system.

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
  Sample SQL files are provided under the dataset/ directory to help initialize your MySQL databases. These files include table creation and data insertion scripts.

  Example SQL file: `dataset/project_*.sql`

  Example SQL file: `dataset/sample_user_collection.json`

- **Test Case**:  
  A set of sample queries for different datasets is available in `dataset/testcase.md`. You can use these test cases to validate the functionality of the system.

# Notes
- You can use `backend/local_test.py` to test individual classes and modules before starting the Flask server.
- To obtain a Gemini API key, please refer to the official documentation: [Get an API Key - Gemini API](https://ai.google.dev/gemini-api/docs/api-key?hl=en)
- Make sure both the backend and frontend are running before starting any tests.
- CORS has already been properly configured in the Flask backend. If you modify the ports or deploy to different domains, ensure that the CORS settings remain correctly applied.
- Make sure that the MongoDB collection contains valid documents with both username and password fields for login.