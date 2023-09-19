<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
<div id="section">
    <div claas="container" id="search-area">
        <form action="/board/list" method="get">
            <select id = "listCount" name = "listCount" value="${listCount}">
                <option value="3" selected>글 개수</option>
                <option value="3">3개씩 보기</option>
                <option value="5">5개씩 보기</option>
                <option value="10">10개씩 보기</option>
                <option value="15">15개씩 보기</option>
                <option value="20">20개씩 보기</option>
            </select>
            <select id="type" name = "type">
                <option value = "boardTitle">제목</option>
                <option value = "boardWriter">작성자</option>
            </select>
            <input id="q" type="text" name="q" placeholder="검색어를 입력하세요">
            <input type="submit" value="검색">
        </form>
    </div>
    <%--검색 창--%>
    <div class="container" id="list">
        <table class="table table-striped table-hover text-center">
        <tr>
            <td>글번호</td>
            <td>작성자</td>
            <td>제목</td>
            <td>조회수</td>
            <td>첨부파일</td>
        </tr>


<c:forEach items="${boardList}" var="board">
        <tr>
            <td>${board.id}</td>
            <td>${board.boardWriter}</td>
            <td><a href="/board/detail?id=${board.id}&page=${paging.page}&q=${q}&type=${type}&listCount=${listCount}">${board.boardTitle}</a></td>
            <td>${board.boardHits}</td>
            <td>${board.fileAttached}</td>
        </tr>
    <br>
</c:forEach>
        </table>
    </div>
</div>
<%-- 페이지 번호 출력 부분 --%>
<div class="container">
    <ul class="pagination justify-content-center">
        <c:choose>
            <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
            <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                    <a class="page-link">[이전]</a>
                </li>
            </c:when>
            <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/list?page=${paging.page-1}&q=${q}&type=${type}&listCount=${listCount}">[이전]</a>
                </li>
            </c:otherwise>
        </c:choose>

        <%--  for(int i=startPage; i<=endPage; i++)      --%>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                <c:when test="${i eq paging.page}">
                    <li class="page-item active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>

                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/list?page=${i}&q=${q}&type=${type}&listCount=${listCount}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">[다음]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/list?page=${paging.page+1}&q=${q}&type=${type}&listCount=${listCount}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>

<c:if test="${sessionScope.loginEmail!=null}">
    <a href="/board/save">글쓰기</a>
</c:if>
</body>
<script>
    <%--const search_fn = () => {--%>
    <%--    const listCount = document.getElementById("listCount").value;--%>
    <%--    const type = document.getElementById("type").value;--%>
    <%--    const q = document.getElementById("q").value;--%>
    <%--    $.ajax({--%>
    <%--        type : "get",--%>
    <%--        url : "/board/list",--%>
    <%--        data : {listCount : listCount, type : type, q : q},--%>
    <%--        success : function (res){--%>
    <%--            listCount.value = "${listCount}";--%>
    <%--            type.value = "${type}";--%>
    <%--            q.value = "${q}";--%>
    <%--            --%>
    <%--        }--%>
    <%--    })--%>
    <%--}--%>

</script>
</html>
