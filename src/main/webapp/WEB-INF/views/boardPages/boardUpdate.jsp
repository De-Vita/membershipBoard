<%--
  Created by IntelliJ IDEA.
  User: 이은수
  Date: 2023-05-17
  Time: 오전 8:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../component/nav.jsp" %>
<form action="/board/update" method="post" enctype="multipart/form-data">
  <input type="text" name="id" value="${board.id}" readonly> <br>
  <input type="text" name="boardTitle" value="${board.boardTitle}"> <br>
  <input type="text" name="boardWriter" value="${board.boardWriter}" readonly> <br>
  <textarea name="boardContents" cols="30" rows="10" value="${board.boardContents}"></textarea> <br>
  <input type="file" name="boardFile" multiple> <br>
  <div>
    <c:forEach items="${boardFile}" var="boardFile">
      ${boardFile.originalFileName}
    </c:forEach>
  </div>
  <input type="submit" value="수정">
</form>
</body>
</html>
