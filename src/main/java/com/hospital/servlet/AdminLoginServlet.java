package com.hospital.servlet;

import com.hospital.config.DatabaseConfig;
import com.hospital.util.SecurityUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Forward to admin login page
        request.getRequestDispatcher("/adminLogin.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = SecurityUtil.sanitizeInput(request.getParameter("email"));
        String password = request.getParameter("password");
        
        // Validate input
        if (email == null || email.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Please enter both email and password.");
            request.getRequestDispatcher("/adminLogin.jsp").forward(request, response);
            return;
        }
        
        if (!SecurityUtil.isValidEmail(email)) {
            request.setAttribute("error", "Please enter a valid email address.");
            request.getRequestDispatcher("/adminLogin.jsp").forward(request, response);
            return;
        }
        
        try (Connection conn = DatabaseConfig.getConnection()) {
            // Check admin credentials
            String sql = "SELECT id, name, email, password FROM admin WHERE email = ? AND status = 'active'";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                String storedPassword = rs.getString("password");
                
                // Verify password (handle both hashed and plain text for backward compatibility)
                boolean passwordValid = false;
                if (storedPassword.startsWith("$2a$") || storedPassword.startsWith("$2b$")) {
                    // BCrypt hashed password
                    passwordValid = SecurityUtil.verifyPassword(password, storedPassword);
                } else {
                    // Plain text password (for initial setup)
                    passwordValid = password.equals(storedPassword);
                }
                
                if (passwordValid) {
                    // Create session
                    HttpSession session = request.getSession();
                    session.setAttribute("adminId", rs.getInt("id"));
                    session.setAttribute("adminName", rs.getString("name"));
                    session.setAttribute("adminEmail", rs.getString("email"));
                    session.setAttribute("userType", "admin");
                    session.setMaxInactiveInterval(30 * 60); // 30 minutes
                    
                    // Redirect to admin dashboard
                    response.sendRedirect("adminDashboard.jsp");
                } else {
                    request.setAttribute("error", "Invalid email or password.");
                    request.getRequestDispatcher("/adminLogin.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Invalid email or password.");
                request.getRequestDispatcher("/adminLogin.jsp").forward(request, response);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error occurred. Please try again.");
            request.getRequestDispatcher("/adminLogin.jsp").forward(request, response);
        }
    }
}