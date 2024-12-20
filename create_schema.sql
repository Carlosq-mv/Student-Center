-- Create the Administrators table
CREATE TABLE IF NOT EXISTS Administrators (
    AdministratorID BIGINT AUTO_INCREMENT PRIMARY KEY,
    Password VARCHAR(255) NOT NULL
);

-- Create the Students table
CREATE TABLE IF NOT EXISTS Students (
    StudentID BIGINT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) NOT NULL
);

-- Create the Courses table with a composite unique constraint on CourseName and Section
CREATE TABLE IF NOT EXISTS Courses (
    CourseID BIGINT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Section INT NOT NULL,
    Credits BIGINT NOT NULL,
    UNIQUE (CourseName, Section)
);

-- Create the Enrollments table with foreign key constraints
CREATE TABLE IF NOT EXISTS Enrollments (
    EnrollmentID BIGINT AUTO_INCREMENT PRIMARY KEY,
    StudentID BIGINT NOT NULL,
    CourseID BIGINT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);

-- Create the Grades table with a foreign key constraint on EnrollmentID
CREATE TABLE IF NOT EXISTS Grades (
    GradeID BIGINT AUTO_INCREMENT PRIMARY KEY,
    EnrollmentID BIGINT NOT NULL,
    Grade VARCHAR(2) NOT NULL,
    GradingDate DATE NOT NULL,
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID) ON DELETE CASCADE
);
