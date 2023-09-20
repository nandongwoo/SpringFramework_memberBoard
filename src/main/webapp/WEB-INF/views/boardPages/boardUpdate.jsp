<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        #update {
            height: 70vh;
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
<div id="update">
    <form action="/board/update" method="post" class="borderBox">
        <input type="hidden" name="id" value="${update.id}">
        제목 : <input type="text" name="boardWriter" value="${sessionScope.loginEmail}" readonly>
        작성자 : <input type="text" name="boardTitle" value="${update.boardTitle}" placeholder="제목">
        내용 : <textarea type="text" name="boardContents" value="${update.boardContents}" placeholder="내용" rows="10"
                       cols="30"></textarea>
<%--        <input type="text" name="boardContents" value="${update.boardContents}" placeholder="내용">--%>
        <%--    <input type="file" name="boardFile" multiple>--%>
        <br>
        <input class="btn btn-dark" type="submit" value="수정">
    </form>
</div>
<%@include file="component/footer.jsp" %>
</body>
</html>
