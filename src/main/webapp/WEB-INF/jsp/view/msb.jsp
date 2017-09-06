<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">

<title>MSB Schedule Display Panel</title>

<jsp:include page="../common/import.jsp"></jsp:include>
<!-- full calendar -->
<link href='<%=basePath%>u/lib/fullcalendar/fullcalendar.min.css' rel='stylesheet'/>
<link href='<%=basePath%>u/lib/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='<%=basePath%>u/lib/fullcalendar/lib/moment.min.js'></script>
<script src='<%=basePath%>u/lib/fullcalendar/fullcalendar.min.js'></script>
<script src='<%=basePath%>u/lib/fullcalendar/lang-all.js'></script>

<style>
    .box button {
        width: 100px;
    }

    .box .longer {
        width: 150px;
    }

    .box .split {
        margin-right: 10px;
    }

    .proposallist tr {
        cursor: pointer;
    }

    #calendar {
        max-width: 900px;
        min-height: 640px;
    }

    .msbdetailtable {
    }

    .msbdetailtable td {
        height: 25px;
        line-height: 25px;
        font-size: 14px;
    }

    .msbdispfilter {
    }

    .msbdispfilter .selectpicker {
        width: 50px;
    }

    .msbdetailtable td:first-child {
        text-align: left;
        font-weight: bold;
    }

    .msbdetailtable textarea {
        resize: none;
        margin-top: 10px;
        font-weight: normal;
    }

    .fc-content {
        cursor: pointer;
    }

    #msbSelectStatus {
        margin-top: 20px;
        display: none;
    }
</style>
<body>
<section>
    <div class="row">
        <div class="col-lg-12">
            <div class="container wrapper outterblock">
                <!-- title -->
                <div class="title">MSB Sequences</div>
                <!-- content -->
                <div class="innerblock">
                    <!-- MSB Display Filter box -->
                    <div class="box">
                        <h3 class="box_title">MSB Display Filter</h3>
                        <div class="content">
                            <div class="input-group" id="simplesearch">
                                <div class="input-group-btn">
                                    <select class="selectpicker" data-width="150px" name="type">
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
                                <input type="text" class="form-control" aria-label="Condition" name="cond"
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
                                    <button class="btn btn-default" type="button" onclick="simpleSearch()">Search
                                    </button>
                                    <button class="btn btn-default" type="button" data-toggle="modal"
                                            data-target="#advancedsearch">Advanced
                                    </button>
                                </div>
                            </div>
                            <div class="alert alert-info" role="alert" style="margin-top: 20px; display: none;"
                                 id="searchstatus">
                                <button type="button" class="close" style="width: 30px;" onclick="closeSearchStatus()">
                                    <span aria-hidden="true">&times;</span></button>
                                <div id="searchstatus_content"></div>
                            </div>
                        </div>
                    </div>

                    <!-- MSB Display Filter box -->
                    <div class="box">
                        <h3 class="box_title">MSB Execution</h3>
                        <div class="content">
                            <button class="btn btn-default longer split" type="button" onclick="autoSchedule()">
                                Auto Schedule
                            </button>
                            <button class="btn btn-default longer split" type="button" onclick="manualSchedule()">
                                Manual Schedule
                            </button>
                            <button class="btn btn-default longer split" type="button" onclick="autoExcution()">
                                Auto Execute
                            </button>
                            <button class="btn btn-default longer split" type="button" onclick="manualExcution()"
                                    id="manualExcution" disabled="disabled">
                                Manual Execute
                            </button>
                        </div>
                    </div>

                    <!-- two column -->
                    <div class="row">
                        <div class="col-lg-4">
                            <!-- Project list -->
                            <div class="box">
                                <h3 class="box_title">Proposal List</h3>
                                <div class="content pre-scrollable"
                                     style="height: 735px; max-height: 735px;">
                                    <table class="table table-striped table-hover proposallist">
                                        <tr>
                                            <th>Proposal ID</th>
                                            <th>Title</th>
                                            <th>Proposer</th>
                                            <th>Rate</th>
                                        </tr>
                                        <c:forEach var="p" items="${proplist}">
                                            <tr onclick="showProposalMSB('${p.id}')">
                                                <td>${p.id}</td>
                                                <td>${p.title}</td>
                                                <td>${p.proposer}</td>
                                                <td>${p.rate}</td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <!-- MSB Display Calendar -->
                            <div class="box">
                                <div class="box_title">
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li role="presentation" class="active"><a href="#calenderpannel"
                                                                                  aria-controls="calenderpannel"
                                                                                  role="tab" data-toggle="tab">MSB
                                            Schedule Calendar</a></li>
                                        <li role="presentation"><a href="#scheduletable" aria-controls="scheduletable"
                                                                   role="tab" data-toggle="tab">MSB Schedule Table</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="content">
                                    <div class="alert alert-success" role="alert"
                                         id="msbSelectStatus">
                                        <button type="button" class="close"
                                                onclick="closeMSBSelectStatus()">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                        <div id="msbSelectStatus_content"></div>
                                    </div>


                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane fade in active" id="calenderpannel">
                                            <br/>
                                            <div id='calendar'></div>
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade" id="scheduletable">
                                            <div class="pre-scrollable" style="height: 700px; max-height: 700px;">
                                                <table class="table table-striped table-hover" id="schdTable">
                                                    <tr>
                                                        <th><span class="glyphicon glyphicon-ok-circle"></span></th>
                                                        <th>ID</th>
                                                        <th>MSB ID</th>
                                                        <th>Title</th>
                                                        <th>Proposal ID</th>
                                                        <th>Begin Time</th>
                                                        <th>End Time</th>
                                                        <th>Status</th>
                                                        <th>Note</th>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-12" style="display: none;" id="msbdetailblock">
            <!-- MSB detail -->
            <div class="container wrapper outterblock">
                <!-- title -->
                <div class="title">MSB Info : <span id="dmid">MSB0006</span>&nbsp;(&nbsp;<span id="dmtit">MSB0006</span>&nbsp;)
                </div>
                <!-- content -->
                <div class="innerblock">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="box">
                                <h3 class="box_title">MSB Detail</h3>
                                <div class="content">
                                    <table class="msbdetailtable" style="width: 100%">
                                        <tr>
                                            <td>ProjectID:</td>
                                            <td id="dpid">M001</td>
                                        </tr>
                                        <tr>
                                            <td>Status:</td>
                                            <td id="dmstat">Unobserved</td>
                                        </tr>
                                        <tr>
                                            <td>Repeat Count:</td>
                                            <td id="dmrc">6</td>
                                        </tr>
                                        <tr>
                                            <td>Observed Count:</td>
                                            <td id="dmoc">0</td>
                                        </tr>
                                        <tr>
                                            <td>Estimated Time:</td>
                                            <td id="dmet">12:00</td>
                                        </tr>
                                        <tr>
                                            <td>Observed Time:</td>
                                            <td id="dmot">00:00</td>
                                        </tr>
                                        <tr>
                                            <td>Wind Speed:</td>
                                            <td id="dmws">&lt;5m/s</td>
                                        </tr>
                                        <tr>
                                            <td>Humidity:</td>
                                            <td id="dmhm">&lt;85%</td>
                                        </tr>
                                        <tr>
                                            <td>Opacity:</td>
                                            <td id="dmot">&gt;70%</td>
                                        </tr>
                                        <tr>
                                            <td>Airtemp:</td>
                                            <td id="dmat">&gt;70%</td>
                                        </tr>
                                        <tr>
                                            <td>Day or Night:</td>
                                            <td id="dmdn">day</td>
                                        </tr>
                                        <tr>
                                            <td>Note:</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <textarea id="dmnt" readonly="true" class="form-control" rows="4"
                                                          editable="false">We are observing 17 small galaxies while we work on the SV data to understand how best to map the larger galaxies. Allocation is grade 2 weather.</textarea>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="box">
                                <h3 class="box_title">Observation List</h3>
                                <div class="content pre-scrollable"
                                     style="height: 425px; max-height: 450px;border: 1px solid #AAA;">
                                    <table class="table table-striped table-hover" id="obs_table">
                                        <tr>
                                            <th>Title</th>
                                            <th>Ra2000</th>
                                            <th>Dec2000</th>
                                            <th>Repeat Count</th>
                                            <th>Estimated Time</th>
                                            <th>Coordinate</th>
                                            <th>Mode</th>
                                            <th>Receiver</th>
                                            <th>Backend</th>
                                            <th>Interfreq</th>

                                            <th>Start Ra</th>
                                            <th>Start Dec</th>
                                            <th>End Ra</th>
                                            <th>End Dec</th>
                                            <th>Epoch</th>
                                            <th>Duration</th>
                                            <th>Backidentity</th>
                                            <th>Scan Velocity</th>
                                            <th>Scan Angle</th>
                                            <th>Terminal Mode</th>
                                            <th>Scan Direction</th>
                                            <th>Start Time</th>
                                            <th>End Time</th>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="box">
                                <h3 class="box_title">MSB Instructions</h3>
                                <div class="content pre-scrollable"
                                     style="height: 425px; max-height: 450px;border: 1px solid #AAA;">
                                    <table class="table table-striped table-hover" id="instTable">
                                        <tr>
                                            <td></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../common/msb_searchbox.jsp"></jsp:include>
<script>
    $(document).ready(function () {

        addSrchItem();

        createEvents('', function (arg) {
            initCalendar(arg);
            revenderSchTable(arg);
        });
        //切换tab时调用，解决table的选择项在caldender中不起作用的bug
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            if ($(e.target).text() == 'MSB Schedule Calendar' && calenderReflesh) {
                initCalendar(msbCalendarEvents);
                calenderReflesh = false;
            }
        });
    });
    var msbCalendarEvents = [];

    function getEvents(msbid) {
        var list = new Array();
        for (j in msbCalendarEvents) {
            var e = msbCalendarEvents[j];
            if (msbid == e.id) {
                list.push(e);
            }
        }
        return list;
    }

    function simpleSearch() {
        var searchCond = achieveData('#simplesearch');
        createEvents(searchCond, function (arg) {
            initCalendar(arg);
            revenderSchTable(arg);
        });
        globalSearchCond = searchCond;
        addSearchStatus('searchstatus');
    }

    function msbAdvancedSearch() {
        var searchCond = achieveData('#search_table tr[id!=\'srch_row\']');
        createEvents(searchCond, function (arg) {
            initCalendar(arg);
            revenderSchTable(arg);
        });
        globalSearchCond = searchCond;
        addSearchStatus('searchstatus');
        $('#advancedsearch').modal('hide');
    }

    function createEvents(srch_arg, callback) {
        closeMSBSelectStatus();
        $.post('<%=basePath%>msb/data', {search: srch_arg}, function (json, status) {
            json = handleJSONResponse(json);
            var events = [];
            for (i in json) {
                events.push({
                    id: json[i].id,
                    title: json[i].id + ' (' + json[i].title + ')',
                    start: json[i].start,
                    end: json[i].end,
                    color: getColor(json[i].status),
                    allDay: false,
                    status: json[i].status,
                    msbid_rc: json[i].msbid_rc,
                    propid: json[i].propid,
                    note: json[i].note
                });
            }
            msbCalendarEvents = events;
            callback(events);
        });
    }

    var isInitalized = false;

    function initCalendar(calevents) {
        if (isInitalized) {
            $('#calendar').fullCalendar('removeEvents');
            $('#calendar').fullCalendar('removeEventSource');
            $('#calendar').fullCalendar('addEventSource', calevents);
        } else {
            isInitalized = true;
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                lang: 'en',
                selectable: false,
                editable: false,
                eventLimit: true, // allow "more" link when too many events
                events: calevents,
                eventClick: function (calEvent, jsEvent, view) {
                    eventClick(calEvent, jsEvent);
                }
            });
        }
    }


    function closeSearchStatus() {
        $('#searchstatus').hide();
        globalSearchCond = '';
        createEvents('', function (arg) {
            initCalendar(arg);
            revenderSchTable(arg);
        });
    }

    function showProposalMSB(propId) {
        globalSearchCond = '[{"type":"pid","cond":"' + propId + '","opt":"oeq"}]';
        addSearchStatus('searchstatus');
        createEvents(globalSearchCond, function (arg) {
            initCalendar(arg);
            revenderSchTable(arg);
        });
    }

    function eventClick(calEvent, jsEvent) {
        var msbid = calEvent.id;
        selectMSB(msbid);
        initCalendar(msbCalendarEvents);
    }

    var hasDetailShow = false;

    function loadMSBDetail(msbid) {
        $.post('msb/detail', {msbid: msbid}, function (json, status) {
            json = handleJSONResponse(json);
            if (!hasDetailShow) {
                hasDetailShow = true;
                $('#msbdetailblock').fadeIn();
            }
            $("#dmid").html(json.id);
            $("#dmtit").html(json.title);
            $("#dpid").html(json.propid);
            $("#dmstat").html(msbObservationStatus(json.status));
            $("#dmrc").html(json.repeatcounts);
            $("#dmoc").html(json.observedcounts);
            $("#dmet").html(json.estimatedtime);
            $("#dmot").html(json.observedtime);
            $("#dmws").html(json.windspeed);
            $("#dmhm").html(json.humidity);
            $("#dmot").html(json.opacity);
            $("#dmat").html(json.airtemp);
            $("#dmdn").html(json.day_or_night);
            $("#dmnt").val(json.note);

            var str = '';
            $("#obs_table .obs_data").remove();
            for (i in json.observations) {
                var os = json.observations;
                str += '<tr class="obs_data">';
                str += '<td>' + (os[i])['title'] + '</td>';
                str += '<td>' + (os[i])['ra2000'] + '</td>';
                str += '<td>' + (os[i])['dec2000'] + '</td>';
                str += '<td>' + (os[i])['repeatcounts'] + '</td>';
                str += '<td>' + (os[i])['estimatedtime'] + '</td>';
                str += '<td>' + (os[i])['coordsystem'] + '</td>';
                str += '<td>' + (os[i])['mode'] + '</td>';
                str += '<td>' + (os[i])['receiver'] + '</td>';
                str += '<td>' + (os[i])['backend'] + '</td>';
                str += '<td>' + (os[i])['interfreq'] + '</td>';

                str += '<td>' + (os[i])['start_ra'] + '</td>';
                str += '<td>' + (os[i])['start_dec'] + '</td>';
                str += '<td>' + (os[i])['end_ra'] + '</td>';
                str += '<td>' + (os[i])['end_dec'] + '</td>';
                str += '<td>' + (os[i])['epoch'] + '</td>';
                str += '<td>' + (os[i])['duration'] + '</td>';
                str += '<td>' + (os[i])['backidentity'] + '</td>';
                str += '<td>' + (os[i])['scan_velocity'] + '</td>';
                str += '<td>' + (os[i])['scan_angle'] + '</td>';
                str += '<td>' + (os[i])['terminal_mode'] + '</td>';
                str += '<td>' + (os[i])['scan_direction'] + '</td>';
                str += '<td>' + toDateStr((os[i])['start_time']) + '</td>';
                str += '<td>' + toDateStr((os[i])['end_time']) + '</td>';
                str += '</tr>';
            }
            $("#obs_table").append(str);
            $('#instTable tr').remove();
            var inst = '';
            for (i in json.instructions) {
                var e = json.instructions[i];
                inst += '<tr><td>' + e + '</td></tr>';
            }
            $('#instTable').append(inst);
        });
    }


    function manualSchedule() {
        window.open('<%=basePath%>msb/adjust');
    }

    var selectedMSB = {};

    //渲染msb table中选择的msb
    function msbStatus() {
        $('#msbSelectStatus').show();
        var str = 'Selected: ';
        var empty = true;
        for (key in selectedMSB) {
            if (selectedMSB[key]) {
                str += key + ' ';
                empty = false;
            }
        }
        if (!empty) {
            $('#manualExcution').attr('disabled', false);
        } else {
            $('#manualExcution').attr('disabled', true);
        }
        $('#msbSelectStatus_content').html(str);
    }

    //撤销msb table中选择的msb
    function closeMSBSelectStatus() {
        $('#msbSelectStatus').hide();
        for (i in msbCalendarEvents) {
            var e = msbCalendarEvents[i];
            e.color = getColor(e.status);
        }
        initCalendar(msbCalendarEvents);
        calenderReflesh = true;
        revenderSchTable(msbCalendarEvents);
        selectedMSB = {};
        $('#manualExcution').attr('disabled', true);
    }

    //执行手动执行
    function manualExcution() {
        var msbidlist = '';
        for (key in selectedMSB) {
            var m = selectedMSB[key];
            msbidlist += key + ';';
        }
        $.post('msb/manualExecute', {schedulelist: msbidlist}, function (json, status) {
            json = handleJSONResponse(json);
            toastr.info(JSON.stringify(json));
        });
    }

    //执行手动执行
    function autoExcution() {
        $.post('msb/autoExecute', {}, function (json, status) {
            json = handleJSONResponse(json);
            toastr.info(JSON.stringify(json));
        });
    }

    //渲染msb table
    function revenderSchTable(arg) {
        var str = '';
        for (i in arg) {
            var m = arg[i];
            str += '<tr class="pointercursor" id="msb_' + m.msbid_rc + '" msbid="' + m.id + '" onclick="selectTableMSB(this)">';
            str += '<td><span class="glyphicon glyphicon-ok msb_check_status" style="display:none;"></span></td>';
            str += '<td>' + m.msbid_rc + '</td>';
            str += '<td>' + m.id + '</td>';
            str += '<td>' + m.title + '</td>';
            str += '<td>' + m.propid + '</td>';
            str += '<td>' + m.start + '</td>';
            str += '<td>' + m.end + '</td>';
            str += '<td>' + msbObservationStatus(m.status) + '</td>';
            str += '<td> <span class="glyphicon glyphicon-tags msbnotecursor" data-toggle="tooltip" data-placement="left" title="' + m.note + '"></td>';
            str += '</tr>';
        }
        $('#schdTable tr:gt(0)').remove();
        $('#schdTable').append(str);
        $('[data-toggle="tooltip"]').tooltip();
    }

    function selectTableMSB(arg) {
        var msbid = $(arg).attr('msbid');
        selectMSB(msbid);
    }

    //选择msb table中msb
    var calenderReflesh = false;

    function selectMSB(msbid) {
        calenderReflesh = true;
        selectedMSB[msbid] = !selectedMSB[msbid];
        for (key in selectedMSB) {
            var events = getEvents(key);
            var trdoms = $('#schdTable tr[msbid="' + key + '"]');
            var chbox = trdoms.find('.msb_check_status');
            if (selectedMSB[key]) {
                for (j in events) {
                    var e = events[j];
                    e.color = '#14D100';
                }
                trdoms.addClass('success').addClass('msb_selected');
                chbox.show();
            } else {
                for (j in events) {
                    var e = events[j];
                    e.color = getColor(e.status);
                }
                trdoms.removeClass('success').removeClass('msb_selected');
                chbox.hide();
            }
        }
        msbStatus();
        loadMSBDetail(msbid);
    }
</script>
</body>
</html>
