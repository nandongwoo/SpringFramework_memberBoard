<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>
<form action="/member/login" method="post">
    <input type="text" placeholder="이메일" name="memberEmail">
    <input type="password" placeholder="비밀번호" name="memberPassword">
    <input type="submit" value="로그인">
</form>
<%@include file="component/footer.jsp"%>
</body>
</html>
