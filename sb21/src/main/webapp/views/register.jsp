
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let register = {
        url:'',
        init:function(){
            $('#check').click(function(){
                let custId = $('#custId').val()
                if(custId == '' || custId == null){
                    alert('ID를 입력 하세요');
                    $('#id').focus();
                    return;
                }
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
            });
            $('#register_btn').click(function(){
                let custId = $('#custId').val();
                let pwd = $('#pwd').val();
                let name = $('#name').val();
                if(custId == '' || custId == null){
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
        },
        send:function(){
            $('#register_form').attr({
                'method':'post',
                'action':'/registerimpl'
            });
            $('#register_form').submit();
        }
    };
    $(function(){
        register.init();
    });

</script>
<div class="container">
    <h2>Register Page</h2>
    <form id="register_form">
        <div class="form-group">
            <label for="custId">ID:</label>
            <input type="text" class="form-control" id="custId" placeholder="Enter id" name="custId">
            <button type="button" id = "check" class="btn btn-primary">ID CHECK</button>
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
        <button type="button" id = "register_btn" class="btn btn-primary">REGISTER</button>
    </form>
</div>