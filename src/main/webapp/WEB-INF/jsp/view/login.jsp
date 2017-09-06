<%@ page language="java" pageEncoding="utf-8" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">

<title>FAST Observation Management System</title>

<jsp:include page="../common/import.jsp"></jsp:include>
<script src="<%=basePath%>u/lib/jquery/jquery.cookie.js" type="text/javascript"></script>
</head>
<style>
    body {
    }

    .signin {
        width: 500px;
        min-height: 350px;
        margin: 0 auto;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -239px;
        margin-left: -248px;
        box-shadow: 0px 0px 5px #BBB;
        border-radius: 5px;
        overflow: hidden;
        background-color: #fff;
    }

    .signin-head {
        margin: 0 auto;
        padding-top: 5px;
        padding-left: 10px;
        height: 80px;
        width: 500px;
        background-color: #009DD9;
    }

    .head-title {
        color: #fff;
        font-size: 18px;
        padding-top: 25px;
        padding-left: 10px;
    }

    .form-signin {
        max-width: 450px;
        padding: 40px 15px 15px 15px;
        margin: 0 auto;
    }

    .form-signin .checkbox {
        margin-bottom: 10px;
        padding-left: 18px;
        font-weight: normal;
    }

    .form-signin .form-control {
        position: relative;
        font-size: 16px;
        height: auto;
        padding: 10px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    .form-signin .form-control:focus {
        z-index: 2;
    }

    .form-signin button {
        border-radius: 0;
    }

    .alert {
        margin-bottom: 5px;
    }

    #background_div {
        position: absolute;
        width: 100%;
        height: 100%;
        overflow: hidden;
        z-index: -1
    }
</style>
<script type="text/javascript">
    $(document).ready(function () {
        //判断之前是否有设置cookie，如果有，则设置【记住我】选择框
        if ($.cookie('rememberMe_userName') != undefined) {
            $("#rememberMe").attr("checked", true);
            $('#username').val($.cookie('rememberMe_userName'));
        } else {
            $("#rememberMe").attr("checked", false);
        }

        //读取cookie  
        if ($('#rememberMe').is(':checked')) {
            $('#username').val($.cookie('rememberMe_userName'));
        }

        //监听【记住我】事件  
        $("#rememberMe").click(function () {
            if ($('#rememberMe').is(':checked')) {//设置cookie
                $.cookie('rememberMe_userName', $('#username').val());
            } else {//清除cookie
                $.removeCookie('rememberMe_userName');
            }
        });
    });
</script>
<body>
<div id="background_div" class="background_div">
    <img src="<%=basePath%>u/img/login_bg_0.jpg" width="100%"/>
</div>
<div class="signin">
    <div class="signin-head">
        <div class="head-title">FAST Observation Management System</div>
    </div>
    <form class="form-signin" role="form" method="post" action="<%=basePath%>user/login">
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user"></span></span>
            <input autofocus
                   type="text" class="form-control" placeholder="Username"
                   aria-describedby="basic-addon1" name="username" id="username">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-asterisk"></span></span>
            <input
                    type="password" class="form-control" placeholder="Password"
                    aria-describedby="basic-addon2" name="password">
        </div>
        <br>
        <button class="btn btn-lg btn-warning btn-block" type="submit">login</button>
        <label class="checkbox">
            <input type="checkbox" id="rememberMe">Remember me
        </label>
        <% String s = (String) request.getAttribute("message");
            if (s != null && !s.equals("")) {%>
        <div class="alert alert-danger" role="alert">${message }</div>
        <%} %>
    </form>
</div>
</body>
</html>