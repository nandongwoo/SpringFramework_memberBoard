<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<tr>
    <td>${member.id}</td>
    <td>${member.memberName}</td>
    <td>${member.memberPassword}</td>
    <td>${member.memberEmail}</td>
    <td>${member.memberMobile}</td>
    <td><c:forEach items="${memberFile}" var="memberFile">
        <img src="${pageContext.request.contextPath}/upload/${memberFile.storedFileName}"
             alt="" width="100" height="100">
    </c:forEach></td>

</tr>

</body>
</html>
