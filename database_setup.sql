USE hospitalmngsys;

-- Create patients table
CREATE TABLE IF NOT EXISTS patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    blood_group VARCHAR(3) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create appointments table
CREATE TABLE IF NOT EXISTS appointments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_name VARCHAR(255) NOT NULL,
    patient_name VARCHAR(255) NOT NULL,
    patient_email VARCHAR(255) NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status VARCHAR(20) DEFAULT 'scheduled',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create admins table
CREATE TABLE IF NOT EXISTS admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
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
INSERT INTO admins (email, password, name) VALUES 
('admin@hospital.com', 'admin123', 'Hospital Administrator')
ON DUPLICATE KEY UPDATE name = VALUES(name);

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
CREATE INDEX idx_patients_email ON patients(email);
CREATE INDEX idx_appointments_date ON appointments(appointment_date);
CREATE INDEX idx_appointments_patient_email ON appointments(patient_email);
CREATE INDEX idx_admins_email ON admins(email);
CREATE INDEX idx_lab_test_bookings_email ON lab_test_bookings(patient_email);

SHOW TABLES;

