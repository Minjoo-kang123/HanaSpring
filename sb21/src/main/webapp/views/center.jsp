<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let center = {
        init: function () {
            $.ajax({
                url:'<c:url value="/wh"/>',
                success:(result)=>{
                    let text = result.response.body.items.item[0].wfSv;
                    $('#wh').text(text);
                }
            });
        }
    };
    $(function () {
        center.init();
    });
</script>
<div class="container">
    <h2>Center Page</h2>
    <h5>Title description, Sep 2, 2017</h5>
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

    <p>Weather..</p>
    <p id="result"></p>
</div>
