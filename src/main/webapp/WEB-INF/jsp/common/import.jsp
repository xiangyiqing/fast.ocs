<%@ page language="java" pageEncoding="utf-8" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<base href="<%=basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="shortcut icon" href="<%=basePath%>u/img/icon.ico">
<meta http-equiv="Cache-Control" content="max-age=720"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="keywords" content="FAST Observation management system">
<meta http-equiv="description" content="FAST Observation management system">

<!-- jQuery文件 -->
<script src="<%=basePath%>u/lib/jquery/jquery-3.0.0.min.js"></script>
<!-- Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="<%=basePath%>u/lib/bootstrap/css/bootstrap.min.css">
<!-- 可选的Bootstrap主题文件-->
<link rel="stylesheet" href="<%=basePath%>u/lib/bootstrap/css/bootstrap-theme.min.css">
<!-- Bootstrap 核心 JavaScript 文件 -->
<script src="<%=basePath%>u/lib/bootstrap/js/bootstrap.min.js"></script>
<!-- toastr -->
<link href="<%=basePath%>u/lib/toastr/toastr.min.css" rel="stylesheet">
<script src="<%=basePath%>u/lib/toastr/toastr.min.js"></script>
<!-- bootstrap-select -->
<link rel="stylesheet" href="<%=basePath%>u/lib/bootstrap-select/bootstrap-select.css">
<script src="<%=basePath%>u/lib/bootstrap-select/bootstrap-select.min.js"></script>
<!-- general -->
<link rel="stylesheet" href="<%=basePath%>u/css/general.css">
<script src="<%=basePath%>u/js/general.js"></script>


