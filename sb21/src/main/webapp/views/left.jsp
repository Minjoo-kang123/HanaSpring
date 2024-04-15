<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
  let left = {
    init: function () {
      $('#btn_board_add').click(()=>{
        if('${sessionScope.id}' == '' || '${sessionScope.id}' == null){
          alert("No login")
          let next = $('#btn_board_add').attr();
          $('#btn_board_add').removeAttr('href');
        }

      })
    }
  };
  $(function () {
    left.init();
  });
</script>
<ul class="nav nav-pills flex-column">
  <li class="nav-item">
    <a id="btn_board_add" class="nav-link" href="<c:url value="/board/add"/>">Board add</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value="/board/get"/>">Board get</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value="/weather"/>">Weather</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value="/chat"/>">xcaht</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value="/pic"/>">Pic</a>
  </li>
</ul>
