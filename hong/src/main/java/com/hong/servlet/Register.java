package com.hong.servlet;

import com.hong.dao.UserDao;
import com.hong.dao.UserDaoImpl;
import com.hong.entity.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "register", urlPatterns = "/register")
public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        //调用UserDao
        UserDao userDao = new UserDaoImpl();

        //处理post请求乱码
        req.setCharacterEncoding("utf-8");

        //从前端接收用户名
        String username = req.getParameter("username");

        //session
        HttpSession session = req.getSession();

        try {
            //用户名已存在
            if (userDao.checkUsername(username).getUsername() != null) {
                req.setAttribute("errorMsg", "用户名已存在");
                req.getRequestDispatcher("/register.jsp").forward(req, resp);
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        //Bean
        //将前端获取数据放在Map中
        Map<String, String[]> parameterMap = req.getParameterMap();
        User user = new User();
        try {
            //将前端 map 集合参数快速封装到 User 中
            BeanUtils.populate(user, parameterMap);

            //将注册用户数据 写入数据库
            int i = userDao.addUser(user);
            if (i < 0) {
                System.out.println("插入失败");
            }

            //跳转 登录成功界面 /register -> /index
            session.setAttribute("user", user);
            resp.sendRedirect(getServletContext().getContextPath() + "/index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println(user);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {

    }
}
