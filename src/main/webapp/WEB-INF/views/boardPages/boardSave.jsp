<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/board/save" method="post" enctype="multipart/form-data">
제목 : <input type="text" name="boardTitle" placeholder="글제목">
작성자 : <input type="text" name="boardWriter" value="${sessionScope.loginEmail}" readonly>
내용 : <input type="text" name="boardContents" placeholder="내용">
첨부파일 :<input type="file" name="boardFile" multiple>
    <input type="submit" value="입력">
</form>





<%--private Long id;--%>
<%--private String boardTitle;--%>
<%--private String boardWriter;--%>
<%--private String boardComment;--%>
<%--private int boardHits;--%>
<%--private String createdAt;--%>
<%--private List<MultipartFile> fileAttached;--%>
</body>
</html>
