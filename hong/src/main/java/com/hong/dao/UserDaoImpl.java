package com.hong.dao;

import cn.hutool.core.util.IdUtil;
import com.hong.entity.User;
import com.hong.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

//实现类
public class UserDaoImpl implements UserDao {

    @Override
    public User checkLogin(String username, String password) throws Exception {
        Connection connection = JDBCUtils.getConnection();
        Statement statement = connection.createStatement();

        String sql = "SELECT * FROM `user` WHERE username='" + username + "' AND `PASSWORD`='" + password + "';";
        ResultSet resultSet = statement.executeQuery(sql);

        //存放查询到的信息->session
        User user = new User();
        while (resultSet.next()) {
            user.setUsername(resultSet.getString("username"));
            user.setPassword(resultSet.getString("password"));
            user.setUid(resultSet.getString("uid"));//修改个人信息时需要使用uid查询数据库
        }

        return user;
    }

    @Override
    public User checkUsername(String username) throws Exception {
        Connection connection = JDBCUtils.getConnection();
        Statement statement = connection.createStatement();

        String sql = "SELECT * FROM `user` WHERE username='" + username + "';";
        ResultSet resultSet = statement.executeQuery(sql);

        User user = new User();
        while (resultSet.next()) {
            user.setUsername(resultSet.getString("username"));
        }
        return user;

    }

    @Override
    public int addUser(User user) throws Exception {
        Connection connection = JDBCUtils.getConnection();
        Statement statement = connection.createStatement();

        //生成uuid 不带 -
        String uid = IdUtil.simpleUUID();
        String sql = "insert into `user` (uid, username, password, name, age) values ('" + uid + "', '" + user.getUsername() + "', '" + user.getPassword() + "', '" + user.getName() + "', '" + user.getAge() + "');";
        return statement.executeUpdate(sql);
    }

    @Override
    public int updateUser(User user) throws Exception {
        Connection connection = JDBCUtils.getConnection();
        Statement statement = connection.createStatement();

        //更新用户信息
        String sql = "update user set username='" + user.getUsername() + "',password='" + user.getPassword() + "',name='" + user.getName() + "',age='" + user.getAge() + "' where uid='" + user.getUid() + "';";
        return statement.executeUpdate(sql);
    }

}
