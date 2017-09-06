<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">

<title>Observation System Status</title>

<jsp:include page="../common/import.jsp"></jsp:include>

<style>
    .box .longer {
        width: 150px;
    }

    .box .split {
        margin-right: 10px;
    }

    .crtinfo .innerblock {
        height: 400px;
    }

    .weathericon {
        background-image: url('<%=basePath%>u/img/weather.png');
        width: 30px;
        height: 30px;
        display: inline-block;
    }

    .temp {
        font-size: 44px;
        color: #2d76b6;
    }

    .temp-stc {
        font-size: 36px;
        color: #2d76b6;
    }

    .weatherinfo {
        height: 30px;
        line-height: 30px;
        float: left;
    }

    time_wrapper {
        width: 265px;
        height: 40px;
        margin-bottom: 6px;
    }

    .time_wrapper .locale {
        display: inline-block;
        font-size: 16px;
        font-weight: bold;
        position: relative;
        top: -5px;
        padding-left: 10px;
        width: 40px;
    }

    .time_wrapper .date {
        display: inline-block;
        font-size: 32px;
        font-weight: bold;
        padding-left: 15px;
    }

    .time_wrapper .second {
        display: inline-block;
        font-size: 16px;
        font-weight: normal;
    }

    .time_wrapper .calender_wrapper {
        display: inline-block;
        font-size: 12px;
        font-weight: normal;
        margin-left: 20px;
    }

    .time_wrapper .week {
        display: block;
        font-weight: normal;
    }

    .time_wrapper .calendar {
        display: block;
        font-weight: bold;
    }

    .connectbtn {
        width: 160px;
    }

    .loaddata button {
        width: 80px;
    }

    .antenna table {
        text-align: center;
        margin-bottom: 0px;
    }

    .antenna input[type="text"] {
        height: 30px;
        font-size: 12px;
        width: 150px;
        margin: auto;
    }

    .execlist {
        height: 350px;
    }

</style>
<body>
<section class="container wrapper">
    <div class="row">
        <div class="col-lg-3">
            <div class="outterblock crtinfo">
                <!-- title -->
                <div class="title">Current Info</div>
                <!-- content -->
                <div class="innerblock">
                    <div class="box">
                        <h3 class="box_title">Telescope Status<span class="blank"><a href="#">0.Normal</a></span></h3>
                        <div class="content">
                        </div>
                    </div>
                    <div class="box">
                        <h3 class="box_title">Weather</h3>
                        <div class="content">
                            <table style="width: 100%">
                                <tr>
                                    <td rowspan="2">
                                        <span class="temp">28</span>
                                        <span class="temp-stc">℃</span>
                                    </td>
                                    <td>
                                        <ul class="list-inline">
                                            <li>
                                                <div class="weathericon"></div>
                                            </li>
                                            <li>
                                                <div class="weatherinfo">Sunny</div>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-globe"></span>Opacity: 80%</td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-random"></span> E to NE &lt;12km/h</td>
                                    <td><span class="glyphicon glyphicon-leaf"></span>HR:<span
                                            style="margin-left: 30px;"></span> 80%
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="box">
                        <h3 class="box_title">Time</h3>
                        <div class="content">
                            <div class="time_wrapper" id="time_LST">
                                <div class="locale">LST</div>
                                <div class="date">14:22</div>
                                <div class="second">35</div>
                                <div class="calender_wrapper">
                                    <div class="week">Saturday</div>
                                    <div class="calendar">2016/6/2</div>
                                </div>
                            </div>
                            <div class="time_wrapper" id="time_UTC">
                                <div class="locale">UTC</div>
                                <div class="date">14:22</div>
                                <div class="second">35</div>
                                <div class="calender_wrapper">
                                    <div class="week">Saturday</div>
                                    <div class="calendar">2016/6/2</div>
                                </div>
                            </div>
                            <div class="time_wrapper" id="time_HST">
                                <div class="locale">HST</div>
                                <div class="date">14:22</div>
                                <div class="second">35</div>
                                <div class="calender_wrapper">
                                    <div class="week">Saturday</div>
                                    <div class="calendar">2016/6/2</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-9">
            <div class="row">
                <div class="col-lg-12">
                    <div class="outterblock">
                        <!-- title -->
                        <div class="title">General Control</div>
                        <!-- content -->
                        <div class="innerblock">
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="box">
                                        <h3 class="box_title">Connection</h3>
                                        <div class="content">
                                            <ul class="list-inline">
                                                <li><span class="glyphicon glyphicon-flash"></span></li>
                                                <li>
                                                    <button class="btn btn-default connectbtn" type="button">
                                                        Disconnect
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="box">
                                        <h3 class="box_title">MSB Loading</h3>
                                        <div class="content loaddata">
                                            <ul class="list-inline">
                                                <li>
                                                    <button class="btn btn-default" type="button">From File</button>
                                                </li>
                                                <li>
                                                    <button class="btn btn-default" type="button">From DB</button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="box">
                                        <h3 class="box_title">User Management</h3>
                                        <div class="content">
                                            <ul class="list-inline">
                                                <li>
                                                    <div style="display: inline-block;  padding-left: 10px; font-size: 14px;">
                                                        <span class="glyphicon glyphicon-user"></span>
                                                        <label style="width: 100px; overflow: hidden;"><c:out
                                                                value="${sessionScope.currentUser.username}"></c:out></label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <button class="btn btn-default" type="button" id="userinfo">User
                                                        Info
                                                    </button>
                                                </li>
                                                <li>
                                                    <div class="dropdown">
                                                        <button class="btn btn-default dropdown-toggle"
                                                                type="button" id="controlMenu" data-toggle="dropdown">
                                                            Control <span class="caret"></span>
                                                        </button>
                                                        <ul class="dropdown-menu" role="menu"
                                                            aria-labelledby="controlMenu">
                                                            <li role="presentation"><a role="menuitem"
                                                                                       tabindex="-1"
                                                                                       href="javascript:showModelUsermanage()">User
                                                                Manage</a></li>
                                                            <li role="presentation"><a role="menuitem"
                                                                                       tabindex="-1"
                                                                                       href="javascript:showModelTimeslotmanage()">TimeSlot
                                                                Manage</a></li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li>
                                                    <button class="btn btn-default" type="button" onclick="loginout()">
                                                        Login Out
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="outterblock">
                        <!-- title -->
                        <div class="title">Antenna Status</div>
                        <!-- content -->
                        <div class="innerblock antenna">
                            <table class="table table-striped table-hover " style="height: 190px;">
                                <tr>
                                    <th>&nbsp;</th>
                                    <th>RA</th>
                                    <th>DEC</th>
                                    <th>AZ</th>
                                    <th>EL</th>
                                </tr>
                                <tr>
                                    <th>Antenna</th>
                                    <td><input type="text" class="form-control" aria-label="..." value="13.256412"
                                               readonly="true"></td>
                                    <td><input type="text" class="form-control" aria-label="..." value="13.256412"
                                               readonly="true"></td>
                                    <td><input type="text" class="form-control" aria-label="..." value="13.256412"
                                               readonly="true"></td>
                                    <td><input type="text" class="form-control" aria-label="..." value="13.256412"
                                               readonly="true"></td>
                                </tr>
                                <tr>
                                    <th>Source</th>
                                    <td><input type="text" class="form-control" aria-label="..." value="13.256412"
                                               readonly="true"></td>
                                    <td><input type="text" class="form-control" aria-label="..." value="13.256412"
                                               readonly="true"></td>
                                    <td><input type="text" class="form-control" aria-label="..." value="13.256412"
                                               readonly="true"></td>
                                    <td><input type="text" class="form-control" aria-label="..." value="13.256412"
                                               readonly="true"></td>
                                </tr>
                                <tr>
                                    <th>Error</th>
                                    <td><input type="text" class="form-control" aria-label="..."
                                               value="13.256412(+3.55%)" readonly="true"></td>
                                    <td><input type="text" class="form-control" aria-label="..."
                                               value="13.256412(+3.55%)" readonly="true"></td>
                                    <td><input type="text" class="form-control" aria-label="..."
                                               value="13.256412(+3.55%)" readonly="true"></td>
                                    <td><input type="text" class="form-control" aria-label="..."
                                               value="13.256412(+3.55%)" readonly="true"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-lg-12">
            <div class="outterblock">
                <!-- title -->
                <div class="title">Execution List</div>
                <!-- content -->
                <div class="innerblock">
                    <div class="execlist pre-scrollable">
                        <table class="table">
                            <tr>
                                <th>MSB ID</th>
                                <th>Proposal ID</th>
                                <th>Rate</th>
                                <th>Status</th>
                                <th>Repeat Count</th>
                                <th>Observed Count</th>
                                <th>Estimated Time</th>
                                <th>Observed time</th>
                                <th>Wind Speed</th>
                                <th>Humidity</th>
                                <th>Opacity</th>
                            </tr>
                            <tr>
                                <td>m001</td>
                                <td>p001</td>
                                <td>Observing</td>
                                <td>6</td>
                                <td>2</td>
                                <td>12:00</td>
                                <td>4:00</td>
                                <td>&lt;6m/s</td>
                                <td>&lt;80%</td>
                                <td>&lt;80%</td>
                                <td>&lt;70%</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>Progress:</td>
                                <td colspan="9">
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success" role="progressbar"
                                             aria-valuenow="33" aria-valuemin="0" aria-valuemax="100"
                                             style="width: 33%;">33%
                                        </div>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>m002</td>
                                <td>p001</td>
                                <td>Observing</td>
                                <td>6</td>
                                <td>3</td>
                                <td>12:00</td>
                                <td>6:00</td>
                                <td>&lt;6m/s</td>
                                <td>&lt;80%</td>
                                <td>&lt;80%</td>
                                <td>&lt;70%</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>Progress:</td>
                                <td colspan="9">
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success" role="progressbar"
                                             aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
                                             style="width: 50%;">50%
                                        </div>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>m003</td>
                                <td>p001</td>
                                <td>Observing</td>
                                <td>6</td>
                                <td>3</td>
                                <td>12:00</td>
                                <td>6:00</td>
                                <td>&lt;6m/s</td>
                                <td>&lt;80%</td>
                                <td>&lt;80%</td>
                                <td>&lt;70%</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>Progress:</td>
                                <td colspan="9">
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success" role="progressbar"
                                             aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
                                             style="width: 50%;">50%
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="outterblock">
                <!-- title -->
                <div class="title">Console</div>
                <!-- content -->
                <div class="innerblock">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#all"
                                                                  aria-controls="all" role="tab"
                                                                  data-toggle="tab">All</a></li>
                        <li role="presentation"><a href="#sys"
                                                   aria-controls="sys" role="tab" data-toggle="tab">System</a></li>
                        <li role="presentation"><a href="#atn"
                                                   aria-controls="atn" role="tab" data-toggle="tab">Antenna</a></li>
                        <li role="presentation"><a href="#atn"
                                                   aria-controls="atn" role="tab" data-toggle="tab">New filter</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="all">
								<textarea style="resize: none; margin-top: 10px; " readonly="true" class="form-control"
                                          rows="6" editable="false">Scheduling MSB006 to 2016/5/31 8:00-10:00
Scheduling MSB007 to 2016/5/31 8:00-10:00
Scheduling MSB008 to 2016/5/31 8:00-10:00
								</textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="modal fade" id="modal_show" role="basic" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px; ">
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
<script>
    function showModel(src, title) {
        var str = '<iframe height="500px" width="770px"  frameborder="0" '
            + 'seamless ="seamless" scrolling ="yes" src="' + src + '">'
            + '</iframe>';
        $('#modal_show .modal-title').html(title);
        $('#modal_show .modal-body').html(str);
        $('#modal_show').modal('show');
    }

    function showModelPwdChange() {
        showModel('user/changepwdpage', 'Password Changing');
    }

    function showModelUsermanage() {
        showModel('user/usermanage', 'User Manage');
    }

    function showModelTimeslotmanage() {
        showModel('sysstatus/timeslotmanage', 'Time Slot Manage');
    }

    function refreshTime() {
        var field = ["LST", "UTC", "HST"];
        var od = new Date();
        var date_field = [
            od,
            new Date(od.getTime() + od.getTimezoneOffset() * 60 * 1000),
            new Date(od.getTime() + od.getTimezoneOffset() * 60 * 1000
                - 36000000)]
        for (i in field) {
            var d = date_field[i];
            var hour = format(d.getHours());
            var minute = format(d.getMinutes());
            var sec = format(d.getSeconds());
            var week = getWeekday(d.getDay());
            var calendar = d.getFullYear() + '/' + format(d.getMonth() + 1)
                + '/' + format(d.getDate());
            $('#time_' + field[i] + ' .date').html(hour + ':' + minute);
            $('#time_' + field[i] + ' .second').html(sec);
            $('#time_' + field[i] + ' .week').html(week);
            $('#time_' + field[i] + ' .calendar').html(calendar);
        }
    }

    function format(arg) {
        return arg < 10 ? '0' + arg : arg;
    }

    function getWeekday(arg) {
        switch (arg) {
            case 0:
                return "Sunday";
            case 1:
                return "Monday";
            case 2:
                return "Tuesday";
            case 3:
                return "Wednesday";
            case 4:
                return "Thursday";
            case 5:
                return "Friday";
            case 6:
                return "Saturday";
        }
    }

    $(document)
        .ready(
            function () {
                refreshTime();
                setInterval(refreshTime, 1000);

                var str = '<table class="table table-striped" style="width:300px">';
                str += '<tr><th>User name:</th><td>${sessionScope.currentUser.username}</td></tr>';
                str += '<tr><th>Create time:</th><td>${sessionScope.currentUser.createtime}</td></tr>';
                str += '<tr><th>Last login time:</th><td>${sessionScope.currentUser.lastlogintime}</td></tr>';
                str += '<tr><th>Status:</th><td>${sessionScope.currentUser.status}</td></tr>';
                str += '<tr><th>Role:</th><td>${sessionScope.currentUser.role}</td></tr>';
                str += '</table>';
                str += '<a class="btn default" href="javascript:showModelPwdChange()">Change Password</a>';
                $('#userinfo')
                    .popover(
                        {
                            trigger: 'focus',
                            placement: 'left',
                            html: true,
                            title: '${sessionScope.currentUser.username} info:',
                            content: str
                        });
            });

    function loginout() {
        window.location.href = "user/loginout";
    }

</script>
</html>
