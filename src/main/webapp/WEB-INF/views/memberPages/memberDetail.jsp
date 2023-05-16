<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-10
  Time: 오후 1:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../component/nav.jsp" %>
    <table>
        <tr>
            <th>id</th>
            <td id="id">${member.id}</td>
        </tr>
        <tr>
            <th>memberEmail</th>
            <td>${member.memberEmail}</td>
        </tr>
        <tr>
            <th>memberName</th>
            <td>${member.memberName}</td>
        </tr>
        <tr>
            <th>memberMobile</th>
            <td>${member.memberMobile}</td>
        </tr>
        <tr>
            <th>memberProfile</th>
            <td>
                <img src="${pageContext.request.contextPath}/upload/${profile.storedFileName}"alt="">
            </td>
        </tr>
    </table>
    <button onclick="update()">회원 정보 수정</button>
</body>
<script>
    const update = () => {
        const memberId = document.getElementById("id").value;
        location.href = `/member/update?id=${member.id}`;
    }
</script>
</html>
