--DROP DATABASE lmsdb; //Run this in the MySQL client when you want to clear the databse
-- find the source of your database file
--source C:\Users\--your path--\lmsdb.sql

--Use the database
use lmsdb; 

--Populate users
INSERT INTO user(username,firstname,lastname,address,role,password,email) VALUES ("JayAdmin","Jay","Gurjar","Chinook street","admin","Jay234","Jay@gmail.com");
INSERT INTO admin(adminid,username) values (10,"JayAdmin");

INSERT INTO user(username,firstname,lastname,address,role,password,email) VALUES ("JayStudent","Jay","Gurjar","Chinook street","student","Jay123","JayGurjar@gmail.com");
INSERT INTO user(username,firstname,lastname,address,role,password,email) VALUES ("AliStudent","Ali","Siddiqi","Skyview 123","student","Ali234","AliSiddiqi@gmail.com");
INSERT INTO user(username,firstname,lastname,address,role,password,email) VALUES ("KaiStudent","Kai","Wang","Highrise 123","student","Kai123","KaiWang@gmail.com");
INSERT INTO user(username,firstname,lastname,address,role,password,email) VALUES ("KundaiStudent","Kundai","Dziwa","2500 University Dr","student","Kundai123","KundaiDziwa@gmail.com");


INSERT INTO user(username,firstname,lastname,address,role,password,email) VALUES ("MoussaviTeacher","Mahmood","Moussavi","Bel air","teacher","Moussavi123","Moussavi@Gmail.com");
INSERT INTO user(username,firstname,lastname,address,role,password,email) VALUES ("MourshirPourTeacher","Mohammed","Mourshirpour","Hollywood street","teacher","Moshi123","Mourshirpour@gmail.com");
INSERT INTO user(username,firstname,lastname,address,role,password,email) VALUES ("Pafederl","Pavol","Federl","Downtown street","teacher","pavol123","Pavol@gmail.com");

INSERT INTO user(username,firstname,lastname,address,role,password,email) VALUES ("RedaProfessor","Reda","Alhajj","Center street","teacher","Reda123","Reda@gmail.com");
INSERT INTO user(username,firstname,lastname,address,role,password,email) VALUES ("ChrisParkerProf","Christian","Parker","Wall street","teacher","CParker123","CParker@gmail.com");


INSERT INTO user(username,firstname,lastname,address,role,password,email) VALUES ("KashfiaTA","Kashfia","Sulinaz","Southcenter street","teacher","Kashfia123","Kashfia@gmail.com");
INSERT INTO user(username,firstname,lastname,address,role,password,email) VALUES ("ChrisMossmanTA","Christopher","Mossman","Downtown street","teacher","Chris123","ChrisMossman@gmail.com");
INSERT INTO user(username,firstname,lastname,address,role,password,email) VALUES ("DeanTeacherOfMultipleCourses","Dean","TeachesMultipleCourses","TFDL","teacher","Dean123","DeanTeachesMultipleCourses@gmail.com");

--Populate students
INSERT INTO student(username,studentID,major,year) VALUES("JayStudent",1000,"CPSC",3);
INSERT INTO student(username,studentID,major,year) VALUES("AliStudent",1001,"CPSC",3);
INSERT INTO student(username,studentID,major,year) VALUES("KaiStudent",1002,"CPSC",3);
INSERT INTO student(username,studentID,major,year) VALUES("KundaiStudent",1003,"CPSC",3);

--Populate teachers
INSERT INTO teacher(username,teacherid,isTA) VALUES("MoussaviTeacher",9999,"Teacher");
INSERT INTO teacher(username,teacherid,isTA) VALUES("MourshirPourTeacher",10000,"Teacher");
INSERT INTO teacher(username,teacherid,isTA) VALUES("Pafederl",10001,"Teacher");
INSERT INTO teacher(username,teacherid,isTA) VALUES("RedaProfessor",10002,"Teacher");
INSERT INTO teacher(username,teacherid,isTA) VALUES("ChrisParkerProf",10005,"Teacher");
INSERT INTO teacher(username,teacherid,isTA) VALUES("DeanTeacherOfMultipleCourses",10006,"Teacher");
INSERT INTO teacher(username,teacherid,isTA) VALUES("KashfiaTA",10003,"TA");
INSERT INTO teacher(username,teacherid,isTA) VALUES("ChrisMossmanTA",10004,"TA");

--Populate courses
INSERT INTO course(courseid, name,time, isEval, finalEval, evalComplete) VALUES(471,"Database systems","MWF", 0,0,0);
INSERT INTO course(courseid, name,time, isEval, finalEval, evalComplete) VALUES(480,"Principles of Software Development","MWF", 0,0,0);
INSERT INTO course(courseid, name,time, isEval, finalEval, evalComplete) VALUES(457,"Operating Systems","MWF",0,0,0);
INSERT INTO course(courseid, name,time, isEval, finalEval, evalComplete) VALUES(511,"Embedded Systems","MWF",0,0,0);

--Assign teacher to each course

INSERT INTO Courseteacher(courseid,teacherid) VALUES(471,10002);
INSERT INTO CourseTeacher(courseid,teacherid) VALUES(480,9999);
INSERT INTO CourseTeacher(courseid,teacherid) VALUES(480,10000);
INSERT INTO CourseTeacher(courseid,teacherid) VALUES(457,10001);
INSERT INTO CourseTeacher(courseid,teacherid) VALUES(471,10003);
INSERT INTO CourseTeacher(courseid,teacherid) VALUES(471,10004);
INSERT INTO CourseTeacher(courseid,teacherid) VALUES(511,10005);
INSERT INTO Courseteacher(courseid,teacherid) VALUES(471,10006);
INSERT INTO CourseTeacher(courseid,teacherid) VALUES(480,10006);

--Assign student course relationship
--Multiple students can take a course and a student can take multiple courses

INSERT INTO takes(courseid,studentID) VALUES(457,1000);
INSERT INTO takes(courseid,studentID) VALUES(457,1002);
INSERT INTO takes(courseid,studentID) VALUES(511,1003);

INSERT INTO takes(courseid,studentID) VALUES(471,1000);
INSERT INTO takes(courseid,studentID) VALUES(471,1001);
INSERT INTO takes(courseid,studentID) VALUES(471,1002);
INSERT INTO takes(courseid,studentID) VALUES(471,1003);

INSERT INTO takes(courseid,studentID) VALUES(480,1000);
INSERT INTO takes(courseid,studentID) VALUES(480,1001);
INSERT INTO takes(courseid,studentID) VALUES(480,1002);
INSERT INTO takes(courseid,studentID) VALUES(480,1003);

INSERT INTO takes(courseid,studentID) VALUES(511,1000);
INSERT INTO takes(courseid,studentID) VALUES(511,1001);
INSERT INTO takes(courseid,studentID) VALUES(511,1002);
INSERT INTO takes(courseid,studentID) VALUES(511,1003);







--------------------------Below is used for testing purposes-----------------------
--------------------------Do not populate with the queries below---------------------

--Populate assignments 
--Used for testing purposes, do not run these queries
INSERT INTO Assignment(assignment_id, assignment_name, due_date, content, courseid) VALUES (1,"Homework 1", "2021-12-14", "Solve Question 1", 471);
INSERT INTO Assignment(assignment_id, assignment_name, due_date, content, courseid) VALUES (2,"Homework 2", "2021-12-14", "Solve Question 2", 471);
INSERT INTO Assignment(assignment_id, assignment_name, due_date, content, courseid) VALUES (4,"Homework 3", "2021-12-14", "Solve Question 3", 471);

INSERT INTO Assignment(assignment_id, assignment_name, due_date, content, courseid) VALUES (4,"Assignment 1", "2021-12-06", "Solve Assignment 1", 480);
INSERT INTO Assignment(assignment_id, assignment_name, due_date, content, courseid) VALUES (5,"Assignment 2", "2021-12-06", "Solve Assignment 2", 480);
INSERT INTO Assignment(assignment_id, assignment_name, due_date, content, courseid) VALUES (6,"Assignment 3", "2021-12-06", "Solve Assignment 3", 480);

INSERT INTO Assignment(assignment_id, assignment_name, due_date, content, courseid) VALUES (7,"Project 1", "2021-12-08", "Complete Project 1", 511);
INSERT INTO Assignment(assignment_id, assignment_name, due_date, content, courseid) VALUES (8,"Project 2", "2021-12-10", "Complete Project 2", 511);

INSERT INTO Assignment(assignment_id, assignment_name, due_date, content, courseid) VALUES (9,"Coding Challenge 1", "2021-11-30", "Complete coding challenge 1", 457);
INSERT INTO Assignment(assignment_id, assignment_name, due_date, content, courseid) VALUES (10,"Coding Challenge 2", "2021-11-30", "Complete coding challenge 2", 457);


--Populate submissions
--Used for testing purposes, do not run the queries below
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 1, 1000, 90);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 2, 1000, 90);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 3, 1000, 75);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 4, 1000, 90);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 5, 1000, 80);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 6, 1000, 70);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 7, 1000, 50);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 8, 1000, 100);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 9, 1000, 90);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 10, 1000, 100);

INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 1, 1001, 70);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 2, 1001, 90);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 3, 1001, 98);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 4, 1001, 40);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 5, 1001, 99);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 6, 1001, 70);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 7, 1001, 60);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 8, 1001, 80);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 9, 1001, 70);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 10, 1001, 95);

INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 1, 1002, 100);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 2, 1002, 100);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 3, 1002, 100);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 4, 1002, 90);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 5, 1002, 99);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 6, 1002, 70);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 7, 1002, 40);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 8, 1002, 30);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 9, 1002, 0);
INSERT INTO submit(assignment_id,studentID, grade) VALUES ( 10, 1002, 100);

