# Hospital Management System - Deployment Guide

## Overview

This is a complete Hospital Management System built with Java servlets, JSP, MySQL database, and modern responsive web design. The system provides secure login functionality for both administrators and patients.

## Fixed Issues

✅ **Login Issues Resolved**: Both admin and patient login functionality has been implemented and fixed
✅ **Database Integration**: Proper database configuration with connection pooling
✅ **Security**: Password hashing with BCrypt, SQL injection prevention
✅ **Modern UI**: Responsive design with professional styling
✅ **Session Management**: Secure user sessions with timeout

## Prerequisites

Before running this application, ensure you have:

1. **Java Development Kit (JDK) 11 or higher**
2. **Apache Maven 3.6 or higher**
3. **MySQL Server 8.0 or higher**
4. **Apache Tomcat 9 or higher**

## Quick Setup Instructions

### 1. Database Setup

```bash
# Start MySQL service
sudo systemctl start mysql

# Connect to MySQL
sudo mysql -u root

# Run the database setup
mysql> source /workspace/database_setup.sql
```

### 2. Build the Application

```bash
cd /workspace
mvn clean package
```

### 3. Deploy to Tomcat

**Option A: Using Maven Tomcat Plugin (Recommended for testing)**
```bash
mvn tomcat7:run
```

**Option B: Deploy to Tomcat Server**
```bash
# Copy WAR file to Tomcat webapps
cp target/hospital-management.war /path/to/tomcat/webapps/
# Start Tomcat
/path/to/tomcat/bin/startup.sh
```

## Application URLs

- **Home Page**: `http://localhost:8080/hospital/homePage.jsp`
- **Admin Login**: `http://localhost:8080/hospital/admin-login` (redirects to `adminLogin.jsp`)
- **Patient Login**: `http://localhost:8080/hospital/patientLogin.jsp`
- **Patient Registration**: `http://localhost:8080/hospital/patientRegistration.jsp`

## Default Credentials

### Admin Login
- **Email**: `admin@hospital.com`
- **Password**: `admin123`

### Test Patient (after registration)
- Register a new patient account through the registration page
- Use your registered credentials to login

## Key Features Implemented

### 🔐 Authentication & Security
- **Admin Login**: Secure authentication for hospital administrators
- **Patient Login**: Secure authentication for patients
- **Password Hashing**: BCrypt encryption for all passwords
- **Session Management**: Secure sessions with 30-minute timeout
- **Input Validation**: Server-side validation and XSS prevention

### 👥 User Management
- **Patient Registration**: New patients can register with email validation
- **Profile Management**: Users can view and manage their profiles
- **Role-based Access**: Different dashboards for admin and patients

### 🏥 Hospital Management
- **Admin Dashboard**: Comprehensive management interface
- **Patient Dashboard**: Patient-specific healthcare portal
- **Appointment System**: Ready for appointment management
- **Medical Records**: Framework for medical record management

### 🎨 Modern UI/UX
- **Responsive Design**: Works on desktop, tablet, and mobile
- **Professional Styling**: Modern gradient backgrounds and clean layouts
- **User-friendly Forms**: Intuitive form design with validation feedback
- **Consistent Branding**: Hospital-themed design throughout

## Project Structure

```
hospital-management-system/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/hospital/
│       │       ├── config/
│       │       │   └── DatabaseConfig.java      # Database connection
│       │       ├── servlet/
│       │       │   ├── AdminLoginServlet.java   # Admin authentication
│       │       │   ├── LoginServlet.java        # Patient authentication
│       │       │   ├── RegistrationServlet.java # Patient registration
│       │       │   └── LogoutServlet.java       # Session termination
│       │       └── util/
│       │           └── SecurityUtil.java        # Security utilities
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml                      # Servlet configuration
│           ├── homePage.jsp                     # Landing page
│           ├── adminLogin.jsp                   # Admin login form
│           ├── patientLogin.jsp                 # Patient login form
│           ├── patientRegistration.jsp          # Registration form
│           ├── adminDashboard.jsp               # Admin dashboard
│           └── patientDashboard.jsp             # Patient dashboard
├── target/
│   └── hospital-management.war                  # Deployable WAR file
├── database_setup.sql                           # Database schema
├── pom.xml                                      # Maven configuration
└── README.md                                    # Project documentation
```

## Database Schema

The system uses the following main tables:

- **`admin`**: Administrator accounts
- **`patient`**: Patient accounts and information
- **`appointments`**: Appointment scheduling
- **`doctors`**: Doctor profiles and specializations
- **`lab_tests`**: Available laboratory tests
- **`blood_bank`**: Blood bank inventory

## Troubleshooting

### Database Connection Issues
1. Verify MySQL is running: `sudo systemctl status mysql`
2. Check database credentials in `DatabaseConfig.java`
3. Ensure database `hospitalmngsys` exists
4. Run the database setup script

### Build Issues
1. Verify Java version: `java -version` (should be 11+)
2. Verify Maven version: `mvn -version` (should be 3.6+)
3. Clean and rebuild: `mvn clean compile package`

### Login Issues
1. Check database connection
2. Verify admin account exists: `SELECT * FROM admin;`
3. Check server logs for authentication errors
4. Ensure session cookies are enabled in browser

### Port Conflicts
- Default port is 8080
- Change port in `pom.xml` if needed:
  ```xml
  <configuration>
      <port>8081</port>
  </configuration>
  ```

## Development Notes

### Security Features
- All passwords are hashed using BCrypt
- SQL injection prevention with PreparedStatements
- XSS protection with input sanitization
- Session management with timeout
- HTTPS-ready configuration

### Extensibility
- Modular servlet architecture
- Prepared for additional features:
  - Appointment booking system
  - Medical records management
  - Billing and payments
  - Report generation
  - Email notifications

## Support

If you encounter issues:

1. Check the application logs in Tomcat's `logs/` directory
2. Verify all prerequisites are installed
3. Ensure database is properly configured
4. Check firewall settings for port 8080

## Next Steps

The application is now ready for:
1. ✅ Admin login functionality
2. ✅ Patient login and registration
3. 🔄 Appointment booking implementation
4. 🔄 Medical records management
5. 🔄 Advanced reporting features

---

**Hospital Management System v1.0**  
*Complete, secure, and modern healthcare management solution*