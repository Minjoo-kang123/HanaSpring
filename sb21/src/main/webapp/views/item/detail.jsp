<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <div class="card-body">
        <div class="table-responsive">
                <div class="form-group">
                    <label for="itemId">ID</label>
                    <input type="text" value="${item.itemId}" class="form-control" id="itemId" name="itemId" readonly>
                </div>
                <div class="form-group">
                    <label for="itemName">Name:</label>
                    <input type="text"  value="${item.itemName}"  class="form-control" id="itemName" placeholder="Enter name" name="itemName" readonly>

                </div>
                <div class="form-group">
                    image:<br/>
                    <img id = "imgName" src="<c:url value="/imgs"/>/${item.imgName}">
                </div>
                <div class="form-group">
                    <label for="itemPrice">Price:</label>
                    <input type="text" value="${item.itemPrice}"  class="form-control" id="itemPrice" placeholder="Enter name" name="itemPrice" readonly>
                </div>
                <div class="form-group">
                    <h3>${item.regdate}</h3>
                    <h3>${item.updatedate}</h3>
                </div>
        </div>
    </div>
</div>