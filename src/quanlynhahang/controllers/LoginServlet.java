package quanlynhahang.controllers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        // nhahang@gmail.com
        // @Admin113
        if (email.equals("1@gmail.com") && password.equals("1")) {
            request.getSession().setAttribute("name", email);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/trang-chu.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("err", "Email hoặc mật khẩu không không chính xác");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login");
            dispatcher.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/dang-nhap.jsp");
    }
}
