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
            $('#btnAdd').click(function(){
                location.href = "<c:url value="/addr/add"/>"
            })
        }
    };
    $(function () {
        detail1.init();
    });
</script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <h2>Cust Detail</h2>
    <h3>${cust.custId}</h3>
    <h3>${cust.name}</h3>
    <h3>${cust.pwd}</h3>
    <c:if test="${cust.custId == id}">
        <button type="button" id="btnAdd" class="btn btn-primary">주소 추가</button>
    </c:if>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Name</th>
            <th>Detail</th>
            <th>CustId</th>
            <th> </th>
            <th> </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${addrs}">
            <tr>
                <td>${c.addrName}</td>
                <td>${c.addrDetail}</td>
                <td>${c.custId}</td>
                <td><a href="<c:url value="/addr/update"/>?id=${c.addrId}">주소 수정</a></td>
                <td><a href="<c:url value="/addr/delete"/>?id=${c.addrId}">주소 삭제</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>