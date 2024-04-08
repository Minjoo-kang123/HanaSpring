
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let cust_add = {
        url:'',
        init:function(url){
            this.url = url;
            $('#register_form > button').click(()=>{
                let boardTitle = $('#boardTitle').val();
                alert(boardTitle)
                let boardContent = $('#boardContent').val();
                if(boardTitle == '' || boardTitle == null){
                    alert('제목를 입력 하세요');
                    $('#boardTitle').focus();
                    return;
                }
                if(boardContent == '' || boardContent == null){
                    alert('내용를 입력 하세요');
                    $('#boardContent').focus();
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
        cust_add.init('<c:url value="/board/addimpl"/>');
    });

</script>
<div class="container">
    <h2>Register Page</h2>
    <form id="register_form">
        <div class="form-group">
            <label for="boardTitle">ID:</label>
            <input type="text" class="form-control" id="boardTitle" placeholder="Enter id" name="boardTitle">

        </div>
        <div class="form-group">
            <label for="boardContent">board_content:</label>
            <textarea class="form-control" id="boardContent" name="boardContent"></textarea>
        </div>
        <button type="button" class="btn btn-primary">REGISTER</button>
    </form>
</div>