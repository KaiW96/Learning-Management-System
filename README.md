# Learning Management System

Updated: January 2022

## Authors
* Jay Gurjar
* Kai Wang
* Kundai Dziwa
* Ali Siddiqi

# Introduction

The learning management system is a lightweight web application which assists in student learning. 
This web application allows multiple user end points such as student, teacher and admin. Each student can enroll in multiple courses,
view class list, upload files for grading and download files uploaded by the teacher. A teacher can track the progression 
of each student in specific classes that they are teaching, view assignments and give feedback. An admin has the privilege to modify student/teacher profiles, add or remove courses to students/teachers and 
send student-teacher evaluation forms to see who is the best and worst teachers for each class.


# Installation

Steps to compile and run this application
  1. Clone The Repository on your local device.
  2. If your local device already has a mysql table that is named "lmsdb", drop it.
  3. Source the sql file on the MySQL Command Line(make sure to include your full path in the command)
  
  For example:
  ```C:\Users\---Your path---\Learning-Management-System\database\lmsdb.sql```

```npm install```

```npm install file-saver```

```npm start```

```python -m venv env```

```.\env\bin\activate```

```pip install flask```

```pip install flask-mysqldb```

```pip install flask-MYSQL```

```pip install --upgrade setuptools```

```pip install --only-binary :all: flask-mysqldb```


