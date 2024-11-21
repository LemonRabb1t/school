package GUI;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Business.CustVerify;
import Business.AdminVerify; // Import AdminVerify class
import Helper.UserInfo;
import Helper.AdminInfo; // Import AdminInfo class
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

        // Check admin login
        AdminInfo admin = AdminVerify.verifyAdmin(username, password);
        if (admin != null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
            dispatcher.forward(request, response);
            return; // Exit the method after forwarding
        }

        // Check user login
        UserInfo user = CustVerify.verifyUser(username, password);
        if (user != null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("user.jsp");
            dispatcher.forward(request, response);
            return; // Exit the method after forwarding
        }

        // If neither admin nor user is found, redirect to index.html
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.html");
        dispatcher.forward(request, response);
    }
}
