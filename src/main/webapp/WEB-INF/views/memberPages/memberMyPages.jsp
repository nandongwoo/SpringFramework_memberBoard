<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script></head>
<body>
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>
<tr>
    <div id="update">
    <form action="/member/update" method="get" name = "updateForm" class="borderBox">
        고유번호 : <input type="text" name="id" value="${member.id}" readonly> <br>
        이메일 : <input type="text" name="memberEmail" value="${member.memberEmail}" readonly> <br>
        이름 : <input type="text" name="memberName" value="${member.memberName}" placeholder="${member.memberName}"> <br>
        비밀번호 : <input type="password" name="memberPassword" value="${member.memberPassword}" placeholder="${member.memberPassword}"> <br>
        전화번호 : <input type="text" name="memberMobile" value="${member.memberMobile}" placeholder="${member.memberMobile}"> <br>
        프로필사진 :
        <td><c:forEach items="${memberFile}" var="memberFile">
            <img src="${pageContext.request.contextPath}/profileUpload/${memberFile.storedFileName}"
                 alt="" width="100" height="100">
        </c:forEach></td>
        <br>
        <input type="text" name="passCheck" id="memberPass">
        <input type="button" class="btn btn-outline-dark" onclick="passCheck_fn()" value="수정">
        <a href="/member/delete1?id=${member.id}">회원탈퇴</a>
    </form>
    </div>
</tr>
<%@include file="component/footer.jsp"%>
</body>
<script>
    const passCheck_fn = () => {
        const passCheck = document.getElementById("memberPass").value;
        if (passCheck==${member.memberPassword}){
            document.updateForm.submit();
        }else{
            alert("비밀번호를 확인하세요");
        }

    }
</script>
</html>
