package com.hong.web;

import com.hong.dao.UserDao;
import com.hong.dao.UserDaoImpl;
import com.hong.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//使用注解方式添加访问路径
@WebServlet(name = "login", urlPatterns = {"/login", "/logout"})
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //调用UserDao
        UserDao userDao = new UserDaoImpl();

        //接收参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //session
        HttpSession session = request.getSession();

        //调用JDBC查询数据库
        try {
            User user = userDao.checkLogin(username, password);
            if (user.getUsername() != null && user.getPassword() != null) {
                //登录成功 进入主页 个人中心

                //将用户信息存在session中
                session.setAttribute("user", user);

                //login -> index
                response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");

                System.out.println("登录成功");
            } else {
//                System.out.println("账号或密码错误");
                request.setAttribute("errorMsg", "账号或密码错误");
                request.getRequestDispatcher("./login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //清除session
        HttpSession session = req.getSession();
        session.invalidate();

        //跳转回login
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }
}
