<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>广州大学红色文化长廊</title>
    <link rel="icon" href="img/favicon.ico">
    <link rel="stylesheet" href="css/index.css" id="cssLink">
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
        <li><a href="index">首页</a></li>
        <li><a href="play.jsp">答题</a></li>
        <%--session没有值，未登录状态--%>
        <c:if test="${empty user }">
            <li><a href="login.jsp">登录</a></li>
            <li><a href="register.jsp">注册</a></li>
        </c:if>
        <%--session有值，已登录状态--%>
        <c:if test="${!empty user }">
            <li><a href="${pageContext.request.contextPath}/updateinfo.jsp">当前登录：${ user.username }</a></li>
            <li><a href="${pageContext.request.contextPath}/logout">注销</a></li>
        </c:if>
    </ul>
</div>

<!-- 字体大小选择 下拉菜单 -->
<div class="dropdown">
    <button class="dropbtn">字体大小</button>
    <div class="dropdown-content">
        <a href="javascript:void(0);" onclick="changeFontSize(15)">小</a>
        <a href="javascript:void(0);" onclick="changeFontSize(20)">中</a>
        <a href="javascript:void(0);" onclick="changeFontSize(25)">大</a>
    </div>
</div>

<div class="content">
    <div class="card">

    </div>
</div>

</body>
<script>
    var card = document.querySelectorAll(".card");

    // 修改字体大小
    function changeFontSize(size) {
        //选择所有文章卡片
        for (let i_card = 0; i_card < card.length; i_card++) {
            var card_p = card[i_card].querySelectorAll("p");
            // 选择卡片中的所有段落
            for (let i_p = 0; i_p < card_p.length; i_p++) {
                // 修改字体大小
                card_p[i_p].style.fontSize = size + "px";
            }
        }
    }
</script>
</html>
