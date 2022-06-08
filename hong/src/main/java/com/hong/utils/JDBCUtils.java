package com.hong.utils;

import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;

//jdbc工具类
public class JDBCUtils {

    //获取连接
    public static Connection getConnection() throws Exception {
        DriverManager.registerDriver(new Driver());

        String url = "jdbc:mysql://localhost:3306/hongdb?useSSL=false";
        String username = "web";
        String password = "1111";

        return DriverManager.getConnection(url, username, password);
    }
}
