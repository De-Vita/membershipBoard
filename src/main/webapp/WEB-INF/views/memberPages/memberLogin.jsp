<%--
  Created by IntelliJ IDEA.
  User: 이은수
  Date: 2023-05-17
  Time: 오전 5:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../component/nav.jsp" %>
<form action="/member/login" method="post">
    <input type="text" name="memberEmail" placeholder="이메일">
    <input type="text" name="memberPassword" placeholder="비밀번호">
    <input type="submit" value="로그인">
</form>
</body>
</html>
