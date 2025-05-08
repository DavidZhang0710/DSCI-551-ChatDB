import mysql.connector

class Database:
    def __init__(self, host="localhost", user="root", password="Root", databases=["project_551"]):
        self.host = host
        self.user = user
        self.password = password
        self.databases = databases
        self.conn = None
        self.cursor = None


    def connect(self, database):
        if self.conn:
            self.conn.close()
        self.conn = mysql.connector.connect(
            host=self.host,
            user=self.user,
            password=self.password,
            database=database
        )
        self.cursor = self.conn.cursor()

    def get_tables_desc(self, database):
        self.connect(database)
        self.cursor.execute("SHOW TABLES")
        tables = [table[0] for table in self.cursor.fetchall()]
        result = []

        for table in tables:
            result.append(f"Table: {table}")
            self.cursor.execute(f"DESCRIBE {table}")
            columns = self.cursor.fetchall()
            result.append(f"{'Column Name':<20}{'Data Type':<20}{'Nullable':<10}{'Key':<10}{'Default':<10}{'Extra'}")
            result.append("=" * 80)
            for column in columns:
                name, dtype, nullable, key, default, extra = column
                result.append(f"{name:<20}{dtype:<20}{nullable:<10}{key:<10}{str(default):<10}{extra}")
            result.append("")

        return "\n".join(result)

    def get_tables_data(self, database):
        self.connect(database)
        self.cursor.execute("SHOW TABLES")
        tables = [table[0] for table in self.cursor.fetchall()]
        result = []
        for table in tables:
            result.append(f"Table: {table}")
            result.append("=" * 80)
            
            self.cursor.execute(f"SELECT * FROM {table} LIMIT 2")
            rows = self.cursor.fetchall()
            
            self.cursor.execute(f"DESCRIBE {table}")
            column_names = [column[0] for column in self.cursor.fetchall()]
            
            header = " | ".join(f"{col:<15}" for col in column_names)
            result.append(header)
            result.append("-" * len(header))
            
            for row in rows:
                result.append(" | ".join(f"{str(item):<15}" for item in row))
            
            if not rows:
                result.append("No data available\n")
            else:
                result.append("... (More rows not shown)\n")
        
        return "\n".join(result)

    def get_one_schema_prompt(self, database):
        return (
        f"Existing tables schema in database {database}:\n" + self.get_tables_desc(database) + 
        f"\n\nBelow are a few sample rows from each table in database {database}:\n" + self.get_tables_data(database)
    )

    def get_all_schema_prompt(self):
        result = []

        for db_name in self.databases:
            prompt = self.get_one_schema_prompt(db_name)
            result.append(prompt)
            result.append("=" * 100)

        return "\n".join(result)

    def get_all_table_data(self):
        result = {}

        for db_name in self.databases:
            self.connect(db_name)
            self.cursor.execute("SHOW TABLES")
            tables = [table[0] for table in self.cursor.fetchall()]

            db_data = {}
            for table in tables:
                self.cursor.execute(f"SHOW COLUMNS FROM `{table}`")
                columns = [column[0] for column in self.cursor.fetchall()]

                self.cursor.execute(f"SELECT * FROM `{table}`")
                rows = self.cursor.fetchall()

                db_data[table] = [columns] + rows

            result[db_name] = db_data

        return result

    def query(self, sql: str):
        self.cursor.execute(sql)
        return self.cursor.fetchall()

    def execute(self, sql: str):
        self.cursor.execute(sql)
        self.conn.commit()

    def execute_by_step(self, database, sql):
        try:
            self.connect(database)
        except Exception as e:
            raise RuntimeError(f"{e}") from e
        
        results = []

        if isinstance(sql, list):
            statements = [s.strip() for s in sql if s.strip()]
        else:
            statements = [s.strip() for s in sql.strip().split(";") if s.strip()]

        for statement in statements:
            try:
                self.cursor.execute(statement)
                if statement.strip().upper().startswith(("SELECT", "SHOW", "DESCRIBE")):
                    results.append(self.cursor.fetchall())
            except Exception as e:
                raise RuntimeError(f"Error executing SQL: {statement}\n{e}") from e

        self.conn.commit()
        return statements, results

    def close(self):
        self.cursor.close()
        self.conn.close()

if __name__ == "__main__":
    db = Database(databases=["project_551", "project_551_temp"])

    # databases = db.get_all_table_data()
    # print(databases)

    # result = db.execute_by_step("project_551", "select * from students")
    # print(result)

    prompt = db.get_all_schema_prompt()
    print(prompt)
