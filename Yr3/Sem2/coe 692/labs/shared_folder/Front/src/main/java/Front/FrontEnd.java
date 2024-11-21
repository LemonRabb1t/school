/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Front;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.AbstractMap;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.NewCookie;
import Helper.CustomersXML;
import business.Business;
import Helper.ProductXML;

/**
 *
 * @author student
 */
@WebServlet(name = "FrontEnd", urlPatterns = {"/FrontEnd"})
public class FrontEnd extends HttpServlet {

    Authenticate autho;

    public FrontEnd() {
        autho = new Authenticate();
    }
    private final String authenticationCookieName = "login_token";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private Map.Entry<String, String> isAuthenticated(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        String token = "";

        System.out.println("TOKEN IS");
        try {
            for (Cookie cookie : cookies) {
                System.out.println(cookie.getName());
                if (cookie.getName().equals(authenticationCookieName)) {
                    token = cookie.getValue();
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        if (!token.isEmpty())
           try {
            if (this.autho.verify(token).getKey()) {
                Map.Entry entry = new AbstractMap.SimpleEntry<String, String>(token, this.autho.verify(token).getValue());
                return entry;

            } else {
                Map.Entry entry = new AbstractMap.SimpleEntry<String, String>("", "");
                return entry;
            }
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(FrontEnd.class.getName()).log(Level.SEVERE, null, ex);
        }

        Map.Entry entry = new AbstractMap.SimpleEntry<String, String>("", "");
        return entry;

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = isAuthenticated(request).getKey();
        String uname = isAuthenticated(request).getValue();
        String hiddenParam = request.getParameter("pageName");
        RequestDispatcher requestDispatcher = null;

        System.out.println("page name param:" + hiddenParam);

        // actions dep on pageName value
        switch (hiddenParam) {

            // user login
            case "login":
                // get username and pword given
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                // authenticate user
                boolean isAuthenticated = Business.isAuthenticated(username, password);

                // if user exists, give a cookie (yay) and send to logged in version of site
                if (isAuthenticated) {
                    request.setAttribute("username", username);
                    token = autho.createJWT("FrontEnd", username, 100000);

                    Cookie newCookie = new Cookie(authenticationCookieName, token);
                    response.addCookie(newCookie);

                    requestDispatcher = request.getRequestDispatcher("SearchLogin.jsp");

                    requestDispatcher.forward(request, response);

                }
                break;

            //  user view profile
            case "ViewProfile":

                CustomersXML result;
                String query = request.getParameter("query");

                if (!token.isEmpty()) { // logged in
                    request.setAttribute("username", uname);
                    result = retreiveServicesFromBackend(query, token);
                    
                    request.setAttribute("customer", result);
                    
                    requestDispatcher = request.getRequestDispatcher("custProfile.jsp");
                    requestDispatcher.forward(request, response);

                } else {
                    requestDispatcher = request.getRequestDispatcher("index.html");
                    requestDispatcher.forward(request, response);
                }
                break;
            case "addtoCart":
                requestDispatcher = request.getRequestDispatcher("addtoCart.jsp");

                requestDispatcher.forward(request, response);
                
                break;
            case "navigation": // nav option placeholder
                requestDispatcher = request.getRequestDispatcher("navigation.jsp");

                requestDispatcher.forward(request, response);
                break;
            case "Search":
                requestDispatcher = request.getRequestDispatcher("index.html");

                requestDispatcher.forward(request, response);
                break;
            default:
                requestDispatcher = request.getRequestDispatcher("error.jsp");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
        processRequest(request, response);
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

    private CustomersXML retreiveServicesFromBackend(String query, String token) {
        try {
            return (Business.getServices(query, token));
        } catch (IOException ex) {
            Logger.getLogger(FrontEnd.class.getName()).log(Level.SEVERE, null, ex);
            return (null);
        }

    }

}
