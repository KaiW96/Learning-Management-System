--The queries below allow easy access to database information
--Many queries were used in the api to access the database

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

--Select all teachers evaluation: outputs, firstname, lastname, teacherid and Questions
SELECT firstname, lastname, teacher.teacherid, Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10
	FROM teacher, user, teacher_evaluation
		WHERE teacher.username = user.username AND 
			  teacher.teacherid = teacher_evaluation.teacherid;

--Select the teacher evaluation using teacherid, output firstname and lastname included
SELECT firstname, lastname, teacher.teacherid, Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10
	FROM teacher, user, teacher_evaluation
		WHERE teacher.username = user.username AND 
			  teacher.teacherid = teacher_evaluation.teacherid AND 
			  teacher.teacherid = 10001;
			  
--Select the evaluations for TAs only, outputs firstname, lastname and questions
SELECT firstname, lastname, teacher.teacherid, Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10
	FROM teacher, user, teacher_evaluation
		WHERE teacher.username = user.username AND 
			  teacher.teacherid = teacher_evaluation.teacherid AND 
			  teacher.isTA = "TA";

--Select students class List of a course
SELECT DISTINCT user.firstname, user.lastname, email
	FROM course, user, student, takes
		WHERE (student.studentID = takes.studentID AND
		user.role = 'student'
		AND takes.courseID = 471);

--Select teachers class List of a course
SELECT user.firstname, user.lastname, email
	FROM user, course, courseteacher, teacher
		WHERE ( 
		courseteacher.teacherid = teacher.teacherid  AND
		user.role = 'teacher'
	    AND courseteacher.courseid = 471
	);

--Delete statements, will cascade into other tables.
DELETE FROM student WHERE student.username = "JayStudent"; 
DELETE FROM user WHERE username = "Ali";

--Delete a teacher. The teacher will be deleted from teacher_evaluation, teacher, courseteacher. course will not be affected
DELETE FROM user WHERE user.username = "Pafederl";


--Questions used for the student-teacher evaluations form
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



--Select all the assignments in a course
SELECT Assignment.assignment_name, course.courseid
	FROM  Assignment, course
	WHERE course.courseid = Assignment.courseid AND
		  course.courseid = 471;

--Delete a assignment for a course
DELETE FROM Assignment WHERE Assignment.assignment_id = 2; 

--Select all assignments for a specific name
SELECT user.firstname, user.lastname, user.username, student.studentid, submit.assignment_id, Assignment.assignment_name, submit.grade, course.courseid
	FROM student, user, submit, Assignment, course
	WHERE student.studentID = submit.studentID AND 
		submit.assignment_id = Assignment.assignment_id AND 
		student.username = user.username AND
		course.courseid = Assignment.courseid AND
		user.firstname = "Ali";
		
--Select all assignments for a specific student in a specific course
SELECT user.firstname, user.lastname, user.username, student.studentid, submit.assignment_id, Assignment.assignment_name, submit.grade, course.courseid
	FROM student, user, submit, Assignment, course
	WHERE student.studentID = submit.studentID AND 
		submit.assignment_id = Assignment.assignment_id AND 
		student.username = user.username AND
		course.courseid = Assignment.courseid AND
		course.courseid = 471 AND
		user.username = "AliStudent";
		
--Select all assignments for a specific name in a specific course
SELECT user.firstname, user.lastname, user.username, student.studentid, course.courseid, course.name, AVG(submit.grade)
	FROM student, user, submit, Assignment, course
	WHERE student.studentID = submit.studentID AND 
		submit.assignment_id = Assignment.assignment_id AND 
		student.username = user.username AND
		user.firstname = "Ali" AND Assignment.courseid = 457;

--Select all assignments for a specific course
SELECT student.studentid, course.courseid, course.name, submit.grade, Assignment.assignment_id
	FROM student, submit, Assignment, course
	WHERE student.studentID = submit.studentID AND 
		submit.assignment_id = Assignment.assignment_id AND 
		Assignment.courseid = course.courseid 
		and course.courseid = 471;

