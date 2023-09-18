<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:if test="${sessionScope.loginEmail=='admin'}">
    <a href="/member/list">회원관리</a>
</c:if>
<c:if test="${sessionScope.loginEmail!=null}">
<a href="/member/logout">로그아웃</a>
<a href="/member/myPage?id=${sessionScope.loginId}">마이페이지</a>
</c:if>
<h1>로그인완료</h1>
<div>
    <table>
        <tr>
            <td>글번호</td>
            <td>작성자</td>
            <td>제목</td>
            <td>조회수</td>
            <td>첨부파일</td>
        </tr>
    </table>

<c:forEach items="${boardList}" var="board">
    <table>
        <tr>
            <td>${board.id}</td>
            <td>${board.boardWriter}</td>
            <td><a href="/board/detail?id=${board.id}">${board.boardTitle}</a></td>
            <td>${board.boardHits}</td>
            <td>${board.fileAttached}</td>
        </tr>
    </table>
    <br>
</c:forEach>
</div>



<c:if test="${sessionScope.loginEmail!=null}">
    <a href="/board/save">글쓰기</a>
</c:if>
</body>
</html>
