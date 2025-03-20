-- create database --
create database miniproject;
-- use database --
use miniproject;
-- create tables --
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    gender VARCHAR(10),
    department VARCHAR(50),
    course_id INT,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    experience INT,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    credits INT
);
CREATE TABLE subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(100) NOT NULL,
    course_id INT,
    faculty_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);
CREATE TABLE marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_id INT,
    marks INT,
    exam_type VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_id INT,
    attendance_percentage FLOAT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);
CREATE TABLE course_registration (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    semester INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
CREATE TABLE timetable (
    timetable_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    subject_id INT,
    faculty_id INT,
    day_of_week VARCHAR(20),
    time_slot VARCHAR(50),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);
CREATE TABLE fees (
    fee_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
CREATE TABLE library (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    book_name VARCHAR(100),
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
-- insert values into tables --
insert into students (student_id, name, dob, gender, department, course_id, email, phone, address) values
(101, 'kavitha', '2002-05-10', 'female', 'it', 1, 'kavitha@gmail.com', '9092306610', 'arni'),
(102, 'dinesh', '2001-07-15', 'male', 'cse', 2, 'dinesh@gmail.com', '8110999825', 'vellore'),
(103, 'saranya', '2002-09-20', 'female', 'ece', 3, 'saranya@gmail.com', '8428236771', 'ranipet'),
(104, 'keerthana', '2001-12-25', 'female', 'it', 1, 'keerthana@gmail.com', '9790483482', 'chennai'),
(105, 'priyadharshini', '2002-02-18', 'female', 'cse', 2, 'priya@gmail.com', '8610561124', 'bangalore');

insert into faculty (faculty_id, name, department, experience, email, phone, address) values
(201, 'jayagandhi', 'it', 10, 'jayagandhi@gmail.com', '8765432101', 'chennai'),
(202, 'suganya', 'cse', 8, 'suganya@gmail.com', '8765432102', 'vellore'),
(203, 'arun', 'ece', 12, 'arun@gmail.com', '8765432103', 'bangalore'),
(204, 'ramani', 'it', 6, 'ramani@gmail.com', '8765432104', 'madurai'),
(205, 'babu', 'cse', 7, 'babu@gmail.com', '8765432105', 'coimbatore');

insert into courses (course_id, course_name, department, credits) values
(1, 'b.tech it', 'it', 4),
(2, 'b.tech cse', 'cse', 4),
(3, 'b.tech ece', 'ece', 4);

insert into subjects (subject_id, subject_name, course_id, faculty_id) values
(301, 'database management', 1, 201),
(302, 'operating systems', 2, 202),
(303, 'multimedia and animation', 3, 203),
(304, 'bigdata analytics', 1, 204),
(305, 'computer networks', 2, 205);

insert into marks (mark_id, student_id, subject_id, marks, exam_type) values
(401, 101, 301, 85, 'final'),
(402, 102, 302, 78, 'final'),
(403, 103, 303, 90, 'mid-term'),
(404, 104, 304, 76, 'final'),
(405, 105, 305, 88, 'mid-term');

insert into attendance (attendance_id, student_id, subject_id, attendance_percentage) values
(501, 101, 301, 92.5),
(502, 102, 302, 93.0),
(503, 103, 303, 80.0),
(504, 104, 304, 75.0),
(505, 105, 305, 95.0);

insert into course_registration (registration_id, student_id, course_id, semester) values
(601, 101, 1, 5),
(602, 102, 2, 6),
(603, 103, 3, 5),
(604, 104, 1, 4),
(605, 105, 2, 6);

insert into timetable (timetable_id, course_id, subject_id, faculty_id, day_of_week, time_slot) values
(701, 1, 301, 201, 'monday', '9:00 AM - 10:30 AM'),
(702, 2, 302, 202, 'tuesday', '10:30 AM - 12:00 PM'),
(703, 3, 303, 203, 'wednesday', '1:00 PM - 2:30 PM'),
(704, 1, 304, 204, 'thursday', '3:00 PM - 4:30 PM'),
(705, 2, 305, 205, 'friday', '9:00 AM - 10:30 AM');

insert into fees (fee_id, student_id, amount, payment_status, payment_date) values
(801, 101, 50000.00, 'paid', '2025-01-15'),
(802, 102, 52000.00, 'paid', '2025-01-10'),
(803, 103, 48000.00, 'paid', '2025-01-10'),
(804, 104, 49000.00, 'unpaid', null),
(805, 105, 51000.00, 'unpaid', null);

insert into library (record_id, student_id, book_name, issue_date, return_date) values
(901, 101, 'database systems', '2025-02-01', '2025-02-15'),
(902, 102, 'operating systems', '2025-02-05', '2025-02-20'),
(903, 103, 'multimedia and animation', '2025-02-10', '2025-02-25'),
(904, 104, 'bigdata analytics', '2025-02-15', '2025-03-01'),
(905, 105, 'computer networking', '2025-02-20', '2025-03-05');
-- to display constraints --
show index from students;
--  stored procedure creation --
-- Insert a Student --
DELIMITER //
CREATE PROCEDURE InsertStudent(
    IN student_name VARCHAR(100), 
    IN student_dob DATE, 
    IN student_gender VARCHAR(10), 
    IN student_department VARCHAR(50), 
    IN student_course_id INT, 
    IN student_email VARCHAR(100), 
    IN student_phone VARCHAR(15), 
    IN student_address TEXT
)
BEGIN
    INSERT INTO students (name, dob, gender, department, course_id, email, phone, address)  
    VALUES (student_name, student_dob, student_gender, student_department, student_course_id, student_email, student_phone, student_address);
    select* from students;
END //
DELIMITER ;
 -- Call the procedure --
CALL InsertStudent('Rahul Kumar', '2002-05-12', 'Male', 'Computer Science', 1, 'rahul@example.com', '9876543210', 'Chennai, India');
-- Retrieve All Students --
 DELIMITER //
CREATE PROCEDURE GetAllStudents()
BEGIN
    SELECT * FROM students;
END //
DELIMITER ;
-- Call the procedure --
CALL GetAllStudents();
 --  Update a Student’s Phone Number --
DELIMITER //
CREATE PROCEDURE UpdateStudentPhone2(IN studentID INT, IN newPhone VARCHAR(15))
BEGIN
    UPDATE students SET phone = newPhone WHERE student_id = studentID;
    select * from students;
END //
DELIMITER ;
-- Call the procedure --
CALL UpdateStudentPhone2(105, '9998887776');
-- Delete a Student Record --
DELIMITER //
CREATE PROCEDURE DeleteStudent(IN studentID INT)
BEGIN
    DELETE FROM students WHERE student_id = studentID;
    select * from students;
END //
DELIMITER ;
-- Call the procedure --
CALL DeleteStudent(107);
 -- Get Students Enrolled in a Specific Course --
DELIMITER //
CREATE PROCEDURE GetStudentsByCourse(IN courseName VARCHAR(100))
BEGIN
    SELECT students.name, courses.course_name  
    FROM students  
    JOIN courses ON students.course_id = courses.course_id  
    WHERE courses.course_name = courseName;
END //
DELIMITER ;
-- Call the procedure --
CALL GetStudentsByCourse('b.tech it');
 -- Insert a Faculty Member --
DELIMITER //
CREATE PROCEDURE InsertFaculty(
    IN faculty_name VARCHAR(100), 
    IN faculty_department VARCHAR(50), 
    IN faculty_experience INT, 
    IN faculty_email VARCHAR(100), 
    IN faculty_phone VARCHAR(15), 
    IN faculty_address TEXT
)
BEGIN
    INSERT INTO faculty (name, department, experience, email, phone, address)  
    VALUES (faculty_name, faculty_department, faculty_experience, faculty_email, faculty_phone, faculty_address);
    select* from faculty;
END //
DELIMITER ;
-- Call the procedure --
CALL InsertFaculty('Dr. Priya Sharma', 'Mathematics', 10, 'priya@example#12.com', '9845612378', 'Bangalore, India');
 -- Assign a Faculty to a Subject --
DELIMITER //
CREATE PROCEDURE AssignFacultyToSubject(IN subjectID INT, IN facultyID INT)
BEGIN
    UPDATE subjects SET faculty_id = facultyID WHERE subject_id = subjectID;
    select * from subjects;
END //
DELIMITER ;
-- Call the procedure --
CALL AssignFacultyToSubject(201, 303);
--  Get Students with Attendance greater Than 75% --
DELIMITER //
CREATE PROCEDURE GetLowAttendanceStudents()
BEGIN
    SELECT students.name, subjects.subject_name, attendance.attendance_percentage  
    FROM attendance  
    JOIN students ON attendance.student_id = students.student_id  
    JOIN subjects ON attendance.subject_id = subjects.subject_id  
    WHERE attendance.attendance_percentage > 75;
    select * from attendance;
END //
DELIMITER ;
-- Call the procedure --
CALL GetLowAttendanceStudents();
-- Insert Exam Marks --
DELIMITER //
CREATE PROCEDURE InsertExamMarks(IN studentID INT, IN subjectID INT, IN marks INT, IN examType VARCHAR(50))
BEGIN
    INSERT INTO marks (student_id, subject_id, marks, exam_type)  
    VALUES (studentID, subjectID, marks, examType);
    select * from marks;
END //
DELIMITER ;
CALL InsertExamMarks(101, 303, 85, 'Mid-Term');
-- Find Students Who Haven’t Paid Fees --
DELIMITER //
CREATE PROCEDURE GetUnpaidStudents()
BEGIN
    SELECT students.name, fees.amount, fees.payment_status  
    FROM students  
    JOIN fees ON students.student_id = fees.student_id  
    WHERE fees.payment_status = 'unpaid';
    select* from fees;
END //
DELIMITER ;
-- Call the procedure --
CALL GetUnpaidStudents();
-- Students Registered for a Specific Semester --
CREATE VIEW StudentsBySemester AS  
SELECT students.name, course_registration.semester, courses.course_name  
FROM course_registration  
JOIN students ON course_registration.student_id = students.student_id  
JOIN courses ON course_registration.course_id = courses.course_id;
-- Use the view --
SELECT * FROM StudentsBySemester WHERE semester = 5;
 -- Faculty Assigned to a Specific Subject --
 CREATE VIEW FacultyBySubject AS  
SELECT faculty.name AS FacultyName, subjects.subject_name AS SubjectName  
FROM faculty  
JOIN subjects ON faculty.faculty_id = subjects.faculty_id;
 -- Use the view --
SELECT * FROM FacultyBySubject WHERE SubjectName = 'database management';
-- Timetable for a Specific Course --
 CREATE VIEW CourseTimetable AS  
SELECT timetable.day_of_week, timetable.time_slot, subjects.subject_name, faculty.name AS FacultyName  
FROM timetable  
JOIN subjects ON timetable.subject_id = subjects.subject_id  
JOIN faculty ON timetable.faculty_id = faculty.faculty_id;
 -- Use the view--
SELECT * FROM CourseTimetable WHERE day_of_week = 'Monday';
-- Books Borrowed by a Student--
CREATE VIEW BooksBorrowed AS  
SELECT students.name AS StudentName, library.book_name AS BookName, library.issue_date, library.return_date  
FROM library  
JOIN students ON library.student_id = students.student_id;
-- Use the view--
SELECT * FROM BooksBorrowed WHERE StudentName = 'kavitha';
-- Count of Students in Each Department--
CREATE VIEW StudentsByDepartment AS  
SELECT department, COUNT(student_id) AS total_students  
FROM students  
GROUP BY department;
-- Use the view--
SELECT * FROM StudentsByDepartment;


