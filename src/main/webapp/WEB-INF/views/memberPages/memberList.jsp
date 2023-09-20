<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp" %>
<div id="section" class="container text-align-center">
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
                    <td><input type="button" class="btn btn-outline-danger" onclick="drop_fn('${member.id}')" value="삭제"></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<%@include file="component/footer.jsp" %>
</body>
<script>
    const drop_fn = (memberId) => {
        const id = memberId;
        location.href = "/member/drop?id=" + id;
    }
</script>
</html>
