package com.hong.dao;

import com.hong.entity.Comment;
import com.hong.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class CommentDaoImpl implements CommentDao {
    @Override
    public Comment obtainComments(String aid) throws Exception {
        Connection connection = JDBCUtils.getConnection();
        Statement statement = connection.createStatement();

        //获取评论 通过文章id
        String sql = "select * from comments where article_id='" + aid + "';";
        ResultSet resultSet = statement.executeQuery(sql);

        //存放查询到的评论->session
        Comment comment = new Comment();
        while (resultSet.next()) {
            comment.setAid(resultSet.getString("aid"));
            comment.setUsername(resultSet.getString("username"));
            comment.setComment(resultSet.getString("comment"));
        }

        return comment;
    }

    @Override
    public int addComment(Comment comment) throws Exception {
        Connection connection = JDBCUtils.getConnection();
        Statement statement = connection.createStatement();

        //插入评论
        String sql = "insert into comments (article_id, username, comment) values (" + comment.getAid() + ", '" + comment.getUsername() + "', '" + comment.getComment() + "');";
        return statement.executeUpdate(sql);
    }
}
