<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/">Home</a>
<a href="/member/save">회원가입</a>
<a href="/member/login">로그인</a>
<a href="/board/list">글목록</a>


<c:if test="${sessionScope.loginEmail == 'admin'}">
    <a href="/member/list">회원관리</a>
</c:if>

</body>
</html>