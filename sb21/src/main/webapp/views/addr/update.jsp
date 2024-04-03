
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let cust_add = {
        url:'',
        init:function(url){
            this.url = url;
            $('#register_form > button').click(()=>{
                let addrName = $('#addrName').val();
                let addrDetail = $('#addrDetail').val();
                if(addrName == '' || addrName == null){
                    alert('주소명을 입력 하세요');
                    $('#addrName').focus();
                    return;
                }
                if(addrDetail == '' || addrDetail == null){
                    alert('주소를 입력 하세요');
                    $('#addrDetail').focus();
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
        cust_add.init('<c:url value="/addr/modifyImpl"/>');
    });

</script>
<div class="container">
    <h2>Address Page</h2>
    <form id="register_form">
        <div class="form-group">
            <label for="addrName">주소록 이름:</label>
            <input type="text" class="form-control" id="addrName" value="${addr.addrName}" name="addrName">
        </div>
        <div class="form-group">
            <label for="addrDetail">주소:</label>
            <input type="text" class="form-control" id="addrDetail" value="${addr.addrDetail}" name="addrDetail">
        </div>
        <div class="form-group">
            <input type="hidden" class="form-control" id="addrId" value="${addr.addrId}" name="addrId">
        </div>
        <button type="button" class="btn btn-primary">update address</button>
    </form>
</div>