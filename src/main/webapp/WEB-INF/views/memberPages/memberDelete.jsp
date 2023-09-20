<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<input type="password" placeholder="비밀번호 확인" id="passCheck">
<button onclick="delete_fn()">삭제</button>
</body>
<script>
    const delete_fn = () => {
        const passCheck = document.getElementById("passCheck").value;
        if(passCheck==${member.memberPassword}) {
            if (confirm("회원탈퇴를 진행하시겠습니까?")) {
                location.href = "/member/delete2?id=${member.id}";
            } else {
                alert("탈퇴를 취소합니다")
            }
        }else{
            alert("비밀번호를 확인하세요")
        }
    }
</script>
</html>
