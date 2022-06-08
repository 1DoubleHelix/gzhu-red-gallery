package com.hong.servlet;

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

@WebServlet(name = "updateinfo", urlPatterns = "/updateinfo")
public class UpdateInfo extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //调用UserDao
        UserDaoImpl userDao = new UserDaoImpl();
        //处理post请求乱码
        req.setCharacterEncoding("utf-8");
        //接收用户名
//        String username = req.getParameter("username");

        HttpSession session = req.getSession();

        //Bean
        Map<String, String[]> parameterMap = req.getParameterMap();
        User user = new User();
        try {
            //将前端 map 集合参数快速封装到 User 中
            BeanUtils.populate(user, parameterMap);

            //修改的用户数据 写入数据库
            int i = userDao.updateUser(user);
            if (i < 0) {
                System.out.println("修改失败");
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
