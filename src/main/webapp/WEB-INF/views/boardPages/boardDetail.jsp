<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <style>
        /*.table{*/
        /*    margin-left: 50px;*/
        /*    margin-right: 50px;*/
        /*}*/

    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<div>
    <%@include file="component/header.jsp" %>
    <%@include file="component/nav.jsp" %>
    <div>
        <%--        <a class="text-dark heart" style="text-decoration-line: none;">--%>
        <%--            <img id="heart" src="/resources/icon/heart.svg">--%>
        <%--            좋아요--%>
        <%--        </a>--%>
    </div>
    <table class="table mx-5">
        <tr>
            <td>글번호 : ${board.id}</td>
        </tr>
    </table>
    <table class="table mx-5">
        <tr>
            <td>글번호 : ${board.boardWriter}</td>
        </tr>
    </table>
    <table class="table mx-5">
        <tr>
            <td>글번호 : ${board.boardTitle}</td>
        </tr>
    </table>
    <br>
    <table class="mx-5">
        <tr>
            <td>
                  내용 : <br>
                <c:if test="${board.fileAttached==1}">
                <c:forEach items="${boardFile}" var="boardFile">

                <img src="${pageContext.request.contextPath}/boardFileUpload/${boardFile.storedFileName}"
                     alt="" width="100" height="100">
            </td>
            </c:forEach>
            </c:if>
            <td id="td">${board.boardContents}</td>
        </tr>
    </table>
    <div class="mx-5">
    <br>
    <c:if test="${board.boardWriter == sessionScope.loginEmail}">
        <input type="button" class="btn btn-outline-primary" onclick="update_fn()" value="수정">
    </c:if>
    <c:choose>
        <c:when test="${board.boardWriter == sessionScope.loginEmail}">
            <input type="button" class="btn btn-outline-danger" onclick="delete_fn()" value="삭제">
        </c:when>
        <c:when test="${sessionScope.loginEmail == 'admin'}">
            <input type="button" class="btn btn-outline-danger" onclick="delete_fn()" value="삭제">
        </c:when>
    </c:choose>
    <%--        <c:if test="${board.boardWriter == sessionScope.loginEmail || board.boardWriter == admin}">--%>
    <%--            <form action="/board/delete" method="get">--%>
    <%--                <input type="submit" value="삭제">--%>
    <%--            </form>--%>
    <%--        </c:if>--%>
    </div>
</div>
<div class="mx-5">
    <br><br>
    <h5>댓글</h5>
    <c:if test="${sessionScope.loginEmail==null}">
        <input type="text" disabled placeholder="로그인하세요">
        <input type="text" disabled placeholder="로그인하세요">
        <button onclick="commentSave_fn()" disabled>댓글작성</button>
        <br>
    </c:if>


    <c:if test="${sessionScope.loginEmail!=null}">
        <input type="text" id="commentWriter" value="${sessionScope.loginEmail}" readonly>
        <input type="text" id="commentContents" placeholder="내용 입력">
        <button onclick="commentSave_fn()">댓글작성</button>
        <br>
    </c:if>
</div>
<div class="mx-5" id="comment-List-area">
    <c:choose>
        <c:when test="${commentList == null}">
            <p id="loginFalse">작성된 댓글이 없습니다.</p>
        </c:when>
        <c:otherwise>
            <table id="comment-List" class="table table-striped">
                <tr>
                    <th>작성자</th>
                    <th>내용</th>
                    <th>삭제</th>
                    <th>작성시간</th>
                </tr>
                <c:forEach items="${commentList}" var="comment">
                    <tr>
                        <td>${comment.commentWriter}</td>
                        <td>${comment.commentContents}</td>
                        <c:if test="${sessionScope.loginEmail==comment.commentWriter}">
                            <td><input type="button" onclick="commentDelete_fn(${comment.id},${board.id})" value="삭제">
                            </td>
                        </c:if>
                        <c:if test="${sessionScope.loginEmail!=comment.commentWriter}">
                            <td><input type="button" onclick="commentDelete_fn(${comment.id},${board.id})" value="삭제" disabled>
                            </td>
                        </c:if>
                        <td>${comment.createdAt}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</div>
</div>
<%@include file="component/footer.jsp" %>
</body>
<script>
    const commentSave_fn = () => {
        const commentWriter = document.getElementById("commentWriter").value;
        const commentContents = document.getElementById("commentContents").value;
        const boardId = '${board.id}';
        const result = document.getElementById("comment-List-area");
        $.ajax({
            type: "get",
            url: "/comment/save",
            data: {
                commentWriter: commentWriter,
                commentContents: commentContents,
                boardId: boardId
            },
            success: function (res) {
                let output = "<table id=\"comment-list\" class=\"table table-striped\">\n" +
                    "    <tr>\n" +
                    "        <th>작성자</th>\n" +
                    "        <th>내용</th>\n" +
                    "        <th>작성시간</th>\n" +
                    "        <th>삭제</th>\n" +
                    "    </tr>\n";
                for (let i in res) {
                    output += "    <tr>\n";
                    output += "        <td>" + res[i].commentWriter + "</td>\n";
                    output += "        <td>" + res[i].commentContents + "</td>\n";
                    if (${sessionScope.loginEmail} = res[i].commentWriter) {
                        output += "<td><input type=\"button\" onclick=\"commentDelete_fn(" + res[i].id + ",${board.id})\" value=\"삭제\"></td>";
                    } else {
                        output += "        <td></td>\n";
                    }
                    output += "        <td>" + res[i].createdAt + "</td>\n";
                    output += "    </tr>\n";
                }
                output += "</table>";
                result.innerHTML = output;
                document.getElementById("commentContents").value = "";
            },
            error: function () {
                console.log("실패");
            }
        })
    }

    const update_fn = () => {
        const id = ${board.id};
        location.href = "/board/update?id=" + id;
    }
    const delete_fn = () => {
        const id = ${board.id};
        location.href = "/board/delete?id=" + id;
    }


    const commentDelete_fn = (commentId, boardId) => {
        const comment = commentId;
        const board = boardId;
        location.href = "/comment/delete?commentId=" + comment + "&boardId=" + board;
    }


</script>


</html>
