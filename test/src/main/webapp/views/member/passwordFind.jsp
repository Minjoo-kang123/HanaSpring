<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

  <link rel="stylesheet" href="<c:url value="/css/member/passwordFind.css"/>">
  <div class="main">
    <form action="<c:url value="/member/passwordFindimpl"/>" name="passwordFindForm">
      <table>
        <tr>
          <td colspan="2">비밀번호 찾기</td>
        </tr>
        <tr>
          <td colspan="2">비밀번호를 잊어버리셨나요?
            <br>회원님의 성명과 아이디,이메일을 입력하여 주세요.</td>
        </tr>
        <tr>
          <td style="width: 20%;">
            <img src="../img/member/txt_join1.gif">
            <img src="../img/member/txt_login_01.gif">
            <img src="../img/member/txt_email.gif">
          </td>
          <td style="width: 80%;">
            <input type="text" name="userName">
            <input type="text" class="idText" name="userID">
            <input type="text" class="emailText" name="userEmail">
          </td>
        </tr>
      </table>
      <div><input type="image" src="<c:url value="/img/member/btn_confirm.gif"/>" onclick="submit()"></div>
      <div><input type="image" src="<c:url value="/img/member/btn_close.gif"/>" onclick="window.close()"></div>
    </form>
  </div>
  <script>
    function submit() {
      var form = document.passwordFindForm;
    
      form.submit();
    }
  </script>
