<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>관리자화면</h1>
<h2>회원관리</h2>
<div>
    <c:forEach items="${memberList}" var="member">
        <tr>
            <form action="/member/delete" method="get">
                <td>${member.memberEmail}</td>
                <td>${member.memberName}</td>
                <td>${member.memberMobile}</td>
                <input type="submit" value="삭제">
            </form>
        </tr>
    </c:forEach>
</div>
</body>
<script>
</script>
</html>
