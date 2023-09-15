<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>
<c:if test="${sessionScope.loginEmail=='admin'}">
    <a href="/member/logout">로그아웃</a>
    <a href="/member/mypage">마이페이지</a>
</c:if>
<%@include file="component/footer.jsp"%>
</body>
</html>
