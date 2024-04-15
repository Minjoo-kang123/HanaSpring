
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #all {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid red;
    }
</style>
<script>
    let websocket = {
        id:'',
        stompClient:null,
        msg:'',
        init:function(){
            let socket = new SockJS('${serverurl}/wsa');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                this.subscribe('/send3',function (msg){
                    //메시가 왔음을 알림
                    this.msg = JSON.parse(msg.body).content1;
                    // 메세지를 변수에 저장함
                    $("#all").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");

                })
            });
        }
    };
    $(function(){
        websocket.init();
    });
</script>
<div class="container">
    <h2>Chat Page</h2>
    <div class="col-sm-5">
        <h3>notice</h3>
        <div id="all"></div>
    </div>
</div>