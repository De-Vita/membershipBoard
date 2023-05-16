<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-15
  Time: 오후 1:27
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
    <div id="section">
        <table>
            <tr>
                <th>회원번호</th>
                <th>이메일</th>
                <th>비밀번호</th>
                <th>이름</th>
                <th>전화번호</th>
            </tr>
            <c:forEach items="${memberList}" var="member">
                <tr>
                    <td>${member.id}</td>
                    <td>${member.memberEmail}</td>
                    <td>${member.memberPassword}</td>
                    <td>${member.memberName}</td>
                    <td>${member.memberMobile}</td>
                    <td>
                        <button onclick="delete_member('${member.id}')">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
<script>
    const delete_member = (id) => {
        location.href = "/member/delete?id=" + id;
    }
</script>
</html>
