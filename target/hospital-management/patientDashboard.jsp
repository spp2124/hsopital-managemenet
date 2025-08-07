<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Check if patient is logged in
    if (session.getAttribute("patientId") == null) {
        response.sendRedirect("patientLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Dashboard - Hospital Management System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f5f5;
            min-height: 100vh;
        }
        
        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1rem 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        .nav {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo h1 {
            font-size: 1.5rem;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .logout-btn {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        
        .logout-btn:hover {
            background: rgba(255, 255, 255, 0.3);
        }
        
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }
        
        .welcome-card {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }
        
        .welcome-card h2 {
            color: #333;
            margin-bottom: 0.5rem;
        }
        
        .welcome-card p {
            color: #666;
        }
        
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }
        
        .dashboard-card {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.2s ease;
        }
        
        .dashboard-card:hover {
            transform: translateY(-5px);
        }
        
        .dashboard-card h3 {
            color: #333;
            margin-bottom: 1rem;
        }
        
        .dashboard-card p {
            color: #666;
            margin-bottom: 1.5rem;
        }
        
        .card-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        
        .btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: transform 0.2s ease;
        }
        
        .btn:hover {
            transform: translateY(-2px);
        }
        
        .patient-info {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }
        
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-top: 1rem;
        }
        
        .info-item {
            padding: 1rem;
            background: #f8f9fa;
            border-radius: 5px;
        }
        
        .info-label {
            font-weight: bold;
            color: #333;
            margin-bottom: 0.5rem;
        }
        
        .info-value {
            color: #666;
        }
    </style>
</head>
<body>
    <header class="header">
        <nav class="nav">
            <div class="logo">
                <h1>🏥 Patient Portal</h1>
            </div>
            <div class="user-info">
                <span>Welcome, ${patientName}</span>
                <a href="logout" class="logout-btn">Logout</a>
            </div>
        </nav>
    </header>
    
    <div class="container">
        <div class="welcome-card">
            <h2>Patient Dashboard</h2>
            <p>Welcome to your patient portal. Manage your appointments, view medical records, and access healthcare services.</p>
        </div>
        
        <div class="patient-info">
            <h3>Your Information</h3>
            <div class="info-grid">
                <div class="info-item">
                    <div class="info-label">Name</div>
                    <div class="info-value">${patientName}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Email</div>
                    <div class="info-value">${patientEmail}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Phone</div>
                    <div class="info-value">${patientPhone}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Patient ID</div>
                    <div class="info-value">PAT-${patientId}</div>
                </div>
            </div>
        </div>
        
        <div class="dashboard-grid">
            <div class="dashboard-card">
                <div class="card-icon">📅</div>
                <h3>Book Appointment</h3>
                <p>Schedule a new appointment with our doctors and specialists.</p>
                <a href="#" class="btn">Book Now</a>
            </div>
            
            <div class="dashboard-card">
                <div class="card-icon">🗓️</div>
                <h3>My Appointments</h3>
                <p>View your upcoming and past appointments with doctors.</p>
                <a href="#" class="btn">View Appointments</a>
            </div>
            
            <div class="dashboard-card">
                <div class="card-icon">📋</div>
                <h3>Medical Records</h3>
                <p>Access your medical history, test results, and prescriptions.</p>
                <a href="#" class="btn">View Records</a>
            </div>
            
            <div class="dashboard-card">
                <div class="card-icon">💊</div>
                <h3>Prescriptions</h3>
                <p>View your current prescriptions and medication history.</p>
                <a href="#" class="btn">View Prescriptions</a>
            </div>
            
            <div class="dashboard-card">
                <div class="card-icon">🧾</div>
                <h3>Bills & Payments</h3>
                <p>View and pay your medical bills and treatment costs.</p>
                <a href="#" class="btn">View Bills</a>
            </div>
            
            <div class="dashboard-card">
                <div class="card-icon">👤</div>
                <h3>Update Profile</h3>
                <p>Update your personal information and contact details.</p>
                <a href="#" class="btn">Update Profile</a>
            </div>
        </div>
        
        <div class="welcome-card">
            <h3>Quick Actions</h3>
            <div style="display: flex; gap: 1rem; flex-wrap: wrap; margin-top: 1rem;">
                <a href="#" class="btn">Emergency Contact</a>
                <a href="#" class="btn">Download Reports</a>
                <a href="#" class="btn">Contact Support</a>
                <a href="homePage.jsp" class="btn" style="background: #6c757d;">Back to Home</a>
            </div>
        </div>
    </div>
</body>
</html>