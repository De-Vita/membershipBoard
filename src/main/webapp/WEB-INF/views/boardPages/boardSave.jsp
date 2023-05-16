<%--
  Created by IntelliJ IDEA.
  User: 이은수
  Date: 2023-05-11
  Time: 오후 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/board/save" method="post" enctype="multipart/form-data">
  <input type="text" name="boardTitle" placeholder="제목"> <br>
  <input type="text" name="boardWriter" value="${sessionScope.loginEmail}" readonly> <br>
  <textarea name="boardContents" id="" cols="30" rows="10"></textarea> <br>
  <input type="file" accept="image/*"- name="boardFile" multiple>
  <input type="submit" value="작성">
</form>
</body>
</html>
