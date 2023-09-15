<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<h1>관리자화면</h1>
<h2>회원관리</h2>

<div class="container">
    <div id="member-list">
        <table class="table table-bordered">
            <tr>
                <td>이메일</td>
                <td>이름</td>
                <td>전화번호</td>
            </tr>
    <c:forEach items="${memberList}" var="member">
        <tr>
            <td>${member.memberEmail}</td>
            <td>${member.memberName}</td>
            <td>${member.memberMobile}</td>
            <td><input type="button" onclick="delete_fn('${member.id}')" value="삭제"></td>
        </tr>
        <br>
    </c:forEach>
        </table>
    </div>
</div>

</body>
<script>
    const delete_fn = (memberId) => {
        const id = memberId;
        location.href = "/member/delete?id=" + id;
    }
</script>
</html>
