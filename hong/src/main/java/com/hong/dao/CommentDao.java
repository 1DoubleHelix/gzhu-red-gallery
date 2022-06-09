package com.hong.dao;

import com.hong.entity.Comment;

import java.util.ArrayList;

public interface CommentDao {
    public ArrayList<Comment> obtainComments(String aid) throws Exception;//通过文章id获取评论

    public int addComment(Comment comment) throws Exception;//添加评论
}
