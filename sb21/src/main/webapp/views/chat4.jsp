
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.js"></script>
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
        init:function(){
            $("")
            console.log("hello")
            $.ajax({
                "Authorization": "KakaoAK 608015414caab1e9d479184918eeca23",
                "url" :" https://api.kakaobrain.com/v1/inference/kogpt/generation",
                "type" : 'post',
                "data": {
                    "prompt" : "오늘 아침 하늘은 곧 비가 올 것 같아서",
                        "max_tokens": 120,
                        "n": 2
                },
                success:function (data){
                    console.log(data + "succ")
                },error:function (data){
                    console.log(data)
                }
            })
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
        <button id="btngo">누르기</button>
    </div>
</div>