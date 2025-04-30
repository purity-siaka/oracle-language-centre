-- Create the database
CREATE DATABASE IF NOT EXISTS oracle_language_centre_db;
USE oracle_language_centre_db;

-- Users table
CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  password VARCHAR(255),
  role ENUM('student', 'admin', 'tutor'),
  phone VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Courses table
CREATE TABLE courses (
  course_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100),
  description TEXT,
  duration VARCHAR(50),
  fee DECIMAL(10,2)
);

-- Enrollments table
CREATE TABLE enrollments (
  enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  course_id INT,
  status VARCHAR(50),
  date_enrolled DATE,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Payments table
CREATE TABLE payments (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  amount DECIMAL(10,2),
  method VARCHAR(50),
  payment_date DATE,
  receipt_url TEXT,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Feedback table
CREATE TABLE user_feedback (
  feedback_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  course_id INT,
  rating INT,
  feedback_comment TEXT,
  feedback_date DATE,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Attendance table
CREATE TABLE attendance (
  attendance_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  course_id INT,
  date DATE,
  status VARCHAR(20),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Certificates table
CREATE TABLE certificates (
  certificate_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  course_id INT,
  issued_on DATE,
  download_url TEXT,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Materials table
CREATE TABLE materials (
  material_id INT AUTO_INCREMENT PRIMARY KEY,
  course_id INT,
  title VARCHAR(100),
  file_url TEXT,
  uploaded_by INT,
  FOREIGN KEY (course_id) REFERENCES courses(course_id),
  FOREIGN KEY (uploaded_by) REFERENCES users(user_id)
);
