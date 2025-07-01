'''
  Copyright © 2025 John Gregg Felicisimo
  All rights reserved. Unauthorized use is prohibited.
'''

## Make sure you install the modules
## pip3 install mysql-connector-python faker
import mysql.connector
from faker import Faker
import random
from datetime import datetime, timedelta

# DB connection
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",  # Replace if you set a password
    database="saclitms"
)
cursor = conn.cursor()

fake = Faker('en_PH')

courses = [
    "AB Communication", "AB Psychology", "ABM", "Bachelor in Secondary Education", "BS Accountancy", "BS Business Administration",
    "BS Civil Engineering", "BS Criminology", "BS Elementary Education", "BS Hospitality Management",
    "BS Industrial Engineering", "BS Information Technology", "BS Management Accounting",
    "BS Midwifery", "BS Medical Technology", "BS Nursing", "BS Physical Therapy",
    "BS Tourism Management", "Dentistry", "HE", "HUMSS", "ICT", "STEM"
]
departments = ["CC", "IBED", "SAHS", "SBAT", "SE", "SEAS", "SHS", "SMIHT", "TESDA"]
academic_year = "2024-2025"
semester = "2"
photo_url = "../assets/User-placeholder.png"
used_rfids = set()

for i in range(1, 501):
    while True:
        rfid_code = ''.join(random.choices('0123456789', k=10))
        if rfid_code not in used_rfids:
            used_rfids.add(rfid_code)
            break

    user_id = f"2301-{str(i).zfill(6)}"
    first_name = fake.first_name_male()
    middle_name = fake.first_name()
    last_name = fake.last_name()
    age = random.randint(17, 23)
    birthday = (datetime.now() - timedelta(days=age * 365 + random.randint(0, 365))).date()
    course = random.choice(courses)
    year_level = random.randint(1, 4)
    department = random.choice(departments)

    # Extract the first letter of the first name
    first_initial = first_name[0].lower()

    # Extract the first letter of the middle name
    middle_initial = middle_name[0].lower()

    email = f"{last_name.lower()}{first_initial}{middle_initial}@gmail.com"
    phone_number = f"09{random.randint(100000000, 999999999)}"

    query = """
    INSERT INTO users (
        student_photo, rfid_code, user_id, first_name, middle_name, last_name, age, birthday,
        course, year_level, academic_year, semester, department, user_type, username,
        password, email, phone_number
    ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """
    values = (
        photo_url, rfid_code, user_id, first_name, middle_name, last_name, age, birthday,
        course, year_level, academic_year, semester, department, 'Student', user_id,
        '', email, phone_number
    )

    cursor.execute(query, values)

# Commit and close connection
conn.commit()
print("500 students inserted successfully.")
cursor.close()
conn.close()
