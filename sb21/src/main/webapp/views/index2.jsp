
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Bootstrap 4 Website Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <%-- KAKAO Map API   --%>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b91233131542ddc771208f56029a6d98"></script>

    <%-- HighChart API   --%>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-3d.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <%-- Custom API   --%>
    <script src="<c:url value="/js/0327.js" />"></script>

    <%-- Web Socket Lib    --%>
    <script src="<c:url value="/webjars/sockjs-client/sockjs.min.js"/>"></script>
    <script src="<c:url value="/webjars/stomp-websocket/stomp.min.js"/>"></script>
    <style>
        .fakeimg {
            height: 200px;
            background: #aaa;
        }
    </style>

    <script>
        let arr1 = [];
        let arr2 = [];
        let websocket = {
            id:'',
            stompClient:null,
            msg:'',
            init:function(){
                $('notice_del').click(()=>{
                    arr1 = [];
                    arr2 = [];
                })

                let socket = new SockJS('${serverurl}/wsa');
                this.stompClient = Stomp.over(socket);

                this.stompClient.connect({}, function(frame) {
                    this.subscribe('/send3',function (msg){
                        //메시가 왔음을 알림
                        this.msg = JSON.parse(msg.body).content1;
                        // 메세지를 변수에 저장함\function appendMessage(msgData) {
                        let messageList = $("#drop");
                        messageList.append(
                            "<div><a class='dropdown-item d-flex align-items-center'>"
                            +   "<div class='font-weight-bold'>"
                            +       "<div class='text-truncate'>"+JSON.parse(msg.body).content1+"</div>"
                            +    "</div>"
                            + "</a></div>"
                        );

                    })
                });
            }
        };
        $(function(){
            websocket.init();
        });
    </script>
</head>
<body>

<div class="jumbotron text-center" style="margin-bottom:0">
    <h1>HTML5 & JavaScript</h1>
</div>
<c:choose>
    <c:when test="${sessionScope.id == null}">
        <ul class="nav justify-content-end">
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-bell fa-fw"></i>
                    <!-- Counter - Alerts -->
                    <span class="badge badge-danger badge-counter"></span>
                </a>
                <!-- Dropdown - Alerts -->
                <div id = "drop" class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                     aria-labelledby="alertsDropdown">
                    <h6 class="dropdown-header">
                        Alerts Center
                    </h6>

                    <button type="button" class="dropdown-item text-center small text-gray-500" id = "notice_del">Delete All</button>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/login" />">LOGIN</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/register" />">REGISTER</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">ABOUT US</a>
            </li>
        </ul>
    </c:when>
    <c:otherwise>
        <ul class="nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/cust/detail"/>?id=${id}">${id}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/logout" />">LOGOUT</a>
            </li>
        </ul>

    </c:otherwise>
</c:choose>


<%--Start Nav Bar--%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <a class="navbar-brand" href="<c:url value='/'/>">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/html/"/>">HTML</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/jquery/"/>">jQuery</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/ajax/"/>">Ajax</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/geo/"/>">Geo</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/chart/"/>">Chart</a>
            </li>
            <c:if test="${id != null}">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/cust/"/>">Cust</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/item/"/>">Item</a>
                </li>
            </c:if>
        </ul>
    </div>
</nav>
<%--End Nav Bar--%>

<%--Start Center Area--%>
<div class="container-fluid" style="margin-top:30px">
    <div class="row">
        <div class="col-sm-2">
            <c:choose>
                <c:when test="${left == null}">
                    <jsp:include page="left.jsp"/>
                </c:when>
                <c:otherwise>
                    <jsp:include page="${left}.jsp"/>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="col-sm-10">
            <c:choose>
                <c:when test="${center == null}">
                    <jsp:include page="center.jsp"/>
                </c:when>
                <c:otherwise>
                    <jsp:include page="${center}.jsp"/>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<%--End Center Area--%>

<%--Start Bottom Area--%>
<div class="text-center bg-dark" style="margin-bottom:0">
    <p>Footer</p>
</div>
<%--End Bottom Area--%>
</body>
</html>