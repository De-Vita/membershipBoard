<%--
  Created by IntelliJ IDEA.
  User: 이은수
  Date: 2023-05-17
  Time: 오전 5:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <ul>
        <li><a href="/member/save">회원가입</a></li>
        <li><a href="/board/">글 목록</a></li>
        <li><a href="/board/paging">페이징목록</a></li>
        <c:if test="${sessionScope.loginEmail == 'admin'}">
            <li><a href="/member/members">회원 목록</a></li>
        </c:if>
        <li>
            <c:choose>
                <c:when test="${sessionScope.loginEmail != null}">
                    <a href="/member/mypage">mypage</a>
                    <a href="/board/save">글 작성</a>
                    <a href="/member/logout">log out</a>
                    <h2>${sessionScope.loginEmail}님 환영합니다</h2>
                </c:when>
                <c:otherwise>
                    <a href="/member/login">login</a>
                </c:otherwise>
            </c:choose>
        </li>
    </ul>
</body>
</html>
