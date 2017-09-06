<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">

<jsp:include page="../common/import.jsp"></jsp:include>
<script src="<%=basePath%>u/lib/validator/validator.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#changepwdForm').validator().on('submit', function (e) {
            if (e.isDefaultPrevented()) {
                //toastr.error("Password has been changed.");
            } else {
                var newpass = $("#newpwd").val();
                var oldpass = $("#oldpwd").val();
                $.post('user/changepwd', {oldpass: oldpass, newpass: newpass}, function (data) {
                    data = handleJSONResponse(data);
                    if (data == 'true') {
                        toastr.info("Password has been changed.");
                        setTimeout(function () {
                            location.reload(true);
                        }, 3000);
                    }
                });
                e.preventDefault();
            }
        });
    });
</script>
</head>
<body>
<div class="container" style="margin-top:5px;width:100%;">
    <form data-toggle="validator" role="form" id="changepwdForm">
        <div class="form-group has-feedback">
            <label for="inputoldpwd" class="control-label">Old Password</label>
            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span> <input
                    type="password"
                    pattern="^[_A-z0-9]{6,}$" maxlength="16" class="form-control"
                    id="oldpwd" placeholder="Old Password" data-remote="user/isCorrect" data-error="Password Incorrect."
                    name="oldpwd" required>
            </div>
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div class="help-block with-errors"></div>
        </div>
        <div class="form-group has-feedback">
            <label for="inputnewpwd" class="control-label">New Password</label>
            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span> <input
                    type="password"
                    pattern="^[_A-z0-9]{6,}$" maxlength="16" class="form-control"
                    id="newpwd" placeholder="New Password" required>
            </div>
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div class="help-block with-errors"></div>
        </div>
        <div class="form-group has-feedback">
            <label for="inputconfirm_newpwd" class="control-label">Confirm New Password</label>
            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span> <input
                    type="password"
                    pattern="^[_A-z0-9]{6,}$" maxlength="16" class="form-control" data-match="#newpwd"
                    id="confirm_newpwd" placeholder="Confirm New Password" required>
            </div>
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div class="help-block with-errors"></div>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary" id="submit" style="text-align:center; width: 150px;">Submit
            </button>
        </div>
    </form>
</div>
</body>
</html>