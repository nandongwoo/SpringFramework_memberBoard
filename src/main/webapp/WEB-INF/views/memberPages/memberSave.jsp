<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>


<form action="/member/save" method="post" enctype="multipart/form-data">
    <input id="email" type="text" placeholder="이메일" name="memberEmail" onkeyup="emailCheck()"> <br>
    <p id="emailCheck"></p>
    <input type="text" placeholder="비밀번호" name="memberPassword"> <br>
    <input type="text" placeholder="이름" name="memberName"> <br>
    <input type="text" placeholder="전화번호" name="memberMobile"> <br>
    <input type="file" name="memberProfile" multiple> <br>
    <input id="submit" type="submit" value="회원가입">
</form>
</body>
<script>
    const emailCheck = () => {
        const email = document.getElementById("email").value;
        const emailCheck = document.getElementById("emailCheck");
        $.ajax({
            type : "get",
            url : "/member/emailCheck",
            data : {memberEmail : email},
            success : function(res){
                if(res.memberEmail!=null){
                    emailCheck.innerHTML="사용 중인 이메일입니다.";
                    emailCheck.style.color = "red";
                    $("#submit").attr("disabled", true);
                }else{
                    emailCheck.innerHTML="사용가능한 이메일입니다.";
                    emailCheck.style.color = "green";
                    $("#submit").attr("disabled", false);
                }
            }, error : function (){

            }
        })
    }
</script>
</html>
