/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab2Package;

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
                if (user.equals("Sarah12") && password.equals("sarah")) { //user
                    response.sendRedirect("user.jsp");
                }
                else if (user.equals("Nini22") && password.equals("nini")) { //admin
                    response.sendRedirect("admin.jsp");
                }

                else {
                    out.println("Invalid Username or Password");
                }
            }
            else {
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