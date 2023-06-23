package kz.bitlab.techorda.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.techorda.db.DBConnector;
import kz.bitlab.techorda.db.Items;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/home.html")
public class HomeServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException
    {
        String how = request.getParameter("sort") == null ? "" : request.getParameter("sort");
        ArrayList<Items> items = DBConnector.allItems(how);
        request.setAttribute("zat",items);
        request.getRequestDispatcher("/home.jsp").forward(request,response);
    }
}
