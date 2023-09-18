<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<tr>
    <form action="/member/update" method="get" name = "updateForm">
        고유번호 : <input type="text" name="id" value="${member.id}" readonly> <br>
        이메일 : <input type="text" name="memberEmail" value="${member.memberEmail}" readonly> <br>
        이름 : <input type="text" name="memberName" value="${member.memberName}" placeholder="${member.memberName}"> <br>
        비밀번호 : <input type="password" name="memberPassword" value="${member.memberPassword}" placeholder="${member.memberPassword}"> <br>
        전화번호 : <input type="text" name="memberMobile" value="${member.memberMobile}" placeholder="${member.memberMobile}"> <br>
        프로필사진 :
        <td><c:forEach items="${memberFile}" var="memberFile">
            <img src="${pageContext.request.contextPath}/upload/${memberFile.storedFileName}"
                 alt="" width="100" height="100">
        </c:forEach></td>
        <br>
        <input type="text" name="passCheck" id="memberPass">
        <input type="button" onclick="passCheck_fn()" value="수정">

    </form>
</tr>

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
