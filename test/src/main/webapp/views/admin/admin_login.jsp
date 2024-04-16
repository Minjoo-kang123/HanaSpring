

    <link rel="stylesheet" href="/css/member/login.css" />

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
            <h3>ADMIN</h3>
          </div>
          <div>
            <p><img src="/img/icon-home.png" /> > 관리자 로그인</p>
          </div>
        </div>
      </div>
    </div>

    <!-- 로그인 -->
    <div class="loginForm container text-center">
      <div class="loginSection1">
        <div><h3>관리자 로그인</h3></div>
        <div><p>The design and maintenance are excellent.</p></div>
      </div>
      <div class="loginMain">
        <form action="adminLoginAction" method="post">
          <table class="main1">
            <tr>
              <td>
                아이디 <br />
                비밀번호
              </td>
              <td>
                <input type="text" name="member_id" /> <br />
                <input type="text" name="member_pw" />
              </td>
              <td>
                <input
                  type="image"
                  class="loginImg"
                  name="submit"
                  value="submit"
                  src="../img/member/btn_login.gif"
                />
              </td>
            </tr>
          </table>
        </form>
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
