<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/board/update" method="post">
    <input type="hidden" name="id" value="${update.id}">
    <input type="text" name="boardWriter" value="${sessionScope.loginEmail}" readonly>
    <input type="text" name="boardTitle" value="${update.boardTitle}" placeholder="제목">
    <input type="text" name="boardContents" value="${update.boardContents}" placeholder="내용">
<%--    <input type="file" name="boardFile" multiple>--%>
    <input type="submit" value="수정">

</form>
</body>
</html>
