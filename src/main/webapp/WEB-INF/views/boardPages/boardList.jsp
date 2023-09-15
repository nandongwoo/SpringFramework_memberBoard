<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:if test="${sessionScope.loginEmail=='admin'}">
    <a href="/member/logout">로그아웃</a>
    <a href="/member/mypage">마이페이지</a>
    <a href="/member/list">회원관리</a>
</c:if>
<h1>로그인완료</h1>





<c:if test="${sessionScope.loginEmail!=null}">
    <a href="/board/save">글쓰기</a>
</c:if>
</body>
</html>
