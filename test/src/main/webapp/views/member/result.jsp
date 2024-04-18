<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원아이디 찾기</title>

  <link rel="stylesheet" href="<c:url value="/css/member/idFind.css"/>">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
  <div class="main">
      <table>
        <tr>
          <td>${msg}</td>
        </tr>
        <tr>
          <td></td>
        </tr>
        <tr style="align-content: center">
          <td>${result}입니다.</td>
        </tr>
      </table>
      <div><input type="image" src="<c:url value="/img/member/btn_close.gif"/>" onclick="window.close()"></div>
  </div>
</body>
</html>