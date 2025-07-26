
-- Experiment 1 (a)
CREATE DATABASE BookStoreDB;
USE BookStoreDB;

CREATE TABLE Writers (
    writer_id INT PRIMARY KEY,
    writer_name VARCHAR(150),
    nationality VARCHAR(60)
);

CREATE TABLE Books (
    book_code INT PRIMARY KEY,
    book_title VARCHAR(120),
    writer_id INT,
    FOREIGN KEY (writer_id) REFERENCES Writers(writer_id)
);

INSERT INTO Writers (writer_id, writer_name, nationality) VALUES
(1, 'Rabindranath Tagore', 'India'),
(2, 'R.K. Narayan', 'India'),
(3, 'Arundhati Roy', 'India');

INSERT INTO Books (book_code, book_title, writer_id) VALUES
(201, 'Gitanjali', 1),
(202, 'The Guide', 2),
(203, 'The God of Small Things', 3);

SELECT 
    B.book_title AS Title,
    W.writer_name AS Author,
    W.nationality AS Country
FROM 
    Books B
JOIN 
    Writers W ON B.writer_id = W.writer_id;
    
    
-- Experiment 1 (b)
CREATE DATABASE AcademicDB;
USE AcademicDB;

CREATE TABLE Departments (
    dept_code INT PRIMARY KEY,
    dept_title VARCHAR(80)
);

CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(120),
    dept_code INT,
    FOREIGN KEY (dept_code) REFERENCES Departments(dept_code)
);

INSERT INTO Departments (dept_code, dept_title) VALUES
(10, 'Information Technology'),
(20, 'Chemical Engineering'),
(30, 'Electronics'),
(40, 'Architecture'),
(50, 'Statistics');

INSERT INTO Subjects (subject_id, subject_name, dept_code) VALUES
(1001, 'Algorithms', 10),
(1002, 'Computer Networks', 10),
(1003, 'Database Systems', 10),
(1004, 'Heat Transfer', 20),
(1005, 'Chemical Kinetics', 20),
(1006, 'Digital Circuits', 30),
(1007, 'Control Systems', 30),
(1008, 'Building Design', 40),
(1009, 'Probability', 50),
(1010, 'Statistical Methods', 50);

CREATE USER 'student456'@'localhost' IDENTIFIED BY 'securepass456';
GRANT SELECT ON AcademicDB.Subjects TO 'student456'@'localhost';

SELECT dept_title
FROM Departments
WHERE dept_code IN (
    SELECT dept_code
    FROM Subjects
    GROUP BY dept_code
    HAVING COUNT(subject_id) >= 3
);