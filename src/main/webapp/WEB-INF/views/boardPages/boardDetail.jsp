<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
<div>
    <h4>댓글작성</h4>
    <c:if test="${sessionScope.loginEmail!=null}">
    <input type="text" id="commentWriter" value="${sessionScope.loginEmail}" readonly>
    <input type="text" id="commentContents" placeholder="내용 입력">
    <button onclick="commentSave_fn()">댓글작성</button>
    </c:if>
</div>
    <div id="comment-List-area">
        <c:choose>
            <c:when test="${commentList == null}">
                <h3>작성된 댓글이 없습니다.</h3>
            </c:when>
            <c:otherwise>
            <table id="comment-List">
                <tr>
                    <th>작성자</th>
                    <th>내용</th>
                    <th>작성시간</th>
                </tr>
                <c:forEach items="${commentList}" var="comment">
                    <tr>
                        <td>${comment.commentWriter}</td>
                        <td>${comment.commentContents}</td>
                        <td>${comment.createdAt}</td>
                        <c:if test="${sessionScope.loginEmail==comment.commentWriter}">
                        <td><input type="button" onclick="commentDelete_fn()" value="삭제"></td>
                        </c:if>
                    </tr>
                    <br>
                </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
<script>
    const commentSave_fn = () => {
        const commentWriter = document.getElementById("commentWriter").value;
        const commentContents = document.getElementById("commentContents").value;
        const boardId = '${board.id}';
        const result = document.getElementById("comment-List-area");
        $.ajax({
            type : "get",
            url : "/comment/save",
            data : {commentWriter : commentWriter,
                    commentContents : commentContents,
                    boardId : boardId},
            success : function (res){
                let output = "<table id=\"comment-list\">\n" +
                    "    <tr>\n" +
                    "        <th>작성자</th>\n" +
                    "        <th>내용</th>\n" +
                    "        <th>작성시간</th>\n" +
                    "    </tr>\n";
                for (let i in res) {
                    output += "    <tr>\n";
                    output += "        <td>" + res[i].commentWriter + "</td>\n";
                    output += "        <td>" + res[i].commentContents + "</td>\n";
                    output += "        <td>" + res[i].createdAt + "</td>\n";
                    if (${sessionScope.loginEmail} = res[i].commentWriter) {
                        output += "        <td><input type=\"button\" onclick=\"commentDelete_fn()\" value=\"삭제\"></td>\n";
                    } else {
                        output += "        <td></td>\n";
                    }
                    output += "    </tr>\n";
                }
                output += "</table>";
                result.innerHTML = output;
                document.getElementById("comment-writer").value = "";
                document.getElementById("comment-contents").value = "";
            },
            error : function (){
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
</script>


</html>
