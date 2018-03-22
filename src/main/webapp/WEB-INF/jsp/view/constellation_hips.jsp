<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">

<title>Constellation Panel</title>

<jsp:include page="../common/import.jsp"></jsp:include>

<!-- include Aladin Lite CSS file in the head section of your page -->
<link rel='stylesheet' href='http://aladin.u-strasbg.fr/AladinLite/api/v2/latest/aladin.min.css' />
<!-- integrate the jQuery library -->
<script type='text/javascript' src='http://code.jquery.com/jquery-1.9.1.min.js' charset='utf-8'></script>

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
                                    <div id="SkySurveyControlHost">

                                        <!-- wwt -->
                                        <%--<div id="WWTCanvas"--%>
                                             <%--style="width:970px; height:680px; border-style: none; border-width: 0px;"></div>--%>

                                        <!-- hips -->
                                        <div id="aladin-lite-div"
                                             style="width:970px;height:680px;"></div>

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


<!-- hips Panel  -->
<script type='text/javascript' src='http://aladin.u-strasbg.fr/AladinLite/api/v2/latest/aladin.min.js' charset='utf-8'></script>
<script type="text/javascript">

    var aladin = A.aladin('#aladin-lite-div',
        {
            survey: 'P/DSS2/color',
            target: '03 47 00.00 +24 07 00.0', //'LMC'
            //fov: 60
            //showReticle: true
            zoom: 2

        });

    <!-- Displaying a custom HiPS image layer -->
//    var aladin = A.aladin('#aladin-lite-div');
//    var hipsDir = "http://localhost:8080/FOCx38i0101t_c0f.fitsHiPS";
////    var hipsDir = "http://astrodeep.u-strasbg.fr/ff/data/HiPS/o_BIH_color";
//    aladin.setImageSurvey(aladin.createImageSurvey("test HiPS", "test HiPS", hipsDir, "equatorial", 13, {imgFormat: 'jpeg'})); // setting a custom HiPS
//
////    aladin.gotoRaDec(3.5920474, -30.405748);
//    aladin.gotoRaDec(155.0754794,+75.0631893);
//    aladin.setFoV(1.65);


<!--   Marker creation: Clicking on a marker displays the associated popup. -->
    var cat_done = A.catalog({
        name: 'MSBs Observed',
        sourceSize: 18,
        color:'#2af009'
    });
    cat_doing = A.catalog({
        name: 'MSBs Observing',
        sourceSize: 18,
        color:'#f00306'
    });
    cat_todo = A.catalog({
        name: 'MSBs To Observe',
        sourceSize: 18,
        color:'#f09208'
    });

    aladin.addCatalog(cat_done);
    aladin.addCatalog(cat_doing);
    aladin.addCatalog(cat_todo);

    cat_todo.addSources([A.marker(57.29673, 24.13671, {popupTitle: 'Pleione', popupDesc: '<em>Bmag:</em> 4.97<br/><em>Spectral type:</em> B8vne<br/>More info <a target="_blank" href="http://simbad.u-strasbg.fr/simbad/sim-id?Ident=NAME+PLEIONE&NbIdent=1">in Simbad</a>'})]);
    cat_todo.addSources([A.marker(57.29059, 24.05342, {popupTitle: 'Atlas', popupDesc: '<em>Bmag:</em> 3.54<br/><em>Spectral type:</em> B8III<br/>More info <a target="_blank" href="http://simbad.u-strasbg.fr/simbad/sim-id?Ident=NAME+ATLAS&NbIdent=1">in Simbad</a>'})]);
    cat_doing.addSources([A.marker(56.87115, 24.10514, {popupTitle: 'Alcyone', popupDesc: '<em>Bmag:</em> 2.806<br/><em>Spectral type:</em> B7III<br/>More info <a target="_blank" href="http://simbad.u-strasbg.fr/simbad/sim-id?Ident=NAME%20ALCYONE&submit=submit">in Simbad</a>'})]);
    cat_done.addSources([A.marker(56.58156, 23.94836, {popupTitle: 'Merope', popupDesc: '<em>Bmag:</em> 4.113<br/><em>Spectral type:</em> BVI4e<br/>More info <a target="_blank" href="http://simbad.u-strasbg.fr/simbad/sim-id?Ident=V*+V971+Tau&NbIdent=1">in Simbad</a>'})]);
    cat_done.addSources([A.marker(56.45669, 24.36775, {popupTitle: 'Maia', popupDesc: '<em>Bmag:</em> 3.812<br/><em>Spectral type:</em> B8III<br/>More info <a target="_blank" href="http://simbad.u-strasbg.fr/simbad/sim-id?Ident=NAME+MAIA&NbIdent=1">in Simbad</a>'})]);
    cat_done.addSources([A.marker(56.21890, 24.11334, {popupTitle: 'Electra', popupDesc: '<em>Bmag:</em> 3.612<br/><em>Spectral type:</em> B6IIIe<br/>More info <a target="_blank" href="http://simbad.u-strasbg.fr/simbad/sim-id?Ident=NAME+ELECTRA&NbIdent=1">in Simbad</a>'})]);
    cat_done.addSources([A.marker(56.30207, 24.46728, {popupTitle: 'Taygeta', popupDesc: '<em>Bmag:</em> 4.199<br/><em>Spectral type:</em> B6IV<br/>More info <a target="_blank" href="http://simbad.u-strasbg.fr/simbad/sim-id?Ident=NAME+TAYGETA&NbIdent=1">in Simbad</a>'})]);

</script>

<!-- wwt Advanced Search  -->
<%--<jsp:include page="../common/msb_searchbox.jsp"></jsp:include>--%>

</body>
</html>