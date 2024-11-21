/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GUI;

import Persistence.Customer_CRUD;
import Helper.UserInfo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nini yang
 */
@WebServlet(name = "custRegister", urlPatterns = {"/custRegister"})

public class custRegister extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = (String) request.getParameter("username");
        String password = (String) request.getParameter("password");
        String fname = (String) request.getParameter("fname");
        String lname = (String) request.getParameter("lname");
        String email = (String) request.getParameter("email");
        String adr1 = (String) request.getParameter("addressL1");

        UserInfo test = Customer_CRUD.create(fname, lname, email, adr1, username, password);

        if (password != null && test != null) {
            request.getSession().setAttribute("username", username);
            RequestDispatcher rd = request.getRequestDispatcher("custRegister.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("custRegisterFAIL.jsp");
            rd.forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
