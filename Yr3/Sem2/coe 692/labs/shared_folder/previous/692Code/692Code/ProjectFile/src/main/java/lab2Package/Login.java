/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab2Package;

import Persistence.Customer_CRUD;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sarah Jawwad
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String user = request.getParameter("user"); // Corrected from "username" to "user"
            String password = request.getParameter("pass"); // Corrected from "password" to "pass"

            if (user != null && password != null) {
                if (user.equals("Admin") && password.equals("Admin")) { //admin
                    response.sendRedirect("admin.jsp");
                } else if (Customer_CRUD.login(user,password)||user.equals("user") && password.equals("user")){
                    response.sendRedirect("user.jsp");
                }else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Invalid Username or Password. Please try again.');");
                    out.println("window.location.href='index.html';"); // Adjust the URL as needed
                    out.println("</script>");
                   
                }
            } else {
                out.println("Empty Username or Password");
            }
        }
        // Removed the "throw new ServletException" line, as it is not needed
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
