
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let register = {
        url:'',
        init:function(){
            $('#btnUpdate').click(function(){
                let id = $('#custId').val();
                let pwd = $('#pwd').val();
                let name = $('#name').val();
                if(id == '' || id == null){
                    alert('ID를 입력 하세요');
                    $('#id').focus();
                    return;
                }
                if(pwd == '' || pwd == null){
                    alert('PWD를 입력 하세요');
                    $('#pwd').focus();
                    return;
                }
                if(name == '' || name == null){
                    alert('NAME를 입력 하세요');
                    $('#name').focus();
                    return;
                }
                register.send();
            });

            $('#btnDelete').click(function(){
                let c = confirm("삭제하시겠습니까?");
                let id = $("#custId").val();
                if(c === true){
                    location.href = "<c:url value="/cust/delete"/>?id="+id;
                }
            });
        },
        send:function(){
            $('#register_form').attr({
                'method':'post',
                'encrype':"multpart/form-data";
                'action':this.url
            });
            $('#register_form').submit();
        }
    };


    $(function(){
        register.init(  );
    });

</script>


<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <form id="register_form">
                    <div class="form-group">
                        <label for="itemId">ID</label>
                        <input type="text" value="${item.itemId}" class="form-control" id="itemId" name="itemId" readonly>
                    </div>
                    <div class="form-group">
                        <label for="itemName">Name:</label>
                        <input type="text"  value="${item.itemName}"  class="form-control" id="itemName" placeholder="Enter name" name="itemName">

                    </div>
                    <div class="form-group">
                        Name:<br/>
                        <img id = "imgName" src="<c:url value="/imgs"/>/${item.imgName}">
                    </div>
                    <div class="form-group">
                        <label for="itemPrice">Price:</label>
                        <input type="text" value="${item.itemPrice}"  class="form-control" id="itemPrice" placeholder="Enter name" name="itemPrice">
                    </div>
                    <div class="form-group">
                        <h3>${item.regDate}</h3>
                        <h3>${item.updateDate}</h3>
                    </div>
                    <button type="button" id = "btnUpdate" class="btn btn-primary">update</button>
                    <button type="button" id = "btnDelete"  class="btn btn-primary">Del</button>
                </form>
            </div>
        </div>
    </div>

</div>


