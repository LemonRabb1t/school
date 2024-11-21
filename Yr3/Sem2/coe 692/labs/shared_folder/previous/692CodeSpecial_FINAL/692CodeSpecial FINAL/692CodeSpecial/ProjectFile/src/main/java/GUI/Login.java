/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GUI;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Business.AccountInfo;
import Helper.UserInfo;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author Sarah Jawwad
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // admin login
        if (username.equals("Admin") && password.equals("Admin")) {
            // add login table checker later on
        } // assume user login
        else {
            UserInfo uf = AccountInfo.verifyUser(username, password);

            if (uf != null) {

                RequestDispatcher dispatcher = request.getRequestDispatcher("user.jsp");
                dispatcher.forward(request, response);

            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.html");
                dispatcher.forward(request, response);
            }
        }

    }

}
