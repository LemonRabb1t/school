/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import Helper.UserInfo;
import Persistence.Customer_CRUD;
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

        // obtain user's info
        String username = (String) request.getParameter("username");
        String password = (String) request.getParameter("password");
        String fname = (String) request.getParameter("fname");
        String lname = (String) request.getParameter("lname");
        String adr1 = (String) request.getParameter("addressL1");
        String adr2 = null;
        // if add2 exists
        if (request.getParameter("address2") != null) {
            adr2 = (String) request.getParameter("addressL2");

        }

        // further imple
        String city = (String) request.getParameter("city");
        String prov = (String) request.getParameter("province");
        String country = (String) request.getParameter("Country");
        //

        String email = (String) request.getParameter("email");

        if (password != null) {

            // create User profile
            UserInfo User = new UserInfo(fname, lname, "921 jackson road", "ninoberr@gmail.com", username, password);
            
            User.write();
//Customer_CRUD.write(fname, lname, "921 jackson road", "ninoberr@gmail.com", username, password);

          // Print response
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           out.println("<script type=\"text/javascript\">");
                    out.println("alert('Account Created');");
                    out.println("window.location.href='index.html';"); // Adjust the URL as needed
                    out.println("</script>");
        }
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
