-- Create database if not exists
CREATE DATABASE IF NOT EXISTS hospitalmngsys;
USE hospitalmngsys;

-- Create patient table (singular name to match servlet)
CREATE TABLE IF NOT EXISTS patient (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create admin table (singular name to match servlet)
CREATE TABLE IF NOT EXISTS admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create appointments table
CREATE TABLE IF NOT EXISTS appointments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_name VARCHAR(255) NOT NULL,
    patient_name VARCHAR(255) NOT NULL,
    patient_email VARCHAR(255) NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status VARCHAR(20) DEFAULT 'scheduled',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patient(id) ON DELETE SET NULL
);

-- Create doctors table
CREATE TABLE IF NOT EXISTS doctors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    specialization VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20),
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create blood_bank table
CREATE TABLE IF NOT EXISTS blood_bank (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    address VARCHAR(255),
    blood_type VARCHAR(3) NOT NULL,
    units_available INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create lab_tests table
CREATE TABLE IF NOT EXISTS lab_tests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    test_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create lab_test_bookings table
CREATE TABLE IF NOT EXISTS lab_test_bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tests VARCHAR(255) NOT NULL,
    patient_name VARCHAR(100) NOT NULL,
    patient_email VARCHAR(100) NOT NULL,
    patient_phone VARCHAR(20) NOT NULL,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20) DEFAULT 'pending',
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample admin data (password: admin123)
INSERT INTO admin (name, email, password, status) VALUES 
('Hospital Administrator', 'admin@hospital.com', 'admin123', 'active')
ON DUPLICATE KEY UPDATE name = VALUES(name), status = VALUES(status);

-- Insert sample doctors
INSERT INTO doctors (name, specialization, email, phone, status) VALUES 
('Dr. John Smith', 'Cardiology', 'dr.smith@hospital.com', '+1-555-0201', 'active'),
('Dr. Sarah Johnson', 'Pediatrics', 'dr.johnson@hospital.com', '+1-555-0202', 'active'),
('Dr. Michael Brown', 'Orthopedics', 'dr.brown@hospital.com', '+1-555-0203', 'active'),
('Dr. Emily Davis', 'Dermatology', 'dr.davis@hospital.com', '+1-555-0204', 'active'),
('Dr. Robert Wilson', 'Neurology', 'dr.wilson@hospital.com', '+1-555-0205', 'active')
ON DUPLICATE KEY UPDATE specialization = VALUES(specialization), status = VALUES(status);

-- Insert sample lab tests
INSERT INTO lab_tests (test_name, price, description) VALUES 
('Blood Test', 50.00, 'Complete blood count and analysis'),
('X-Ray', 75.00, 'Digital X-ray imaging'),
('MRI Scan', 300.00, 'Magnetic Resonance Imaging'),
('CT Scan', 250.00, 'Computed Tomography scan'),
('ECG', 40.00, 'Electrocardiogram'),
('Ultrasound', 80.00, 'Ultrasound imaging')
ON DUPLICATE KEY UPDATE price = VALUES(price), description = VALUES(description);

-- Insert sample blood bank data
INSERT INTO blood_bank (name, contact_number, address, blood_type, units_available) VALUES 
('City Blood Bank', '+1-555-0101', '123 Main St, City Center', 'A+', 25),
('City Blood Bank', '+1-555-0101', '123 Main St, City Center', 'A-', 15),
('City Blood Bank', '+1-555-0101', '123 Main St, City Center', 'B+', 20),
('City Blood Bank', '+1-555-0101', '123 Main St, City Center', 'B-', 10),
('City Blood Bank', '+1-555-0101', '123 Main St, City Center', 'O+', 30),
('City Blood Bank', '+1-555-0101', '123 Main St, City Center', 'O-', 18),
('City Blood Bank', '+1-555-0101', '123 Main St, City Center', 'AB+', 12),
('City Blood Bank', '+1-555-0101', '123 Main St, City Center', 'AB-', 8)
ON DUPLICATE KEY UPDATE units_available = VALUES(units_available);

-- Create indexes for better performance
CREATE INDEX idx_patient_email ON patient(email);
CREATE INDEX idx_admin_email ON admin(email);
CREATE INDEX idx_appointments_date ON appointments(appointment_date);
CREATE INDEX idx_appointments_patient_email ON appointments(patient_email);
CREATE INDEX idx_doctors_email ON doctors(email);
CREATE INDEX idx_lab_test_bookings_email ON lab_test_bookings(patient_email);

-- Show all tables
SHOW TABLES;

-- Show sample data
SELECT 'Admin Users:' as Info;
SELECT id, name, email, status FROM admin;

SELECT 'Doctors:' as Info;
SELECT id, name, specialization, email FROM doctors;

SELECT 'Lab Tests:' as Info;
SELECT id, test_name, price FROM lab_tests;

