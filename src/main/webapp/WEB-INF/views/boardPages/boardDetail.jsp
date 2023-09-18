<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <table>
        <tr>
            <td>${board.id}</td>
            <td>${board.boardWriter}</td>
            <td>${board.boardTitle}</td>
            <td>${board.boardContents}</td>
            <c:if test="${board.fileAttached==1}">
        <tr>
            <th>image</th>
            <c:forEach items="${boardFile}" var="boardFile">
                <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                     alt="" width="100" height="100">
            </c:forEach>
        </tr>
        </c:if>
        </tr>
    </table>
</div>
</body>
</html>
