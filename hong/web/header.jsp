<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- 头部 -->
<div class="header">
    <p>广州大学红色文化长廊</p>
</div>

<!-- 导航栏 -->
<div class="topnav">
    <ul>
        <li><a href="${pageContext.request.contextPath}/article.jsp">文章</a></li>
        <li><a href="${pageContext.request.contextPath}/play.jsp">答题</a></li>
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