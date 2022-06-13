package com.hong.servlet;

import com.hong.dao.CommentDaoImpl;
import com.hong.entity.Comment;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "/updatecomment", urlPatterns = "/updatecomment")
public class UpdateComment extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //调用CommentDao
        CommentDaoImpl commentDao = new CommentDaoImpl();
        //处理post请求乱码
        req.setCharacterEncoding("utf-8");
        //从前端接收用户名
        String username = req.getParameter("username");
        //session
        HttpSession session = req.getSession();

        //Bean
        Map<String, String[]> parameterMap = req.getParameterMap();
        Comment comment = new Comment();

        try {
            //将前端 map 集合参数快速封装到 User 中
            BeanUtils.populate(comment, parameterMap);

            //评论写入数据库
            int i = commentDao.addComment(comment);
            if (i < 0) {
                System.out.println("插入失败");
            }
            resp.sendRedirect(getServletContext().getContextPath() + "/article.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {

    }
}
