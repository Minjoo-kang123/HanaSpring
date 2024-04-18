<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="<c:url value="/css/customer/customer01.css"/>">
<div class="commonSection1">
  <div class="commonContent1">
    <img src="../img/member/sub-visual02.jpg"
         style="width: 100%; height: 100%;">
    <div class="commonContent2 text-center">
      <div>
        <h3>COSTOMER</h3>
      </div>
      <div>
        <p><img src="../img/icon-home.png"> > 고객지원 > 묻고답하기</p>
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
      <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button"
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
      <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown"
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
<div class="communitySection2 container text-center">
  <div>
    <div>묻고답하기</div>
    <div>The design and maintenance are excellent.</div>
  </div>
  <div class="question">
    <table>
      <tr>
        <td>제목</td>
        <td><span class="inputStyle1">${data.noticeTitle}</span></td>
      </tr>
      <tr>
        <td>작성일</td>
        <td><span class="inputStyle1"><fmt:formatDate pattern="yyyy-MM-dd" value="${data.noticeDate}"/></span></td>
      </tr>

      <tr>
        <td style="width: 1px"></td>
        <td><span class="inputStyle1">${data.noticeContent}</span></td>
      </tr>
    </table>

    <div class="btn">
      <button onclick="location.href='<c:url value="/community/community01"/>'"> <img src="<c:url value="/img/customer/list.gif"/>"> </button>
    </div>
  </div>
</div>
<!-- 묻고답하기 - 글쓰기 -->
