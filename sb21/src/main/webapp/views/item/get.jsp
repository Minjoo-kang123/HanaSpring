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
<style>
    img {
        width: 50px;
    }
</style>
<div class="container">
    <h1>Items3</h1>
    <table class="table table-striped">
            <thead>
            <tr>
                <th>image</th>
                <th>itemId</th>
                <th>itemName</th>
                <th>price</th>
                <th>regdate</th>
                <th>updatedate</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
                <th>image</th>
                <th>itemId</th>
                <th>itemName</th>
                <th>price</th>
                <th>regdate</th>
                <th>updatedate</th>
            </tr>
            </tfoot>
            <tbody>
            <c:forEach var="c" items="${items}">
                <tr>
                    <td><a href="<c:url value="/item/detail"/>?id=${c.itemId}"><img src="<c:url value="/imgs"/>/${c.imgName}"></a></td>
                    <td>${c.itemId}</td>
                    <td>${c.itemName}</td>
                    <td><fmt:formatNumber type="number" pattern="###,###원" value="${c.itemPrice}" /></td>
                    <td>${c.regdate}</td>
                    <td>${c.updatedate}</td>
                </tr>
            </c:forEach>
            </tbody>
    </table>
</div>








