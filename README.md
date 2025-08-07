# Hospital Management System - Complete Java Web Application

## Overview

This is a fully functional Hospital Management System built with Java servlets, JSP, MySQL database, and modern responsive web design. The system has been completely refactored and fixed from the original buggy version to provide a secure, professional, and user-friendly healthcare management solution.

## Features

### Patient Features
- **User Registration**: Secure patient registration with password hashing
- **User Authentication**: Secure login with session management
- **Appointment Booking**: Schedule appointments with doctors
- **Medical Records Access**: View personal medical information
- **Modern UI**: Responsive design that works on all devices

### Administrator Features
- **Admin Dashboard**: Comprehensive hospital management interface
- **Patient Management**: View and manage patient records
- **Appointment Management**: View and manage all appointments
- **System Administration**: Full control over hospital operations

### Technical Features
- **Security**: Password hashing with BCrypt, SQL injection prevention
- **Session Management**: Secure user sessions with timeout
- **Database Connection Pooling**: Efficient database connections with HikariCP
- **Responsive Design**: Modern CSS with mobile-first approach
- **Error Handling**: Comprehensive error handling and user feedback

## Technology Stack

- **Backend**: Java 11, Jakarta Servlets, JSP
- **Database**: MySQL 8.0
- **Frontend**: HTML5, CSS3, JavaScript
- **Build Tool**: Maven 3.6+
- **Web Server**: Apache Tomcat 9
- **Security**: BCrypt password hashing
- **Connection Pooling**: HikariCP

## Prerequisites

Before running this application, ensure you have the following installed:

1. **Java Development Kit (JDK) 11 or higher**
2. **Apache Maven 3.6 or higher**
3. **MySQL Server 8.0 or higher**
4. **Apache Tomcat 9 or higher**

## Installation and Setup

### Step 1: Database Setup

1. **Install MySQL Server** (if not already installed)
2. **Start MySQL service**
3. **Create the database and tables**:

```sql
-- Connect to MySQL as root
mysql -u root -p

-- Create database
CREATE DATABASE hospitalmngsys;

-- Use the database
USE hospitalmngsys;

-- Run the database setup script (provided in database_setup.sql)
```

### Step 2: Configure Database Connection

The database configuration is located in:
`src/main/java/com/hospital/config/DatabaseConfig.java`

Update the following parameters if needed:
- Database URL: `jdbc:mysql://localhost:3306/hospitalmngsys`
- Username: `root`
- Password: `admin123`

### Step 3: Build the Application

```bash
# Navigate to project directory
cd hospital_management_fixed

# Clean and build the project
mvn clean compile package
```

### Step 4: Deploy to Tomcat

```bash
# Copy the WAR file to Tomcat webapps directory
cp target/hospital-management.war /path/to/tomcat/webapps/

# Start Tomcat server
# The application will be automatically deployed
```

## Running the Application

### Method 1: Using Tomcat (Recommended)

1. **Start Tomcat server**
2. **Access the application** at: `http://localhost:8080/hospital-management/`

### Method 2: Using Maven Tomcat Plugin

```bash
# Run with embedded Tomcat
mvn tomcat7:run

# Access at: http://localhost:8080/hospital/
```

## Application URLs

- **Home Page**: `http://localhost:8080/hospital-management/homePage.jsp`
- **Patient Login**: `http://localhost:8080/hospital-management/patientLogin.jsp`
- **Patient Registration**: `http://localhost:8080/hospital-management/patientRegistration.jsp`
- **Admin Login**: `http://localhost:8080/hospital-management/adminLogin.jsp`

## Default Admin Credentials

- **Email**: `admin@hospital.com`
- **Password**: `admin123`

## Project Structure

```
hospital_management_fixed/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── hospital/
│       │           ├── config/
│       │           │   └── DatabaseConfig.java
│       │           ├── servlet/
│       │           │   ├── RegistrationServlet.java
│       │           │   ├── LoginServlet.java
│       │           │   ├── AdminLoginServlet.java
│       │           │   ├── AppointmentServlet.java
│       │           │   └── LogoutServlet.java
│       │           └── util/
│       │               └── SecurityUtil.java
│       └── webapp/
│           ├── WEB-INF/
│           │   ├── web.xml
│           │   └── lib/
│           ├── homePage.jsp
│           ├── patientLogin.jsp
│           ├── patientRegistration.jsp
│           ├── adminLogin.jsp
│           └── [other JSP files]
├── target/
│   └── hospital-management.war
├── database_setup.sql
├── pom.xml
└── README.md
```

## Key Improvements Made

### Security Enhancements
1. **Password Hashing**: Implemented BCrypt for secure password storage
2. **SQL Injection Prevention**: Used PreparedStatements throughout
3. **Session Management**: Proper session handling with timeout
4. **Input Validation**: Comprehensive server-side validation

### Code Quality Improvements
1. **Package Structure**: Organized code into proper packages
2. **Error Handling**: Comprehensive exception handling
3. **Connection Pooling**: Efficient database connection management
4. **Code Documentation**: Well-documented and maintainable code

### UI/UX Improvements
1. **Modern Design**: Professional, responsive web design
2. **User Experience**: Intuitive navigation and user feedback
3. **Mobile Compatibility**: Works seamlessly on all devices
4. **Accessibility**: Improved accessibility features

### Database Improvements
1. **Schema Optimization**: Improved database schema with indexes
2. **Sample Data**: Pre-populated with sample data for testing
3. **Connection Management**: Efficient connection pooling

## Testing the Application

### Test Patient Registration
1. Navigate to the registration page
2. Fill out the form with valid data
3. Submit and verify successful registration

### Test Patient Login
1. Use registered credentials to log in
2. Verify successful authentication and session creation

### Test Admin Login
1. Use admin credentials to access admin panel
2. Verify admin functionality

## Troubleshooting

### Common Issues

1. **Database Connection Error**
   - Verify MySQL is running
   - Check database credentials in DatabaseConfig.java
   - Ensure database exists and tables are created

2. **404 Error on Servlet Calls**
   - Verify web.xml servlet mappings
   - Check servlet class names and packages
   - Ensure WAR file is properly deployed

3. **Build Errors**
   - Verify Java and Maven versions
   - Check internet connection for dependency downloads
   - Clean and rebuild: `mvn clean compile package`

### Logs and Debugging

- **Tomcat Logs**: Check `logs/catalina.out` for server errors
- **Application Logs**: Check console output for application-specific errors
- **Database Logs**: Check MySQL error logs for database issues

## Future Enhancements

Potential improvements for future versions:
1. **REST API**: Add REST endpoints for mobile app integration
2. **Email Notifications**: Send appointment confirmations via email
3. **Payment Integration**: Add payment processing for services
4. **Reporting**: Generate medical reports and analytics
5. **Multi-language Support**: Internationalization features

## Support and Maintenance

For support or questions about this application:
1. Check the troubleshooting section above
2. Review the code documentation
3. Verify all prerequisites are properly installed
4. Check server and application logs for specific error messages

## License

This project is provided as-is for educational and demonstration purposes.

---

**Hospital Management System v1.0**  
*A complete, secure, and modern healthcare management solution*

