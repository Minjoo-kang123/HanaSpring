<%--
  Created by IntelliJ IDEA.
  User: 하나로H017
  Date: 2024-04-17
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="<c:url value="/css/member/join.css"/>">

<script>
    //이메일 검증 식
    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    var pwExp = /^(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()-_+=|\\[\]{};:'",.<>?])[a-zA-Z][a-zA-Z0-9!@#$%^&*()-_+=|\\[\]{};:'",.<>?]{7,15}$/;
    let idExp = /^[a-z0-9]{4,16}$/
    let pwdCheck = false;
    let idCheck = false;
    let register = {
        init:function(){
            $('#userPWCheck').focusout(function (){
                let memberPw = $('#memberPw').val();
                let userPWCheck = $('#userPWCheck').val();
                if(memberPw != userPWCheck){
                    $('#checkPw').text("비밀번호가 일치하지 않습니다.")
                    pwdCheck = false;
                }else {
                    $('#checkPw').text("비밀번호가 일치합니다.")
                    pwdCheck = true;
                }
            })
            $('#memberEmail').focusout(function (){
                let memberEmail = $('#memberEmail').val();

                if(!memberEmail.match(regExp)){
                    $('#checkEmail').text("올바른 이메일을 작성하세요.")
                }else {
                    $('#checkEmail').text("사용 가능한 이메일입니다.")
                }
            })
            $('#memberPw').focusout(function (){
                let memberPw = $('#memberPw').val();

                if(!memberPw.match(pwExp)){
                    $('#checkpwd').text("올바른 비밀번호를 작성하세요.")
                }else {
                    $('#checkpwd').text("사용 가능한 비밀번호입니다.")
                }
            })

            $('#check').click(function(){
                let memberId = $('#memberId').val()
                if(memberId == '' || memberId == null){
                    alert('ID를 입력 하세요');
                    $('#id').focus();
                    return;
                }
                if(memberId.length < 4){
                    alert('ID를 4자 이상 입력 하세요');
                    return;
                }
                if(memberId.length > 16){
                    alert('ID를 16자 이하로 입력 하세요');
                    return;
                }
                if(!memberId.match(idExp)){
                    alert('ID에는 알파벳, 숫자만 사용 가능합니다.');
                    return;
                }
                $.ajax({
                    url:'<c:url value="/member/idcheck"/>',
                    data:{'memberId':memberId},
                    success:(result)=>{
                        let msg = '입력가능합니다.';
                        idCheck = true;
                        if(result == '0'){
                            msg = '사용 불가능 합니다.'
                            idCheck = false;
                        }
                        alert(msg);
                    }
                })
            });
            $('#btnSubmit').click(function(){
                let memberId = $('#memberId').val();
                let memberPw = $('#memberPw').val();
                let memberName = $('#memberName').val();
                let memberEmail = $('#memberEmail').val();
                let passwordCheckQuestion = $("#passwordCheckQuestion option:selected").val();
                let memberPwAnswer = $("#memberPwAnswer").val();
                let memberEmailReceive = $('input[name=memberEmailReceive]:checked').val();
                let memberGender = $('input[name=memberGender]:checked').val();
                let memberBirthDate = $('#memberBirthDate').val();

                if(memberId == '' || memberId == null){
                    alert('ID를 입력 하세요');
                    $('#memberId').focus();
                    return;
                }
                if(memberPw == '' || memberPw == null){
                    alert('PWD를 입력 하세요');
                    $('#memberPw').focus();
                    return;
                }
                if(memberName == '' || memberName == null){
                    alert('NAME를 입력 하세요');
                    $('#memberName').focus();
                    return;
                }
                if(!memberEmail.match(regExp)){
                    alert("올바른 이메일 형식을 입력하세요.")
                    $('#memberEmail').focus();
                    return;
                }
                if(passwordCheckQuestion === '0'){
                    alert("비밀번호 확인 질문을 선택해주세요")
                    $('#passwordCheckQuestion').focus();
                    return;
                }
                if(memberPwAnswer == '' || memberPwAnswer == null){
                    alert('memberPwAnswer를 입력 하세요');
                    $('#memberPwAnswer').focus();
                    return;
                }
                if(!memberEmailReceive){
                    alert("이메일 수신여부를 체크해주세요.")
                    return;
                }
                if(!memberGender){
                    alert("성별을 체크해주세요.")
                    return;
                }
                if(!memberBirthDate){
                    alert("생년월일을 입력해주세요.")
                    return;
                }
                if(!pwdCheck){
                    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.")
                    return;
                }
                register.send();
            });
        },
        send:function(){
            $('#register_form').attr({
                'method':'POST',
                'action':'/member/joinimpl'
            });
            $('#register_form').submit();
        }
    };
    $(function(){
        register.init();
    });

</script>
<!-- 메인 -->
<!-- COMMON -->
<div class="commonSection1">
    <div class="commonContent1">
        <img src="<c:url value="/img/member/sub-visual02.jpg"/>"
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>MEMBER</h3>
            </div>
            <div>
                <p><img src="<c:url value="/img/icon-home.png"/>"> > 회원가입</p>
            </div>
        </div>
    </div>
</div>

<!-- 메인 -->
<!-- 회원가입 -->
<div class="joinForm container">
    <div class="joinSection1">
        <div><h3>회원가입</h3></div>
        <div><p>The design and maintenance are excellent.</p></div>
    </div>
    <div class="wellcome">
        <h3>OOO사이트에 오신 것을 환영합니다.</h3>
        <h5>-이름과 이메일을 입력해 주시면 가입여부를 확인 후 회원가입 절차가 이루어집니다.</h5>
    </div>
    <br><br>
    <div class="contents">
        <h3>회원가입을 위해서 아래의 양식에 있는 내용을 입력해 주셔야 합니다.</h3>
        <h5>-회원님의 개인정보를 신중하게 보호하고 있으며 회원님의 동의 없이는 기재하신 회원정보가 누출되지 않습니다.
            자세한 내용은 개인정보보호정책에서 확인하세요.</h5>
    </div>
    <!-- 입력폼 -->
    <form id = "register_form">
        <div class="information1">
            <div>기본정보</div>
            <table>
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="memberId" id="memberId">
                        <img src="<c:url value="/img/member/btn_iddupl.gif"/>" id = "check">
                        (영문 소문자, 숫자로 4~16자)
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td>
                        <input type="password" name="memberPw" id ="memberPw">
                        영문/숫자/특수문자조합으로 8~16자리. 첫글자는 영문자로 사용 <span style="color: red" id = "checkpwd"></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="userPWCheck" id ="userPWCheck"> <span style="color: red" id = "checkPw"></span></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="memberName" id ="memberName"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" name = "memberEmail" id = "memberEmail"> <span style="color: red" id = "checkEmail"></span></td>
                </tr>
                <tr>
                    <td>이메일 수신여부</td>
                    <td><input type="radio" name="memberEmailReceive" value="1">수신
                        <input type="radio" name="memberEmailReceive" value="0">수신안함</td>
                </tr>
                <tr>
                    <td>비밀번호 확인시 질문</td>
                    <td>
                        <select class="size" id="memberPwQuestion" name="memberPwQuestion">
                            <option value="0">========선택========</option>
                            <option value="1">기억에 남는 추억의 장소는?</option>
                            <option value="2">자신의 인생 좌우명은?</option>
                            <option value="3">자신의 보물 제1호는?</option>
                            <option value="4">가장 기억에 남는 선생님 성함은?</option>
                            <option value="5">내가 좋아하는 캐릭터는?</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호 확인시 답변</td>
                    <td><input type="text" name="memberPwAnswer" id ="memberPwAnswer"></td>
                </tr>
                <tr>
                    <td>성별</td>
                    <td><input type="radio" name="memberGender" value="male">남자<input type="radio" name="memberGender" value="female">여자</td>
                </tr>
                <tr>
                    <td>생년월일</td>
                    <td>
                        <input type="date" id = "memberBirthDate" name="memberBirthDate">
                    </td>
                </tr>
            </table>
        </div>

    </form>

    <div class="Information2">부가정보</div>
    <div class="imageBtn2">
        <input type="image" id="btnSubmit" src="<c:url value="/img/member/btn_confirm.gif"/>">
        <input type="image" id="btnCancel" src="<c:url value="/img/member/btn_cancel.gif"/>">
    </div>

</div>



