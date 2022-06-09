package com.hong.dao;

import com.hong.entity.Comment;
import com.hong.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CommentDaoImpl implements CommentDao {
    @Override
    public ArrayList<Comment> obtainComments(String aid) throws Exception {
        Connection connection = JDBCUtils.getConnection();
        Statement statement = connection.createStatement();


        //通过文章id 获取评论集合
        String sql = "select * from `comments` where aid='" + aid + "';";
        ResultSet resultSet = statement.executeQuery(sql);

        //存放所有评论
        ArrayList<Comment> commentList = new ArrayList<>();

        //返回查询到的评论->session
        while (resultSet.next()) {
            Comment comment = new Comment();
            comment.setAid(resultSet.getString("aid"));
            comment.setUsername(resultSet.getString("username"));
            comment.setComment(resultSet.getString("comment"));

            //查询结果->commentList
            commentList.add(comment);
        }

        return commentList;
    }

    @Override
    public int addComment(Comment comment) throws Exception {
        Connection connection = JDBCUtils.getConnection();
        Statement statement = connection.createStatement();

        //插入评论
        String sql = "insert into comments (aid, username, comment) values (" + comment.getAid() + ", '" + comment.getUsername() + "', '" + comment.getComment() + "');";
        return statement.executeUpdate(sql);
    }
}
