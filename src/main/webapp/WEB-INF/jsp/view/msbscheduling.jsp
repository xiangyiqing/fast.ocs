<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">

<title>MSB Scheduling Management Panel</title>

<jsp:include page="../common/import.jsp"></jsp:include>

<!-- jquery ui-->
<link rel="stylesheet" href="<%=basePath%>u/lib/jqueryui/jquery-ui.min.css">
<script src="<%=basePath%>u/lib/jqueryui/jquery-ui.min.js"></script>

<style>
    .box button {
        width: 70px;
        height: 30px;
        font-size: 10px;
    }

    #msbsearch button {
        height: 33px;
    }

    .cusbutton {
        width: 130px;
    }

    .movebox button {
        width: 50px;
        height: 50px;
        margin-top: 20px;
        margin-left: 13px;
    }

    .msb_wrapper {
        height: 450px;
        max-height: 450px;
        border: 1px solid #AAA;
        margin-top: 10px;
    }

    .slot_wrapper {
        height: 450px;
        max-height: 450px;
        border: 1px solid #AAA;
        margin: 10px 0px;
    }

    .solttable {
        border-left: 5px solid #009DD9;
    }

    .msbnotecursor {
        cursor: default;
    }

    .solttable tr {
        cursor: pointer;
    }

    .slottable_title {
        text-align: left;
    }

    #msbTable th {
        vertical-align: middle;
    }

    .check_status {
        display: none;
    }

    .msb_check_status {
        display: none;
    }

    #slotSelectStatus {
        margin-top: 20px;
        display: none;
    }

    #msbSearchStatus {
        margin-top: 20px;
        display: none;
    }

    #msbSelectStatus {
        margin-top: 20px;
        display: none;
    }

    .msb_selected {
    }

    .selectedSlot {
    }

    .selectSlotMSB {
    }

    #adjust_text {
        resize: none;
        margin-top: 10px;
    }

    .save_btn {
        width: 100px;
        float: right;
        margin-right: 15px;
    }

    .movetoconfrimbtn {
        margin-top: 10px;
        width: 250px;
    }

    .popover {
        max-width: 375px;
    }

    .highlight {
        transition: 1s;
        background-color: RGBA(250, 128, 114, 0.2);
    }
</style>
<body>
<section class="wrapper">
    <div class="row">
        <div class="col-lg-12">
            <div class="container wrapper outterblock">
                <!-- title -->
                <div class="title">MSB Schedule Strategy Management</div>
                <!-- content -->
                <div class="innerblock">
                    <form class="form-inline">
                        <div class="input-group-btn-inline">
                            <label for="exampleInputName2">Current strategy</label>
                            <button type="button" class="btn btn-default dropdown-toggle"
                                    data-toggle="dropdown" aria-haspopup="true" style="width: 200px;"
                                    aria-expanded="false">
                                Current Strategy <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                            <button type="button" class="btn btn-default cusbutton">Set to default</button>
                            <button type="button" class="btn btn-default cusbutton">New</button>
                            <button type="button" class="btn btn-default cusbutton">Modify</button>
                            <button type="button" class="btn btn-default cusbutton">Delete</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <!-- MSB detail -->
            <div class="container wrapper outterblock">
                <!-- title -->
                <div class="title">MSB Schedule Strategy Adjustment</div>
                <!-- content -->
                <div class="innerblock">
                    <div>
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#cs"
                                                                      aria-controls="cs" role="tab"
                                                                      data-toggle="tab"><strong>Current
                                strategy</strong></a></li>
                            <li role="presentation"><a href="#s1"
                                                       aria-controls="s1" role="tab" data-toggle="tab">Strategy 1</a>
                            </li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="cs">
                                <div class="row">
                                    <div class="col-lg-5">
                                        <!-- Prepare to schedule -->
                                        <div class="box">
                                            <h3 class="box_title">Prepare To Schedule</h3>
                                            <div class="content">
                                                <div class="input-group" id="msbsearch">
                                                    <div class="input-group-btn">
                                                        <select class="selectpicker" data-width="120px"
                                                                name="type">
                                                            <optgroup label="Proposal">
                                                                <option value="pid">Proposal Id</option>
                                                                <option value="ptit">Proposal Title</option>
                                                                <option value="ppor">Proposer</option>
                                                                <option value="prate">Rate</option>
                                                            </optgroup>
                                                            <optgroup label="MSB">
                                                                <option value="mid">MSB Id</option>
                                                                <option value="mtit">MSB Title</option>
                                                                <option value="mrc">Repeat Counts</option>
                                                                <option value="mws">Wind Speed</option>
                                                                <option value="mhd">Humidity</option>
                                                                <option value="mdn">Day or Night</option>
                                                                <option value="mat">Airtemp</option>
                                                                <option value="mop">Opacity</option>
                                                                <option value="met">Estimated Time</option>
                                                            </optgroup>
                                                        </select>
                                                    </div>
                                                    <!-- /btn-group -->
                                                    <input type="text" class="form-control"
                                                           aria-label="Condition" name="cond"
                                                           placeholder="Condition">
                                                    <div class="input-group-btn">
                                                        <select class="selectpicker" data-width="80px" name="opt">
                                                            <option value="oeq">=</option>
                                                            <option value="olt">&lt;</option>
                                                            <option value="olq">&lt;=</option>
                                                            <option value="ogt">&gt;</option>
                                                            <option value="ogq">&gt;=</option>
                                                            <option value="onot">!=</option>
                                                            <option value="olk">like</option>
                                                            <option value="onlk">not like</option>
                                                        </select>
                                                    </div>
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-default" type="button"
                                                                onclick="msbSimpleSearch()">Search
                                                        </button>
                                                        <button class="btn btn-default" type="button"
                                                                data-toggle="modal" data-target="#advancedsearch">
                                                            Advanced
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="alert alert-info" role="alert" id="msbSearchStatus">
                                                    <button type="button" class="close"
                                                            onclick="closeMSBSearchStatus()">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                    <div id="msbSearchStatus_content"></div>
                                                </div>
                                                <div class="pre-scrollable msb_wrapper">
                                                    <table class="table table-striped table-hover" id="msbTable">
                                                        <tr>
                                                            <th><span class="glyphicon glyphicon-ok-circle"></span></th>
                                                            <th>MSB ID</th>
                                                            <th>Proposal ID</th>
                                                            <th>Status</th>
                                                            <th>Repeat Count</th>
                                                            <th>Observed Count</th>
                                                            <th>Estimate Time</th>
                                                            <th>Observed Time</th>
                                                            <th>Note</th>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="alert alert-success" role="alert" id="msbSelectStatus">
                                                    <button type="button" class="close"
                                                            onclick="closeMSBSelectStatus()">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                    <div id="msbSelectStatus_content"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-1 movebox" style="padding-top: 150px;">
                                        <button class="btn btn-default" type="button" id="toPrepBtn">&lt;</button>
                                        <button class="btn btn-default" type="button" id="toSchedBtn">&gt;</button>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="box">
                                            <h3 class="box_title">Scheduled</h3>
                                            <div class="content">
                                                <div>
                                                    <ul class="list-inline">
                                                        <li>
                                                            <button class="btn btn-default" type="button"
                                                                    onclick="autoSchedule()">Auto
                                                            </button>
                                                        </li>
                                                        <li>
                                                            <button class="btn btn-default" type="button" id="revokebtn"
                                                                    onclick="revokeOperation()">Revoke
                                                            </button>
                                                        </li>
                                                        <li>
                                                            <button class="btn btn-default" type="button"
                                                                    id="movetobtn">Move to #
                                                            </button>
                                                        </li>
                                                        <li>
                                                            <button class="btn btn-default" type="button"
                                                                    onclick="eraseAll()">Erase All
                                                            </button>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="pre-scrollable slot_wrapper">
                                                    <table class="table">
                                                        <tr>
                                                            <th><span class="glyphicon glyphicon-ok-circle"></span></th>
                                                            <th>MSB ID</th>
                                                            <th>Project ID</th>
                                                            <th>Locked</th>
                                                        </tr>
                                                        <c:forEach var="s" items="${schedulesolt}">
                                                            <tr>
                                                                <td colspan="4">
                                                                    <table class="table table-striped table-hover solttable">
                                                                        <tr id="${s.id}" onclick="selectSlot(this)">
                                                                            <td width="45"><span
                                                                                    class="glyphicon glyphicon-ok check_status"></span>
                                                                            </td>
                                                                            <td colspan="2" class="slottable_title">
                                                                                <strong>${s.begintime}</strong><span
                                                                                    class="blank">→</span>&nbsp;<small>${s.endtime}</small>
                                                                            </td>
                                                                            <td><span class="blank"></span></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </table>
                                                </div>
                                                <div class="alert alert-success" role="alert" id="slotSelectStatus">
                                                    <button type="button" class="close"
                                                            onclick="closeSlotSelectStatus()">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                    <div id="slotSelectStatus_content"></div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- Adjustment Log -->
                                    <div class="col-lg-12">
                                        <div class="box">
                                            <h3 class="box_title">Adjustment Log</h3>
                                            <div class="content">
                                                <textarea id="adjust_text" readonly="true" class="form-control" rows="6"
                                                          editable="false"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <button class="btn btn-default save_btn" type="button" onclick="update()">Save
                                        </button>
                                        <button class="btn btn-default save_btn" type="button"
                                                onclick="adjustmentLog()">Refresh
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="s1">2...</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../common/msb_searchbox.jsp"></jsp:include>
</body>
<script>
    //存储所有Schedule Slot信息
    var scheduleSlot = ${scheduleSlotJson};
    //存储所有MSB信息
    var msbRepository = [];

    //获取Schedule Slot
    function getScheduleSlot(slotid) {
        for (i in scheduleSlot) {
            var s = scheduleSlot[i];
            if (s.slotid == slotid) {
                return s;
            }
        }
        return {};
    }

    //获取MSB
    function getMSB(msbid_rc) {
        for (i in msbRepository) {
            var m = msbRepository[i];
            if (m.msbid_rc == msbid_rc) {
                return m;
            }
        }
        return {};
    }

    //返回msb是否已经调度
    function hasScheduled(arg) {
        for (i in msbRepository) {
            var s = msbRepository[i];
            if (s.msbid_rc == arg && s.slotid != '') {
                return true;
            }
        }
        return false;
    }

    //渲染Schedule table
    function venderSchedule() {
        $('.solttable').find('tr:gt(0)').remove();
        for (i in msbRepository) {
            var s = msbRepository[i];
            if (s.slotid != '') {
                var parentobj = $('#' + s.slotid).parent();
                addScheduleTableRow(s, parentobj);
            }
        }
        addScheduleLocker();
    }

    function addScheduleTableRow(row, container) {
        var str = '<tr id ="' + row.msbid_rc + '" onclick="selectSlotMSB(this)">';
        str += '<td><span class="glyphicon glyphicon-ok check_status"></span></td>';
        str += '<td>' + row.msbid_rc + '</td>';
        str += '<td>' + row.propid + '</td>';
        if (bool(row.locked)) {
            str += '<td><span class="glyphicon glyphicon-lock" id="locker_' + row.msbid_rc + '"></span></td>';
        } else {
            str += '<td><span class="glyphicon glyphicon-unchecked" id="locker_' + row.msbid_rc + '"></span></td>';
        }
        str += '</tr>';
        container.append(str);
    }

    function addScheduleLocker() {
        //schedule locker
        $('span[id^="locker_"]').bind("click", event, function () {
            var id = $(this).attr('id');
            id = id.substring(id.indexOf('_') + 1, id.length);
            var msb = getMSB(id);
            //toggle
            msb.locked = setBool(!bool(msb.locked));
            if (msb.locked == '1') {
                $(this).attr('class', 'glyphicon glyphicon-lock');
            } else {
                $(this).attr('class', 'glyphicon glyphicon-unchecked');
            }
            event.stopPropagation();
            var tr = $('#' + id);
            tr.removeClass('success').removeClass('selectedSlotMSB');
            selectedSlotMSB[id] = false;
            tr.find('.check_status').hide();
            slotStatus();
            toBtnValidate();
        });
    }

    //选择Schedule table 中的slot
    function selectSlot(arg) {
        $('.selectedSlot').find('.check_status').hide();
        $('.selectedSlot').removeClass('info').removeClass('selectedSlot');
        //移除所有选择的msb
        $('.selectedSlotMSB').find('.check_status').hide();
        $('.selectedSlotMSB').removeClass('success').removeClass('selectedSlotMSB');
        selectedSlotMSB = {};
        $('#slotSelectStatus').attr('class', 'alert alert-info');

        var chbox = $(arg).find('.check_status');
        if (chbox.css('display') != 'none') {
            $(arg).removeClass('info').removeClass('selectedSlot');
            chbox.hide();
        } else {
            $(arg).addClass('info').addClass('selectedSlot');
            chbox.show();
        }
        slotStatus();
        $('#toPrepBtn').attr('disabled', true);
        $('#toSchedBtn').attr('disabled', false);
    }

    var selectedSlotMSB = {};

    //选择Schedule table 中的msb
    function selectSlotMSB(arg) {
        var msbid_rc = $(arg).attr('id');
        var msb = getMSB(msbid_rc);
        if (bool(msb.locked)) {
            return;
        }
        $('.selectedSlot').find('.check_status').hide();
        $('.selectedSlot').removeClass('info').removeClass('selectedSlot');
        $('#slotSelectStatus').attr('class', 'alert alert-success');
        var chbox = $(arg).find('.check_status');
        if (chbox.css('display') != 'none') {
            $(arg).removeClass('success').removeClass('selectedSlotMSB');
            selectedSlotMSB[msbid_rc] = false;
            chbox.hide();
        } else {
            $(arg).addClass('success').addClass('selectedSlotMSB');
            selectedSlotMSB[msbid_rc] = true;
            chbox.show();
        }
        slotStatus();
        toBtnValidate();
    }

    //渲染Schedule table中的选择状态
    function slotStatus() {
        $('#slotSelectStatus').show();
        var str = 'Selected: ';
        //slot
        $('.selectedSlot').each(function () {
            str += $(this).attr('id') + ' ';
        });
        //msb
        $('#movetobtn').attr("disabled", true);
        for (key in selectedSlotMSB) {
            if (selectedSlotMSB[key]) {
                str += key + ' ';
                $('#movetobtn').attr("disabled", false);
            }
        }
        $('#slotSelectStatus_content').html(str);
    }

    //将Schedule Slot 中选择的MSB去调度
    function toPrep() {
        for (key in selectedSlotMSB) {
            if (selectedSlotMSB[key]) {
                $('#' + key).remove();
                var m = getMSB(key);
                var str = '';
                str += '<tr id="msb_' + m.msbid_rc + '" msbid="' + m.msbid_rc + '" onclick="selectMSB(this)">';
                str += '<td class="pointercursor"><span class="glyphicon glyphicon-ok msb_check_status"></span></td>';
                str += '<td class="pointercursor">' + m.msbid_rc + '</td>';
                str += '<td>' + m.propid + '</td>';
                str += '<td>' + msbObservationStatus(m.status) + '</td>';
                str += '<td>' + m.repeatcounts + '</td>';
                str += '<td>' + m.observedcounts + '</td>';
                str += '<td>' + m.estimatedtime + '</td>';
                str += '<td>' + m.observedtime + '</td>';
                str += '<td>' + '' + '</td>';
                str += '</tr>';
                $('#msbTable').append(str);
                var t = getMSB(key);
                recordOperation(m.msbid_rc, t.slotid, 'top');
                t.slotid = '';
            }
        }
        closeSlotSelectStatus();
        toBtnValidate();
    }

    //将选择的MSB调度到选择的Slot中
    function toSched() {
        var slot = $('.selectedSlot').attr('id');
        if (slot != '') {
            for (key in selectedMSB) {
                if (selectedMSB[key]) {
                    $('#msb_' + key).remove();
                    var s = getMSB(key);
                    addScheduleTableRow(s, $('.selectedSlot').parent());
                    getMSB(key).slotid = slot;
                    recordOperation(key, slot, 'tos');
                }
            }
            closeMSBSelectStatus();
            toBtnValidate();
            addScheduleLocker();
        }
    }

    //取消Schedule Slot中所有选择
    function closeSlotSelectStatus() {
        $('#slotSelectStatus').hide();
        selectedSlotMSB = {};
        $('.selectedSlot').find('.check_status').hide();
        $('.selectedSlot').removeClass('info').removeClass('selectedSlot');
        $('.selectedSlotMSB').find('.check_status').hide();
        $('.selectedSlotMSB').removeClass('success').removeClass('selectedSlotMSB');
        //disable moveto button
        $('#movetobtn').attr("disabled", true);
    }

    //msb 简单搜索
    function msbSimpleSearch() {
        var searchCond = achieveData('#msbsearch');
        fetchMSBs(searchCond, function (arg) {
            revenderMSB(arg);
            globalSearchCond = searchCond;
            addSearchStatus('msbSearchStatus');
        });

    }

    //msb 高级搜索
    function msbAdvancedSearch() {
        var searchCond = achieveData('#search_table tr[id!=\'srch_row\']');
        fetchMSBs(searchCond, function (arg) {
            revenderMSB(arg);
            globalSearchCond = searchCond;
            addSearchStatus('msbSearchStatus');
        });
        $('#advancedsearch').modal('hide');
    }

    //取消msb table中所有选择
    function closeMSBSearchStatus() {
        $('#msbSearchStatus').hide();
        globalSearchCond = '';
        fetchMSBs('', function (arg) {
            revenderMSB(arg);
        });
    }

    //获取msb信息
    function fetchMSBs(srch_arg, callback) {
        $.post('<%=basePath%>msb/adjust/msbsearch', {search: srch_arg}, function (json, status) {
            json = handleJSONResponse(json);
            callback(json);
        });
    }

    var isFirstHighlight = true;
    var lastArg = null;

    //渲染msb table
    function revenderMSB(arg) {
        if (arg == null) {
            arg = lastArg;
        } else {
            lastArg = arg;
        }
        var str = '';
        var highlightElems = new Array();
        for (i in arg) {
            var m = arg[i];
            if (hasScheduled(m.msbid_rc)) {
                highlightElems.push(m.msbid_rc);
                continue;
            }
            var selected = '', selected2 = '';
            if (selectedMSB[m.msbid_rc]) {
                selected = 'class="success msb_selected"';
                selected2 = 'style="display:inline;"';
            }
            str += '<tr id="msb_' + m.msbid_rc + '" msbid="' + m.msbid_rc + '" onclick="selectMSB(this)" ' + selected + '>';
            str += '<td class="pointercursor"><span class="glyphicon glyphicon-ok msb_check_status" ' + selected2 + '></span></td>';
            str += '<td class="pointercursor">' + m.msbid_rc + '</td>';
            str += '<td>' + m.propid + '</td>';
            str += '<td>' + msbObservationStatus(m.status) + '</td>';
            str += '<td>' + m.repeatcounts + '</td>';
            str += '<td>' + m.observedcounts + '</td>';
            str += '<td>' + m.estimatedtime + '</td>';
            str += '<td>' + m.observedtime + '</td>';
            str += '<td> <span class="glyphicon glyphicon-tags msbnotecursor" data-toggle="tooltip" data-placement="left" title="' + m.note + '"></td>';
            str += '</tr>';
            highlightElems.push("msb_" + m.msbid_rc);
        }
        $('#msbTable tr:gt(0)').remove();
        $('#msbTable').append(str);
        //highlight
        if (!isFirstHighlight) {
            for (i in highlightElems) {
                highlight(highlightElems[i]);
            }
        } else {
            isFirstHighlight = false;
        }

        $('[data-toggle="tooltip"]').tooltip();
    }

    //选择msb table中msb
    function selectMSB(arg) {
        var msbid_rc = $(arg).attr('msbid');
        var chbox = $(arg).find('.msb_check_status');
        if (chbox.css('display') != 'none') {
            $(arg).removeClass('success').removeClass('msb_selected');
            selectedMSB[msbid_rc] = false;
            chbox.hide();
        } else {
            $(arg).addClass('success').addClass('msb_selected');
            selectedMSB[msbid_rc] = true;
            chbox.show();
        }
        msbStatus();
        toBtnValidate();
    }

    var selectedMSB = {};

    //渲染msb table中选择的msb
    function msbStatus() {
        $('#msbSelectStatus').show();
        var str = 'Selected: ';
        for (key in selectedMSB) {
            if (selectedMSB[key]) {
                str += key + ' ';
            }
        }
        $('#msbSelectStatus_content').html(str);
    }

    //撤销msb table中选择的msb
    function closeMSBSelectStatus() {
        $('#msbSelectStatus').hide();
        selectedMSB = {};
        $('.msb_selected').find('.msb_check_status').hide();
        $('.msb_selected').removeClass('success').removeClass('msb_selected');
        ;
    }

    //控制to button的状态
    function toBtnValidate() {
        $('#toPrepBtn').attr('disabled', true);
        $('#toSchedBtn').attr('disabled', true);
        if ($('.msb_selected').length > 0 && $('.selectedSlot').length > 0) {
            $('#toSchedBtn').attr('disabled', false);
        }
        if ($('.selectedSlotMSB').length > 0) {
            $('#toPrepBtn').attr('disabled', false);
        }
    }

    //Schedule 日志
    function adjustmentLog() {
        var str = '';
        $('#adjust_text').val(str);
        for (i in msbRepository) {
            var m = msbRepository[i];
            var sslot = m.slotid;
            var scont = 'none';
            var slot = null;
            if (m.slotid != '' && (slot = getScheduleSlot(m.slotid)) != null) {
                scont = '[' + slot.begintime + ' , ' + slot.endtime + ']';
            }
            str += 'MSB: ' + m.msbid + '(' + m.msbid_rc + ') is set to ' + scont + '.\n';
        }
        $('#adjust_text').val(str);
    }

    //撤销所有Schedule
    function eraseAll() {
        for (i in msbRepository) {
            var m = msbRepository[i];
            m.slotid = '';
        }
        revenderMSB(msbRepository);
        $('.solttable').each(function () {
            $(this).find('tr:gt(0)').remove();
        });
        closeSlotSelectStatus();
        closeMSBSelectStatus();
        toBtnValidate();
    }

    //保存调度
    function update() {
        var result = [];
        for (i in msbRepository) {
            var m = msbRepository[i];
            result.push({id: m.id, slotid: m.slotid, locked: m.locked});
        }
        var str = JSON.stringify(result);
        $.post('<%=basePath%>msb/adjust/update', {result: str}, function (json, status) {
            json = handleJSONResponse(json);
        });
    }

    var optArrays = [];
    var currentOpt = -1;

    //撤销操作
    function recordOperation(left, right, opt) {
        optArrays[++currentOpt] = {left: left, right: right, opt: opt};
        if (currentOpt >= 0) {
            $('#revokebtn').attr("disabled", false);
        }
    }

    function revokeOperation() {
        if (currentOpt >= 0) {
            closeSlotSelectStatus();
            closeMSBSelectStatus();
            var left = optArrays[currentOpt].left;
            var right = optArrays[currentOpt].right;
            var opt = optArrays[currentOpt].opt;
            if (opt == "tos") {
                var msb = getMSB(left);
                msb.slotid = '';
            } else {
                var msb = getMSB(left);
                msb.slotid = right;
            }
            currentOpt--;
            revenderMSB(null);
            venderSchedule();
        }
        if (currentOpt < 0) {
            $('#revokebtn').attr("disabled", true);
        }
    }

    //msb 在Schedule移动功能
    function moveTo() {
        var slotid = $('#movetoselect').val();
        for (key in selectedSlotMSB) {
            if (selectedSlotMSB[key]) {
                var msb = getMSB(key);
                msb.slotid = slotid;
            }
        }
        closeSlotSelectStatus();
        venderSchedule();
        $('#movetobtn').popover('hide');
    }

    var isFirstHighlight = true;

    function highlight(arg) {
        if (isFirstHighlight) {
            isFirstHighlight = false;
            return;
        }
        var dom = $('#' + arg);
        var color = 'RGBA(250, 128, 114, 0.2)';
        var org_color = dom.css('background-color');
        for (var i = 0; i < 3; i++) {
            dom.animate({backgroundColor: color}, "slow");
            dom.animate({backgroundColor: org_color}, "slow");
        }

    }

    $(document).ready(function () {

        fetchMSBs('', function (arg) {
            //全部msb
            msbRepository = arg;
            revenderMSB(arg);
            venderSchedule();
        });

        $('#toPrepBtn').click(toPrep);
        $('#toSchedBtn').click(toSched);
        $('#toPrepBtn').attr('disabled', true);
        $('#toSchedBtn').attr('disabled', true);
        $('#revokebtn').attr("disabled", true);
        $('#movetobtn').attr("disabled", true);
        //move to
        var str = '<select id="movetoselect" >';
        <c:forEach var="s" items="${schedulesolt}">
        str += '<option value="${s.id}">${s.begintime}<span class="blank">→</span>${s.endtime}</option>';
        </c:forEach>
        str += '</select>';
        str += '<button class="btn btn-default movetoconfrimbtn" type="button" onclick="moveTo()">Done</button>';
        $('#movetobtn').popover({
            html: true, title: 'Move To #', content: str
        });
        //advanced Search
        addSrchItem();

    });
</script>
</html>
