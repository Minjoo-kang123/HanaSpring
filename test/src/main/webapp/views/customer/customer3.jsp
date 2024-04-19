
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/admin/admin.css">

  <link rel="stylesheet" href="<c:url value="/css/customer/customer03.css"/>">

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
          <p><img src="../img/icon-home.png"> > 고객지원 > FAQ</p>
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
              FAQ
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

  <!-- FAQ -->
  <div class="communitySection2 container text-center">
    <div>
      <div>FAQ</div>
      <div>The design and maintenance are excellent.</div>
    </div>
    <div class="faq">
      <table>
        <tr>
          <td>질문1</td>
          <td onclick="window.location.href='customer03_1.html?no=1'">자주하는 질문모음입니다.</td>
        </tr>
        <tr>
          <td>질문2</td>
          <td onclick="window.location.href='customer03_1.html?no=2'">자주하는 질문모음입니다.</td>
        </tr>
        <tr>
          <td>질문3</td>
          <td onclick="window.location.href='customer03_1.html?no=3'">자주하는 질문모음입니다.</td>
        </tr>
        <tr>
          <td>질문4</td>
          <td onclick="window.location.href='customer03_1.html?no=4'">자주하는 질문모음입니다.</td>
        </tr>
        <tr>
          <td>질문5</td>
          <td onclick="window.location.href='customer03_1.html?no=5'">자주하는 질문모음입니다.</td>
        </tr>
      </table>
    </div>
  </div>

  <div class="search container">
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
