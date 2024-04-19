
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

    $('#order_select').change(function() {
      var selectedOption = $('#order_select').val();
      // AJAX 요청
      $.ajax({
        type: "GET",
        url: "/admin_notice/order",
        data: { order: selectedOption },
        success: function(data) {
          this.data = data;
          var tbodyContent = ''; // 새로운 tbody 내용을 저장할 변수
          if(perpage == 50){
            data.forEach(function(item, n) {
              // 각 데이터 항목을 기반으로 tr 요소 생성
              tbodyContent += '<tr onclick="location.href=\'/admin_notice_view?idx=' + item.noticeIdx + '\'" style="cursor: pointer">';
              tbodyContent += '<td>' + (n + 1) + '</td>';
              tbodyContent += '<td>' + item.noticeTitle + '</td>';
              tbodyContent += '<td>' + item.noticeMemberId + '</td>';
              tbodyContent += '<td>' + formatDate(item.noticeDate)+ '</td>';
              tbodyContent += '</tr>';
            });
          }
          else{
            for(let i = 0; i < perpage; i++){
              if(data[i] == null)
                break;
              tbodyContent += '<tr onclick="location.href=\'/admin_notice_view?idx=' + data[i].noticeIdx + '\'" style="cursor: pointer">';
              tbodyContent += '<td>' + (i + 1) + '</td>';
              tbodyContent += '<td>' + data[i].noticeTitle + '</td>';
              tbodyContent += '<td>' + data[i].noticeMemberId + '</td>';
              tbodyContent += '<td>' + formatDate(data[i].noticeDate)+ '</td>';
              tbodyContent += '</tr>';
            }
          }

          // 생성한 tbody 내용을 #memberTable에 추가
          $('#adminTable').html(tbodyContent);
        },
        error: function(xhr, status, error) {
          console.error("AJAX Error:", status, error);
        }
      });
    });

    $('#page_select').change(function() {
      var selectedOption = $('#order_select').val();
      perpage = $(this).val();
      // AJAX 요청
      $.ajax({
        type: "GET",
        url: "/admin_notice/order",
        data: { order: selectedOption },
        success: function(data) {
          this.data = data;
          var tbodyContent = ''; // 새로운 tbody 내용을 저장할 변수

          for(let i = 0; i < perpage; i++){
            if(data[i] == null)
              break;
            tbodyContent += '<tr onclick="location.href=\'/admin_notice_view?idx=' + data[i].noticeIdx + '\'" style="cursor: pointer">';
            tbodyContent += '<td>' + (i + 1) + '</td>';
            tbodyContent += '<td>' + data[i].noticeTitle + '</td>';
            tbodyContent += '<td>' + data[i].noticeMemberId + '</td>';
            tbodyContent += '<td>' + formatDate(data[i].noticeDate)+ '</td>';
            tbodyContent += '</tr>';
          }
          // 생성한 tbody 내용을 #memberTable에 추가
          $('#adminTable  ').html(tbodyContent);
        },
        error: function(xhr, status, error) {
          console.error("AJAX Error:", status, error);
        }
      });
    });

    // 정렬 기준이 변경될 때마다
  });
</script>
<link rel="stylesheet" href="<c:url value="/css/admin/admin.css"/>">
    <!-- 메인 -->
    <!-- COMMON -->

    <div class="commonSection1">
      <div class="commonContent1">
        <img
          src="/img/member/sub-visual01.jpg"
          style="width: 100%; height: 100%"
        />
        <div class="commonContent2 text-center">
          <div>
            <h3>관리자페이지</h3>
          </div>
          <div>
            <p><img src="/img/icon-home.png" /> > 관리자페이지</p>
          </div>
        </div>
      </div>
    </div>

    <div id="adminMain">
      <!-- 사이드메뉴 -->
      <div id="adminSide">
        <ul>
          <li><a href="/admin_member">회원 관리</a></li>
          <li>
            <a href="/admin_notice" class="adminSideActive">공지사항 관리</a>
          </li>
          <li><a href="/admin_one2one">1:1문의 관리</a></li>
          <li><a href="/admin_qna">묻고답하기 관리</a></li>
          <li><a href="/admin_faq">FAQ 관리</a></li>
          <li><a href="/admin_product">제품 관리</a></li>
        </ul>
      </div>
      <!-- 메인 -->
      <div id="adminSection">
        <div class="adminDiv">
          <h3>공지사항 관리</h3>
        </div>
        <form method="get" action="<c:url value="/admin_noticeSc"/>">
          <div class="adminDiv">
            검색 옵션
            <select name="select" id="search_select">
              <option value="all" selected>전체</option>
              <option value="title">제목</option>
              <option value="content">내용</option>
              <option value="id">작성자아이디</option>
            </select>
            <input
              type="text"
              name="keyword"
              id="search_keyword"
              required
            />
            <input type="image" src="../img/community/search.gif" />
          </div>
        </form>
        <div class="adminDiv">
          정렬
          <select class="size" name="order_select" id="order_select">
            <option value="id_asc" selected>아이디 오름차순</option>
            <option value="id_desc">아이디 내림차순</option>
            <option value="reg_date_asc">등록일 오름차순</option>
            <option value="reg_date_desc">등록일 내림차순</option>
          </select>
        </div>
        <div class="adminDiv2" id="tableTitle">
          <div>목록 10건</div>
          <div>
            한페이지 행수
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
                <th>글번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>작성일</th>
              </tr>
            </thead>
            <tbody id = "adminTable">
              <c:forEach items="${list}" var="c" begin="0" end="9" varStatus="status">
                <tr onclick="location.href='<c:url value="/admin_notice_view"/>?idx=${c.noticeIdx}';"
                    style="cursor: pointer" >
                  <td>${status.count}</td>
                  <td>${c.noticeTitle}</td>
                  <td>${c.noticeMemberId}</td>
                  <td><fmt:formatDate pattern="yyyy-MM-dd" value="${c.noticeDate}"/></td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>

        <div class="pageNav adminDiv2">
          <div></div>
          <div>
            <a href="/admin_notice?page=1">처음</a>
            <a href="/admin_notice?page=1">이전</a>
            <a href="/admin_notice?page=1">1</a>
            <a href="/admin_notice?page=2">2</a>
            <a href="/admin_notice?page=3">3</a>
            <a href="/admin_notice?page=2">다음</a>
            <a href="/admin_notice?page=3">마지막</a>
          </div>
          <div><a href="<c:url value="/admin_notice_write"/>">공지글 쓰기</a></div>
        </div>
      </div>
    </div>

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
          <span
            >회사 : 코딩강사 &nbsp; 주소 : 서울특별시 중구 명동 세종대로 110
            &nbsp; 대표 : 홍길동 <br />
            고객지원 : 010-2222-3333, FAX : 070-888-5555, EMAIL :
            support@gmail.com, 사업자등록번호 : 100-02-00033, 통신판매업 :
            제1111-경기-00000호<br />COPYRIGHT(C) 2021 CODINGGANSA. ALL RIGHT
            RESERVED.</span
          >
        </div>
        <div>
          <img src="/img/mf-icon01.png" alt="" />
          <img src="/img/mf-icon02.png" alt="" />
          <img src="/img/mf-icon03.png" alt="" />
          <img src="/img/mf-icon04.png" alt="" />
        </div>
      </div>
    </div>

    <script>
      // back to top 기능
      $(document).ready(function () {
        $(window).scroll(function () {
          if ($(this).scrollTop() > 50) {
            console.log("fadeIn");
            $("#back-to-top").fadeIn();
          } else {
            console.log("fadeOut");
            $("#back-to-top").fadeOut();
          }
        });
        // scroll body to 0px on click
        $("#back-to-top").click(function () {
          console.log("click");
          $("#back-to-top").tooltip("hide");
          $("body,html").animate(
            {
              scrollTop: 0,
            },
            500
          );
          return false;
        });
        $("#back-to-top").tooltip("show");
      });
    </script>
