<%--
  Created by IntelliJ IDEA.
  User: 하나로H017
  Date: 2024-04-17
  Time: 오후 7:12
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="<c:url value="/css/member/login.css"/>">
<script>
    let login = {
        init:function(){
            $('#submit_btn').click(function(){
                let id = $('#loginID').val();
                let pwd = $('#loginPW').val();
                if(id == '' || id == null){
                    alert('ID를 입력 하세요');
                    $('#loginID').focus();
                    return;
                }
                if(pwd == '' || pwd == null){
                    alert('PWD를 입력 하세요');
                    $('#loginPW').focus();
                    return;
                }
                login.send();
            });
        },
        send:function(){
            $('#login_form').attr({
                'method':'get',
                'action':'/member/loginimpl'
            });
            $('#login_form').submit();
        }
    }
    $(function(){
        login.init();
    });
</script>
<!-- 메인 -->
<!-- COMMON -->
<div class="commonSection1">
    <div class="commonContent1">
        <img src="<c:url value="/img/member/sub-visual01.jpg"/>"
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>MEMBER</h3>
            </div>
            <div>
                <img src="<c:url value="/img/icon-home.png"/>">로그인
            </div>
        </div>
    </div>
</div>

<!-- 로그인 -->
<div class="loginForm container text-center">
    <div class="loginSection1">
        <div><h3>로그인</h3></div>
        <div><p>The design and maintenance are excellent.</p></div>
    </div>
    <div class="loginMain">
        <span>${msg}</span>
        <form id = "login_form">
            <table class="main1">
                <tr>
                    <td>
                        아이디 <br>
                        비밀번호
                    </td>
                    <td>
                        <input type="text" name="loginID"  id="loginID" placeholder="Enter id"> <br>
                        <input type="password" name="loginPW" id="loginPW" placeholder="Enter password" >
                    </td>
                    <td>
                        <button type="button" id = "submit_btn"> <img src="<c:url value="/img/member/btn_login.gif"/>" alt="login btn"></button>
                    </td>
                </tr>
            </table>
        </form>
        <div class="loginSection2">
            <table class="main2">
                <tr>
                    <td>-아이디를 잊으셨나요?</td>
                    <td>
                        <input type="image"
                               onclick="window.open('<c:url value="/member/idFind"/>','아이디찾기', 'width=430,height=300,location=no,status=no,scrollbars=no')",
                               src="<c:url value="/img/member/btn_id_find.gif"/>" >
                    </td>
                </tr>
                <tr>
                    <td>-비밀번호를 잊으셨나요?</td>
                    <td>
                        <input type="image"
                               onclick="window.open('<c:url value="/member/passwordFind"/>','비밀번호찾기', 'width=430,height=300,location=no,status=no,scrollbars=no')",
                               src="<c:url value="/img/member/btn_pw_find.gif"/>" >
                    </td>
                </tr>
            </table>
        </div>

    </div>
</div>
