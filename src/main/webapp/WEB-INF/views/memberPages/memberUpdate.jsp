<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-11
  Time: 오후 1:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../component/nav.jsp" %>
<form action="/member/update" method="post" enctype="multipart/form-data" name="updateForm">
    <input type="text" name="id" value="${member.id}" readonly> <br>
    <input type="text" name="memberEmail" value="${member.memberEmail}" readonly> <br>
    <input type="text" name="memberPassword" id="memberPassword" placeholder="비밀번호 입력"> <br>
    <input type="text" name="memberName" value="${member.memberName}"> <br>
    <input type="text" name="memberMobile" value="${member.memberMobile}"> <br>
    <input type="file" name="memberProfile"}> <br>
    <div id="fileName">${profile.originalFileName}</div>
    <input type="button" onclick="update_check()" value="수정">
</form>
</body>
<script>
    const update_check = () => {
      const inputPass = document.getElementById("memberPassword").value;
      const DBPass = '${member.memberPassword}';
      if (inputPass == DBPass) {
          const memberId = '${member.id}';
          document.getElementsByName("id")[0].value = memberId;
          document.updateForm.submit();
      } else {
          alert("비밀번호가 일치하지 않습니다");
      }
    }
    window.onload = function() {
        // 이전에 입력한 값이 있는 경우만 실행
        if (sessionStorage.getItem("memberEmail")) {
            document.getElementsByName("memberEmail")[0].value = sessionStorage.getItem("memberEmail");
        }
        if (sessionStorage.getItem("memberName")) {
            document.getElementsByName("memberName")[0].value = sessionStorage.getItem("memberName");
        }
        if (sessionStorage.getItem("memberMobile")) {
            document.getElementsByName("memberMobile")[0].value = sessionStorage.getItem("memberMobile");
        }
    }
    // 페이지 떠날 때 실행
    window.onbeforeunload = function() {
        sessionStorage.setItem("memberEmail", document.getElementsByName("memberEmail")[0].value);
        sessionStorage.setItem("memberName", document.getElementsByName("memberName")[0].value);
        sessionStorage.setItem("memberMobile", document.getElementsByName("memberMobile")[0].value);
    }
</script>
</html>
