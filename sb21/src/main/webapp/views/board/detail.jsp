<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<script>
    let detail1 ={
        init: function () {
            $('#btnUpdte').click(function(){
                location.href = "<c:url value="/board/update"/>?id=${board.boardId}"
            })
            $('#btnDel').click(function(){
                location.href = "<c:url value="/board/delete"/>?id=${board.boardId}"
            })
        }
    };
    $(function () {
        detail1.init();
    });
</script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    .container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
        text-align: center;
        color: #333;
    }
    .post {
        border-bottom: 1px solid #ccc;
        padding: 10px 0;
        margin-bottom: 20px;
    }
    .post h2 {
        color: #007bff;
        margin-bottom: 5px;
    }
    .post p {
        margin: 0;
        color: #666;
    }
    .post .date {
        color: #999;
        font-size: 14px;
    }
</style>

<div class="container">
    <div class="post">
        <h2>${board.boardTitle}</h2>
        <p>조회수 : ${board.boardCnt}</p>
        <p>${board.boardContent}</p>
        <p class="date">${board.boardRegdate}</p>
        <p class="date">${board.boardUpdate}</p>


    </div>
    <c:if test="${board.custId == id}">
        <button type="button" id="btnUpdte" class="btn btn-primary">게시글 수정</button>
        <button type="button" id="btnDel" class="btn btn-primary">게시글 삭제</button>
    </c:if>

    <%-- Comment List    --%>

    <c:choose>
        <c:when test="${board.commentList.size() != 0}">
            <%--            <c:when test="${board.commentList != []}">--%>
            <%--            <c:when test="${!empty(board.commentList)}">--%>
            <table class="table table-striped" id="comment_table">
                <thead>
                <tr>
                    <th>Content</th>
                    <th>CustId</th>
                    <th>RegDate</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="c" items="${board.commentList}">
                    <tr>
                        <td>${c.commentContent}</td>
                        <td>${c.custId}</td>
                        <td>
                            <fmt:parseDate value="${c.commentRegdate}"
                                           pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                            <fmt:formatDate pattern="yyyy년MM월dd일 HH시mm분" value="${ parsedDateTime }" />
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p>없음</p>
        </c:otherwise>
    </c:choose>

</div>