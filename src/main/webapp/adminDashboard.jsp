<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Check if admin is logged in
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Hospital Management System</title>
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
        
        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }
        
        .stat-card {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        
        .stat-number {
            font-size: 2rem;
            font-weight: bold;
            color: #667eea;
            margin-bottom: 0.5rem;
        }
        
        .stat-label {
            color: #666;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <header class="header">
        <nav class="nav">
            <div class="logo">
                <h1>🏥 Admin Panel</h1>
            </div>
            <div class="user-info">
                <span>Welcome, ${adminName}</span>
                <a href="logout" class="logout-btn">Logout</a>
            </div>
        </nav>
    </header>
    
    <div class="container">
        <div class="welcome-card">
            <h2>Admin Dashboard</h2>
            <p>Welcome to the Hospital Management System admin panel. Manage patients, appointments, and system settings from here.</p>
        </div>
        
        <div class="stats">
            <div class="stat-card">
                <div class="stat-number">--</div>
                <div class="stat-label">Total Patients</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">--</div>
                <div class="stat-label">Today's Appointments</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">--</div>
                <div class="stat-label">Active Doctors</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">--</div>
                <div class="stat-label">Pending Requests</div>
            </div>
        </div>
        
        <div class="dashboard-grid">
            <div class="dashboard-card">
                <div class="card-icon">👥</div>
                <h3>Manage Patients</h3>
                <p>View and manage patient records, medical history, and personal information.</p>
                <a href="#" class="btn">View Patients</a>
            </div>
            
            <div class="dashboard-card">
                <div class="card-icon">📅</div>
                <h3>Appointments</h3>
                <p>Manage appointments, schedule new ones, and view appointment history.</p>
                <a href="#" class="btn">Manage Appointments</a>
            </div>
            
            <div class="dashboard-card">
                <div class="card-icon">👨‍⚕️</div>
                <h3>Doctors</h3>
                <p>Manage doctor profiles, specializations, and availability schedules.</p>
                <a href="#" class="btn">Manage Doctors</a>
            </div>
            
            <div class="dashboard-card">
                <div class="card-icon">📊</div>
                <h3>Reports</h3>
                <p>Generate and view various reports including patient statistics and revenue.</p>
                <a href="#" class="btn">View Reports</a>
            </div>
            
            <div class="dashboard-card">
                <div class="card-icon">⚙️</div>
                <h3>System Settings</h3>
                <p>Configure system settings, user permissions, and hospital information.</p>
                <a href="#" class="btn">Settings</a>
            </div>
            
            <div class="dashboard-card">
                <div class="card-icon">💊</div>
                <h3>Pharmacy</h3>
                <p>Manage medicine inventory, prescriptions, and pharmacy operations.</p>
                <a href="#" class="btn">Pharmacy</a>
            </div>
        </div>
        
        <div class="welcome-card">
            <h3>Quick Actions</h3>
            <div style="display: flex; gap: 1rem; flex-wrap: wrap; margin-top: 1rem;">
                <a href="#" class="btn">Add New Patient</a>
                <a href="#" class="btn">Schedule Appointment</a>
                <a href="#" class="btn">Generate Report</a>
                <a href="homePage.jsp" class="btn" style="background: #6c757d;">Back to Home</a>
            </div>
        </div>
    </div>
</body>
</html>