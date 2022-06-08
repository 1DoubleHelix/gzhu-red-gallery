package com.hong.dao;

import com.hong.entity.User;

//封装数据访问
public interface UserDao {

    public User checkLogin(String username, String password) throws Exception;//用户名和密码登录

    public User checkUsername(String username) throws Exception;//查询用户名是否已存在

    public int addUser(User user) throws Exception;//插入用户

    public int changeUser(User user) throws Exception;//修改用户信息

}
