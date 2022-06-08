package com.hong.entity;

//实体类 映射数据库的表
public class Comment {
    private String aid;//文章编号
    private String username;//用户名
    private String comment;//评论

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

}
