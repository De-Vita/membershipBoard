<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-09
  Time: 오후 1:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<%@include file="../component/nav.jsp" %>
<form action="/member/save" method="post" enctype="multipart/form-data">
    <input type="text" name="memberEmail" id="member-email" placeholder="이메일" onblur="email_check()"> <br>
    <p id="check-result"></p>
    <input type="text" name="memberPassword" id="member-password" placeholder="비밀번호" onblur="password_check()"> <br>
    <p id="password-result"></p>
    <input type="text" name="memberName" id="member-name" placeholder="이름" onblur="name_check()"> <br>
    <p id="name-result"></p>
    <input type="text" name="memberMobile" id="member-mobile" placeholder="010-0000-0000" onblur="mobile_check()"> <br>
    <p id="mobile-result"></p>
    <input type="file" name="memberProfile" placeholder="프로필사진"> <br>
    <input type="submit" value="가입">
</form>
</body>
<script>
    const email_check = () => {
      const email = document.getElementById("member-email").value;
      const result = document.getElementById("check-result");
      $.ajax({
          type: "post",
          url: "/member/email-check",
          data : {
              "memberEmail" : email
          },
          success: function () {
              result.innerHTML = "사용 가능한 이메일입니다";
              result.style.color = "green";
          },
          error: function (err) {
              console.log(err);
              if (err.status == "409") {
                  result.innerHTML = "이미 사용 중인 이메일입니다.";
                  result.style.color = "red";
              } else if (err.status == "404") {
                  result.innerHTML = "입력해주세요";
                  result.style.color = "red";
              }
          }
      })
    }
    const password_check = () => {
      const password = document.getElementById("member-password").value;
      const passwordResult = document.getElementById("password-result");
      const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{8,16}$/;
      if (password.match(exp)) {
          passwordResult.innerHTML = "사용 가능한 비밀번호";
          passwordResult.style.color = "green";
      } else {
          passwordResult.innerHTML = "소문자, 숫자를 포함하여 8~16자 이내로 입력";
          passwordResult.style.color = "red";
      }
    }
    const name_check = () => {
      const name = document.getElementById("member-name").value;
      const nameResult = document.getElementById("name-result");
      if (name == "") {
          nameResult.innerHTML = "입력해주세요"
          nameResult.style.color = "red";
      } else {
          nameResult.innerHTML = "";
      }
    }
    const mobile_check = () => {
      const mobile = document.getElementById("member-mobile").value;
      const mobileResult = document.getElementById("mobile-result");
      const exp = /^\d{3}-\d{4}-\d{4}$/;
      if (mobile.match(exp)) {
          mobileResult.innerHTML = "올바른 전화번호";
          mobileResult.style.color = "green";
      } else {
          mobileResult.innerHTML = "010-0000-0000 형식으로 입력해주세요";
          mobileResult.style.color = "red";
      }
    }

</script>
</html>
