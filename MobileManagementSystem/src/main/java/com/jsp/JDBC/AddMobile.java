package com.jsp.JDBC;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class AddMobile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int mobileId = Integer.parseInt(req.getParameter("mobileId"));
        String mobileModel = req.getParameter("mobileModel");
        String mobileBrand = req.getParameter("mobileBrand");
        int mobilePrice = Integer.parseInt(req.getParameter("mobilePrice"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/mobiledb", "root", "root");

            String query = "INSERT INTO mobiledb (mobileId, mobileModel, mobileBrand, mobilePrice) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = connection.prepareStatement(query);

            pstmt.setInt(1, mobileId);
            pstmt.setString(2, mobileModel);
            pstmt.setString(3, mobileBrand);
            pstmt.setInt(4, mobilePrice);

            pstmt.executeUpdate();

            PrintWriter out = resp.getWriter();
            out.print("Data has been saved into the database.");

            pstmt.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // main() method for testing MySQL connection (optional)
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/mobiledb", "root", "root");

            if (connection != null) {
                System.out.println("MySQL Connected Successfully!");
            } else {
                System.out.println(" Failed to connect to MySQL!");
            }

            // Test insert
            String query = "INSERT INTO mobiledb (mobileId, mobileModel, mobileBrand, mobilePrice) VALUES (2, 'TestModel', 'TestBrand', 99999)";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.executeUpdate();

            System.out.println("Test data inserted successfully!");

            pstmt.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}