<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>

<%--<%@page import="" %>--%>
<%--<%@page import="webapp" %>--%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>Constellation Panel</title>

    <jsp:include page="../common/import.jsp"></jsp:include>

    <!-- include Aladin Lite CSS file in the head section of your page -->
    <link rel='stylesheet' href='http://aladin.u-strasbg.fr/AladinLite/api/v2/latest/aladin.min.css' />
    <!-- integrate the jQuery library -->
    <script type='text/javascript' src='http://code.jquery.com/jquery-1.9.1.min.js' charset='utf-8'></script>

    <style type="text/css">
        /*div{*/
        /*width: 50px;*/
        /*height: 50px;*/
        /*float: left;*/
        /*margin-right: 20px;*/
        /*}*/
        .tableDiv{ //doing
        height:80px;
            margin-left: 520px;
            /*border-color: #fafeff;*/
            border:10px #fafeff;
            border-collapse: collapse;

        }
        .squareDiv{ //todo
            /*margin-top: 20px;*/
        margin-bottom: 20px;
        }
        .textDiv{ //todo
        font-size: 16pt;
            margin-right: 40px;
        }
    </style>

</head>

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
                                    <table id="proposalTable" class="table table-striped table-hover proposallist">
                                        <thead>
                                        <tr>
                                            <th>Proposal ID</th>
                                            <th>Title</th>
                                            <th>Proposer</th>
                                            <th>Rate</th>
                                            <%--<th>Show</th>--%>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <%--<tr id = "P001" onclick="searchHiPS(this.id)" style="cursor: pointer;">--%>
                                        <%--<td>P001</td>--%>
                                        <%--<td>Light</td>--%>
                                        <%--<td class = "John">John</td>--%>
                                        <%--<td>5.0</td>--%>
                                        <%--</tr>--%>
                                        <%--<tr>--%>
                                        <%--<td id = "P002">P002</td>--%>
                                        <%--<td>kktitle</td>--%>
                                        <%--<td class = "Sam">Sam</td>--%>
                                        <%--<td>6.0</td>--%>
                                        <%--</tr>--%>
                                        </tbody>


                                        <%--<c:forEach var="p" items="${proplist}">--%>
                                        <%--<tr onclick="showProposalMSB('${p.id}')" style="cursor: pointer;">--%>
                                        <%--<td>${p.id}</td>--%>
                                        <%--<td>${p.title}</td>--%>
                                        <%--<td>${p.proposer}</td>--%>
                                        <%--<td>${p.rate}</td>--%>
                                        <%--</tr>--%>
                                        <%--</c:forEach>--%>
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

                                        <button id onclick="show(0)">默认天区</button>
                                        <button id onclick="show(1)">观测区域</button>

                                        <div>
                                            <table class="tableDiv">
                                                <tr>
                                                    <td class="squareDiv" style="background-color: #67daee;color: #67daee">somethi</td>
                                                    <td class="textDiv">Will Observe</td>
                                                    <td class="textDiv" style="color: #ffffff">kkk</td>

                                                    <td class="squareDiv" style="background-color: #f0360e;color: #f0360e">somethi</td>
                                                    <td class="textDiv">Obseving</td>
                                                    <td class="textDiv" style="color: #ffffff">kkk</td>

                                                    <td class="squareDiv" style="background-color: #d3da34;color: #d3da34">somethi</td>
                                                    <td class="textDiv">Observed</td>
                                                    <td class="textDiv" style="color: #ffffff">kkk</td>

                                                </tr>
                                            </table>

                                        </div>
                                        <%--<div class="bigDiv">--%>
                                        <%--<div class="squareDiv" style="background-color: #67daee"> </div>--%>
                                        <%--&lt;%&ndash;<div class="textDiv"> <p>zheshisha</p> </div>&ndash;%&gt;--%>

                                        <%--<div class="squareDiv" style="background-color: #f0360e"> </div>--%>
                                        <%--&lt;%&ndash;<div class="textDiv"> <p>zheshisha</p> </div>&ndash;%&gt;--%>

                                        <%--<div class="squareDiv" style="background-color: #d3da34"></div>--%>
                                        <%--&lt;%&ndash;<div class="textDiv"> <p>zheshisha</p> </div>&ndash;%&gt;--%>

                                        <%--</div>--%>


                                        <!-- hips -->
                                        <div id='infoDiv' style="background-color: #d5d9da; border: rgba(85,85,85,0.92);font-size:18pt;margin: 3pt">&nbsp; </div>
                                        <div class ="aladin-lite-div"
                                        <%--id = "default"--%>
                                             style="width:970px;height:680px;"></div>

                                        <%--<div class ="aladin-lite-div"--%>
                                        <%--id = "observingArea"--%>
                                        <%--style="width:970px;height:680px;visibility: hidden;"></div>--%>
                                        <%--<input id="DSS" type="radio" name="survey" value="P/DSS2/color" checked><label for="DSS">DSS color<label>--%>
                                        <%--<input id="DSS-blue" type="radio" name="survey" value="P/DSS2/blue"><label for="DSS-blue">DSS blue<label>--%>
                                        <%--<input id="2MASS" type="radio" name="survey" value="P/2MASS/color"><label for="2MASS">2MASS<label>--%>
                                        <%--<input id="allwise" type="radio" name="survey" value="P/allWISE/color"><label for="allwise">AllWISE<label>--%>
                                        <%--<input id="glimpse" type="radio" name="survey" value="P/GLIMPSE360"><label for="glimpse">GLIMPSE 360<label>--%>

                                        <input id="msbDoing" type="radio" name="goto" value="32.53,70" checked><label for="msbDoing">  Goto msbDoing   <label>
                                        <input id="msbDone" type="radio" name="goto" value="30, 19.79" checked><label for="msbDone">  Goto msbDone   <label>
                                        <input id="msbTodo" type="radio" name="goto" value="226.2, 18.65" checked><label for="msbTodo">  Goto msbTodo   <label>
                                        <input id="telePos" type="radio" name="goto" value="226.2, 18.65" checked><label for="telePos">  Goto telePos   <label>


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

    //    document.getElementsByClassName("aladin-lite-div").style.visibility="hidden";  //隐藏
    //    document.getElementById("default").style.visibility="visible";  //显示

    var aladin = A.aladin('.aladin-lite-div',
        {
//            survey: 'P/DSS2/color',
//            target: '240 +10.65',
//            cooFrame: 'j2000d',
//            fov: 90
            target: 'LMC',
            fov: 55
        });

    <!-- Displaying a custom HiPS image layer -->
    var hips = A.catalogHiPS('http://axel.u-strasbg.fr/HiPSCatService/Simbad', {
        onClick: 'showTable',
        name: 'Simbad',
        color: '#f00306',
        shape: 'plus'
    });
    aladin.addCatalog(hips);

    var hips2 = A.catalogHiPS('http://axel.u-strasbg.fr/HiPSCatService/2MASS', {
        onClick: 'showTable',
        name: '2MASS',
        color: '#4ceed8',
        shape: 'square'
    });
    aladin.addCatalog(hips2);

    //    var hipsDir = "http://localhost:8080/FOCx38i0101t_c0f.fitsHiPS"; //  "http://astrodeep.u-strasbg.fr/ff/data/HiPS/o_BIH_color";
    //    var testHiPS = aladin.createImageSurvey("test HiPS", "test HiPS", hipsDir, "equatorial", 13, {imgFormat: 'jpeg'});
    ////    aladin.setImageSurvey(testHiPS); // setting a custom HiPS

    <!-- Animate to a given position -->
    var startRaDec = [32.53,70];
    var endRaDec = [305.5, 38.5];

    aladin.gotoRaDec(startRaDec[0],startRaDec[1]);

    //    aladin.gotoRaDec(266.41683, -29.00781);
    // Parameters are:
    //    <right ascension of final position>,
    //    <declination of final position>,
    //    <animation duration in seconds>
    //    aladin.animateToRaDec(endRaDec[0],endRaDec[1],10);

    //function animateLoop(){
    //    while(1)
    //    {
    //        var currentRaDec = aladin.getRaDec();
    //        if(currentRaDec = startRaDec)
    //            aladin.animateToRaDec(endRaDec[0],endRaDec[1],10);
    //        else
    //            aladin.animateToRaDec(startRaDec[0],startRaDec[1],10);
    //    }
    //}

    // 天区图选择
    //    $('input[name=survey]').change(function() {
    //        aladin.setImageSurvey($(this).val());
    //    });

    $('input[name=goto]').change(function() {
        if($(this).attr("id") == "msbDoing")
            aladin.gotoRaDec(32.53,70);
        else if($(this).attr("id") == "msbDone")
            aladin.gotoRaDec(30, 19.79);
        else if($(this).attr("id") == "msbTodo")
            aladin.gotoRaDec(226.2, 18.65);
        else
            aladin.gotoRaDec(33.53, 72);
    });

    var i,j,k;


    // pid选择
    //$('input[name=PID]').change(function() {
    //    aladin.setImageSurvey($(this).val());
    //});

    <!--   ADD sources. -->
    // shapeName: square,cross,plus,triangle,catalogHiPS,self-definition(c)
    //var c = document.createElement('canvas'); c.width = c.height = 11; var ctx = c.getContext('2d'); ctx.beginPath(); ctx.arc(5, 5, 4, 0, 2 * Math.PI, false); ctx.closePath(); ctx.strokeStyle = '#ccc'; ctx.lineWidth = 2; ctx.stroke();
    //var geoFeatures = A.catalog({shape: c, labelColumn: 'name', displayLabel: true, labelColor: '#fff', labelFont: '14px sans-serif'});


    //        ["PID","MID","Ra","Dec","Status"]
    var msbData1 = [["001","001",226.2, 18.65,  0],//todo
        ["001","002",70.5, -42.4,   0],
        ["001","003",250.4, 40.5,   0]];

    var msbData2 = [["002","001",-112.58, 1.57, 2],
        ["002","002",147.21, 25.02, 0],
        ["002","003",316.0, -49.7,  0],
        ["002","004",-59.2, -13.9,  0],
        ["002","005",32.53, 70,     1]]; //doing

    var msbData3 = [["003","001",298, 25,       2],
        ["003","002",30, 19.79,     2],
        ["003","003",70.5, -42.4,   2],
        ["003","004",280, 45,       2]];
    var msbData4 = [["004","001",87, 12.9,      2],
        ["004","001",117.5, 46.7,   2],
        ["004","001",350, -45,      2]];//undone

    var msbData = [msbData1,msbData2,msbData3,msbData4];

    var maxLength=0;
    for(i = 0; i<msbData.length; i++)
    {
        maxLength = Math.max(maxLength,msbData[i].length);
    }

    var catalog = new Array(msbData.length);
    for(i=0; i<msbData.length; i++)
    {
        catalog[i] = new Array();
    }
    //    var catalog = [msbData.length][maxLength];
    //    var catalogToDo = [];
    //    var catalogDoing= [];
    //    var catalogDone = [];


    for(i = 0; i<msbData.length; i++)//14ge
    {
        for(j=0; j<msbData[i].length; j++)
        {
            var newSrc;
            switch (msbData[i][j][4])
            {
                case 0: {
                    newSrc = A.catalog({name:'MSB ToDo',shape:'catalogHiPS', color:'#67daee', sourceSize: 12});

                    //                catalog[i].push(srcToDo);
                    //                catalogToDo.push(srcToDo);

                    aladin.addCatalog(newSrc);
                    newSrc.addSources(A.source(msbData[i][j][2],msbData[i][j][3], {name: 'PID:'+ msbData[i][j][0] +' MSBID:'+msbData[i][j][1]}));
                    break;
                }
                case 1: {
                    newSrc = A.catalog({name:'MSB Doing', shape:'catalogHiPS', color:'#f0360e', sourceSize: 12});
//                    catalog[0].push(newSrc);
                    //                catalog[i].push(srcDoing);
                    //                catalogDoing.push(srcDoing);
//                    catalog[0][0] = newSrc;

                    aladin.addCatalog(newSrc);
                    newSrc.addSources(A.source(msbData[i][j][2], msbData[i][j][3], {name: 'PID:' + msbData[i][j][0] + ' MSBID:' + msbData[i][j][1]}));
                    break;
                }
                case 2: {
                    newSrc = A.catalog({name:'MSB Done', shape:'catalogHiPS', color:'#d3da34', sourceSize: 12});
//                    catalog[i][j] = newSrc;
                    //                catalog[i].push(srcDone);
                    //                catalogDone.push(srcDone);

                    aladin.addCatalog(newSrc);
                    newSrc.addSources(A.source(msbData[i][j][2], msbData[i][j][3], {name: 'PID:' + msbData[i][j][0] + ' MSBID:' + msbData[i][j][1]}));
                    break;
                }
            }
            catalog[i].push(newSrc);
        }
    }

    //    var srcToDo = A.catalog({name:'MSB ToDo',shape:'catalogHiPS', color:'#67daee', sourceSize: 12});
    //    aladin.addCatalog(srcToDo);
    //
    //    var srcDone = A.catalog({name:'MSB Done', shape:'catalogHiPS', color:'#d3da34', sourceSize: 12});
    //    aladin.addCatalog(srcDone);
    //
    //    var srcDoing = A.catalog({name:'MSB Doing', shape:'catalogHiPS', color:'#f0360e', sourceSize: 12});
    //    aladin.addCatalog(srcDoing);
    //
    //    srcToDo.addSources(A.source(226.2, 18.65, {name: 'PID_001 MSB_001'}));
    //    srcToDo.addSources(A.source(70.5, -42.4, {name: 'PID_001 MSB_002'}));
    //    srcToDo.addSources(A.source(250.4, 40.5, {name: 'PID_001 MSB_003'}));
    //
    //    srcToDo.addSources(A.source(-59.2, -13.9, {name: 'PID_002 MSB_004'}));
    //    srcToDo.addSources(A.source(147.21, 25.02, {name: 'PID_002 MSB_002'}));
    //    srcToDo.addSources(A.source(316.0, -49.7, {name: 'PID_002 MSB_003'}));
    //    srcDoing.addSources(A.source(32.53, 70, {name: 'PID_002 MSB_005'}));
    //    srcDone.addSources(A.source(-112.58, 1.57, {name: 'PID_002 MSB_001'}));
    //
    //    srcDone.addSources(A.source(298, 25, {name: 'PID_003 MSB_001'}));
    //    srcDone.addSources(A.source(30, 19.79, {name: 'PID_003 MSB_002'}));
    //    srcDone.addSources(A.source(70.5, -42.4, {name: 'PID_003 MSB_003'}));
    //    srcDone.addSources(A.source(280, 45, {name: 'PID_003 MSB_004'}));
    //
    //    srcDone.addSources(A.source(87, 12.9, {name: 'PID_004 MSB_001'}));
    //    srcDone.addSources(A.source(117.5, 46.7, {name: 'PID_004 MSB_002'}));
    //    srcDone.addSources(A.source(350, -45, {name: 'PID_004 MSB_003'}));

    var proposalData = [
//        ["PID","Title","Proposal","Rate"]
        ["001","Light","John","5.0"],
        ["002","Tianjin","Sam","6.0"],
        ["003","TJU","Lily","6.0"],
        ["004","Nankai","Jony","6.0"]];

    var proposalTable = document.getElementById("proposalTable");
    for(k=0; k<proposalData.length; k++)
    {
//        var PID = proposalDatap[k][0];
//        var Title = proposalDatap[k][1];
//        var Proposal = proposalDatap[k][2];
//        var Rate = proposalDatap[k][3];

        var rowsNum = proposalTable.rows.length;
        proposalTable.insertRow(rowsNum);

        var newRow = proposalTable.rows[rowsNum];
        newRow.id = proposalData[k][0];
//        newRow.onclick = function(){
//            alert("test");
////            var newRowId = this.id;
//        };

        for(j=0; j<4; j++)
        {
            proposalTable.rows[rowsNum].insertCell(j);
            var newCell = proposalTable.rows[rowsNum].cells[j];
            newCell.innerHTML = proposalData[k][j]; //文字信息
//            newCell.id = "proposalData[k][0]";
            newCell.style = "cursor: pointer";
        }

        proposalTable.rows[rowsNum].insertCell(j);
        newCell = proposalTable.rows[rowsNum].cells[j];
        newCell.innerHTML = "<label><input class= 'checkbox-inline' type='checkbox' name='aladinSource' value='Add' checked='checked'></label>"; //文字信息
    }
    //
    //function searchHiPS()
    //{
    ////    window.open('http://localhost:8080/LineChart/');
    //    alert("test");
    //}

    //    change image layers using radio btns
    $('input[name=aladinSource]').change(function() {
        // find index of changed input
        var index = $("label input").index(this);

        if (this.checked) {
            for(i=0; i<catalog[index].length; i++)
            {
                catalog[index][i].show();
            }
//            catalog[1][4].hide();
//            myOverlays[index].show();
        }
        else {
            for(i=0; i<catalog[index].length; i++)
            {
                catalog[index][i].hide();
            }
//            catalog[1][4].show();
//            myOverlays[index].hide();
        }
    });

    //change image layers using radio btns
    //$('input[name=moc]').change(function() {
    //    // find index of changed input
    //    var index = $("label input").index(this);
    //
    //    if (this.checked) {
    //        myOverlays[index].show();
    //    }
    //    else {
    //        myOverlays[index].hide();
    //    }
    //});

    <!--   Listening to events on sources. -->
    // define function triggered when  a source is hovered
    aladin.on('objectHovered', function(object) {
        var msg;
        var infoDiv = document.getElementById('infoDiv');
        if (object) {
            msg = object.data.name + ' located at ' + object.ra + ', ' + object.dec;
            infoDiv.style.color = '#000000';
//            infoDiv.color = ''
        }
        else {
            msg = ' no ';
            infoDiv.style.color = '#d5d9da';
        }
        $('#infoDiv').html(msg);
    });

    // define function triggered when an object is clicked
    var objClicked;
    aladin.on('objectClicked', function(object) {
        var msg;
        var infoDiv = document.getElementById('infoDiv');
        if (object) {
            objClicked = object;
            object.select();
            msg = object.data.name + ' located at ' + object.ra + ', ' + object.dec;
            infoDiv.style.color = '#000000';
        }
        else {
            objClicked.deselect();
            msg = ' no ';
            infoDiv.style.color = '#d5d9da';
        }
        $('#infoDiv').html(msg);
    });


    <!--   Marker creation: Clicking on a marker displays the associated popup. -->
    var landingSites = A.catalog({name:'tele position', sourceSize: 16});
    aladin.addCatalog(landingSites);

    landingSites.addSources([A.marker(33.53, 72, {popupTitle: 'tele position', popupDesc: 'The telescope is now observing location 33.53,72.'})]);
    //landingSites.addSources([A.marker(-125.7, 68.22, {popupTitle: 'Phoenix', popupDesc: 'Landing date: May 25, 2008 23:53:44 UTC'})]);
    //landingSites.addSources([A.marker(-33.22, 19.13, {popupTitle: 'Pathfinder', popupDesc: 'Landing date: July 4, 1997 16:56:55 UTC'})]);
    //landingSites.addSources([A.marker(354.4734, -1.9462, {popupTitle: 'Opportunity', popupDesc: 'Landing date: January 25, 2004, 05:05 UTC'})]);
    //landingSites.addSources([A.marker(-225.71, 47.64, {popupTitle: 'Viking 2', popupDesc: 'Landing date: September 3, 1976 22:37:50'})]);
    //landingSites.addSources([A.marker(175.472636, -14.5684, {popupTitle: 'Spirit', popupDesc: 'Landing date: January 4, 2004, 04:35 UTC '})]);
    //landingSites.addSources([A.marker(137.4417, -4.5895, {popupTitle: 'Curiosity', popupDesc: 'Landing date: August 6, 2012, 05:17 UTC '})])

    //<!--   Marker creation: Clicking on a marker displays the associated popup. -->
    //var cat_done = A.catalog({
    //    name: 'MSBs Observed',
    //    sourceSize: 18,
    //    color:'#2af009'
    //});
    //var cat_doing = A.catalog({
    //    name: 'MSBs Observing',
    //    sourceSize: 18,
    //    color:'#f00306'
    //});
    //var cat_todo = A.catalog({
    //    name: 'MSBs To Observe',
    //    sourceSize: 18,
    //    color:'#f09208'
    //});
    //
    //aladin.addCatalog(cat_done);
    //aladin.addCatalog(cat_doing);
    //aladin.addCatalog(cat_todo);
    //
    //cat_todo.addSources([A.marker(57.29673, 24.13671, {popupTitle: 'PID_001 MSB_001', popupDesc: '<em>PID:</em> 001<br/><em>MID:</em> 001<br/><em>Current State: </em>MSBs To Observe.})]);
    //    cat_doing.addSources([A.marker(56.87115, 24.10514, {popupTitle: 'PID_001 MSB_002', popupDesc: '<em>PID:</em> 001<br/><em>MID:</em> 002<br/><em>Current State:</em>;
    //    cat_done.addSources([A.marker(56.58156, 23.94836, {popupTitle: 'PID_002 MSB_002', popupDesc: '<em>PID:</em> 002<br/><em>MID:</em> 002<br/><em>Current State: </em><a target="_blank" href="http://simbad.u-strasbg.fr/simbad/sim-id?Ident=V*+V971+Tau&NbIdent=1">in Simbad</a>'})]);
    //cat_done.addSources([A.marker(56.45669, 24.36775, {popupTitle: 'PID_002 MSB_003', popupDesc: '<em>PID:</em> 002<br/><em>MID:</em> 003<br/><em>Current State: </em><a target="_blank" href="http://simbad.u-strasbg.fr/simbad/sim-id?Ident=NAME+MAIA&NbIdent=1">in Simbad</a>'})]);
    //cat_done.addSources([A.marker(56.21890, 24.11334, {popupTitle: 'PID_003 MSB_001', popupDesc: '<em>PID:</em> 003<br/><em>MID:</em> 001<br/><em>Current State: </em><a target="_blank" href="http://simbad.u-strasbg.fr/simbad/sim-id?Ident=NAME+ELECTRA&NbIdent=1">in Simbad</a>'})]);
    //cat_done.addSources([A.marker(56.30207, 24.46728, {popupTitle: 'PID_003 MSB_002', popupDesc: '<em>PID:</em> 003<br/><em>MID:</em> 002<br/><em>Current State:</em> <a target="_blank" href="http://simbad.u-strasbg.fr/simbad/sim-id?Ident=NAME+TAYGETA&NbIdent=1">in Simbad</a>'})]);

    //<!-- Display a footprint overlay: available overlays include polylines, circles and polygons. -->
    //    // polygon: 多边形
    //    var overlay = A.graphicOverlay( {color: '#2345ee', lineWidth: 3});
    //    aladin.addOverlay(overlay);
    //
    //    var raDecArray_polygon =
    //            [[270.62172, -23.04858], [270.59267, -23.08082], [270.62702, -23.10701],
    //            [270.64113, -23.09075], [270.63242, -23.08376], [270.63868, -23.07631],
    //            [270.63131, -23.07021], [270.63867, -23.06175]];
    //    overlay.addFootprints([A.polygon(raDecArray_polygon)]);
    //
    //    function changePolygonColor(overlayPolygon,raDecArray,NewColor){
    //        overlayPolygon = A.graphicOverlay( {color: NewColor, lineWidth: 3});
    //        aladin.addOverlay(overlayPolygon);
    //        overlayPolygon.addFootprints([A.polygon(raDecArray)]);
    //    }
    //
    //    changePolygonColor(overlay,raDecArray_polygon,'#2af009');

    //    // polyline: 线段
    //    var raDecArray_polyline = [[270.62172, -23.04858], [270.59267, -23.08082]];
    //    overlay.add(A.polyline(raDecArray_polyline));
    //
    //    // circle: 圆
    //    var raDec_circle = (270.62172, -23.04858, 0.03);
    //    overlay.add(A.circle(270.62172, -23.04858, 0.03,{color:'#2af009'}));

    // add moc
    //    var json = {"3":[517],
    //        "4":[2065,2066,2067,2112,2344,2346,2432],
    //        "5":[8221,8257,8258,8259,8293,8304,8305,8307,8308,8452,8456,9346,9352,9354,9736],
    //        "6":[32861,32862,32863,32881,32882,32883,32892,32893,33025,33026,33027,33157,33168,33169,33171,
    //            33181,33224,33225,33227,33236,33240,33812,33816,33828,33832,37377,37378,37379,37382,37388,
    //            37390,37412,37414,37420,37422,37562,38928,38930,38936,38948,38952],
    //        "7":[131423,131439,131443,131523,131556,131557,131580,131581,132099,132612,132613,132624,132625,132627,132637,
    //            132680,132681,132683,132709,132720,132721,132904,132905,132948,132952,132964,132968,133008,133009,133012,135252,135256,135268,135316,135320,135332,135336,148143,148152,148154,149507,149520
    //            ,149522,149523,149652,149654,149660,149662,149684,149686,149692,149694,149695,150120,150122,150208,150210,150216,150218,150240,150242,150243,155748,155752,155796,155800,155812,155816]};
    //
    //    var moc = A.MOCFromJSON(json, {opacity: 0.25, color: 'magenta', lineWidth: 1});
    //    aladin.addMOC(moc);

    //    function showProposalMSB(propId) {
    //        globalSearchCond = '[{"type":"pid","cond":"' + propId + '","opt":"oeq"}]';
    //        addSearchStatus('searchstatus');
    //        fetchData(globalSearchCond, null);
    //    }
    //    function jumpToP001(){
    ////    window.open('../html/p001.html');
    //        window.open('http://localhost:8080/LineChart/');
    //    }



    function show(a) {
        if(a == 0)
            window.location.href= "/constellation";
        else if(a == 1)
            window.location.href= "/constellation/multisourcefusion";
    }

</script>

<%--<!-- d3.js  -->--%>
<%--<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>--%>


<!-- wwt Advanced Search  -->
<%--<jsp:include page="../common/msb_searchbox.jsp"></jsp:include>--%>

</body>
</html>