package com.hospital.servlet;

import com.hospital.config.DatabaseConfig;
import com.hospital.util.SecurityUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/patientRegistration")
public class RegistrationServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Forward to patient registration page
        request.getRequestDispatcher("/patientRegistration.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = SecurityUtil.sanitizeInput(request.getParameter("name"));
        String email = SecurityUtil.sanitizeInput(request.getParameter("email"));
        String phone = SecurityUtil.sanitizeInput(request.getParameter("phone"));
        String address = SecurityUtil.sanitizeInput(request.getParameter("address"));
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        // Validate input
        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            phone == null || phone.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("/patientRegistration.jsp").forward(request, response);
            return;
        }
        
        if (!SecurityUtil.isValidEmail(email)) {
            request.setAttribute("error", "Please enter a valid email address.");
            request.getRequestDispatcher("/patientRegistration.jsp").forward(request, response);
            return;
        }
        
        if (!SecurityUtil.isValidPassword(password)) {
            request.setAttribute("error", "Password must be at least 6 characters long.");
            request.getRequestDispatcher("/patientRegistration.jsp").forward(request, response);
            return;
        }
        
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("/patientRegistration.jsp").forward(request, response);
            return;
        }
        
        try (Connection conn = DatabaseConfig.getConnection()) {
            // Check if email already exists
            String checkSql = "SELECT id FROM patient WHERE email = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();
            
            if (rs.next()) {
                request.setAttribute("error", "Email already registered. Please use a different email.");
                request.getRequestDispatcher("/patientRegistration.jsp").forward(request, response);
                return;
            }
            
            // Hash password
            String hashedPassword = SecurityUtil.hashPassword(password);
            
            // Insert new patient
            String insertSql = "INSERT INTO patient (name, email, phone, address, password, created_at) VALUES (?, ?, ?, ?, ?, NOW())";
            PreparedStatement insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setString(1, name);
            insertStmt.setString(2, email);
            insertStmt.setString(3, phone);
            insertStmt.setString(4, address);
            insertStmt.setString(5, hashedPassword);
            
            int rowsAffected = insertStmt.executeUpdate();
            
            if (rowsAffected > 0) {
                request.setAttribute("success", "Registration successful! Please login to continue.");
                request.getRequestDispatcher("/patientLogin.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
                request.getRequestDispatcher("/patientRegistration.jsp").forward(request, response);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error occurred. Please try again.");
            request.getRequestDispatcher("/patientRegistration.jsp").forward(request, response);
        }
    }
}