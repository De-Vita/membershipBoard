<%--
  Created by IntelliJ IDEA.
  User: 이은수
  Date: 2023-05-12
  Time: 오전 1:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<%@include file="../component/nav.jsp" %>
    <div id="section">
        <table>
            <tr>
                <th>id</th>
                <td>${board.id}</td>
            </tr>
            <tr>
                <th>writer</th>
                <td>${board.boardWriter}</td>
            </tr>
            <tr>
                <th>date</th>
                <td>
                    <fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                </td>
            </tr>
            <tr>
                <th>hits</th>
                <td>${board.boardHits}</td>
            </tr>
            <tr>
                <th>title</th>
                <td>${board.boardTitle}</td>
            </tr>
            <tr>
                <th>contents</th>
                <td>${board.boardContents}</td>
            </tr>
            <c:if test="${board.fileAttached == 1}">
                <tr>
                    <th>image</th>
                    <td>
                       <c:forEach items="${boardFileList}" var="boardFile">
                           <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                                alt="" width="100" height="100">
                       </c:forEach>
                    </td>
                </tr>
            </c:if>
        </table>
        <c:if test="${board.boardWriter == sessionScope.loginEmail}">
            <button onclick="board_update()">수정</button>
            <button onclick="board_delete()">삭제</button>
        </c:if>

</body>
<script>
    const board_delete = () => {
        const id = '${board.id}';
        location.href = "/board/delete?id=" + id;
    }
</script>
</html>
