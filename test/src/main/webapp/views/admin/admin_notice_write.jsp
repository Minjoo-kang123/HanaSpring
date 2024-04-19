
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<c:url value="/css/admin/admin.css"/>">
  <!-- 메인 -->
  <!-- COMMON -->
  
  <div class="commonSection1">
    <div class="commonContent1">
      <img src="/img/member/sub-visual01.jpg" 
          style="width: 100%; height: 100%;">
      <div class="commonContent2 text-center">
        <div>
          <h3>관리자페이지</h3>
        </div>
        <div>
          <p><img src="/img/icon-home.png"> 관리자페이지</p>
        </div>
      </div>
    </div>
  </div>
  
  <div id="adminMain">
    <!-- 사이드메뉴 -->
  	<div id="adminSide">
  	  <ul>
	  	  <li><a href="./admin_member.html">회원 관리</a></li>
	  	  <li><a href="./admin_notice.html" class="adminSideActive">공지사항 관리</a></li>
	  	  
  	  </ul>
  	</div>
  	<!-- 메인 -->
  	<div id="adminSection">
  		<div class="adminDiv">
  			<h3>공지사항 관리</h3>
  		</div>
        <form action="<c:url value="/admin_notice/addimpl"/>" method="post">
            <div class="noticeWriteTitle adminDiv2">
                <label style="width: 100px;">타이틀</label>
                <input type="text" name="noticeTitle" id="noticeTitle" required>
                </div>
                <div class="adminDiv2">
                  <textarea rows="5" cols="50" id="editor4" name="noticeContent" required></textarea>

                </div>
                <div class="noticeWriteBtns adminDiv2">
                  <input type="submit" value="등록" onclick="submit()">
                  <input type="button" onclick="history.back()" value="취소">
                </div>
        </form>
    </div>
  </div>


  <script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
  <!-- <script>CKEDITOR.replace('editor4');</script> -->
  <script>
  	var ckeditor_config = {
	   resize_enaleb : false,
	   enterMode : CKEDITOR.ENTER_BR,
	   shiftEnterMode : CKEDITOR.ENTER_P,
	   filebrowserUploadUrl : "/ckUpload"
	 };
	 CKEDITOR.replace("editor4", ckeditor_config);
  </script>


    
<!-- footer -->
<div class="footer">
  <div class="container text-center">
    <div>
      <a href="#">회사소개&nbsp;&nbsp;<span>|</span></a>
      <a href="#">개인정보보호정책&nbsp;&nbsp;<span>|</span></a>
      <a href="#">이메일무단수집거부&nbsp;&nbsp;<span>|</span></a>
      <a href="#">묻고답하기&nbsp;&nbsp;<span>|</span></a>
      <a href="#">오시는길&nbsp;&nbsp;<span>|</span></a>
    </div>
    <div>
      <span>회사 : 코딩강사 &nbsp; 주소 : 서울특별시 중구 명동 세종대로 110  &nbsp; 대표 : 홍길동 <br>
        고객지원 : 010-2222-3333, FAX : 070-888-5555, EMAIL : support@gmail.com, 사업자등록번호 : 100-02-00033, 통신판매업 : 제1111-경기-00000호<br>COPYRIGHT(C) 2021 CODINGGANSA. ALL RIGHT RESERVED.</span>
    </div>
    <div>
      <img src="/img/mf-icon01.png" alt="">
      <img src="/img/mf-icon02.png" alt="">
      <img src="/img/mf-icon03.png" alt="">
      <img src="/img/mf-icon04.png" alt="">
    </div>
  </div>
</div>


<script> 
   // back to top 기능
  $(document).ready(function(){
    $(window).scroll(function () {
      if ($(this).scrollTop() > 50) {
        console.log('fadeIn');
        $('#back-to-top').fadeIn();
      } else {
        console.log('fadeOut');
        $('#back-to-top').fadeOut();
      }
    });
    // scroll body to 0px on click
    $('#back-to-top').click(function () {
      console.log('click');
      $('#back-to-top').tooltip('hide');
      $('body,html').animate({
          scrollTop: 0
      }, 500);
      return false;
    });
    $('#back-to-top').tooltip('show');
  });
   
</script>
