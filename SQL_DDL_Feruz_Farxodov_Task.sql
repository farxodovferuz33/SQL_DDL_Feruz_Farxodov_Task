CREATE DATABASE university;

CREATE SCHEMA university_schema;


CREATE TABLE university_schema.Students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    date_of_birth DATE CHECK (date_of_birth > '2000-01-01'),
    gender CHAR(1) CHECK (gender IN ('M', 'F'))
);

CREATE TABLE university_schema.Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL
);

CREATE TABLE university_schema.Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE DEFAULT current_date,
    FOREIGN KEY (student_id) REFERENCES university_schema.Students (student_id),
    FOREIGN KEY (course_id) REFERENCES university_schema.Courses (course_id)
);

INSERT INTO university_schema.Students (student_name, date_of_birth, gender)
VALUES
    ('Feruz Farxodov', '2001-05-15', 'M'),
    ('Frankie Smith', '2000-08-24', 'F');

INSERT INTO university_schema.Courses (course_name, department)
VALUES
    ('Mathematics', 'Math Department'),
    ('Computer Science', 'Computer Science Department');

INSERT INTO university_schema.Enrollments (student_id, course_id, enrollment_date)
VALUES
    (1, 1, '2021-09-01'),
    (2, 2, '2021-08-15');



ALTER TABLE university_schema.Students
ADD COLUMN record_ts DATE DEFAULT current_date;

ALTER TABLE university_schema.Courses
    ADD COLUMN record_ts DATE DEFAULT current_date;

ALTER TABLE university_schema.Enrollments
    ADD COLUMN record_ts DATE DEFAULT current_date;

SELECT * FROM university_schema.Students;
SELECT * FROM university_schema.Courses;
SELECT * FROM university_schema.Enrollments;