package GUI;

import Business.SearchProduct;
import Helper.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Search_Product", urlPatterns = {"/Search_Product"})
public class Search_Product extends HttpServlet {
    
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String keyword = request.getParameter("word"); // Change to "word" as per your form input name
            List<Product> productsList = SearchProduct.searchProducts(keyword);
            request.setAttribute("productsList", productsList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("BrowseProduct.jsp");
            dispatcher.forward(request, response);
        }

}

