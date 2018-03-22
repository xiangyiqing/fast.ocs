<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">

<title>Constellation Panel</title>

<jsp:include page="../common/import.jsp"></jsp:include>

<!-- WWT -->
<script src="http://www.worldwidetelescope.org/scripts/wwtsdk.aspx"></script>


<style>
    .zoom_wrapper {
        position: relative;
        top: -70px;
        right: 20px;
        width: 110px;
        float: right;
        font-size: 42px;
        text-shadow: 0px 0px 1px #fff;
    }

    .zoom_in {
        color: #009DD9;
        margin-right: 10px;
    }

    .zoom_out {
        color: #009DD9;
    }
</style>

<body>
<section class="wrapper">
    <div class="row">
        <div class="col-lg-12">
            <div class="container wrapper outterblock">
                <!-- title -->
                <div class="title">Constellation Control Panel</div>

                <!-- content -->
                <div class="innerblock">
                    <div class="row">
                        <!-- MSB Display Filter -->
                        <div class="col-lg-12">
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
                                            <button class="btn btn-default" type="button" onclick="simpleSearch()">
                                                Search
                                            </button>
                                            <button class="btn btn-default" type="button" data-toggle="modal"
                                                    data-target="#advancedsearch">Advanced
                                            </button>
                                        </div>
                                    </div>
                                    <div class="alert alert-info" role="alert" style="margin-top: 20px; display: none;"
                                         id="searchstatus">
                                        <button type="button" class="close" style="width: 30px;"
                                                onclick="closeSearchStatus()"><span aria-hidden="true">&times;</span>
                                        </button>
                                        <div id="searchstatus_content"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Project List -->
                        <div class="col-lg-3">
                            <div class="box">
                                <h3 class="box_title">Project List</h3>
                                <div class="content pre-scrollable"
                                     style="height: 685px; max-height: 680px;">
                                    <table class="table table-striped table-hover proposallist">
                                        <tr>
                                            <th>Proposal ID</th>
                                            <th>Title</th>
                                            <th>Proposer</th>
                                            <th>Rate</th>
                                        </tr>
                                        <c:forEach var="p" items="${proplist}">
                                            <tr onclick="showProposalMSB('${p.id}')" style="cursor: pointer;">
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

                        <!-- Constellation -->
                        <div class="col-lg-9">
                            <div class="box">
                                <h3 class="box_title">Constellation</h3>
                                <div class="content">
                                    <div id="WorldWideTelescopeControlHost">
                                        <div id="WWTCanvas"
                                             style="width:970px; height:680px; border-style: none; border-width: 0px;"></div>

                                        <!-- zoom_wrapper -->
                                        <div class="zoom_wrapper">
                                            <a href="javascript:FovInc()"><span
                                                    class="glyphicon glyphicon-zoom-in zoom_in"></span></a>
                                            <a href="javascript:FovDec()"><span
                                                    class="glyphicon glyphicon-zoom-out zoom_out"></span></a>
                                        </div>

                                        <!-- wwtLOGO -->
                                        <div class="well well-sm" style="margin-top: 10px;">
                                            <div style="display: inline-block; position: relative; top:-10px;margin-left:10px; margin-right: 5px; font-weight: bold;">
                                                Powered by
                                            </div>
                                            <img alt="" src="u/img/navbar-logo-glow.png"
                                                 style="width: 50px;height: 50px; vertical-align: top;">
                                            <div style="display: inline-block;">
                                                <div style="font-size:13px;font-weight:500;">American Astronomical
                                                    Society
                                                </div>
                                                <div style="font-size:20.7px;text-shadow:0px -1px 0px rgba(0,0,0,0.2);color:#009cff;">
                                                    <span style="color: #111;">World </span> Wide Telescope
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
        </div>
    </div>
</section>

<jsp:include page="../common/msb_searchbox.jsp"></jsp:include>

<!-- WWT -->
<script>

    // declare global Worldwide Telescope object

    var wwt;

    // Create variables to hold the changeable settings

    var bShowCrosshairs = true;
    var bShowUI = true;
    var bShowFigures = true;

    // Create variables to hold some annotation objects
    var circle1;

    // This function initializes the wwt object and once it is done
    // it fires the wwtReady event

    function initialize() {
        $('#WWTCanvas').bind('mouseover', function () {
            if (window.addEventListener) {
                window.addEventListener('DOMMouseScroll', preventDefault, false);
            }
            window.onmousewheel = document.onmousewheel = preventDefault;
            document.onkeydown = keydown;
        });
        $('#WWTCanvas').bind('mouseout', function () {
            if (window.removeEventListener) {
                window.removeEventListener('DOMMouseScroll', preventDefault, false);
            }
            window.onmousewheel = document.onmousewheel = document.onkeydown = null;
        });

        wwt = wwtlib.WWTControl.initControl("WWTCanvas");
        wwt.add_ready(wwtReady);
    }

    //当鼠标移入wwt时禁止页面滚动
    var keys = [37, 38, 39, 40];

    function preventDefault(e) {
        e = e || window.event;
        if (e.preventDefault)
            e.preventDefault();
        e.returnValue = false;
    }

    function keydown(e) {
        for (var i = keys.length; i--;) {
            if (e.keyCode === keys[i]) {
                preventDefault(e);
                return;
            }
        }
    }

    // This function is where you would put your custom code for WWT
    // following the initForWwt() call

    function wwtReady() {
        initForWwt();
        fetchData('', null);
    }

    // This is the initialization for Worldwide Telescope

    function initForWwt() {
        wwt.loadImageCollection("http://www.worldwidetelescope.org/COMPLETE/wwtcomplete.wtml");

        // add any wwt object settings changes here
        wwt.settings.set_showCrosshairs(bShowCrosshairs);
        wwt.settings.set_showConstellationFigures(bShowFigures);
        wwt.hideUI(!bShowUI);
    }

    // A simple function to toggle the settings
    // This function is called from the checkbox entries setup in the html table

    function toggleSetting(text) {
        switch (text) {
            case 'ShowUI':
                bShowUI = !bShowUI;
                wwt.hideUI(!bShowUI);
                wwt.set_showExplorerUI(bShowUI);
                break;

            case 'ShowCrosshairs':
                bShowCrosshairs = !bShowCrosshairs;
                wwt.settings.set_showCrosshairs(bShowCrosshairs);
                break;

            case 'ShowFigures':
                bShowFigures = !bShowFigures;
                wwt.settings.set_showConstellationFigures(bShowFigures);
                break;
        }
    }

    // A function to change the view to different constellations
    // Note the fov set to 60 (maximum view distance)
    // This function is called from the button entries in the html table


    function GotoConstellation(text) {

        switch (text) {
            case 'Sagittarius':
                wwt.gotoRaDecZoom(286.485, -27.5231666666667, 60, false);
                break;

            case 'Aquarius':
                wwt.gotoRaDecZoom(334.345, -9.21083333333333, 60, false);
                break;
        }
    }

    function FovDec() {
        var newFov = 1.1 * wwt.get_fov();
        if (newFov <= 60) {
            wwt.gotoRaDecZoom(wwt.getRA(), wwt.getDec(), newFov, false);
        }
    }

    // Function to decrease the field of view (zoom in)
    function FovInc() {
        var newFov = wwt.get_fov() / 1.1;
        if (wwt.get_fov() >= 0.00022910934437488727) {
            wwt.gotoRaDecZoom(wwt.getRA(), wwt.getDec(), newFov, false);
        }
    }

    // A function to create a circle
    function createWWTCircle(fill, lineColor, fillColor, lineWidth, opacity, radius, skyRelative, ra, dec) {
        var circle = wwt.createCircle(fill);
        circle.set_lineColor(lineColor);
        circle.set_fillColor(fillColor);
        circle.set_lineWidth(lineWidth);
        circle.set_opacity(opacity);
        circle.set_radius(radius);
        circle.set_skyRelative(skyRelative);
        circle.setCenter(ra, dec);
        return circle;
    }

    $(document).ready(function () {
        initialize();

        addSrchItem();
    });

    function simpleSearch() {
        var searchCond = achieveData('#simplesearch');
        fetchData(searchCond, null);
        globalSearchCond = searchCond;
        addSearchStatus('searchstatus');
    }

    function msbAdvancedSearch() {
        var searchCond = achieveData('#search_table tr[id!=\'srch_row\']');
        fetchData(searchCond, null);
        globalSearchCond = searchCond;
        addSearchStatus('searchstatus');
        $('#advancedsearch').modal('hide');
    }

    var data = [];

    function fetchData(srch_arg, callback) {
        $.post('<%=basePath%>constellation/data', {search: srch_arg}, function (json, status) {
            json = handleJSONResponse(json);

            for (i in json) {
                var obj = json[i];
                // Create a fixed empty circle centered on Aquarius
                var circle = createWWTCircle(true, getColor(obj.status), getColor(obj.status), 1, 0.6, 15, false, obj.ra, obj.dec);
                // Add its annotation
                circle.set_id(obj.obsid);
                var label = 'MSB:' + obj.msbid + ' ' + obj.title + ' ' + 'Ra:' + obj.ra + 'Dec:' + obj.dec;
                circle.set_label(label);
                circle.set_showHoverLabel(true);
                obj['circle'] = circle;
            }
            venderCanvas(json);
            if (callback != null) {
                callback(json);
            }
        });
    }

    function venderCanvas(newData) {
        for (i in data) {
            var obj = data[i];
            wwt.removeAnnotation(obj.circle);
        }
        data = newData;
        for (i in data) {
            var obj = data[i];
            wwt.addAnnotation(obj.circle);
        }
        if (fetchData.length > 0) {
            wwt.gotoRaDecZoom(data[0].ra, data[0].dec, 60, false);
        }
    }

    function closeSearchStatus() {
        $('#searchstatus').hide();
        globalSearchCond = '';
        fetchData('', null);
    }

    function showProposalMSB(propId) {
        globalSearchCond = '[{"type":"pid","cond":"' + propId + '","opt":"oeq"}]';
        addSearchStatus('searchstatus');
        fetchData(globalSearchCond, null);
    }
</script>


</body>
</html>