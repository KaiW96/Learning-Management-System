--Select all from user
SELECT * FROM user;

--Select all from student
Select * FROM student;

--Select all from teacher;
SELECT * FROM teacher;

--Select a student based on studentID
SELECT firstname, lastname FROM user,student WHERE student.username = user.username AND studentID = 1000;

--Display first name, last name for all teachers
SELECT firstname,lastname from teacher, user WHERE teacher.username = user.username;
--Display first name, last name for all teaching assistants
SELECT firstname,lastname from teacher, user WHERE teacher.username = user.username AND isTA = "TA"; 

--Select teacher information based on username
--prints TeacherID, first name, last name, teaching Assistant Status
SELECT teacherid, firstname, lastname, isTA FROM user,teacher WHERE teacher.username = user.username;

--Select course information based on teacher username,
--prints courseID, course name, teacher first and last name, Teaching Assistant status
SELECT course.courseid, course.name, user.firstname, user.lastname, teacher.isTA 
	FROM courseteacher, course, user, teacher
	WHERE courseteacher.courseid = course.courseid AND 
		teacher.teacherid = courseteacher.teacherid AND 
		teacher.username = user.username;

--Select course information based on teacherID,
--prints courseID, course name, teacher first and last name, Teaching Assistant status
SELECT course.courseid, course.name, user.firstname, user.lastname, teacher.isTA 
	FROM courseteacher, course, user, teacher
	WHERE courseteacher.courseid = course.courseid AND 
		teacher.teacherid = courseteacher.teacherid AND 
		teacher.username = user.username AND
		teacher.teacherid = 10006;

--Select course information based on courseID,
--prints courseID, course name, teacher first and last name, Teaching Assistant status, teacher email
SELECT course.courseid, course.name, user.firstname,  user.lastname, teacher.isTA, user.email
	FROM courseteacher, course, user, teacher
	WHERE courseteacher.courseid = course.courseid AND 
		teacher.teacherid = courseteacher.teacherid AND 
		teacher.username = user.username AND 
		course.courseid = 471;

SELECT course.courseid, course.name, user.firstname, user.lastname, teacher.isTA 
	FROM courseteacher, course, user, teacher
	WHERE courseteacher.courseid = course.courseid AND 
		teacher.teacherid = courseteacher.teacherid AND 
		teacher.username = user.username AND 
		course.courseid = 480;

--Select course information based on Teaching assistant status,
--Only select from teaching assistants
--prints courseID, course name, teacher first and last name, Teaching Assistant status
SELECT course.courseid, course.name, user.firstname, user.lastname, teacher.isTA 
	FROM courseteacher, course, user, teacher
	WHERE courseteacher.courseid = course.courseid AND 
		teacher.teacherid = courseteacher.teacherid AND 
		teacher.username = user.username AND 
		isTA = "TA";

--Select course information based on students
--Prints out all courses along with all of its students
SELECT course.courseid, course.name, user.firstname, user.lastname, user.username, student.studentid
	FROM takes, course, student, user
	WHERE takes.courseid = course.courseid AND 
		student.studentid = takes.studentid AND
		student.username = user.username;
		
--Select course/student information based on specific course
--Prints out all students for that course
SELECT course.courseid, course.name, user.firstname, user.lastname, user.username, student.studentid
	FROM takes, course, student, user
	WHERE takes.courseid = course.courseid AND 
		student.studentid = takes.studentid AND
		student.username = user.username AND
		course.courseid = 471;

--Select course/student information based on specific student name
--Prints out all courses for that student
SELECT course.courseid, course.name, user.firstname, user.lastname, user.username, student.studentid
	FROM takes, course, student, user
	WHERE takes.courseid = course.courseid AND 
		student.studentid = takes.studentid AND
		student.username = user.username AND
		user.firstname = "Jay";


--Select course/student information based on specific student name
--Prints out all courses for that student
SELECT DISTINCT course.courseid,course.name, student.studentID, firstname, lastname, user.username 
	from user,student,course, takes 
	WHERE student.studentID = takes.studentID 
		AND student.username = user.username
		AND user.firstname = "Jay";
		

--Insert into document
--used for testing purposes
INSERT INTO document(id, file, courseid, teacherid) VALUES (1, "lecture.pdf", 471, 10001);

--Select all the documents for a course
--used for testing purposes
SELECT DISTINCT document.id, file, TO_BASE64(file),
    FROM_BASE64(TO_BASE64(file))
	FROM course, document, user
		WHERE course.courseID = document.courseid AND
			  course.courseid = 471;

--Delete a document in the course for teacher
--used for testing purposes
DELETE FROM document where document.id = 2;

##Select all teachers evaluation: outputs, firstname, lastname, teacherid and Questions
SELECT firstname, lastname, teacher.teacherid, Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10
	FROM teacher, user, teacher_evaluation
		WHERE teacher.username = user.username AND 
			  teacher.teacherid = teacher_evaluation.teacherid;

##Select the teacher evaluation using teacherid, output firstname and lastname included
SELECT firstname, lastname, teacher.teacherid, Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10
	FROM teacher, user, teacher_evaluation
		WHERE teacher.username = user.username AND 
			  teacher.teacherid = teacher_evaluation.teacherid AND 
			  teacher.teacherid = 10001;
			  
##Select the evaluations for TAs only, outputs firstname, lastname and questions
SELECT firstname, lastname, teacher.teacherid, Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10
	FROM teacher, user, teacher_evaluation
		WHERE teacher.username = user.username AND 
			  teacher.teacherid = teacher_evaluation.teacherid AND 
			  teacher.isTA = "TA";

##Select students class List of a course
SELECT DISTINCT user.firstname, user.lastname, email
	FROM course, user, student, takes
		WHERE (student.studentID = takes.studentID AND
		user.role = 'student'
		AND takes.courseID = 471);

##Select teachers class List of a course
SELECT user.firstname, user.lastname, email
	FROM user, course, courseteacher, teacher
		WHERE ( 
		courseteacher.teacherid = teacher.teacherid  AND
		user.role = 'teacher'
	    AND courseteacher.courseid = 471
	);

##Delete statements, will cascade into other tables.
DELETE FROM student WHERE student.username = "JayStudent"; 
DELETE FROM user WHERE username = "Ali";

##Delete a teacher. The teacher will be deleted from teacher_evaluation, teacher, courseteacher. course will not be affected
DELETE FROM user WHERE user.username = "Pafederl";



##Q1 The TA starts the lab session on time:

##Q2 The TA uses the time of the lab effectively:

##Q3 The TA answers the questions satisfactorily:

##Q4 The TA marks the assignments fairly:

##Q5 The TA marks the assignments on time:

##Q6 The TA posts the solutions on time:

##Q7 The TA demonstrated enough knowledge of the material covered:

##Q8 The TA responses to emails and messages on time:

##Q9 The TA treats the students respectfully:

##Q10 I will be happy to have the same TA again:



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

## Select all the assignmnets in a course
SELECT Assignment.assignment_name, course.courseid
	FROM  Assignment, course
	WHERE course.courseid = Assignment.courseid AND
		  course.courseid = 471;

## Delete a assignment for a course
DELETE FROM Assignment WHERE Assignment.assignment_id = 2; 


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

SELECT user.firstname, user.lastname, user.username, student.studentid, submit.assignment_id, Assignment.assignment_name, submit.grade, course.courseid
	FROM student, user, submit, Assignment, course
	WHERE student.studentID = submit.studentID AND 
		submit.assignment_id = Assignment.assignment_id AND 
		student.username = user.username AND
		course.courseid = Assignment.courseid AND
		user.firstname = "Ali";

SELECT user.firstname, user.lastname, user.username, student.studentid, submit.assignment_id, Assignment.assignment_name, submit.grade, course.courseid
	FROM student, user, submit, Assignment, course
	WHERE student.studentID = submit.studentID AND 
		submit.assignment_id = Assignment.assignment_id AND 
		student.username = user.username AND
		course.courseid = Assignment.courseid AND
		course.courseid = 471 AND
		user.username = "AliStudent";
		
SELECT user.firstname, user.lastname, user.username, student.studentid, course.courseid, course.name, AVG(submit.grade)
	FROM student, user, submit, Assignment, course
	WHERE student.studentID = submit.studentID AND 
		submit.assignment_id = Assignment.assignment_id AND 
		student.username = user.username AND
		user.firstname = "Ali" AND Assignment.courseid = 457;


SELECT student.studentid, course.courseid, course.name, submit.grade, Assignment.assignment_id
	FROM student, submit, Assignment, course
	WHERE student.studentID = submit.studentID AND 
		submit.assignment_id = Assignment.assignment_id AND 
		Assignment.courseid = course.courseid 
		and course.courseid = 471;

























INSERT INTO notification(notificationid, date, time, status, courseid) VALUES (01, "2021-11-14", "11:11:11", "Database project is due soon", 471);
INSERT INTO notification(notificationid, date, time, status, courseid) VALUES (02, "2021-11-14", "11:11:12", "480 project starts next week!", 480);

INSERT INTO receives(notificationid, studentid) VALUES (01,1000); //Gonna need a for loop to send it to all students by changing studentID
INSERT INTO receives(notificationid, studentid) VALUES (01,1001);
INSERT INTO receives(notificationid, studentid) VALUES (02,1000);
INSERT INTO receives(notificationid, studentid) VALUES (02,1001);

SELECT DISTINCT user.firstname, user.lastname, user.username, student.studentid, notification.status, notification.date,notification.time
	FROM course, student, user, notification, receives
	WHERE receives.studentID = student.studentID AND 
		student.username = user.username AND
		user.firstname = "Jay";

INSERT INTO communication(communication_id, date) VALUES (01, "2021-11-14");
INSERT INTO communication(communication_id, date) VALUES (02, "2021-11-14");

INSERT INTO discussion(username, name, content,communication_id) VALUES ("JayStudent", "Jay", "I just completed 471 API, project looks great!", 01);
INSERT INTO discussion(username, name, content, communication_id) VALUES("AliStudent", "Ali", "Good job Jay, I now want you to build an app!", 01);

INSERT INTO email_list(email, studentID, communication_id) VALUES ("JayGurjar@gmail.com", 1000, 01);
INSERT INTO email_list(email, studentID, communication_id) VALUES ("AliSiddiqi@gmail.com", 1000, 01);

INSERT INTO writes(communication_id, studentID) VALUES (01, 1000);
INSERT INTO writes(communication_id, studentID) VALUES (02, 1000);

SELECT DISTINCT user.firstname, user.lastname, communication.communication_id, discussion.content, email_list.email
	FROM user, student, writes, communication, discussion, email_list
	WHERE user.username = student.username AND
		student.studentID = writes.studentID AND 
		writes.communication_id = communication.communication_id AND
		communication.communication_id = email_list.communication_id AND
		communication.communication_id = discussion.communication_id;