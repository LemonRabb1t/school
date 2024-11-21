package Frontend;

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
import Business.Business;
import Helper.CustomersXML;
import Helper.SearchXML;

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

        }
        if (!token.isEmpty()) {
            if (this.autho.verify(token).getKey()) {
                Map.Entry entry = new AbstractMap.SimpleEntry<String, String>(token, this.autho.verify(token).getValue());
                return entry;

            } else {
                Map.Entry entry = new AbstractMap.SimpleEntry<String, String>("", "");
                return entry;
            }
        }

        Map.Entry entry = new AbstractMap.SimpleEntry<String, String>("", "");
        return entry;

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = isAuthenticated(request).getKey();
        String uname = isAuthenticated(request).getValue();
        String hiddenParam = request.getParameter("pageName");
        System.out.println("param: " + hiddenParam);

        switch (hiddenParam) {
            case "login":
                String username = request.getParameter("username");
                String passwrod = request.getParameter("passwrod");
                boolean isAuthenticated = Business.isAuthenticated(username, passwrod);
                if (isAuthenticated) {
                    request.setAttribute("username", username);
                    token = autho.createJWT("FrontEnd", username, 100000);

                    Cookie newCookie = new Cookie(authenticationCookieName, token);
                    response.addCookie(newCookie);
                    uname = username; // set username to username
                    RequestDispatcher requestDispatcher = request.
                            getRequestDispatcher("frontpageWithLogin.jsp");

                    requestDispatcher.forward(request, response);

                }
                break;
            case "search":

                SearchXML result;
                String query = request.getParameter("query");
                if (token.isEmpty()) {
                    result = retreiveServicesFromBackend(query);
                    request.setAttribute("productResults", result);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontpageWithoutLogin.jsp");

                    requestDispatcher.forward(request, response);
                    break;
                } else {
                    request.setAttribute("username", uname);
                    result = retreiveServicesFromBackend(query);

                    request.setAttribute("productResults", result);

                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontpageWithLogin.jsp");

                    requestDispatcher.forward(request, response);
                }
                break;
            case "profile":
                System.out.println("token in profile: " + token);
                if (token.isEmpty()) {
                    // redirect to login
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.html");

                    requestDispatcher.forward(request, response);
                } else {
                    // only info passed is username, change to match search
                    CustomersXML cust;
                    System.out.println("user: " + uname); // test
                    cust = retreiveServicesFromBackend(uname, token); // OVERLOAD METHOD IN BUSINESS
                    

                    
                    /* hardcode
                     request.setAttribute("fname", "John");
                      request.setAttribute("lname", "Doe");
                      request.setAttribute("adr", "321 rainbow road");
                    request.setAttribute("city", "Toronto");
                    request.setAttribute("country", "Canada");
                    request.setAttribute("phone", "321 rainbow road");
                    request.setAttribute("email", "email@gmail.com");
                    */
                    request.setAttribute("customer", cust);
                    request.setAttribute("username", uname);
                    System.out.println("cust: " + cust.getCustomers()); // test
                    
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("profile.jsp");

                    requestDispatcher.forward(request, response);
                }
                break;
            case "skip":
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontpageWithoutLogin.jsp");

                requestDispatcher.forward(request, response);
                break;
            case "logout":
                // terminate current account
                token = null;
                RequestDispatcher logout = request.getRequestDispatcher("index.html");

                logout.forward(request, response);
                break;
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

    private SearchXML retreiveServicesFromBackend(String query) {
        try {
            return (Business.getServices(query));
        } catch (IOException ex) {
            Logger.getLogger(FrontEnd.class.getName()).log(Level.SEVERE, null, ex);
            return (null);
        }

    }

    private CustomersXML retreiveServicesFromBackend(String query, String t) {
        try {
            System.out.println("retrieve service from backend frontend.java entered, token:" + t);
            return (Business.getServicesCust(query, t));
        } catch (IOException ex) {
            Logger.getLogger(FrontEnd.class.getName()).log(Level.SEVERE, null, ex);
            return (null);
        }

    }

}
