<%--
  Created by IntelliJ IDEA.
  User: 하나로H017
  Date: 2024-04-18
  Time: 오전 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<c:url value="/css/customer/customer02.css"/>">
<style>
    #popup {
        display: flex;
        justify-content: center;
        align-items: center;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, .7);
        z-index: 1;
    }

    #popup.hide {
        display: none;
    }

    #popup.has-filter {
        backdrop-filter: blur(4px);
        -webkit-backdrop-filter: blur(4px);
    }

    #popup .content {
        width:450px;
        padding: 20px;
        background: #fff;
        border-radius: 5px;
        box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
    }
    #popup .termstitle{
        font-weight: 700;
        font-size: 18px;
        margin-bottom: 15px;

    }
    #popup .termscontent{
        margin-bottom: 45px;
        color: #6f7792;
    }
    .terms_highligt{
        color : black;
        font-weight: 700;
        margin-bottom: 10px;
    }
    #popupbtnarea{
        height: 50px;
    }
    #closepopupbtn{
        width: 120px;
        height: 35px;
        border-radius: 8px;
        background-color: #5C75E6;
        color: white;
    }
    #openpop{
        border: none;
        text-decoration-line: underline;
        cursor :pointer;
        outline: none;
        background-color: #f5f5f5;
    }
    #openpop:hover{
        color: #5C75E6;
    }
</style>
<script>
    let id = null;
    let pw = null;
    function opening(id, key) {
        this.id = id;
        this.pw = key;

        $('#popup').css('display','');
        popup.classList.remove('hide');
        popup.classList.add('has-filter');
        if (hasFilter) {
            popup.classList.add('has-filter');
        } else {
            popup.classList.remove('has-filter');
        }
    }

    $('#closeBtn').click(function (e){
        $('#popup').removeClass('has-filter').addClass('hide');
    });

    function btnclick(){
        let input = $('#cInput').val()
        if(input == this.pw){
            this.send();
        }else {
            alert("비밀번호가 틀립니다.")
        }
    };

    function send(){
        let url = '/customer/customer024?id='+this.id
        $('#pwd_form').attr({
            'method':'get',
            'action': url
        });
        location.href = url
        $('#pwd_form').submit();
    }
</script>
<!-- 메인 -->
<!-- 1:1문의 -->
<!-- COMMON -->
<div class="commonSection1">
    <div class="commonContent1">
        <img src="../img/member/sub-visual02.jpg"
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>COSTOMER</h3>
            </div>
            <div>
                <p><img src="<c:url value="/img/icon-home.png"/>"> > 고객지원 > 묻고답하기</p>
            </div>
        </div>
    </div>
</div>
<!-- COMMON - 드랍다운 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="../index.html"><button class="homeBtn">H</button></a>
    <ul class="navbar-nav mr-auto navbar-nav-scroll"
        style="max-height: 100px;">

        <li class="nav-item dropdown dropdownHide">
            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown1" role="button"
               data-toggle="dropdown" aria-expanded="false">
                고객지원
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                <li><a class="dropdown-item" href="#">회사소개</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">사업분야</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">제품안내</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">커뮤니티</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">고객지원</a></li>
            </ul>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown2"
               role="button" data-toggle="dropdown" aria-expanded="false">
                묻고답하기
            </a>
            <ul class="dropdown-menu asd">
                <li><a class="dropdown-item" href="../customer/costomer01.html">1:1문의</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="../customer/costomer02.html">묻고답하기</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="../customer/costomer03.html">FAQ</a></li>
            </ul>
        </li>
    </ul>
    </div>
</nav>

<!-- 묻고답하기 -->
<div class="communitySection2 container text-center">
    <div>
        <div>묻고답하기</div>
        <div>The design and maintenance are excellent.</div>
    </div>
    <div class="qna">
        <table>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
            <c:forEach items="${list}" var="c">
                <tr onclick="opening(${c.qnaIdx}, ${c.qnaPw})">
                    <td>${c.qnaIdx}</td>
                    <td><img src="../img/customer/icon_sct.gif">${c.qnaTitle}</td>
                    <td>${c.qnaName}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${ c.qnaDate }"/></td>
                </tr>
            </c:forEach>
        </table>
        <div class="main" id="popup" style="display: none;">
            <div id = "pwd_form" style="background-color: white; padding: 0px 10px; border-radius: 2px">
                <table>
                    <tr>
                        <td colspan="2">비밀번호입력</td>
                    </tr>
                    <tr>
                        <td colspan="2">글 작성시 입력한 비밀번호를 입력하세요.</td>
                    </tr>
                    <tr>
                        <td style="width: 20%;"><img src="../img/customer/txt_pass.gif"></td>
                        <td style="width: 80%;"><input type="password" id = "cInput"></td>
                    </tr>
                </table>
                <div><button onclick="btnclick()"><img src = "<c:url value="/img/customer/btn_confirm.gif"/>"></button></div>
                <div><input class="closeBtn" type="image" onclick="" src="<c:url value="/img/member/btn_close.gif"/>"></div>
            </div>
        </div>
    </div>
</div>

<!-- search bar -->
<div class="search container">
    <div>
        <img onclick="window.location.href='customer02_2.html'"
             src="../img/customer/write.gif">
    </div>
    <table>
        <tr>
            <td>
                <select name="내용" id="">
                    <option value="">제목</option>
                    <option value="">내용</option>
                    <option value="">작성자</option>
                </select>
            </td>
            <td>
                <input type="text">
            </td>
            <td>
                <input type="image" src="../img/customer/search.gif">
            </td>
        </tr>
    </table>
</div>
