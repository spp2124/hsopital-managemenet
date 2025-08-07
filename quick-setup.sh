#!/bin/bash

# Hospital Management System - Quick Setup Script
echo "🏥 Hospital Management System - Quick Setup"
echo "=========================================="

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed. Please install Java 11 or higher."
    exit 1
fi

# Check if Maven is installed
if ! command -v mvn &> /dev/null; then
    echo "❌ Maven is not installed. Please install Maven 3.6 or higher."
    exit 1
fi

echo "✅ Java and Maven are installed"

# Build the application
echo "🔨 Building the application..."
mvn clean package

if [ $? -ne 0 ]; then
    echo "❌ Build failed. Please check the error messages above."
    exit 1
fi

echo "✅ Application built successfully"

# Check if MySQL is available
if command -v mysql &> /dev/null; then
    echo "✅ MySQL is available"
    echo "📋 Database setup instructions:"
    echo "   1. Start MySQL: sudo systemctl start mysql"
    echo "   2. Connect: sudo mysql -u root"
    echo "   3. Run: source $(pwd)/database_setup.sql"
    echo ""
else
    echo "⚠️  MySQL not found. Please install MySQL server."
fi

# Create run script
cat > run-app.sh << 'EOF'
#!/bin/bash
echo "🚀 Starting Hospital Management System..."
echo "Application will be available at: http://localhost:8080/hospital/"
echo ""
echo "Default Admin Credentials:"
echo "  Email: admin@hospital.com"
echo "  Password: admin123"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""
mvn tomcat7:run
EOF

chmod +x run-app.sh

echo ""
echo "🎉 Setup completed successfully!"
echo ""
echo "📋 Next steps:"
echo "   1. Set up MySQL database (see DEPLOYMENT_GUIDE.md)"
echo "   2. Run: ./run-app.sh"
echo "   3. Open: http://localhost:8080/hospital/"
echo ""
echo "📖 For detailed instructions, see DEPLOYMENT_GUIDE.md"