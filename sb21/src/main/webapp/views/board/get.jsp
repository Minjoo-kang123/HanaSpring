<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let html3 = {
        init: function () {
        }
    };
    $(function () {
        html3.init();
    });
</script>
<div class="container">
    <h1>html3</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${boards}">
            <tr>
                <td><a href="<c:url value="/board/detail"/>?id=${c.boardId}">${c.boardTitle}</a></td>
                <td>${c.custId}</td>
                <td>${c.boardRegdate}</td>
                <td>${c.boardCnt}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>








