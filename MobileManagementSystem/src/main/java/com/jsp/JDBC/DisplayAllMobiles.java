package com.jsp.JDBC;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.ArrayList;

public class DisplayAllMobiles extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<String[]> mobileList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/servlet_mobiledatabase", "root", "tiger");

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM mobile");

            while (rs.next()) {
                String[] mobile = new String[4];
                mobile[0] = rs.getString("mobileId");
                mobile[1] = rs.getString("mobileModel");
                mobile[2] = rs.getString("mobileBrand");
                mobile[3] = rs.getString("mobilePrice");
                mobileList.add(mobile);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // send data to JSP
        request.setAttribute("mobiles", mobileList);
        RequestDispatcher rd = request.getRequestDispatcher("DisplayAllMobiles.jsp");
        rd.forward(request, response);
    }
}