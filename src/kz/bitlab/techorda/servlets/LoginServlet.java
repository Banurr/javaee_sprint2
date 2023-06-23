package kz.bitlab.techorda.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import kz.bitlab.techorda.db.DBConnector;
import kz.bitlab.techorda.db.User;

import java.io.IOException;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setAttribute("error","");
        request.getRequestDispatcher("/login.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = DBConnector.getUser(email,password);
        if(user != null)
        {
            request.setAttribute("adam",user);
            request.getRequestDispatcher("/user.jsp").forward(request,response);
        }
        else
        {
            request.setAttribute("error","error");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }
}
