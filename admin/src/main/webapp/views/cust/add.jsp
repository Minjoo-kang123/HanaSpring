
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let cust_add = {
        url:'',
        init:function(url){
            this.url = url;
            $('#custId').keyup(()=>{
                let custId = $('#custId').val();
                $.ajax({
                    url:'<c:url value="/registercheck"/>',
                    data:{'id':custId},
                    success:(result)=>{
                        let msg = '입력가능합니다.';
                        if(result == '0'){
                            msg = '사용 불가능 합니다.'
                        }
                        $('#check_msg').html(msg);
                    }
                })
            })
            $('#register_form > button').click(()=>{
                let custId = $('#custId').val();
                let pwd = $('#pwd').val();
                let name = $('#name').val();
                if(custId == '' || custId == null){
                    alert('ID를 입력 하세요');
                    $('#custId').focus();
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
                this.send();
            });
        },
        send:function(){
            $('#register_form').attr({
                'method':'post',
                'action':this.url
            });
            $('#register_form').submit();
        }
    };
    $(function(){
        cust_add.init('<c:url value="/cust/addimpl"/>');
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
                        <label for="custId">ID:</label>
                        <input type="text" class="form-control" id="custId" placeholder="Enter id" name="custId">
                        <span id="check_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="pwd">Password:</label>
                        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">

                    </div>
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">

                    </div>
                    <button type="button" class="btn btn-primary">REGISTER</button>
                </form>
            </div>
        </div>
    </div>

</div>


