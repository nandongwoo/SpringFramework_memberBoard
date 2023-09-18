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

        <c:if test="${board.boardWriter == sessionScope.loginEmail}">
                <input type="button" onclick="update_fn()" value="수정">

        </c:if>
        <c:if test="${board.boardWriter == sessionScope.loginEmail}">
                <input type="button" onclick="delete_fn()" value="삭제">
        </c:if>
        <c:if test="${board.boardWriter == 'admin'}">
            <form action="/board/delete?id=${board.id}" method="get">
                <input type="submit" value="삭제">
            </form>
        </c:if>
<%--        <c:if test="${board.boardWriter == sessionScope.loginEmail || board.boardWriter == admin}">--%>
<%--            <form action="/board/delete" method="get">--%>
<%--                <input type="submit" value="삭제">--%>
<%--            </form>--%>
<%--        </c:if>--%>
        </tr>
    </table>
</div>
</body>
<script>
    const update_fn = () => {
        const id = ${board.id};
        location.href = "/board/update?id=" + id;
    }
    const delete_fn = () => {
        const id = ${board.id};
        location.href = "/board/delete?id=" + id;
    }
</script>




























</html>
