<%--
  Created by IntelliJ IDEA.
  User: 이은수
  Date: 2023-05-12
  Time: 오전 2:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="../component/nav.jsp" %>
    <div id="section">
        <div class="container" id="search-area">
            <form action="/board/paging" method="get">
                <select name="type">
                    <option value="boardTitle">제목</option>
                    <option value="boardWriter">작성자</option>
                </select>
                <input type="text" name="q" placeholder="검색어를 입력하세요">
                <input type="submit" value="검색">
            </form>
        </div>
        <div class="container" id="list">
            <table class="table table-striped table-hover text-center">
                <tr>
                    <th>id</th>
                    <th>title</th>
                    <th>writer</th>
                    <th>date</th>
                    <th>hits</th>
                </tr>
                <c:forEach items="${boardList}" var="board">
                    <tr>
                        <td>${board.id}</td>
                        <td>
                            <a href="/board?id=${board.id}"&page=${paging.page}>${board.boardTitle}</a>
                        </td>
                        <td>${board.boardWriter}</td>
                        <td>
                            <fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                        </td>
                        <td>${board.boardHits}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="container">
            <ul class="pagination justify-content-center">
                <c:choose>
                    <c:when test="${paging.page<=1}">
                        <li class="page-item disabled">
                            <a class="page-link">[이전]</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/board/paging?page=${paging.page-1}">[이전]</a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                    <c:choose>
                        <c:when test="${i eq paging.page}">
                            <li class="page-item active">
                                <a class="page-link">${i}</a>
                            </li>
                        </c:when>

                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="/board/paging?page=${i}">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${paging.page>=paging.maxPage}">
                        <li class="page-item disabled">
                            <a class="page-link">[다음]</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/board/paging?page=${paging.page+1}">[다음]</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</body>
</html>
