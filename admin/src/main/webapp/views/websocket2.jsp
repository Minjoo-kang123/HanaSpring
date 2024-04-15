
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #all {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid red;
    }

    #me {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid blue;
    }

    #to {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid green;
    }
</style>


<script>
    let websocket = {
        id:'',
        stompClient:null,
        init:function(){
            let socket = new SockJS('${serverurl}/wsa');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                this.subscribe('/send3',function (msg){
                    $("#all").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");
                })
            });

            $('#sendall').click(()=>{
                let msg = JSON.stringify({
                    'sendid' : this.id,
                    'content1' : $("#alltext").val()
                });
                this.stompClient.send("/receiveall2", {}, msg);
            });
        }
    };
    $(function(){
        websocket.init();
    });
</script>



<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Web Socket</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Web Socket</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <div class="col-sm-5">
                    <h1 id="adm_id">${sessionScope.admin.id}</h1>
                    <H1 id="status">Status</H1>
                    <button id="connect">Connect</button>
                    <button id="disconnect">Disconnect</button>

                    <h3>All</h3>
                    <input type="text" id="alltext"><button id="sendall">Send</button>
                    <div id="all"></div>
                </div>
            </div>
        </div>
    </div>

</div>

