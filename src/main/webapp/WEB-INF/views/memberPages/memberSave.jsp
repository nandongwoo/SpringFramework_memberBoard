<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        #save {
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
<div class="container" id="save">
    <form action="/member/save" method="post" enctype="multipart/form-data" class="borderBox">
        <input id="email" type="text" placeholder="이메일" name="memberEmail" onkeyup="emailCheck()"> <br>
        <p id="emailCheck"></p>
        <input type="text" placeholder="비밀번호" name="memberPassword"> <br>
        <input type="text" placeholder="이름" name="memberName"> <br>
        <input type="text" placeholder="전화번호" name="memberMobile"> <br>
        <input type="file" name="memberProfile" multiple> <br>
        <input id="submit" type="submit" value="회원가입">
    </form>
</div>
<%@include file="component/footer.jsp" %>
</body>
<script>
    const emailCheck = () => {
        const email = document.getElementById("email").value;
        const emailCheck = document.getElementById("emailCheck");
        $.ajax({
            type: "get",
            url: "/member/emailCheck",
            data: {memberEmail: email},
            success: function (res) {
                if (res.memberEmail != null) {
                    emailCheck.innerHTML = "사용 중인 이메일입니다.";
                    emailCheck.style.color = "red";
                    $("#submit").attr("disabled", true);
                } else {
                    emailCheck.innerHTML = "사용가능한 이메일입니다.";
                    emailCheck.style.color = "green";
                    $("#submit").attr("disabled", false);
                }
            }, error: function () {

            }
        })
    }
</script>
</html>
