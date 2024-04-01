<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    #container{
        width: 400px;
        height: 500px;
        border: 1px solid blueviolet;
    }
</style>
<script>
    let chart2 = {
        init:function (){
            $('#getData').click(()=>{
                this.get();
            })
        },get:function (){
            $.ajax({
                url:'<c:url value="chart/getdata">',
                success:(data)=>{
                    this.chart(data);
                }
            })
        } ,chart:function(data){

    }
    }
    $(function(){
        chart2.init();
    })
</script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button id="getData" type="button" class="btn btn-primary">GET</button>
<div id="container"></div>
</body>
</html>
