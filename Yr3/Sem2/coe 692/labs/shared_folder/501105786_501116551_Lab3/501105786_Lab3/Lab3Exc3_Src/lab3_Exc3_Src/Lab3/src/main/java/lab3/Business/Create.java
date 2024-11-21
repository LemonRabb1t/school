/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab3.Business;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lab3.Persistence.Playlist;


@WebServlet(name = "Create", urlPatterns = {"/Create"})
public class Create extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form parameters
        String playlistName = request.getParameter("playlistName");
        String description = request.getParameter("description");

        // Create a new playlist object
        Playlist playlist = new Playlist(playlistName, description);
        
        // Save the playlist to the database
        playlist.savePlaylist();

        // Print response
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           out.println("<script type=\"text/javascript\">");
                    out.println("alert('Playlist Created');");
                    out.println("window.location.href='playlist.jsp';"); // Adjust the URL as needed
                    out.println("</script>");
        }
    }
}
