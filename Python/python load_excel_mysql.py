import os
import pandas as pd
import mysql.connector

# ==========================================================
# MYSQL SETTINGS
# ==========================================================

HOST = "127.0.0.1"
PORT = 3306
USER = "root"

# IMPORTANT:
# Enter the SAME password you use to connect to MySQL Workbench
PASSWORD = "YOUR_MYSQL_PASSWORD"

DATABASE = "adventure_works"

# ==========================================================
# EXCEL FILE LOCATION
# ==========================================================

FOLDER = r"D:\ExcleR\Projects\SQL\Data Set"

# ==========================================================
# CONNECT TO MYSQL SERVER
# ==========================================================

print("Connecting to MySQL...")

try:

    conn = mysql.connector.connect(
        host=HOST,
        port=PORT,
        user=USER,
        password="rani"
    )

    cursor = conn.cursor()

    print("✓ MySQL connection successful")

except mysql.connector.Error as error:

    print("\n❌ MySQL connection failed")
    print(error)

    print("\nCheck these:")
    print("1. MySQL password")
    print("2. Username")
    print("3. MySQL Server is running")
    print("4. Port is 3306")

    exit()

# ==========================================================
# CREATE DATABASE
# ==========================================================

cursor.execute(
    f"CREATE DATABASE IF NOT EXISTS `{DATABASE}`"
)

print(f"✓ Database '{DATABASE}' is ready")

# Select database

conn.database = DATABASE

# ==========================================================
# CHECK EXCEL FOLDER
# ==========================================================

if not os.path.exists(FOLDER):

    print("\n❌ Excel folder not found:")
    print(FOLDER)

    cursor.close()
    conn.close()

    exit()

print("\nExcel folder:")
print(FOLDER)

# ==========================================================
# FIND EXCEL FILES
# ==========================================================

files = [
    file
    for file in os.listdir(FOLDER)
    if file.lower().endswith(".xlsx")
]

if not files:

    print("\n❌ No Excel files found.")

    cursor.close()
    conn.close()

    exit()

print("\nExcel files found:")

for file in files:
    print(" - " + file)

# ==========================================================
# LOAD EACH EXCEL FILE
# ==========================================================

for file in files:

    print("\n======================================")
    print("Loading:", file)
    print("======================================")

    file_path = os.path.join(FOLDER, file)

    # Table name = Excel filename without .xlsx
    table_name = os.path.splitext(file)[0]

    try:

        # --------------------------------------------------
        # READ EXCEL
        # --------------------------------------------------

        df = pd.read_excel(
            file_path,
            engine="openpyxl"
        )

        print("Excel rows:", len(df))
        print("Excel columns:", len(df.columns))

        # --------------------------------------------------
        # CLEAN COLUMN NAMES
        # --------------------------------------------------

        df.columns = [
            str(column).strip()
            for column in df.columns
        ]

        # --------------------------------------------------
        # REMOVE COMPLETELY EMPTY ROWS
        # --------------------------------------------------

        df = df.dropna(how="all")

        print("Rows to insert:", len(df))

        # --------------------------------------------------
        # DROP OLD TABLE
        # --------------------------------------------------

        cursor.execute(
            f"DROP TABLE IF EXISTS `{table_name}`"
        )

        # --------------------------------------------------
        # CREATE TABLE AUTOMATICALLY
        # --------------------------------------------------

        column_definitions = []

        for column in df.columns:

            column_definitions.append(
                f"`{column}` TEXT"
            )

        create_table_sql = f"""
        CREATE TABLE `{table_name}` (
            {', '.join(column_definitions)}
        )
        """

        cursor.execute(create_table_sql)

        print("✓ Table created:", table_name)

        # --------------------------------------------------
        # INSERT DATA
        # --------------------------------------------------

        columns = ", ".join(
            f"`{column}`"
            for column in df.columns
        )

        placeholders = ", ".join(
            ["%s"] * len(df.columns)
        )

        insert_sql = f"""
        INSERT INTO `{table_name}`
        ({columns})
        VALUES ({placeholders})
        """

        # --------------------------------------------------
        # INSERT IN BATCHES
        # --------------------------------------------------

        batch_size = 5000

        total_rows = len(df)

        for start in range(
            0,
            total_rows,
            batch_size
        ):

            batch = df.iloc[
                start:start + batch_size
            ]

            values = []

            for row in batch.itertuples(
                index=False,
                name=None
            ):

                cleaned_row = tuple(
                    None if pd.isna(value)
                    else str(value)
                    for value in row
                )

                values.append(cleaned_row)

            cursor.executemany(
                insert_sql,
                values
            )

            conn.commit()

            print(
                f"Inserted {min(start + batch_size, total_rows):,}"
                f" / {total_rows:,}"
            )

        print(
            f"✓ SUCCESS: {file}"
        )

    except Exception as error:

        print(
            f"\n❌ ERROR loading {file}"
        )

        print(error)

        conn.rollback()

# ==========================================================
# SHOW LOADED TABLES
# ==========================================================

print("\n======================================")
print("LOADED TABLES")
print("======================================")

cursor.execute("SHOW TABLES")

tables = cursor.fetchall()

for table in tables:

    print("✓", table[0])

# ==========================================================
# CLOSE CONNECTION
# ==========================================================

cursor.close()
conn.close()

print("\n======================================")
print("ALL FILES PROCESSED")
print("======================================")