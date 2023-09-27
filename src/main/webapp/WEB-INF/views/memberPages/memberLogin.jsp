<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <style>
        #login {
            height: 40vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        h1 {
            font-weight: bold;
            color: black;
            font-size: 50px;
        }

        .borderBox {
            /*border-style: double;*/
            /*border-color: black;*/
            width: 300px;
            padding: 50px;
            background-color: white;
            text-align: center;
        }

        input[type="text"], input[type="password"] {
            text-align: center;
            color: black;
            margin-bottom: 30px;
            background: none;
            border: 2px solid black;
            width: 180px;
            height: 20px;
            border-radius: 30px;
            padding: 10px;
        }

        button {
            width: 100px;
            height: 50px;
            background: none;
            border: 2px solid black;
            border-radius: 30px;
            color: black;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp" %>
<div class="container" id="login">
    <c:if test="${sessionScope.loginEmail == null}">
        <form action="/member/login" method="post" class="borderBox">
            <h1>로그인</h1>
            <br>
            <input type="text" placeholder="이메일" name="memberEmail">
            <input type="password" placeholder="비밀번호" name="memberPassword">
            <button type="submit">로그인!</button>
        </form>
    </c:if>
</div>


<%@include file="component/footer.jsp" %>
</body>
</html>