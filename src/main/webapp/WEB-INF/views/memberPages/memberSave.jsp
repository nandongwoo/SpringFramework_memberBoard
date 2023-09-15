<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<form action="/member/save" method="post" enctype="multipart/form-data">
    <input type="text" placeholder="이메일" name="memberEmail"> <br>
    <input type="text" placeholder="비밀번호" name="memberPassword"> <br>
    <input type="text" placeholder="이름" name="memberName"> <br>
    <input type="text" placeholder="전화번호" name="memberMobile"> <br>
    <input type="file" name="memberProfile" multiple> <br>
    <input type="submit" value="회원가입">
</form>



</body>
</html>
