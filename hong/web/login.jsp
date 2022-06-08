<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <link rel="icon" href="img/favicon.ico">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/css/swiper.min.css">
    <script src="https://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/js/swiper.min.js"></script>
</head>
<body>

<!-- 头部 -->
<div class="header">
    <p>广州大学红色文化长廊</p>
</div>

<!-- 导航栏 -->
<div class="topnav">
    <ul>
        <li><a href="index.jsp">首页</a></li>
        <li><a href="login.jsp">登录</a></li>
        <li><a href="register.jsp">注册</a></li>
        <li><a href="${pageContext.request.contextPath}/logout">注销</a></li>
    </ul>
</div>

<%--<jsp:include page="/header.jsp"></jsp:include>--%>

<div class="content">
    <div class="card">
        <div class="login">
            <%--错误信息--%>
            <div><span style="color: red">${errorMsg }</span></div>

            <form action="${pageContext.request.contextPath }/login" method="post">
                <label for="username" class="">用户名</label>
                <input type="text" id="username" placeholder="请输入用户名" name="username">
                <label for="inputPassword" class="">密码</label>
                <input type="password" id="inputPassword" placeholder="请输入密码" name="password">
                <input type="submit" class="submit" width="100" value="登录" name="submit">
            </form>

            <p>无账户请先注册</p>

        </div>
    </div>
</div>

<!-- 页脚 -->
<div class="footer">
    <div class="foot-content">
        <img src="img/gzhu.png" alt="gzhu_logo">
        <p>邮编：510006 通讯地址：广州市大学城外环西路230号</p>
    </div>
</div>


</body>
<script>
</script>
</html>