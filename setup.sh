#!/bin/bash

# Hospital Management System - Setup Script
# This script helps set up the hospital management system

echo "=========================================="
echo "Hospital Management System Setup"
echo "=========================================="

# Check if Java is installed
echo "Checking Java installation..."
if command -v java &> /dev/null; then
    echo "✓ Java is installed: $(java -version 2>&1 | head -n 1)"
else
    echo "✗ Java is not installed. Please install Java 11 or higher."
    exit 1
fi

# Check if Maven is installed
echo "Checking Maven installation..."
if command -v mvn &> /dev/null; then
    echo "✓ Maven is installed: $(mvn -version | head -n 1)"
else
    echo "✗ Maven is not installed. Please install Maven 3.6 or higher."
    exit 1
fi

# Check if MySQL is installed
echo "Checking MySQL installation..."
if command -v mysql &> /dev/null; then
    echo "✓ MySQL is installed"
else
    echo "✗ MySQL is not installed. Please install MySQL 8.0 or higher."
    exit 1
fi

# Build the project
echo "Building the project..."
mvn clean compile package

if [ $? -eq 0 ]; then
    echo "✓ Project built successfully!"
    echo "WAR file created: target/hospital-management.war"
else
    echo "✗ Build failed. Please check the error messages above."
    exit 1
fi

# Setup database
echo "Setting up database..."
echo "Please ensure MySQL is running and you have root access."
echo "The database setup script is available in: database_setup.sql"
echo ""
echo "To set up the database manually, run:"
echo "mysql -u root -p < database_setup.sql"
echo ""

# Instructions for deployment
echo "=========================================="
echo "Deployment Instructions:"
echo "=========================================="
echo "1. Copy the WAR file to your Tomcat webapps directory:"
echo "   cp target/hospital-management.war /path/to/tomcat/webapps/"
echo ""
echo "2. Start Tomcat server"
echo ""
echo "3. Access the application at:"
echo "   http://localhost:8080/hospital-management/"
echo ""
echo "Default admin credentials:"
echo "   Email: admin@hospital.com"
echo "   Password: admin123"
echo ""
echo "Setup completed successfully!"
echo "=========================================="

