<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册</title>
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

<div class="content">
    <div class="card">
        <div class="login">
            <div><span style="color: red">${errorMsg}</span></div>

            <form method="post" action="${pageContext.request.contextPath}/register">
                <label for="username">用户名</label>
                <input type="text" id="username" placeholder="请输入用户名" name="username">

                <label for="inputPassword">密码</label>
                <input type="password" id="inputPassword" onchange="resetHint('inputPassword')" placeholder="请输入密码"
                       name="password">

                <label for="confirmPassword">确认密码</label>
                <input type="password" id="confirmPassword" onchange="checkPassword('inputPassword','confirmPassword')"
                       placeholder="请输入确认密码">
                <div id="hint"></div>

                <label for="usercaption">姓名</label>
                <input type="text" id="usercaption" placeholder="请输入姓名" name="name">


                <%--<label for="date">年龄</label>--%>
                <%--<input type="date" name="birthday">--%>

                <label for="age">年龄</label>
                <input type="number" min="12" max="120" name="age">


                <input type="submit" class="submit" width="100" value="注册" name="submit">

            </form>

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
    //重置密码提示
    function resetHint(pwd) {
        pwdValue = document.getElementById("inputPassword").value;
        if (pwdValue) {
            document.getElementById('hint').innerHTML = ' ';
        }
    }

    //确认密码
    function checkPassword(pwd1, pwd2) {
        pwd1Value = document.getElementById("inputPassword").value;

        pwd2Value = document.getElementById("confirmPassword").value;
        if (pwd1Value !== pwd2Value) {
            document.getElementById('hint').innerHTML = '密码不一致，请重新输入';
            document.getElementById(pwd1).value = "";
            document.getElementById(pwd2).value = "";
        }
    }
</script>
</html>




