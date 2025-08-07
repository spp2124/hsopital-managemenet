<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Management System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        
        .header {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 1rem 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
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
            color: white;
            font-size: 1.5rem;
        }
        
        .nav-links {
            display: flex;
            gap: 2rem;
        }
        
        .nav-links a {
            color: white;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        
        .nav-links a:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }
        
        .main-content {
            margin-top: 80px;
            min-height: calc(100vh - 80px);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }
        
        .hero {
            text-align: center;
            color: white;
            max-width: 800px;
        }
        
        .hero h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }
        
        .hero p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }
        
        .cta-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }
        
        .btn {
            padding: 1rem 2rem;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: transform 0.2s ease;
        }
        
        .btn:hover {
            transform: translateY(-2px);
        }
        
        .btn-primary {
            background: white;
            color: #667eea;
        }
        
        .btn-secondary {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: 2px solid white;
        }
        
        .features {
            margin-top: 4rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }
        
        .feature {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 2rem;
            border-radius: 10px;
            text-align: center;
        }
        
        .feature h3 {
            margin-bottom: 1rem;
            color: white;
        }
        
        .feature p {
            color: rgba(255, 255, 255, 0.8);
        }
        
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2rem;
            }
            
            .cta-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .nav-links {
                gap: 1rem;
            }
        }
    </style>
</head>
<body>
    <header class="header">
        <nav class="nav">
            <div class="logo">
                <h1>🏥 HealthCare</h1>
            </div>
            <div class="nav-links">
                <a href="patientLogin.jsp">Patient Login</a>
                <a href="adminLogin.jsp">Admin Login</a>
                <a href="patientRegistration.jsp">Register</a>
            </div>
        </nav>
    </header>
    
    <main class="main-content">
        <div class="hero">
            <h1>Hospital Management System</h1>
            <p>Your health, our priority. Experience modern healthcare management with our comprehensive system.</p>
            
            <div class="cta-buttons">
                <a href="patientRegistration.jsp" class="btn btn-primary">Get Started</a>
                <a href="patientLogin.jsp" class="btn btn-secondary">Patient Portal</a>
                <a href="adminLogin.jsp" class="btn btn-secondary">Admin Portal</a>
            </div>
            
            <div class="features">
                <div class="feature">
                    <h3>🩺 Patient Care</h3>
                    <p>Comprehensive patient management and medical records system</p>
                </div>
                <div class="feature">
                    <h3>📅 Appointments</h3>
                    <p>Easy appointment scheduling and management for patients and staff</p>
                </div>
                <div class="feature">
                    <h3>🔒 Secure</h3>
                    <p>Advanced security measures to protect patient data and privacy</p>
                </div>
                <div class="feature">
                    <h3>📱 Modern</h3>
                    <p>Responsive design that works seamlessly on all devices</p>
                </div>
            </div>
        </div>
    </main>
</body>
</html>