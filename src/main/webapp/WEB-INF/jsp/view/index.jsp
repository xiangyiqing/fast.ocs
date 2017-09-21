<%@ page language="java" pageEncoding="utf-8" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">

<title>FAST Observation Management System</title>
<jsp:include page="../common/import.jsp"></jsp:include>

</head>
<style>
    body {

    }

    .index {
        width: 640px;
        min-height: 350px;
        box-shadow: 0px 0px 5px #BBB;
        border-radius: 5px;
        overflow: hidden;
        background-color: #fff;
        margin: 0 auto;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -239px;
        margin-left: -318px;
    }

    .index-head {
        margin: 0 auto;
        padding-top: 5px;
        padding-left: 10px;
        height: 80px;
        background-color: #009DD9;
    }

    .head-title {
        color: #fff;
        font-size: 18px;
        padding-top: 25px;
        padding-left: 10px;
    }

    .menu {
        width: 640px;
        margin-left: 45px;
    }

    .menu a {
        display: inline-block;
        width: 123px;
        height: 123px;
        border-radius: 4px;
    }

    .menu a:hover {
        box-shadow: 0px 0px 30px #009DD9;
        transition: all 0.3s linear 0s;
    }

    #icon_title {
        width: 500px;
        margin: 0px auto;
        margin-top: 30px;
        text-align: center;
        font-size: 18px;
        color: #555;
    }

    #background_div {
        position: absolute;
        width: 100%;
        height: 100%;
        overflow: hidden;
        z-index: -1
    }
</style>
<body>
<div id="background_div" class="background_div">
    <img src="<%=basePath%>u/img/login_bg_0.jpg" width="100%"/>
</div>
<div class="index">
    <div class="index-head">
        <div class="head-title">FAST Observation Management System</div>
    </div>
    <div style="padding-top: 55px;">
        <ul class="list-inline menu">
            <li><a target="_blank" href="<%=basePath%>sysstatus"
                   onmouseenter="iconswitch(1)"><img
                    src="<%=basePath%>u/img/index_sys.png"
                    alt="Observation System Status" class="img-thumbnail"></a></li>
            <li><a target="_blank" href="<%=basePath%>msb"
                   onmouseenter="iconswitch(2)"><img
                    src="<%=basePath%>u/img/index_msb.png"
                    alt="MSB Schedule Display Panel" class="img-thumbnail"></a></li>
            <li><a target="_blank" href="<%=basePath%>constellation"
                   onmouseenter="iconswitch(3)"><img
                    src="<%=basePath%>u/img/index_constellation.png"
                    alt="Constellation Panel" class="img-thumbnail"></a></li>
            <li><a target="_blank" href="<%=basePath%>visualize"
                   onmouseenter="iconswitch(4)"><img
                    src="<%=basePath%>u/img/index_visualize.png"
                    alt="Visualization Panel" class="img-thumbnail"></a></li>
        </ul>
    </div>
    <div>
        <div id="icon_title"></div>
    </div>
</div>

<div class="modal fade" id="modal_changepwd" role="basic" aria-hidden="true">
    <div class="modal-dialog" style="width: 700px; ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    Password Changing
                </h4>
            </div>
            <div class="modal-body">
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    $(document).ready(function () {
        $('.menu a').bind('mouseleave', function () {
            iconclearinvoke();
        });

        if ('${sessionScope.currentUser.status}' == '2') {
            showModelPwdChange();
        }
    });
    var timeoutID = null;

    function iconswitch(arg) {
        var str = "";
        switch (arg) {
            case 1: {
                str = "ObservationMapper System Status";
                break;
            }
            case 2: {
                str = "MSB Schedule Display Panel";
                break;
            }
            case 3: {
                str = "Constellation Panel";
                break;
            }
            case 4: {
                str = "Visualization Panel";
                break;
            }
        }
        $("#icon_title").html(str);
        $("#icon_title").fadeIn(300);
        if (timeoutID != null) {
            clearTimeout(timeoutID);
        }
    }

    function iconclearinvoke() {
        timeoutID = setTimeout("iconclear()", 1000);
    }

    function iconclear() {
        $("#icon_title").fadeOut(800, function () {
            $("#icon_title").html('');
        });
    }

    function showModelPwdChange() {
        var str = '<iframe height="490px" width="670px"  frameborder="0" '
            + 'seamless ="seamless" scrolling ="no" src="user/changepwdpage">'
            + '</iframe>';
        $('#modal_changepwd .modal-body').html(str);
        $('#modal_changepwd').modal('show');
    }

</script>
</html>