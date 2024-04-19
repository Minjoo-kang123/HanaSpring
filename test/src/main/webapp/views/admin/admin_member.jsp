
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<c:url value="/css/admin/admin.css"/>">
<script>
	let data = null;
	let perpage = 10;
	function formatDate(date) {
		const d = new Date(date);
		const year = d.getFullYear();
		const month = String(d.getMonth() + 1).padStart(2, '0');
		const day = String(d.getDate()).padStart(2, '0');
		return year + '-' + month + "-" + day;
	}
	$(document).ready(function(){

		$('#page_select').change(function() {
			var selectedOption = $('#order_select').val();
			let perpage = $(this).val();
			// AJAX 요청
			$.ajax({
				type: "GET",
				url: "/admin_member/order",
				data: { order: selectedOption },
				success: function(data) {
					this.data = data;
					var tbodyContent = ''; // 새로운 tbody 내용을 저장할 변수

					for(let i = 0; i < perpage; i++){
						if(data[i] == null)
							break;
						tbodyContent += '<tr>';
						tbodyContent += '<td>' + data[i].memberId + '</td>';
						tbodyContent += '<td>' + data[i].memberName + '</td>';
						tbodyContent += '<td>' + data[i].memberEmail + '</td>';
						tbodyContent += '<td>' + data[i].memberBirthDate + '</td>';
						tbodyContent += '<td>' + formatDate(data[i].memberJoinDate)+ '</td>';
						tbodyContent += '</tr>';
					}
					// 생성한 tbody 내용을 #memberTable에 추가
					$('#memberTable').html(tbodyContent);
				},
				error: function(xhr, status, error) {
					console.error("AJAX Error:", status, error);
				}
			});
		});

		// 정렬 기준이 변경될 때마다
		$('#order_select').change(function() {
			var selectedOption = $(this).val();
			// AJAX 요청
			$.ajax({
				type: "GET",
				url: "/admin_member/order",
				data: { order: selectedOption },
				success: function(data) {
					this.data = data;
					var tbodyContent = ''; // 새로운 tbody 내용을 저장할 변수
					if(perpage == 50){
						data.forEach(function(item) {
							// 각 데이터 항목을 기반으로 tr 요소 생성
							tbodyContent += '<tr>';
							tbodyContent += '<td>' + item.memberId + '</td>';
							tbodyContent += '<td>' + item.memberName + '</td>';
							tbodyContent += '<td>' + item.memberEmail + '</td>';
							tbodyContent += '<td>' + item.memberBirthDate + '</td>';
							tbodyContent += '<td>' + formatDate(item.memberJoinDate)+ '</td>';
							tbodyContent += '</tr>';

						});
					}
					else{
						for(let i = 0; i < perpage; i++){
							if(data[i] == null)
								break;
							tbodyContent += '<tr>';
							tbodyContent += '<td>' + data[i].memberId + '</td>';
							tbodyContent += '<td>' + data[i].memberName + '</td>';
							tbodyContent += '<td>' + data[i].memberEmail + '</td>';
							tbodyContent += '<td>' + data[i].memberBirthDate + '</td>';
							tbodyContent += '<td>' + formatDate(data[i].memberJoinDate)+ '</td>';
							tbodyContent += '</tr>';
						}
					}

					// 생성한 tbody 내용을 #memberTable에 추가
					$('#memberTable').html(tbodyContent);
				},
				error: function(xhr, status, error) {
					console.error("AJAX Error:", status, error);
				}
			});
		});
	});
</script>
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
          <p><img src="/img/icon-home.png"> > 관리자페이지</p>
        </div>
      </div>
    </div>
  </div>
  
  <div id="adminMain">
    <!-- 사이드메뉴 -->
  	<div id="adminSide">
  	  <ul>
	  	  <li><a href="/admin_member" class="adminSideActive">회원 관리</a></li>
	  	  <li><a href="/admin_notice">공지사항 관리</a></li>
	  	  <li><a href="/admin_one2one">1:1문의 관리</a></li>
	  	  <li><a href="/admin_qna">묻고답하기 관리</a></li>
	  	  <li><a href="/admin_faq">FAQ 관리</a></li>
	  	  <li><a href="/admin_product">제품 관리</a></li>
  	  </ul>
  	</div>
  	<!-- 메인 -->
  	<div id="adminSection">
  		<div class="adminDiv">
  			<h3>회원관리</h3>
  		</div>
		<form action="<c:url value="/adminSc"/>">
			<div class="adminDiv">
				검색 옵션
				<select name="select" id="search_select">
				  <option value="all" selected>전체</option>
				  <option value="id">아이디</option>
				  <option value="name">성명</option>
				  <option value="email">이메일</option>
				</select>
			<input type="text" name="keyword" id="search_keyword" required>
			<input type="image" src="../img/community/search.gif">
  			</div>
		</form>
  		<div class="adminDiv">
  		  정렬
  		  <select class="size" name="order_select" id="order_select" onchange="">
          <option value="id_asc" selected>아이디 오름차순</option>
          <option value="id_desc">아이디 내림차순</option>
          <option value="join_date_asc">가입일 오름차순</option>
          <option value="join_date_desc">가입일 내림차순</option>
        </select>
  		</div>
  		<div class="adminDiv2" id="tableTitle">
  		  <div>회원목록 1건</div>
  		  <div>한페이지 행수
	  		  <select class="size" name="page_select" id="page_select">
	          <option value="10" selected>10개씩 보기</option>
	          <option value="20">20개씩 보기</option>
	          <option value="50">50개씩 보기</option>
	        </select>
  		  </div>
  		</div>
  		<div class="">
  			<table class="adminTable">
  			  <thead>
  			  	<tr>
	  			  	<th>아이디</th>
	  			  	<th>성명</th>
	  			  	<th>이메일</th>
	  			  	<th>생일</th>
	  			  	<th>가입일</th>
  			  	</tr>
  			  </thead>
  			  <tbody id = "memberTable">
				  <c:forEach items="${list}" var="c" begin="0" end="9">
						<tr>
							<td>${c.memberId}</td>
							<td>${c.memberName}</td>
							<td>${c.memberEmail}</td>
							<td>${c.memberBirthDate}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ c.memberJoinDate }"/></td>
						</tr>
				  </c:forEach>
  			  </tbody>
  			</table>
  		</div>
  		
  		<div class="pageNav adminDiv2">
  		  <div> </div>
  			<div>
	  			<a href="/admin_member?page=1">처음</a>
	  			<a href="/admin_member?page=1">이전</a>
	  			<a href="/admin_member?page=1">1</a>
	  			<a href="/admin_member?page=2">2</a>
	  			<a href="/admin_member?page=3">3</a>
	  			<a href="/admin_member?page=2">다음</a>
	  			<a href="/admin_member?page=3">마지막</a>
  			</div>
  			<div> </div>
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
