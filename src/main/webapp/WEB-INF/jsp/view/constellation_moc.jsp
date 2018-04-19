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

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <link rel="icon" href="images/virgo.ico">
    <link rel="stylesheet" href="css/virgo_website.css">
    <link rel="stylesheet" href="css/font-awesome-4.7.0/css/font-awesome.css">
    <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
    <script type="text/javascript" src="scripts/jquery/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="scripts/virgo_website.js"></script>
    <script type="text/javascript" src="scripts/aladin.js"></script>
    <!-- Aladin Lite JS code and CSS -->
    <script type="text/javascript" src="https://aladin.u-strasbg.fr/AladinLite/api/v2/latest/aladin.min.js" charset="utf-8"></script>
    <link rel="stylesheet" href="https://aladin.u-strasbg.fr/AladinLite/api/v2/latest/aladin.min.css" />

    <!-- Aladin lite popup window-->
    <style type="text/css">

    </style>

    <style type="text/css">
        .aladin-popup {
            width: 200px;
        }

        table,td,th
        {
            border:2px solid #ffffff
        }

        table
        {

            width:100%;
            text-align: center
        }

        tr
        {
            height:35px;;
            size: 8pt;
        }
        th
        {
            height:70px;
        }
    </style>
</head>


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


                        <!-- Project List -->

                        <!-- Constellation -->
                        <%--<div class="col-lg-9">--%>
                        <div class="box">
                            <h3 class="box_title">Constellation</h3>
                            <div class="content">
                                <div class="2buttons">
                                    <button id onclick="show(0)">Constellation Skymap</button>
                                    <button id onclick="show(1)">Constellation Area</button>
                                    <button id onclick="show(2)">Multisource Fusion</button>

                                    <p></p>
                                    <p></p>
                                </div>

                                <div id="SkySurveyControlHost">

                                    <%--<div id="SkySurveyControlHost">--%>

                                    <%--<!-- wwt -->--%>
                                    <%--&lt;%&ndash;<div id="WWTCanvas"&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;style="width:970px; height:680px; border-style: none; border-width: 0px;"></div>&ndash;%&gt;--%>

                                    <%--<button id onclick="show(0)">默认天区</button>--%>
                                    <%--<button id onclick="show(1)">观测区域</button>--%>

                                    <%--<!-- hips -->--%>
                                    <%--<div id='infoDiv'>&nbsp; </div>--%>
                                    <%--<div class ="aladin-lite-div"--%>
                                    <%--&lt;%&ndash;id = "default"&ndash;%&gt;--%>
                                    <%--style="width:970px;height:680px;"></div>   //visibility: hidden;--%>
                                    <%----%>


                                    <%--</div>--%>



                                    <!-- Interactive Skymap -->
                                    <div class="w3-container w3-padding-0 w3-border-grey w3-half"
                                         style="width:680px; float: left">
                                        <!-- Aladin Lite container at requested dimensions -->
                                        <div id="aladin-lite-div" style="width:680px;height:620px;z-index:0"></div>

                                        <!-- Backgrounds. -->
                                        <%--<p><b><i class="fa fa-file-image-o"></i> Backgrounds</b></p>--%>
                                        <%--<p>If you want to see the extension of these sky regions through the constellations you can select an artistic background image <input id="Constellation6" class="checkbox-inline" type="radio" name="survey" value="P/CONSTELLATIONS6" ><label for="Constellations"><b>Constellations.</b><label></p>--%>
                                        <p></p>
                                        <p>You can also select various background images at different wavelengths, combining the electromagnetic data with the gravitational-wave information:
                                        <p></p>
                                        <input id="Mellinger" class="checkbox-inline" type="radio" name="survey" value="P/Mellinger/color" checked ><label for="Mellinger"><b> Mellinger (default)   </b><label>
                                        <input id="WISE" class="checkbox-inline" type="radio" name="survey" value="P/allWISE/color"><label for="WISE"><b> WISE   </b><label>
                                        <input id="2MASS" class="checkbox-inline" type="radio" name="survey" value="P/2MASS/color"><label for="2MASS"><b> 2MASS   </b><label>
                                        <input id="DSS" class="checkbox-inline" type="radio" name="survey" value="P/DSS2/color" ><label for="DSS"><b> DSS color   </b><label>
                                        <input id="XMM" class="checkbox-inline" type="radio" name="survey" value="P/XMM/PN/color"><label for="XMM"><b> XMM   </b><label>
                                        <input id="Fermi" class="checkbox-inline" type="radio" name="survey" value="P/Fermi/color"><label for="allwise"><b> Fermi   </b><label><p>

                                    </div>

                                    <!-- The Using the skymap container on large screens. -->
                                    <%--<div class="w3-container w3-padding w3-responsive w3-half"--%>
                                    <div class="choiceTable"
                                         style="background-color: #dbdfe0; float: right">
                                        <h4><i class="fa fa-map"></i> Using the skymap</h4>
                                        <p>Click on the various options below to display information relating to each detection.</p>
                                        <!-- Options table. -->
                                        <table class="w3-table-all">
                                            <thead>
                                            <tr class="w3-dark-grey" style="background-color: #585b5c;color:#ffffff">
                                                <th class="w3-border-right">MSB ID</th>
                                                <th class="w3-center w3-border-right">Pop-up info</th>
                                                <th class="w3-center w3-border-right">Label</th>
                                                <th class="w3-center">Sky Survey Area</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr class="w3-blue" style="background-color:#00BFFF;color:#ffffff">
                                                <td class="w3-border-right">001</td>
                                                <td class="w3-center w3-border-right"><label><input class="checkbox-inline" type="checkbox" name="moc" value="MSB 001" unchecked /></label></td>
                                                <td class="w3-center w3-border-right"><label><input class="checkbox-inline" type="checkbox" name="moc" value="label" unchecked /></label></td>
                                                <td class="w3-center"><label><input class="checkbox-inline" type="checkbox" name="moc" value="popup info" unchecked /></label></td>
                                            </tr>
                                            <tr class="w3-orange" style="background-color:#FF8100;color:#ffffff">
                                                <td class="w3-border-right">002</td>
                                                <td class="w3-center w3-border-right"><label><input class="checkbox-inline" type="checkbox" name="moc" value="MSB 002" unchecked /></label></td>
                                                <td class="w3-center w3-border-right"><label><input class="checkbox-inline" type="checkbox" name="moc" value="label" unchecked /></label></td>
                                                <td class="w3-center"><label><input class="checkbox-inline" type="checkbox" name="moc" value="popup info" unchecked /></label></td>
                                            </tr>
                                            <tr class="w3-light-green" style="background-color:#7CFC00;color:#000000">
                                                <td class="w3-border-right">003</td>
                                                <td class="w3-center w3-border-right"><label><input class="checkbox-inline" type="checkbox" name="moc" value="MSB 003" unchecked /></label></td>
                                                <td class="w3-center w3-border-right"><label><input class="checkbox-inline" type="checkbox" name="moc" value="label" unchecked /></label></td>
                                                <td class="w3-center"><label><input class="checkbox-inline" type="checkbox" name="moc" value="popup info" unchecked /></label></td>
                                            </tr>
                                            <tr class="w3-khaki" style="background-color:#F0E68C;color:#000000">
                                                <td class="w3-border-right">004</td>
                                                <td class="w3-center w3-border-right"><label><input class="checkbox-inline" type="checkbox" name="moc" value="MSB 004" unchecked /></label></td>
                                                <td class="w3-center w3-border-right"><label><input class="checkbox-inline" type="checkbox" name="moc" value="label" unchecked /></label></td>
                                                <td class="w3-center"><label><input class="checkbox-inline" type="checkbox" name="moc" value="popup info" unchecked /></label></td>
                                            </tr>
                                            <tr class="w3-purple" style="background-color:#ff00ff;color:#ffffff">
                                                <td class="w3-border-right">005</td>
                                                <td class="w3-center w3-border-right"><label><input class="checkbox-inline" type="checkbox" name="moc" value="MSB 004" unchecked /></label></td>
                                                <td class="w3-center w3-border-right"><label><input class="checkbox-inline" type="checkbox" name="moc" value="label" unchecked /></label></td>
                                                <td class="w3-center"><label><input class="checkbox-inline" type="checkbox" name="moc" value="popup info" unchecked /></label></td>
                                            </tr>
                                            <tr class="w3-red" style="background-color:#ff8080;color:#ffffff">
                                                <td class="w3-border-right">006</td>
                                                <td class="w3-center w3-border-right"><label><input class="checkbox-inline" type="checkbox" name="moc" value="MSB 006" unchecked /></label></td>
                                                <td class="w3-center w3-border-right"><label><input class="checkbox-inline" type="checkbox" name="moc" value="label" unchecked /></label></td>
                                                <td class="w3-center"><label><input class="checkbox-inline" type="checkbox" name="moc" value="popup info" unchecked /></label></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>


                                </div>


                            </div>
                        </div>
                        <%--</div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- hips Panel  -->
<!-- Creation of Aladin Lite instance with initial parameters -->
<script type='text/javascript' src='http://aladin.u-strasbg.fr/AladinLite/api/v2/latest/aladin.min.js' charset='utf-8'></script>
<%--<script>--%>
<%--// Start up Aladin Lite--%>
<%--var aladin = A.aladin('#aladin-lite-div', {--%>
<%--survey: "P/Mellinger/color",--%>
<%--target: '3 28 35.268 -35 50 14.04',--%>
<%--fov: 175,--%>
<%--fullScreen:false,--%>
<%--showReticle:true,--%>
<%--showLayersControl: false,--%>
<%--showGotoControl:false--%>
<%--});--%>
<%--//aladin.setProjection('AITOFF')--%>

<%--//popup windows ligo localization: bayestar skymap--%>
<%--var gw1408_pop_hl = A.catalog({name: 'popup info', sourceSize: 12, color: '#00BFFF'});--%>
<%--aladin.addCatalog(gw1408_pop_hl);--%>
<%--gw1408_pop_hl.addSources([A.marker(51.0000, 3.500, {popupTitle: 'GW170814: Rapid LIGO localization ', popupDesc: '<em>Area (50%): 333 sq. deg. <br>Area (90%): 1158 sq. deg.</em>'})]);--%>
<%--//    gw1408_pop_hl.hide()--%>

<%--</script>--%>

<script type="text/javascript">

    // Start up Aladin Lite
    var aladin = A.aladin('#aladin-lite-div', {
        survey: "P/Mellinger/color",
        target: '3 28 35.268 -35 50 14.04',
        fov: 175
//        fullScreen:false,
//        showReticle:true,
//        showLayersControl: true,
//        showGotoControl:true
    });
    //aladin.setProjection('AITOFF')

    //popup windows ligo localization: bayestar skymap
    var gw1408_pop_hl = A.catalog({name: 'popup info', sourceSize: 12, color: '#00BFFF'});
    aladin.addCatalog(gw1408_pop_hl);
    gw1408_pop_hl.addSources([A.marker(51.0000, 3.500, {popupTitle: 'MSB 001', popupDesc: '<em>Area (50%): 333 sq. deg. <br>Area (90%): 1158 sq. deg.</em>'})]);
    gw1408_pop_hl.hide()

    //popup windows ligo and virgo localization: bayestar skymap
    var gw1408_pop_hlv = A.catalog({name: 'popup info', sourceSize: 12, color: '#FF8100'});
    aladin.addCatalog(gw1408_pop_hlv);
    gw1408_pop_hlv.addSources([A.marker(45.5000, -36.0147, {popupTitle: 'MSB 002', popupDesc: '<em>Area (50%): 22 sq. deg.<br>Area (90%): 97.4 sq. deg.</em>'})]);
    gw1408_pop_hlv.hide()


    //popup windows ligo and virgo localization: refined skymap
    var gw1408_pop_ref = A.catalog({name: 'popup info', sourceSize: 12, color: '#7CFC00'});
    aladin.addCatalog(gw1408_pop_ref);
    gw1408_pop_ref.addSources([A.marker(45.7917,  -48.8250, {popupTitle: 'MSB 003', popupDesc: '<em>Area (50%): 12.9 sq. deg. <br>Area (90%): 61.7 sq. deg.</em>'})]);
    gw1408_pop_ref.hide()

    //popup windows gw150914: lalinference skymap
    var gw0914_pop_hl = A.catalog({name: 'popup info', sourceSize: 12, color: '#F0E68C'});
    aladin.addCatalog(gw0914_pop_hl);
    gw0914_pop_hl.addSources([A.marker(156.0250, -44.2144, {popupTitle: 'MSB 004', popupDesc: '<em>Area (50%): 149.1 sq. deg. <br>Area (90%): 616.4 sq. deg. </em>'})]);
    gw0914_pop_hl.hide()

    //popup windows gw151226: lalinference skymap
    var gw1226_pop_hl = A.catalog({name: 'popup info', sourceSize: 12, color: '#ff00ff'});
    aladin.addCatalog(gw1226_pop_hl);
    gw1226_pop_hl.addSources([A.marker(17.5333,  -17.0119, {popupTitle: 'MSB 005', popupDesc: '<em>Area (50%): 288.3 sq. deg. <br>Area (90%): 887.9 sq. deg.  </em>'})]);
    gw1226_pop_hl.hide()

    //popup windows gw170104: lalinference skymap
    var gw0104_pop_hl = A.catalog({name: 'popup info', sourceSize: 12, color: '#ff8080'});
    aladin.addCatalog(gw0104_pop_hl);
    gw0104_pop_hl.addSources([A.marker(109.3917,  3.7333, {popupTitle: 'MSB 006', popupDesc: '<em>Area (50%): 384 sq. deg. <br> Area (90%): 1609 sq. deg. </em>'})]);
    gw0104_pop_hl.hide()


    // define custom draw function: LIGO localization GW170814
    var drawFunction = function(source, canvasCtx, viewParams) {
        canvasCtx.beginPath();
        canvasCtx.arc(source.x, source.y, source.data['size'] * 2, 0, 2 * Math.PI, false);
        canvasCtx.closePath();
        canvasCtx.strokeStyle = '#c38';
        canvasCtx.lineWidth = 3;
        canvasCtx.globalAlpha = 0.7,
            canvasCtx.stroke();
        var fov = Math.max(viewParams['fov'][0], viewParams['fov'][1]);

        // object name is displayed
        if (fov>180) {
            return;
        }

        canvasCtx.globalAlpha = 0.9;
        canvasCtx.globalAlpha = 1;

        var xShift = 20;
        var xShift2 = 50;

        canvasCtx.font = 'small-caps bold 22px arial'
        canvasCtx.fillStyle = '#00BFFF';
        canvasCtx.fillText(source.data['name'], source.x + xShift2, source.y -8);

        // object type is displayed
        if (fov>180) {
            return;
        }
        canvasCtx.font = 'small-caps bold 20px arial'
        canvasCtx.fillStyle = '#ffffff';
        canvasCtx.fillText(source.data['otype'], source.x + 2 + xShift, source.y + 10);
    };

    // create sources objects LIGO localization - Area (90%) = 1158 sq. deg'
    var ligo_loc = A.source(52.800, 5.800, {name: 'MSB 001', size: 0, otype: 'of PID 002'});

    // create catalog layer with custom draw function
    var gw1408_info_hl = A.catalog({name: 'cat', shape: drawFunction, color:'white'});
    // add sources to the new layer
    gw1408_info_hl.addSources([ligo_loc]);
    aladin.addCatalog(gw1408_info_hl);
    gw1408_info_hl.hide();

    // define custom draw function: GW150914
    var drawFunction = function(source, canvasCtx, viewParams) {
        canvasCtx.beginPath();
        canvasCtx.arc(source.x, source.y, source.data['size'] * 2, 0, 2 * Math.PI, false);
        canvasCtx.closePath();
        canvasCtx.strokeStyle = '#c38';
        canvasCtx.lineWidth = 3;
        canvasCtx.globalAlpha = 0.7,
            canvasCtx.stroke();
        var fov = Math.max(viewParams['fov'][0], viewParams['fov'][1]);

        // object name is displayed
        if (fov>180) {
            return;
        }

        canvasCtx.globalAlpha = 0.9;
        canvasCtx.globalAlpha = 1;

        var xShift = 20;

        canvasCtx.font = 'small-caps bold 22px arial'
        canvasCtx.fillStyle = '#F0E68C';
        canvasCtx.fillText(source.data['name'], source.x + xShift, source.y -8);

        // object type is displayed
        if (fov>180) {
            return;
        }
        canvasCtx.font = 'small-caps bold 18px arial'
        canvasCtx.fillStyle = '#ffffff';
        canvasCtx.fillText(source.data['otype'], source.x + 2 + xShift, source.y + 10);
    };
    // create sources objects
    var gw159814_info = A.source(156.0250, -44.2144, {name: 'MSB 004', size: 0, otype: 'of PID 002'});

    // create catalog layer with custom draw function
    var gw0914_info_hl = A.catalog({name: 'cat', shape: drawFunction, color:'white'});
    // add sources to the new layer
    gw0914_info_hl.addSources([gw159814_info]);
    aladin.addCatalog(gw0914_info_hl);
    gw0914_info_hl.hide();


    // define custom draw function: GW151226
    var drawFunction = function(source, canvasCtx, viewParams) {
        canvasCtx.beginPath();
        canvasCtx.arc(source.x, source.y, source.data['size'] * 2, 0, 2 * Math.PI, false);
        canvasCtx.closePath();
        canvasCtx.strokeStyle = '#c38';
        canvasCtx.lineWidth = 3;
        canvasCtx.globalAlpha = 0.7,
            canvasCtx.stroke();
        var fov = Math.max(viewParams['fov'][0], viewParams['fov'][1]);

        // object name is displayed
        if (fov>180) {
            return;
        }

        canvasCtx.globalAlpha = 0.9;
        canvasCtx.globalAlpha = 1;

        var xShift = 20;

        canvasCtx.font = 'small-caps bold 22px arial'
        canvasCtx.fillStyle = '#ff00ff';
        canvasCtx.fillText(source.data['name'], source.x + xShift, source.y -8);

        // object type is displayed
        if (fov>180) {
            return;
        }
        canvasCtx.font = 'small-caps bold 18px arial'
        canvasCtx.fillStyle = '#ffffff';
        canvasCtx.fillText(source.data['otype'], source.x + 2 + xShift, source.y + 10);
    };
    // create sources objects
    var gw151226_info = A.source(17.5333,  -17.0119, {name: 'MSB 005', size: 0, otype: 'of PID 002'});

    // create catalog layer with custom draw function
    var gw1226_info_hl = A.catalog({name: 'cat', shape: drawFunction, color:'white'});
    // add sources to the new layer
    gw1226_info_hl.addSources([gw151226_info]);
    aladin.addCatalog(gw1226_info_hl);
    gw1226_info_hl.hide();

    // define custom draw function: GW170104
    var drawFunction = function(source, canvasCtx, viewParams) {
        canvasCtx.beginPath();
        canvasCtx.arc(source.x, source.y, source.data['size'] * 2, 0, 2 * Math.PI, false);
        canvasCtx.closePath();
        canvasCtx.strokeStyle = '#c38';
        canvasCtx.lineWidth = 3;
        canvasCtx.globalAlpha = 0.7,
            canvasCtx.stroke();
        var fov = Math.max(viewParams['fov'][0], viewParams['fov'][1]);

        // object name is displayed
        if (fov>180) {
            return;
        }

        canvasCtx.globalAlpha = 0.9;
        canvasCtx.globalAlpha = 1;

        var xShift = 20;

        canvasCtx.font = 'small-caps bold 22px arial'
        canvasCtx.fillStyle = '#ff8080';
        canvasCtx.fillText(source.data['name'], source.x + xShift, source.y -8);

        // object type is displayed
        if (fov>180) {
            return;
        }
        canvasCtx.font = 'small-caps bold 18px arial'
        canvasCtx.fillStyle = '#ffffff';
        canvasCtx.fillText(source.data['otype'], source.x + 2 + xShift, source.y + 10);
    };
    // create sources objects
    var gw170104_info = A.source(109.3917,  3.7333, {name: 'MSB 006', size: 0, otype: 'of PID 002'});

    // create catalog layer with custom draw function
    var gw0104_info_hl = A.catalog({name: 'cat', shape: drawFunction, color:'white'});

    // add sources to the new layer
    gw0104_info_hl.addSources([gw170104_info]);
    aladin.addCatalog(gw0104_info_hl);
    gw0104_info_hl.hide();

    // MOC CONFIDENCE REGIONS //

    // GW170814: gw1408_bays_hl.fits.gz,0; moc = 90%
    var json =
        {"3":[362,519,525,527,549,562,572],
            "4":[1452,1454,1455,1466,2071,2097,2099,2105,2112,2205,2240,2242,2243,2252,2254,
                2255,2266,2273,2276,2277,2279,2294,2295,2296,2297,2300,2301,2303],
            "5":[4,5,16,17,5768,5770,5771,5774,5775,5814,5815,5858,5859,5862,5863,
                5868,5869,8277,8278,8279,8281,8282,8283,8295,8301,8303,8428,8429,8431,8456,
                8458,8610,8616,8618,8619,8773,8775,8781,8783,8816,8817,8819,8828,8829,8831,
                8966,8986,9012,9014,9015,9070,9088,9089,9101,9112,9113,9115,9140,9141,9168,
                9170,9171,9174,9197,9208,9209,9211,9386,9387,9390,9728,9729,9730],
            "6":[0,1,4,5,80,81,82,84,85,256,257,17748,17749,23050,23076,
                23078,23079,23090,23091,23146,23147,23250,23251,23254,23255,23480,23481,23496,23498,23520,
                33087,33101,33102,33103,33107,33121,33123,33173,33174,33175,33179,33201,33203,33209,33210,
                33211,33720,33721,33723,33808,33809,33810,33828,33830,33920,33922,33928,34346,34432,34434,
                34468,34470,35089,35091,35097,35099,35221,35223,35272,35273,35275,35300,35301,35303,35320,
                35321,35323,35669,35856,35858,35859,35868,35870,35871,35936,35938,35939,35948,35950,35951,
                36054,36234,36235,36274,36284,36286,36287,36330,36361,36364,36365,36367,36400,36401,36413,
                36456,36457,36459,36549,36572,36573,36676,36678,36679,36690,36700,36702,36703,36772,36773,
                36784,36785,36787,36797,36840,36841,37542,37543,37554,38924,38925,38926,38928,38944,38945,
                38946],
            "7":[12,13,24,25,28,29,31,332,333,344,345,1040,1041,70976,70977,
                70980,70981,70983,92204,92206,92207,92308,92310,92311,92354,92355,92378,92379,92578,92579,
                92602,92603,92992,92994,92995,92998,92999,93704,93706,93707,93710,93711,93722,93723,93726,
                93727,93770,93771,93774,93775,93786,93787,93790,93791,93928,93929,93930,93932,93933,93936,
                93937,93938,93988,93990,93996,93998,94088,132341,132343,132421,132422,132423,132425,132426,132427,
                132489,132490,132491,132689,132690,132691,132709,132711,132809,132811,132833,132835,134888,134889,134891,
                135244,135245,135246,135248,135264,135265,135266,135316,135318,135684,135686,135720,135722,135808,135810,
                137352,137354,137376,137378,137379,137740,137742,137743,137784,137786,137884,137886,137960,137962,137963,
                140353,140355,140361,140363,140484,140485,140487,140493,140495,140881,140883,141097,141188,141189,141191,
                141209,141237,142672,142673,142675,142684,142685,142687,143430,143798,143799,143848,143850,143851,144222,
                144223,144928,144930,144931,144952,144954,144955,145090,145091,145100,145102,145103,145140,145142,145143,
                145324,145326,145327,145441,145464,145465,145467,145556,145557,145612,145613,145615,145648,145649,145832,
                145833,145835,146192,146193,146195,146204,146205,146276,146277,146300,146301,146708,146710,146711,146764,
                146766,146767,146804,146806,146807,147076,147077,147100,147101,147144,147145,147147,147184,147185,147372,
                147373,150157,150158,150159,150220,150222,150223,155716,155718,155720,155721,155722],
            "8":[375851]}

    var gw1408_bays_hl = A.MOCFromJSON(json, {name:'MSB 001)', opacity: 0.55,color: '#00BFFF', lineWidth: 1,adaptativeDisplay: false});
    aladin.addMOC(gw1408_bays_hl);
    gw1408_bays_hl.hide();

    //GW170814: gw1408_bays_hlv.fits.gz,0; moc = 90%
    var json =
        {"4":[2197],
            "5":[8430,8431,8442,8443,8446,8773,8784,8785,8787,8960,8962,8963,8966],
            "6":[33711,33718,33719,33762,33763,33766,33788,33790,33791,34474,35088,35089,35091,35101,35144,
                35145,35189,35844,35846,35847,35872,35873,35876,35877,35888,35889,35892],
            "7":[134837,134839,134859,134862,134863,135068,135070,135071,135114,135115,135118,135156,135158,135159,137890,
                137900,137902,137903,137914,140309,140361,140400,140401,140585,140588,140589,140693,140736,140737,140740,
                140741,140752,140753,140755,143380,143382,143383,143432,143434,143435,143480,143482,143483,143501,143512,
                143513,143516,143517,143560,143561,143564,143565,143576,143577],
            "8":[539353,539354,539355,539434,539435,539442,539443,539445,539446,539447,540170,540171,540174,540175,540278,
                540279,540450,540451,540454,540476,540478,540479,540522,540523,540526,540630,540631,551554,551564,551566,
                551567,551578,551604,551606,551607,551650,551660,551662,551663,561233,561235,561244,561245,561247,561440,
                561441,561443,561453,561556,561557,561612,561613,561652,561653,562336,562337,562339,562360,562361,562364,
                562365,562367,562756,562757,562768,562769,562771,562957,562968,562969,562972,562973,563016,563017,563019,
                563061,573526,573704,573706,573707,573732,573734,573735,573752,573754,573755,573758,573896,573898,573899,
                573924,573926,573927,573946,573984,573985,573988,573989,574000,574001,574003,574061,574072,574073,574076,
                574077,574248,574249,574252,574253,574264,574265,574268,574269,574288,574290,574296,574298,574312,574313,
                574320],
            "10":[]}

    var gw1408_bays_hlv = A.MOCFromJSON(json, {name:'MSB 002', opacity: 0.70,color: '#FF8100', lineWidth: 1,adaptativeDisplay: false});
    aladin.addMOC(gw1408_bays_hlv);
    gw1408_bays_hlv.hide();

    //GW150914: LALINFERENCE
    var json =
        {"4":[2065,2067,2068,2070,2073,2075,2076,2078,2100,2318,2319,2330,2331,2334,2335,
            2337,2338,2340,2378],
            "5":[6702,8257,8259,8265,8267,8276,8278,8289,8291,8389,8404,8406,8408,8409,8411,
                8412,8414,9261,9262,9263,9314,9315,9318,9319,9345,9346,9347,9356,9357,9358,
                9364,9365,9366,9368,9376,9377,9378,9408,9409,9412,9413,9424,9425,9428,9429,
                9518,9519,9530,9600,9601,9604,9605,9616,9617,9620],
            "6":[26758,26764,26765,26767,26778,26789,26800,26802,26803,26814,27153,27156,27158,27159,27164,
                27165,27167,27189,33027,33033,33034,33035,33056,33057,33059,33065,33067,33108,33110,33136,
                33138,33144,33146,33147,33153,33188,33189,33191,33232,33234,33240,33266,33272,33274,33275,
                33553,33555,33564,33565,33567,33641,33652,33654,33660,33662,33744,33745,33747,33748,33750,
                37023,37037,37038,37039,37042,37043,37066,37067,37070,37071,37082,37083,37085,37086,37087,
                37322,37323,37326,37327,37338,37339,37342,37343,37377,37378,37379,37436,37437,37438,37468,
                37469,37476,37477,37478,37480,37516,37517,37520,37521,37522,37536,37538,37640,37641,37644,
                37645,37656,38026,38064,38066,38067,38070,38071,38126,38127,38138,38484,38486,38492],
            "7":[106668,106670,106671,107012,107013,107015,107021,107024,107026,107027,107036,107038,107039,107065,107067,
                107106,107153,107164,107165,107167,107189,107191,107206,107248,107250,107262,108609,108611,108620,108621,
                108623,108628,108630,108645,108664,108665,108667,108753,108764,108765,108767,108789,108928,132100,132101,
                132103,132107,132129,132130,132131,132233,132235,132257,132265,132464,132548,132549,132550,132556,132582,
                132620,132621,132623,132645,132647,132653,132655,132761,132788,132789,132791,132932,132966,132968,132969,
                132970,133058,133092,133094,134209,134245,134265,134267,134353,134356,134357,134359,134365,134514,134520,
                134522,134523,134561,134573,134614,134620,134622,134644,134646,134652,134654,134929,134932,134933,134935,
                134984,134985,134996,134998,135004,135006,135024,135025,135027,135028,135030,148091,148125,148126,148127,
                148143,148145,148146,148147,148165,148166,148167,148275,148278,148279,148321,148322,148323,148325,148326,
                148327,148337,148338,148339,149007,149019,149022,149023,149066,149280,149282,149283,149286,149287,149298,
                149299,149302,149303,149346,149347,149350,149351,149362,149363,149507,149756,149757,149758,149880,149881,
                149882,149884,149885,149916,149924,149925,149926,149936,149952,150072,150073,150074,150076,150077,150078,
                150092,150093,150096,150097,150098,150112,150148,150149,150150,150176,150628,150629,150816,150817,150820,
                150821,150832,150833,150836,150837,150880,150881,152108,152110,152111,152122,152123,152126,152260,152262,
                152263,152274,152275,152278,152456,152458,152459,152462,152496,152498,152499,152502,152503,152547,152556,
                152558,152559,152570,153713,153716,153717,153888,153889,153892,153893,153895,153904,153905,153908,153909,
                153911,153940,153942,153948,153950,153952,153953,153956,153957,153959,153972,153974,153976,153977,153980,
                153981],
            "8":[426650,426651,426676,426678,426679,426728,426730,426731,428059,428093,428095,428102,428122,428181,428257,
                428259,428265,428418,428474,428621,428623,428665,428667,428816,428818,428819,428830,428904,428906,429004,
                429006,429007,429042,434489,434491,434518,434524,434526,434527,434589,434591,434613,434664,434665,434667,
                435009,435020,435021,435023,435064,435065,435067,435153,435164,435165,435242,435328,435330,435336,435338,
                435360,435362,435368,435370,435720,435722,435723,435744,435745,435746,435752,435754,528409,528410,528411,
                529037,529039,529069,529071,529754,529776,529778,529784,529860,529864,530204,530205,530206,530320,530322,
                530332,530334,530335,530437,530439,531052,531053,531055,531161,531163,531188,531189,531191,531197,531736,
                531738,531856,531858,531884,531885,531886,531888,531890,532224,532226,532238,532274,532280,532282,532283,
                532372,532374,532380,532382,532383,532456,532458,536833,536844,536845,536847,536869,536989,537056,537057,
                537059,537065,537432,537433,537435,537457,537469,537920,537922,537928,537930,537931,537952,537953,537954,
                537960,537962,538048,538050,538051,538084,538086,538241,538253,538289,538301,538450,538486,538492,538494,
                538580,538582,538588,538590,538612,538614,538620,538622,539713,539725,539736,539737,539739,539764,539765,
                539948,539949,539951,539988,539990,539996,539998,540020,540022,540028,540030,540052,540053,540055,540105,
                540116,540118,592357,592359,592363,592565,592566,592567,592569,592570,592571,592657,592658,592659,593039,
                593054,593055,593097,593098,593099,593282,593283,593298,593299,593345,593346,593347,596073,596074,596075,
                596270,596271,597126,597127,597138,597139,597142,597143,597186,597187,597190,597191,597202,597203,597383,
                597464,597466,597467,597470,597471,598021,598023,598027,599036,599668,599669,599670,599672,599673,599674,
                599708,599709,599710,599712,599713,599714,599716,599717,599748,599749,599750,599752,599812,599813,599814,
                599816,600300,600301,600303,600376,600377,600378,600396,600397,600398,600400,600416,600417,600418,600420,
                600452,600453,600454,600456,600457,600604,600624,600625,600626,600632,600708,600712,600714,602273,602274,
                602275,602276,602292,602293,602336,602337,602340,602341,602352,602353,602356,602357,602528,602529,602560,
                602561,602564,602565,602576,602577,602580,602581,603336,603337,603341,603536,603537,603540,603541,603584,
                603585,603588,603589,603600,603601,608436,608438,608439,608482,608483,608510,608511,608682,608683,608686,
                608687,609044,609046,609047,609118,609119,609802,609830,609831,609854,609855,609990,609991,610002,610184,
                610186,610187,610202,610228,610230,610231,610284,610286,610287,614848,614849,614876,614877,615560,615561,
                615564,615565,615576,615577,615624,615625,615628,615629,615640,615641,615772,615774,615796,615798,615816,
                615817,615820,615821,615832,615833,615835,615894,615900,615902,615929,615932],
            "9":[1712228,1712229,1712231,1712369,1712371,1712377,1712733,1712735,1713025,1713027,1713666,1713890,1714481,1715013,1715015,
                1715312,1715314,1715315,1715592,1715594,1715628,1715630,1715631,1715992,1715994,1715995,1738353,1738355,1738461,1740045,
                1740265,1740267,1741452,1741454,1741484,1741486,1742884,1742886,1743012,1743014,2119108,2119592,2119594,2121956,2121957,
                2121959,2122317,2122319,2127080,2127082,2127438,2128908,2128910,2147340,2147341,2147343,2147385,2147387,2149885,2151716,
                2151718,2151844,2151846,2152961,2152973,2153153,2153936,2153938,2154364,2154366,2154460,2154462,2159068,2159069,2159071,
                2159956,2159958,2160084,2160086,2160092,2160094,2160496,2160497,2160498,2369449,2369450,2369451,2372386,2372387,2373378,
                2373379,2384062,2384063,2388498,2388499,2389530,2389531,2389862,2389863,2389874,2389875,2396148,2396149,2396150,2398180,
                2398700,2398702,2398860,2398861,2398862,2399012,2399013,2401596,2401597,2401598,2401608,2401610,2401676,2401677,2401832,
                2401833,2401834,2409090,2409091,2413360,2413361,2414172,2414173,2414348,2414349,2414360,2414361,2439954,2439955,2440012,
                2440014,2440015,2440740,2440742,2440743,2458128,2458129,2458176,2458177,2459405,2463064,2463066,2463067,2463444,2463445,
                2463568,2463570]}

    var gw0914_lali_hl = A.MOCFromJSON(json, {name:'MSB 004', opacity: 0.50,color: '#F0E68C', lineWidth: 1,adaptativeDisplay: false});
    aladin.addMOC(gw0914_lali_hl);
    gw0914_lali_hl.hide();

    //GW151226: LALINFERENCE
    var json =
        {"4":[54,55,116,2614,2620,2622,2708,2710,2716],
            "5":[128,129,134,135,146,147,150,153,156,157,200,201,204,205,207,
                392,393,394,396,397,406,407,408,409,412,413,450,451,453,454,
                455,456,457,460,468,469,470,1757,1758,1767,1772,1777,1836,1922,4363,
                4400,4407,4457,4460,4461,4474,4475,4478,4565,6400,6402,6403,6409,6411,6436,
                6438,6445,6447,6546,6555,6577,6588,10324,10325,10326,10329,10331,10332,10334,10353,
                10355,10356,10361,10363,10448,10449,10451,10873,10875,10961,10964,10966,10972,10974,10996,
                10997,10999,11005,11178,11411,11427,11432],
            "6":[170,171,520,521,524,525,527,528,530,531,534,535,564,565,578,
                606,607,608,609,637,778,779,782,783,808,809,812,813,824,825,
                827,1531,1533,1534,1535,1580,1581,1592,1593,1594,1596,1597,1611,1614,1615,
                1640,1641,1644,1645,1656,1657,1660,1661,1798,1799,1810,1811,1844,1845,1846,
                1884,1885,1888,1889,1892,6911,7005,7006,7007,7022,7023,7027,7036,7063,7067,
                7078,7079,7081,7082,7083,7084,7085,7086,7092,7105,7106,7107,7112,7113,7114,
                7120,7121,7268,7273,7274,7317,7319,7323,7324,7325,7326,7341,7342,7343,7348,
                7352,7354,7360,7681,7682,7683,7684,7685,7686,7712,16759,17449,17466,17467,17470,
                17553,17556,17557,17606,17607,17613,17618,17619,17624,17625,17627,17653,17800,17802,17803,
                17806,17807,17818,17824,17825,17848,17849,17852,17853,17855,17890,17891,17894,17895,17918,
                17919,18241,18244,18245,18256,18257,18259,24917,24919,25604,25606,25633,25635,25648,25650,
                25656,25658,25659,25733,25735,25741,25756,25758,25776,25777,25779,25785,25832,25834,26132,
                26133,26135,26141,26176,26178,26179,26208,26209,26211,26212,26214,26217,26219,26317,26319,
                26320,26322,26328,26330,26361,26363,26364,26366,27732,27734,27735,27741,27743,27914,27936,
                27938,27944,41287,41293,41294,41295,41308,41310,41315,41321,41323,41332,41409,41411,41417,
                41419,41432,41433,41434,41441,41443,41449,41450,41451,41456,41458,41464,41466,41801,41802,
                41803,41808,41810,43489,43491,43497,43499,43506,43512,43514,43841,43852,43853,43855,43877,
                43879,43892,43894,43900,43902,43903,43992,43993,43995,44017,44028,44029,44031,44680,44682,
                44704,44706,44707,45482,45621,45622,45623,45625,45626,45627,45628,45629,45630,45643,45649,
                45650,45651,45652,45653,45654,45656,45664,45665,45666,45668,45701,45703,45705,45706,45707,
                45712,45713,45714,45736],
            "7":[698,699,702,2092,2093,2104,2105,2107,2118,2119,2130,2131,2135,2241,2244,
                2245,2269,2316,2318,2319,2330,2331,2334,2416,2418,2419,2422,2423,2440,2441,
                2444,2445,2447,2529,2532,2533,2544,2545,3106,3107,3110,3178,3179,3182,3183,
                3192,3194,3195,3198,3199,3245,3256,3257,3260,3261,3304,3305,3307,3370,3371,
                3924,3925,6075,6078,6079,6122,6123,6130,6131,6207,6251,6254,6255,6266,6267,
                6270,6271,6328,6329,6330,6332,6333,6334,6380,6381,6392,6393,6396,6441,6442,
                6443,6450,6451,6453,6454,6455,6636,7179,7181,7182,7183,7234,7238,7239,7328,
                7329,7332,7333,7344,7345,7348,7388,7389,7391,7544,7545,7560,7561,7564,7565,
                7572,7573,7574,7576,7577,7616,7617,7620,27639,27643,27999,28019,28079,28083,28085,
                28086,28087,28101,28102,28103,28105,28106,28107,28148,28152,28154,28263,28265,28266,28267,
                28302,28303,28307,28309,28310,28311,28321,28322,28323,28348,28349,28372,28373,28374,28376,
                28384,28385,28386,28388,28417,28418,28419,28460,28464,28465,28488,28489,28544,28925,28927,
                28982,28987,28988,29063,29069,29070,29071,29080,29082,29089,29090,29091,29100,29101,29102,
                29273,29274,29275,29285,29287,29289,29291,29308,29310,29341,29342,29343,29358,29359,29361,
                29362,29363,29400,29402,29412,29413,29414,29420,29444,29448,29449,29450,30723,30748,30749,
                30750,30768,30769,30770,30772,30776,30784,30786,30852,30856,67033,67035,67060,67061,69770,
                69771,69774,69775,69792,69793,69795,69804,69805,69858,69859,69863,69884,69886,69887,70058,
                70164,70165,70208,70209,70211,70232,70233,70236,70237,70239,70418,70419,70422,70436,70437,
                70448,70449,70451,70461,70466,70490,70491,70494,70495,70504,70505,70507,70597,70608,70609,
                71178,71204,71206,71207,71218,71219,71278,71279,71290,71304,71305,71308,71309,71311,71344,
                71348,71349,71404,71405,71416,71417,71419,71554,71555,71558,71559,71570,71626,71627,71666,
                71667,71670,72960,72961,72989,73032,73033,73072,73073,73076,73077,73079,99665,99667,99701,
                99703,99709,102422,102428,102430,102504,102506,102529,102531,102565,102567,102573,102606,102628,102630,
                102631,102928,102929,102973,102975,102994,103000,103002,103030,103036,103038,103113,103115,103148,103149,
                103151,103298,103304,103306,103342,104517,104536,104537,104539,104573,104575,104708,104710,104754,104760,
                104762,104763,104840,104841,104843,104860,104862,104863,104865,104930,104936,104938,104939,105221,105223,
                105265,105267,105294,105316,105318,105324,105326,105327,105365,105426,105432,105434,105435,105441,105443,
                105468,105470,110916,110917,110919,110932,110934,110935,110961,110963,111060,111061,111063,111069,111071,
                111093,111626,111648,111650,111651,111748,111758,111780,111782,111785,111788,111790,165141,165143,165169,
                165171,165236,165238,165244,165255,165283,165289,165336,165337,165338,165360,165641,165643,165665,165667,
                165673,165675,165740,165742,165761,165763,165769,165771,165793,165794,165795,165828,165829,165830,165836,
                167200,167201,167203,167264,167266,167272,167274,167360,167362,167368,167370,167392,167394,167400,167402,
                167744,167746,167752,167754,167874,167936,167938,173277,173279,173898,173920,173922,173928,173930,173953,
                173954,173955,173961,173963,173985,173987,173993,174016,174018,174060,174062,175372,175373,175375,175397,
                175416,175417,175419,175472,175474,175480,175482,175504,175505,175507,175541,175543,175549,175551,175582,
                175604,175606,175607,175893,175895,175977,175979,176076,176077,176079,176101,176120,176121,176123,178688,
                178690,178696,178698,178734,178820,178822,178823,178864,178866,178872,178874,181246,181247,182399,182463,
                182477,182478,182479,182481,182483,182497,182499,182524,182526,182555,182557,182558,182559,182566,182567,
                182569,182570,182571,182594,182595,182620,182628,182629,182630,182632,182668,182669,182670,182676,182688,
                182689,182690,182803,182809,182810,182811,182819,182860,182861,182862,182864,182865,182866,182880,182881,
                182882,182884,182928,182929,182930,182932,182936,182948,182950,182952,182953,182954,183296,183298],
            "8":[2698,2699,2702,2784,2786,2787,2814,2815,8352,8353,8356,8357,8359,8380,8381,
                8424,8425,8464,8466,8467,8470,8471,8514,8515,8536,8538,8539,8960,8961,8988,
                8989,9061,9072,9073,9226,9270,9271,9314,9315,9340,9342,9343,9514,9515,9518,
                9519,9530,9531,9668,9670,9671,9680,9682,9683,9686,9687,9772,9773,9784,9785,
                10112,10113,10140,10141,10184,10185,10188,10189,10191,12446,12447,12706,12707,12710,12711,
                12722,12723,12726,12727,12774,12775,12786,12787,12976,12977,13048,13049,13052,13053,13224,
                13225,13227,13498,13499,13758,13759,13802,13803,13806,13807,13822,13823,15365,15376,15377,
                15380,15381,15424,15425,15428,15429,15440,15441,15444,15445,15616,15617,15632,15633,15636,
                15637,15680,15681,15684,15685,24254,24255,24297,24298,24299,24311,24443,24446,24447,24479,
                24482,24487,24515,24517,24518,24519,24815,24826,24827,25002,25003,25062,25063,25078,25079,
                25324,25325,25340,25341,25528,25529,25532,25533,25576,25588,25589,25590,25762,25763,25799,
                25810,25811,25915,25962,25982,25983,26272,26273,26352,26353,26356,26357,26528,26529,26532,
                26533,26548,26549,26592,26593,26624,26625,28711,28713,28714,28715,28722,28723,28941,28942,
                28943,29320,29321,29322,29324,29325,29340,29396,29397,29560,29561,29562,29568,29569,29572,
                29573,29584,29585,29632,30184,30185,30186,30188,30192,30193,30194,30196,30300,30301,30302,
                30320,30484,110527,110569,110570,110571,112061,112063,112255,112309,112310,112311,112313,112314,112315,
                112338,112339,112399,112401,112403,112419,112596,112597,112598,112600,112601,112602,112612,112613,112614,
                112991,113005,113006,113007,113047,113050,113051,113206,113207,113227,113233,113234,113235,113400,113401,
                113402,113508,113509,113510,113512,113513,113520,113548,113549,113550,113568,113844,113845,113864,113865,
                113866,113872,113873,115705,115707,115919,115923,115932,115941,115942,115943,115945,115946,115947,115960,
                115962,116251,116269,116271,116273,116274,116275,116304,116306,116324,116325,116326,116355,116412,116414,
                116416,116418,117069,117070,117071,117089,117090,117091,117145,117146,117147,117236,117238,117244,117341,
                117342,117343,117359,117361,117363,117429,117430,117431,117584,117585,117586,117604,117606,117660,117661,
                117662,117688,117696,117784,117786,117804,117806,117888,117889,117890,117896,122885,122886,122887,123004,
                123006,123084,123085,123086,123140,123141,123142,123168,123412,123428,268129,268130,268131,268136,268137,
                268253,279074,279075,279078,279079,279090,279144,279146,279147,279150,279151,279176,279177,279179,279204,
                279205,279228,279229,279426,279427,279448,279450,279451,279542,280238,280239,280645,280669,280840,280841,
                280884,280885,280952,280953,280955,281666,281667,281670,281671,281692,281694,281695,281729,281732,281733,
                281735,281757,281800,281801,281803,281841,281870,281954,281955,281970,282024,282025,282384,282385,282444,
                282445,282447,282484,282485,282487,284822,284823,284890,284891,285106,285107,285166,285167,285229,285240,
                285241,285243,285333,285380,285381,285383,285400,285401,285404,285405,285407,285604,285605,285672,285673,
                285675,286210,286211,286286,286287,286298,286299,286498,286499,286502,286520,286522,286523,286656,286658,
                286659,286662,286686,286687,291156,291157,291159,291852,291940,291941,291952,291953,291955,292136,292137,
                292140,292141,292143,292241,292244,292245,292247,292300,292301,292312,292313,292315,398693,398801,398803,
                398845,409682,409716,409718,409724,409726,409727,409992,409994,410030,410113,410115,410149,410151,410256,
                410257,410259,410265,410301,410303,410416,410418,410419,410516,410518,410519,410594,410600,410602,411724,
                411725,411727,411749,411751,411889,411968,411970,412006,412012,412014,412015,412150,412156,412158,412549,
                412551,412601,412603,413230,413360,413362,413363,418065,418077,418244,418245,418247,418288,418289,418291,
                418644,418645,418647,418653,418655,418836,418838,418844,418846,418847,418914,418920,418922,419008,419010,
                419011,419022,419044,419046,419368,419369,419371,419408,419410,419416,419418,419419,419446,419468,419469,
                419471,419493,419495,419714,419750,420881,420883,420917,420919,421057,421059,421138,421144,421146,421168,
                421170,421171,421300,421302,421303,421457,421459,421468,421469,421471,421696,421698,421699,421732,421734,
                421735,421761,421796,421797,421799,421840,421842,421848,421850,421851,443673,443675,443700,443701,443703,
                443709,443732,443734,443840,443841,443843,443877,443879,444249,444251,444275,446496,446498,446510,446596,
                446598,446599,446618,446640,446642,446648,446650,447024,447026,447149,448528,660561,660563,660569,660570,
                660571,660589,660591,660673,660675,660681,660682,660683,660948,660950,660956,660984,660986,661013,661014,
                661015,661017,661018,661019,661328,661356,661358,661444,661448,661449,661450,661472,661474,662541,662543,
                662964,662965,662966,662972,662973,662974,663049,663051,663073,663075,663081,663082,663083,663169,663170,
                663171,663352,663354,663448,663450,663472,663474,668509,668637,668639,668661,668663,668669,668671,668809,
                668810,668811,669060,669062,669068,669444,669446,669452,669572,669574,670037,670039,670079,670173,670175,
                670205,670207,670549,670551,670581,670583,670719,671104,671106,671112,671114,671136,671138,671144,671146,
                671488,671490,671520,671521,671522,671528,671530,671616,671618,671748,671750,671776,671778,692565,692567,
                692573,692575,692597,692599,692605,692607,693077,693079,693205,693207,693213,693215,693237,693239,693245,
                693247,694018,694024,694026,694144,694146,694176,694178,694184,694186,694741,694743,694749,695552,695554,
                695560,695561,695562,695584,695585,695586,695718,695724,695726,695808,695809,695811,695849,695981,695983,
                696068,696070,696076,696078,696218,696252,696254,701445,701497,701499,701596,701597,701599,701621,701623,
                701672,701673,701675,701794,701800,701802,701932,701934,701935,702052,702053,702055,702061,702160,702161,
                702163,702169,702298,702320,702322,703604,703605,703607,703613,703615,703701,703703,703905,703907,703913,
                703915,704260,704261,704263,704313,704413,704415,704489,713378,713384,713386,714796,714798,715284,715286,
                715362,715368,715370,715492,715494,715500,715502,715503,724927,724973,724974,724975,724979,724982,724983,
                727728,727729,727730,727736,729593,729594,729595,729823,729845,729846,729847,729849,729850,729851,729923,
                729929,729930,729931,729993,729994,729995,730100,730101,730102,730108,730207,730219,730225,730226,730227,
                730255,730262,730263,730273,730274,730275,730484,730524,730532,730533,730534,730536,730537,730538,730544,
                730560,730561,730562,730684,730685,730686,730708,730712,730720,730721,730722,730764,730768,730784,731197,
                731199,731205,731207,731211,731233,731234,731235,731452,731454,731468,731470,731488,731489,731490,731532,
                731552,731724,731725,731726,731748,731752,731754,731796,731797,731798,731820,733188,733190,753664,753665,
                753666],
            "9":[10862,10863,11142,11143,11946,11947,33862,33863,33874,36240,36241,36300,36301,36922,37074,
                37075,38678,38679,39072,39073,39076,39077,40760,40761,51840,51841,51844,51845,54010,54011,
                61440,61441,61772,61773,97002,97003,97005,97006,97007,97186,97187,97230,97231,97242,97243,
                97782,97783,97913,97914,97915,97934,97935,97945,97946,97947,98986,98987,99002,99003,99258,
                99259,100063,100238,100239,101304,101305,101308,101309,101368,101369,101372,101373,102308,102309,102320,
                102321,103658,103659,103854,103855,103866,103867,105104,105105,106512,106513,115762,115763,115787,115790,
                115791,117292,117293,120756,120757,120788,120789,121212,121213,442223,448249,448250,448251,449019,449251,
                449311,449323,449325,449326,449327,449591,452187,452237,452238,452239,452823,452907,454224,454225,454226,
                456720,463704,463706,463707,463736,463738,463759,463824,463826,463844,463845,463846,463852,463854,465081,
                465083,465668,465669,465670,468579,468948,468949,468950,470368,470370,470736,471564,471566,492448,492449,
                492450,1116290,1116291,1116366,1116367,1116582,1116583,1117698,1117722,1117723,1118174,1118175,1120946,1120947,1122576,
                1122577,1122579,1123548,1123549,1123748,1123749,1126656,1126658,1126659,1126662,1126663,1126730,1126731,1126774,1126775,
                1126912,1126913,1126915,1126936,1126937,1127024,1127025,1127027,1127360,1127361,1127363,1127373,1127413,1127486,1127487,
                1127814,1129493,1140442,1140912,1140913,1140915,1141528,1141529,1141531,1141557,1144856,1144858,1144859,1144862,1144863,
                1167412,1167413,1167415,1169257,1595201,1638722,1640112,1640114,1640115,1641068,1641069,1641071,1641201,1641203,1646677,
                1646904,1646905,1646907,1648592,1648594,1649013,1652912,1652914,1652915,1672305,1672307,1672316,1672317,1672319,1673013,
                1673015,1674585,1674587,1675380,1675382,1675383,1676036,1676038,1677668,1677670,1677776,1677778,1678848,1678850,1678851,
                1678906,1678992,1678994,1678995,1683701,1684544,1684546,1685112,1685114,1687052,1687053,1687055,1687396,1687398,1774808,
                1774809,1774811,1774833,1775541,1775543,1777092,1777093,1777095,1785996,1785998,1785999,1786034,1786464,1786466,1788593,
                1788595,1788604,1788605,1788607,2642273,2642274,2642275,2642699,2642721,2642722,2642723,2645804,2645806,2651868,2651869,
                2651870,2652321,2652323,2652673,2652675,2653296,2653298,2671989,2671991,2674007,2674013,2674015,2674045,2674047,2675233,
                2675235,2677816,2677818,2678320,2678322,2678424,2680309,2680311,2682741,2682743,2682869,2682871,2684420,2684422,2687108,
                2770933,2770935,2770941,2770943,2782252,2782254,2782348,2782350,2782351,2784316,2784318,2784864,2784866,2805789,2805791,
                2805821,2806340,2806341,2806343,2806517,2806696,2806697,2806699,2808685,2808687,2809184,2809186,2809187,2809292,2809294,
                2815616,2815617,2815619,2817964,2817965,2817967,2853548,2853550,2859624,2859626,2910924,2910925,2910926,2910952,2910953,
                2910954,2919713,2919714,2919715,2919949,2919950,2919951,2919969,2919970,2919971,2920412,2920413,2920414,2920827,2920871,
                2920874,2920875,2921045,2921046,2921047,2921940,2923076,2924793,2924794,2924795,2925812,2925813,2925814,2925876,2926132,
                2926212,2926908,2926909,2926910,2927296,2927297,2927298,2932756,2932757,2932758]}

    var gw1226_lali_hl = A.MOCFromJSON(json, {name:'MSB 005', opacity: 0.50,color: '#ff00ff', lineWidth: 1,adaptativeDisplay: false});
    aladin.addMOC(gw1226_lali_hl);
    gw1226_lali_hl.hide();

    //GW170104: LALINFERENCE
    var json =
        {"3":[118],
            "4":[296,299,302,389,400,401,403,406,407,450,451,457,460,461,478,
                479,501,735,758,761,762,1025,1056,1058,1064,1066,1155,1161,1163,1190,
                1196,1352,1358,1381,1392,1395,1398,1405,2200,2214,2219],
            "5":[1162,1188,1190,1191,1192,1193,1195,1202,1212,1214,1215,1258,1259,1541,1552,
                1553,1608,1609,1616,1618,1619,1622,1623,1652,1653,1794,1816,1818,1819,1822,
                1823,1824,1825,1849,1852,1853,1866,1904,1906,1907,1910,1911,1989,2000,2001,
                2003,2911,2933,2934,2935,3006,3007,3023,3025,3027,3028,3030,3036,3043,3052,
                3053,3054,3056,3057,3058,3089,3091,3092,3094,3100,3102,4011,4014,4015,4026,
                4105,4107,4108,4109,4110,4129,4131,4132,4134,4137,4138,4139,4140,4142,4228,
                4230,4236,4238,4260,4262,4268,4270,4609,4611,4612,4614,4615,4617,4619,4641,
                4664,4666,4740,4741,4743,4749,4751,4752,4754,4792,4793,4795,4798,5199,5210,
                5211,5214,5215,5233,5236,5237,5239,5414,5415,5417,5420,5421,5423,5426,5436,
                5438,5439,5482,5521,5572,5574,5575,5576,5577,5586,5596,5598,5599,5616,5617,
                8437,8438,8439,8441,8442,8443,8444,8507,8509,8510,8511,8547,8549,8552,8582,
                8583,8585,8586,8587,8588,8589,8590,8592,8593,8594,8608,8609,8765,8766,8767,
                8773,8774,8775,8779,8780,8781,8782,8784,8785,8786,8808,8851,8852,8853,8854,
                8860,8869,8871,8880,8881,8882,8888,8890],
            "6":[4642,4652,4654,4655,4666,4756,4758,4759,4777,4802,4812,4814,4815,4826,4852,
                4854,4855,5026,5027,5050,5051,5054,6160,6161,6216,6217,6220,6221,6223,6257,
                6260,6261,6263,6441,6444,6445,6470,6471,6482,6548,6549,6592,6593,6596,6597,
                6599,7182,7183,7194,7195,7270,7271,7282,7283,7304,7305,7308,7309,7349,7392,
                7393,7417,7420,7421,7470,7471,7482,7483,7622,7623,7634,7635,7638,7639,7941,
                7952,7953,7955,7965,8008,8009,8011,8048,8049,8052,8053,11615,11637,11639,11729,
                11731,11751,11757,11758,11759,12015,12021,12022,12023,12085,12087,12091,12099,12105,12106,
                12107,12116,12118,12124,12126,12152,12153,12154,12167,12171,12220,12221,12236,12237,12238,
                12240,12256,12257,12258,12353,12355,12389,12391,16039,16050,16051,16110,16111,16122,16389,
                16391,16397,16398,16399,16427,16444,16446,16448,16450,16456,16513,16515,16521,16523,16532,
                16534,16540,16542,16545,16547,17052,17054,17076,17078,17084,17086,18433,18435,18441,18443,
                18452,18454,18465,18467,18473,18538,18572,18573,18575,18597,18599,18605,18624,18626,18632,
                18634,18968,18969,18971,18993,18995,19012,19014,19020,19022,19092,19093,19095,19101,19103,
                19152,19154,19160,19162,19176,19177,19179,19184,19186,20787,20790,20791,20793,20834,20835,
                20838,20839,20885,20928,20929,20931,20941,20952,20953,20955,20981,21546,21547,21550,21648,
                21650,21651,21654,21655,21664,21665,21667,21677,21688,21689,21691,21710,21711,21748,21750,
                21751,21922,21932,21934,21935,21946,22037,22080,22081,22083,22093,22132,22133,22292,22294,
                22295,22316,22317,22338,22348,22350,22351,22362,22388,22390,22391,22420,22421,22473,22476,
                22477,22479,22513,22516,22517,22519,33661,33662,33663,33725,33727,33741,33742,33743,33745,
                33746,33747,33761,33762,33763,33780,33781,33782,33784,33785,33786,34015,34026,34027,34033,
                34034,34035,34154,34183,34185,34186,34187,34193,34194,34195,34200,34201,34202,34204,34212,
                34213,34214,34216,34240,34319,34325,34326,34327,34338,34339,34364,34380,34381,34382,34384,
                34385,34386,34388,34400,34401,34440,34441,34442,34444,34448,35031,35037,35038,35039,35055,
                35057,35059,35087,35091,35109,35110,35111,35113,35115,35132,35134,35148,35168,35216,35217,
                35218,35236,35240,35241,35242,35389,35391,35397,35398,35399,35403,35420,35422,35448,35450,
                35481,35483,35503,35532,35533,35534,35556,35584],
            "7":[24889,24890,24891,48057,48058,48059],
            "8":[99555]}

    var gw0104_lali_hl = A.MOCFromJSON(json, {name:'MSB 006', opacity: 0.50,color: '#ff8080', lineWidth: 1,adaptativeDisplay: false});
    aladin.addMOC(gw0104_lali_hl);
    gw0104_lali_hl.hide();

    //GW170814: gw1408_ref_hlv.fits.gz,0; moc = 90%
    var json =
        {"5":[8438,8439,8442,8445,8616,8617],
            "6":[33719,33725,33741,33742,33743,33762,33763,33764,33765,33776,33777,33779,33789,34440,34442,
                34443,34446,34472,34473,34476,34477,34479,34482,34488,34489],
            "7":[134867,134869,134870,134871,134873,134875,134897,134899,134908,134909,134911,134942,134943,134957,134959,
                134961,134962,134963,134986,134987,134990,134991,135002,135003,135006,135040,135042,135043,135046,135064,
                135066,135068,135069,135088,135090,135096,135098,135112,135113,135115,135141,135152,135153,135155,137766,
                137767,137790,137791,137896,137897,137900,137901,137912,137913,137920,137922,137923,137932,137934,137935,
                137960,137961,137962,137964,137965,140544,140545,140548,140549,140560],
            "8":[539463,539467,539473,539474,539475,539489,539490,539491,539496,539497,539499,539585,539587,539621,539623,
                539640,539641,539807,539833,539834,539835,539842,539843,539958,539959,540002,540003,540030,540031,540166,
                540167,540176,540177,540178,540180,540181,540188,540190,540191,540260,540261,540262,540268,540270,540285,
                540356,540358,540364,540366,540388,540390,540396,540398,540456,540457,540459,540560,540561,540617,540656,
                540657,540660,540661,550954,550955,551056,551058,551059,551114,551115,551118,551152,551154,551155,551158,
                551336,551338,551339,551656,551657,551660,551661,551663,551684,551686,551687,551704,551706,551707,551734,
                551852,551853,551854,551864,551865,551868,551869,551872,551874,551880,551882,551904,551906,551912,561493,
                562188,562189,562200,562201,562204,562205],
            "9":[2160759],
            "10":[8643033,8643034,8643035]}

    var gw1408_ref_hlv = A.MOCFromJSON(json, {name:'MSB 003', opacity: 0.65,color: '#7CFC00', lineWidth: 1,adaptativeDisplay: false});
    aladin.addMOC(gw1408_ref_hlv);
    gw1408_ref_hlv.hide();

    // define custom draw function: LIGO and Virgo localization
    var drawFunction = function(source, canvasCtx, viewParams) {
        canvasCtx.beginPath();
        canvasCtx.arc(source.x, source.y, source.data['size'] * 2, 0, 2 * Math.PI, false);
        canvasCtx.closePath();
        canvasCtx.strokeStyle = '#c38';
        canvasCtx.lineWidth = 3;
        canvasCtx.globalAlpha = 0.7,
            canvasCtx.stroke();
        var fov = Math.max(viewParams['fov'][0], viewParams['fov'][1]);

        // object name is displayed
        if (fov>180) {
            return;
        }

        canvasCtx.globalAlpha = 0.9;
        canvasCtx.globalAlpha = 1;

        var xShift = -190;
        var xShift2 = -290;

        canvasCtx.font = 'small-caps bold 22px arial'
        canvasCtx.fillStyle = '#FF8100';
        canvasCtx.fillText(source.data['name'], source.x + xShift, source.y -8);

        // object type is displayed
        if (fov>180) {
            return;
        }
        canvasCtx.font = 'small-caps bold 20px arial'
        canvasCtx.fillStyle = '#ffffff';
        canvasCtx.fillText(source.data['otype'], source.x + 2 + xShift2, source.y + 10);
    };
    // create sources objects Area (90%) = 97.4 sq. deg
    var ligo_virgo_loc = A.source(46.2083, -34.7261, {name: 'MSB 002', size: 0, otype: 'of PID 002'});

    // create catalog layer with custom draw function
    var gw1408_info_hlv = A.catalog({name: 'cat', shape: drawFunction, color:'white'});
    // add sources to the new layer
    gw1408_info_hlv.addSources([ligo_virgo_loc]);
    aladin.addCatalog(gw1408_info_hlv);
    gw1408_info_hlv.hide();


    // define custom draw function: LIGO and Virgo localization refined
    var drawFunction = function(source, canvasCtx, viewParams) {
        canvasCtx.beginPath();
        canvasCtx.arc(source.x, source.y, source.data['size'] * 2, 0, 2 * Math.PI, false);
        canvasCtx.closePath();
        canvasCtx.strokeStyle = '#c38';
        canvasCtx.lineWidth = 3;
        canvasCtx.globalAlpha = 0.7,
            canvasCtx.stroke();
        var fov = Math.max(viewParams['fov'][0], viewParams['fov'][1]);

        // object name is displayed
        if (fov>180) {
            return;
        }

        canvasCtx.globalAlpha = 0.9;
        canvasCtx.globalAlpha = 1;

        var xShift = -210;
        var xShift2 = -150;

        canvasCtx.font = 'small-caps bold 22px arial'
        canvasCtx.fillStyle = '#7CFC00';
        canvasCtx.fillText(source.data['name'], source.x + xShift2, source.y -8);

        // object type is displayed
        if (fov>180) {
            return;
        }
        canvasCtx.font = ''

        var slideIndex = 1;
        showDivs(slideIndex);

        function plusDivs(n) {
            showDivs(slideIndex += n);
        }

        function showDivs(n) {
            var i;
            var x = document.getElementsByClassName("SlideshowTutorial");
            if (n > x.length) {slideIndex = 1}
            if (n < 1) {slideIndex = x.length}
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            x[slideIndex-1].style.display = "block";
        }
</script>

<!-- Creation of Aladin Lite instance with initial parameters -->
<script type="text/javascript">

    // Start up Aladin Lite
    var aladin = A.aladin('#aladin-lite-div', {
        survey: "P/Mellinger/color",
        target: '3 28 35.268 -35 50 14.04',
        fov: 175
    });
    //aladin.setProjection('AITOFF')

    //popup windows ligo localization: bayestar skymap
    var gw1408_pop_hl = A.catalog({name: 'popup info', sourceSize: 12, color: '#00BFFF'});
    aladin.addCatalog(gw1408_pop_hl);
    gw1408_pop_hl.addSources([A.marker(51.0000, 3.500, {popupTitle: 'MSB 001 ', popupDesc: '<em>Area (50%): 333 sq. deg. <br>Area (90%): 1158 sq. deg.</em>'})]);
    gw1408_pop_hl.hide()

    //popup windows ligo and virgo localization: bayestar skymap
    var gw1408_pop_hlv = A.catalog({name: 'popup info', sourceSize: 12, color: '#FF8100'});
    aladin.addCatalog(gw1408_pop_hlv);
    gw1408_pop_hlv.addSources([A.marker(45.5000, -36.0147, {popupTitle: 'MSB 002', popupDesc: '<em>Area (50%): 22 sq. deg.<br>Area (90%): 97.4 sq. deg.</em>'})]);
    gw1408_pop_hlv.hide()


    //popup windows ligo and virgo localization: refined skymap
    var gw1408_pop_ref = A.catalog({name: 'popup info', sourceSize: 12, color: '#7CFC00'});
    aladin.addCatalog(gw1408_pop_ref);
    gw1408_pop_ref.addSources([A.marker(45.7917,  -48.8250, {popupTitle: 'MSB 003', popupDesc: '<em>Area (50%): 12.9 sq. deg. <br>Area (90%): 61.7 sq. deg.</em>'})]);
    gw1408_pop_ref.hide()

    //popup windows gw150914: lalinference skymap
    var gw0914_pop_hl = A.catalog({name: 'popup info', sourceSize: 12, color: '#F0E68C'});
    aladin.addCatalog(gw0914_pop_hl);
    gw0914_pop_hl.addSources([A.marker(156.0250, -44.2144, {popupTitle: 'MSB 004', popupDesc: '<em>Area (50%): 149.1 sq. deg. <br>Area (90%): 616.4 sq. deg. </em>'})]);
    gw0914_pop_hl.hide()

    //popup windows gw151226: lalinference skymap
    var gw1226_pop_hl = A.catalog({name: 'popup info', sourceSize: 12, color: '#ff00ff'});
    aladin.addCatalog(gw1226_pop_hl);
    gw1226_pop_hl.addSources([A.marker(17.5333,  -17.0119, {popupTitle: 'MSB 005', popupDesc: '<em>Area (50%): 288.3 sq. deg. <br>Area (90%): 887.9 sq. deg.  </em>'})]);
    gw1226_pop_hl.hide()

    //popup windows gw170104: lalinference skymap
    var gw0104_pop_hl = A.catalog({name: 'popup info', sourceSize: 12, color: '#ff8080'});
    aladin.addCatalog(gw0104_pop_hl);
    gw0104_pop_hl.addSources([A.marker(109.3917,  3.7333, {popupTitle: 'MSB 006', popupDesc: '<em>Area (50%): 384 sq. deg. <br> Area (90%): 1609 sq. deg. </em>'})]);
    gw0104_pop_hl.hide()


    // define custom draw function: LIGO localization GW170814
    var drawFunction = function(source, canvasCtx, viewParams) {
        canvasCtx.beginPath();
        canvasCtx.arc(source.x, source.y, source.data['size'] * 2, 0, 2 * Math.PI, false);
        canvasCtx.closePath();
        canvasCtx.strokeStyle = '#c38';
        canvasCtx.lineWidth = 3;
        canvasCtx.globalAlpha = 0.7,
            canvasCtx.stroke();
        var fov = Math.max(viewParams['fov'][0], viewParams['fov'][1]);

        // object name is displayed
        if (fov>180) {
            return;
        }

        canvasCtx.globalAlpha = 0.9;
        canvasCtx.globalAlpha = 1;

        var xShift = 20;
        var xShift2 = 50;

        canvasCtx.font = 'small-caps bold 22px arial'
        canvasCtx.fillStyle = '#00BFFF';
        canvasCtx.fillText(source.data['name'], source.x + xShift2, source.y -8);

        // object type is displayed
        if (fov>180) {
            return;
        }
        canvasCtx.font = 'small-caps bold 20px arial'
        canvasCtx.fillStyle = '#ffffff';
        canvasCtx.fillText(source.data['otype'], source.x + 2 + xShift, source.y + 10);
    };

    // create sources objects LIGO localization - Area (90%) = 1158 sq. deg'
    var ligo_loc = A.source(52.800, 5.800, {name: 'MSB 001', size: 0, otype: 'of PID 002'});

    // create catalog layer with custom draw function
    var gw1408_info_hl = A.catalog({name: 'cat', shape: drawFunction, color:'white'});
    // add sources to the new layer
    gw1408_info_hl.addSources([ligo_loc]);
    aladin.addCatalog(gw1408_info_hl);
    gw1408_info_hl.hide();

    // define custom draw function: GW150914
    var drawFunction = function(source, canvasCtx, viewParams) {
        canvasCtx.beginPath();
        canvasCtx.arc(source.x, source.y, source.data['size'] * 2, 0, 2 * Math.PI, false);
        canvasCtx.closePath();
        canvasCtx.strokeStyle = '#c38';
        canvasCtx.lineWidth = 3;
        canvasCtx.globalAlpha = 0.7,
            canvasCtx.stroke();
        var fov = Math.max(viewParams['fov'][0], viewParams['fov'][1]);

        // object name is displayed
        if (fov>180) {
            return;
        }

        canvasCtx.globalAlpha = 0.9;
        canvasCtx.globalAlpha = 1;

        var xShift = 20;

        canvasCtx.font = 'small-caps bold 22px arial'
        canvasCtx.fillStyle = '#F0E68C';
        canvasCtx.fillText(source.data['name'], source.x + xShift, source.y -8);

        // object type is displayed
        if (fov>180) {
            return;
        }
        canvasCtx.font = 'small-caps bold 18px arial'
        canvasCtx.fillStyle = '#ffffff';
        canvasCtx.fillText(source.data['otype'], source.x + 2 + xShift, source.y + 10);
    };
    // create sources objects
    var gw159814_info = A.source(156.0250, -44.2144, {name: 'MSB 004', size: 0, otype: 'of PID 002'});

    // create catalog layer with custom draw function
    var gw0914_info_hl = A.catalog({name: 'cat', shape: drawFunction, color:'white'});
    // add sources to the new layer
    gw0914_info_hl.addSources([gw159814_info]);
    aladin.addCatalog(gw0914_info_hl);
    gw0914_info_hl.hide();


    // define custom draw function: GW151226
    var drawFunction = function(source, canvasCtx, viewParams) {
        canvasCtx.beginPath();
        canvasCtx.arc(source.x, source.y, source.data['size'] * 2, 0, 2 * Math.PI, false);
        canvasCtx.closePath();
        canvasCtx.strokeStyle = '#c38';
        canvasCtx.lineWidth = 3;
        canvasCtx.globalAlpha = 0.7,
            canvasCtx.stroke();
        var fov = Math.max(viewParams['fov'][0], viewParams['fov'][1]);

        // object name is displayed
        if (fov>180) {
            return;
        }

        canvasCtx.globalAlpha = 0.9;
        canvasCtx.globalAlpha = 1;

        var xShift = 20;

        canvasCtx.font = 'small-caps bold 22px arial'
        canvasCtx.fillStyle = '#ff00ff';
        canvasCtx.fillText(source.data['name'], source.x + xShift, source.y -8);

        // object type is displayed
        if (fov>180) {
            return;
        }
        canvasCtx.font = 'small-caps bold 18px arial'
        canvasCtx.fillStyle = '#ffffff';
        canvasCtx.fillText(source.data['otype'], source.x + 2 + xShift, source.y + 10);
    };
    // create sources objects
    var gw151226_info = A.source(17.5333,  -17.0119, {name: 'MSB005', size: 0, otype: 'of PID 002'});

    // create catalog layer with custom draw function
    var gw1226_info_hl = A.catalog({name: 'cat', shape: drawFunction, color:'white'});
    // add sources to the new layer
    gw1226_info_hl.addSources([gw151226_info]);
    aladin.addCatalog(gw1226_info_hl);
    gw1226_info_hl.hide();

    // define custom draw function: GW170104
    var drawFunction = function(source, canvasCtx, viewParams) {
        canvasCtx.beginPath();
        canvasCtx.arc(source.x, source.y, source.data['size'] * 2, 0, 2 * Math.PI, false);
        canvasCtx.closePath();
        canvasCtx.strokeStyle = '#c38';
        canvasCtx.lineWidth = 3;
        canvasCtx.globalAlpha = 0.7,
            canvasCtx.stroke();
        var fov = Math.max(viewParams['fov'][0], viewParams['fov'][1]);

        // object name is displayed
        if (fov>180) {
            return;
        }

        canvasCtx.globalAlpha = 0.9;
        canvasCtx.globalAlpha = 1;

        var xShift = 20;

        canvasCtx.font = 'small-caps bold 22px arial'
        canvasCtx.fillStyle = '#ff8080';
        canvasCtx.fillText(source.data['name'], source.x + xShift, source.y -8);

        // object type is displayed
        if (fov>180) {
            return;
        }
        canvasCtx.font = 'small-caps bold 18px arial'
        canvasCtx.fillStyle = '#ffffff';
        canvasCtx.fillText(source.data['otype'], source.x + 2 + xShift, source.y + 10);
    };
    // create sources objects
    var gw170104_info = A.source(109.3917,  3.7333, {name: 'MSB 006', size: 0, otype: 'of PID 002'});

    // create catalog layer with custom draw function
    var gw0104_info_hl = A.catalog({name: 'cat', shape: drawFunction, color:'white'});

    // add sources to the new layer
    gw0104_info_hl.addSources([gw170104_info]);
    aladin.addCatalog(gw0104_info_hl);
    gw0104_info_hl.hide();

    // MOC CONFIDENCE REGIONS //

    // GW170814: gw1408_bays_hl.fits.gz,0; moc = 90%
    var json =
        {"3":[362,519,525,527,549,562,572],
            "4":[1452,1454,1455,1466,2071,2097,2099,2105,2112,2205,2240,2242,2243,2252,2254,
                2255,2266,2273,2276,2277,2279,2294,2295,2296,2297,2300,2301,2303],
            "5":[4,5,16,17,5768,5770,5771,5774,5775,5814,5815,5858,5859,5862,5863,
                5868,5869,8277,8278,8279,8281,8282,8283,8295,8301,8303,8428,8429,8431,8456,
                8458,8610,8616,8618,8619,8773,8775,8781,8783,8816,8817,8819,8828,8829,8831,
                8966,8986,9012,9014,9015,9070,9088,9089,9101,9112,9113,9115,9140,9141,9168,
                9170,9171,9174,9197,9208,9209,9211,9386,9387,9390,9728,9729,9730],
            "6":[0,1,4,5,80,81,82,84,85,256,257,17748,17749,23050,23076,
                23078,23079,23090,23091,23146,23147,23250,23251,23254,23255,23480,23481,23496,23498,23520,
                33087,33101,33102,33103,33107,33121,33123,33173,33174,33175,33179,33201,33203,33209,33210,
                33211,33720,33721,33723,33808,33809,33810,33828,33830,33920,33922,33928,34346,34432,34434,
                34468,34470,35089,35091,35097,35099,35221,35223,35272,35273,35275,35300,35301,35303,35320,
                35321,35323,35669,35856,35858,35859,35868,35870,35871,35936,35938,35939,35948,35950,35951,
                36054,36234,36235,36274,36284,36286,36287,36330,36361,36364,36365,36367,36400,36401,36413,
                36456,36457,36459,36549,36572,36573,36676,36678,36679,36690,36700,36702,36703,36772,36773,
                36784,36785,36787,36797,36840,36841,37542,37543,37554,38924,38925,38926,38928,38944,38945,
                38946],
            "7":[12,13,24,25,28,29,31,332,333,344,345,1040,1041,70976,70977,
                70980,70981,70983,92204,92206,92207,92308,92310,92311,92354,92355,92378,92379,92578,92579,
                92602,92603,92992,92994,92995,92998,92999,93704,93706,93707,93710,93711,93722,93723,93726,
                93727,93770,93771,93774,93775,93786,93787,93790,93791,93928,93929,93930,93932,93933,93936,
                93937,93938,93988,93990,93996,93998,94088,132341,132343,132421,132422,132423,132425,132426,132427,
                132489,132490,132491,132689,132690,132691,132709,132711,132809,132811,132833,132835,134888,134889,134891,
                135244,135245,135246,135248,135264,135265,135266,135316,135318,135684,135686,135720,135722,135808,135810,
                137352,137354,137376,137378,137379,137740,137742,137743,137784,137786,137884,137886,137960,137962,137963,
                140353,140355,140361,140363,140484,140485,140487,140493,140495,140881,140883,141097,141188,141189,141191,
                141209,141237,142672,142673,142675,142684,142685,142687,143430,143798,143799,143848,143850,143851,144222,
                144223,144928,144930,144931,144952,144954,144955,145090,145091,145100,145102,145103,145140,145142,145143,
                145324,145326,145327,145441,145464,145465,145467,145556,145557,145612,145613,145615,145648,145649,145832,
                145833,145835,146192,146193,146195,146204,146205,146276,146277,146300,146301,146708,146710,146711,146764,
                146766,146767,146804,146806,146807,147076,147077,147100,147101,147144,147145,147147,147184,147185,147372,
                147373,150157,150158,150159,150220,150222,150223,155716,155718,155720,155721,155722],
            "8":[375851]}

    var gw1408_bays_hl = A.MOCFromJSON(json, {name:'MSB 001', opacity: 0.55,color: '#00BFFF', lineWidth: 1,adaptativeDisplay: false});
    aladin.addMOC(gw1408_bays_hl);
    gw1408_bays_hl.hide();

    //GW170814: gw1408_bays_hlv.fits.gz,0; moc = 90%
    var json =
        {"4":[2197],
            "5":[8430,8431,8442,8443,8446,8773,8784,8785,8787,8960,8962,8963,8966],
            "6":[33711,33718,33719,33762,33763,33766,33788,33790,33791,34474,35088,35089,35091,35101,35144,
                35145,35189,35844,35846,35847,35872,35873,35876,35877,35888,35889,35892],
            "7":[134837,134839,134859,134862,134863,135068,135070,135071,135114,135115,135118,135156,135158,135159,137890,
                137900,137902,137903,137914,140309,140361,140400,140401,140585,140588,140589,140693,140736,140737,140740,
                140741,140752,140753,140755,143380,143382,143383,143432,143434,143435,143480,143482,143483,143501,143512,
                143513,143516,143517,143560,143561,143564,143565,143576,143577],
            "8":[539353,539354,539355,539434,539435,539442,539443,539445,539446,539447,540170,540171,540174,540175,540278,
                540279,540450,540451,540454,540476,540478,540479,540522,540523,540526,540630,540631,551554,551564,551566,
                551567,551578,551604,551606,551607,551650,551660,551662,551663,561233,561235,561244,561245,561247,561440,
                561441,561443,561453,561556,561557,561612,561613,561652,561653,562336,562337,562339,562360,562361,562364,
                562365,562367,562756,562757,562768,562769,562771,562957,562968,562969,562972,562973,563016,563017,563019,
                563061,573526,573704,573706,573707,573732,573734,573735,573752,573754,573755,573758,573896,573898,573899,
                573924,573926,573927,573946,573984,573985,573988,573989,574000,574001,574003,574061,574072,574073,574076,
                574077,574248,574249,574252,574253,574264,574265,574268,574269,574288,574290,574296,574298,574312,574313,
                574320],
            "10":[]}

    var gw1408_bays_hlv = A.MOCFromJSON(json, {name:'MSB 002', opacity: 0.70,color: '#FF8100', lineWidth: 1,adaptativeDisplay: false});
    aladin.addMOC(gw1408_bays_hlv);
    gw1408_bays_hlv.hide();

    //GW150914: LALINFERENCE
    var json =
        {"4":[2065,2067,2068,2070,2073,2075,2076,2078,2100,2318,2319,2330,2331,2334,2335,
            2337,2338,2340,2378],
            "5":[6702,8257,8259,8265,8267,8276,8278,8289,8291,8389,8404,8406,8408,8409,8411,
                8412,8414,9261,9262,9263,9314,9315,9318,9319,9345,9346,9347,9356,9357,9358,
                9364,9365,9366,9368,9376,9377,9378,9408,9409,9412,9413,9424,9425,9428,9429,
                9518,9519,9530,9600,9601,9604,9605,9616,9617,9620],
            "6":[26758,26764,26765,26767,26778,26789,26800,26802,26803,26814,27153,27156,27158,27159,27164,
                27165,27167,27189,33027,33033,33034,33035,33056,33057,33059,33065,33067,33108,33110,33136,
                33138,33144,33146,33147,33153,33188,33189,33191,33232,33234,33240,33266,33272,33274,33275,
                33553,33555,33564,33565,33567,33641,33652,33654,33660,33662,33744,33745,33747,33748,33750,
                37023,37037,37038,37039,37042,37043,37066,37067,37070,37071,37082,37083,37085,37086,37087,
                37322,37323,37326,37327,37338,37339,37342,37343,37377,37378,37379,37436,37437,37438,37468,
                37469,37476,37477,37478,37480,37516,37517,37520,37521,37522,37536,37538,37640,37641,37644,
                37645,37656,38026,38064,38066,38067,38070,38071,38126,38127,38138,38484,38486,38492],
            "7":[106668,106670,106671,107012,107013,107015,107021,107024,107026,107027,107036,107038,107039,107065,107067,
                107106,107153,107164,107165,107167,107189,107191,107206,107248,107250,107262,108609,108611,108620,108621,
                108623,108628,108630,108645,108664,108665,108667,108753,108764,108765,108767,108789,108928,132100,132101,
                132103,132107,132129,132130,132131,132233,132235,132257,132265,132464,132548,132549,132550,132556,132582,
                132620,132621,132623,132645,132647,132653,132655,132761,132788,132789,132791,132932,132966,132968,132969,
                132970,133058,133092,133094,134209,134245,134265,134267,134353,134356,134357,134359,134365,134514,134520,
                134522,134523,134561,134573,134614,134620,134622,134644,134646,134652,134654,134929,134932,134933,134935,
                134984,134985,134996,134998,135004,135006,135024,135025,135027,135028,135030,148091,148125,148126,148127,
                148143,148145,148146,148147,148165,148166,148167,148275,148278,148279,148321,148322,148323,148325,148326,
                148327,148337,148338,148339,149007,149019,149022,149023,149066,149280,149282,149283,149286,149287,149298,
                149299,149302,149303,149346,149347,149350,149351,149362,149363,149507,149756,149757,149758,149880,149881,
                149882,149884,149885,149916,149924,149925,149926,149936,149952,150072,150073,150074,150076,150077,150078,
                150092,150093,150096,150097,150098,150112,150148,150149,150150,150176,150628,150629,150816,150817,150820,
                150821,150832,150833,150836,150837,150880,150881,152108,152110,152111,152122,152123,152126,152260,152262,
                152263,152274,152275,152278,152456,152458,152459,152462,152496,152498,152499,152502,152503,152547,152556,
                152558,152559,152570,153713,153716,153717,153888,153889,153892,153893,153895,153904,153905,153908,153909,
                153911,153940,153942,153948,153950,153952,153953,153956,153957,153959,153972,153974,153976,153977,153980,
                153981],
            "8":[426650,426651,426676,426678,426679,426728,426730,426731,428059,428093,428095,428102,428122,428181,428257,
                428259,428265,428418,428474,428621,428623,428665,428667,428816,428818,428819,428830,428904,428906,429004,
                429006,429007,429042,434489,434491,434518,434524,434526,434527,434589,434591,434613,434664,434665,434667,
                435009,435020,435021,435023,435064,435065,435067,435153,435164,435165,435242,435328,435330,435336,435338,
                435360,435362,435368,435370,435720,435722,435723,435744,435745,435746,435752,435754,528409,528410,528411,
                529037,529039,529069,529071,529754,529776,529778,529784,529860,529864,530204,530205,530206,530320,530322,
                530332,530334,530335,530437,530439,531052,531053,531055,531161,531163,531188,531189,531191,531197,531736,
                531738,531856,531858,531884,531885,531886,531888,531890,532224,532226,532238,532274,532280,532282,532283,
                532372,532374,532380,532382,532383,532456,532458,536833,536844,536845,536847,536869,536989,537056,537057,
                537059,537065,537432,537433,537435,537457,537469,537920,537922,537928,537930,537931,537952,537953,537954,
                537960,537962,538048,538050,538051,538084,538086,538241,538253,538289,538301,538450,538486,538492,538494,
                538580,538582,538588,538590,538612,538614,538620,538622,539713,539725,539736,539737,539739,539764,539765,
                539948,539949,539951,539988,539990,539996,539998,540020,540022,540028,540030,540052,540053,540055,540105,
                540116,540118,592357,592359,592363,592565,592566,592567,592569,592570,592571,592657,592658,592659,593039,
                593054,593055,593097,593098,593099,593282,593283,593298,593299,593345,593346,593347,596073,596074,596075,
                596270,596271,597126,597127,597138,597139,597142,597143,597186,597187,597190,597191,597202,597203,597383,
                597464,597466,597467,597470,597471,598021,598023,598027,599036,599668,599669,599670,599672,599673,599674,
                599708,599709,599710,599712,599713,599714,599716,599717,599748,599749,599750,599752,599812,599813,599814,
                599816,600300,600301,600303,600376,600377,600378,600396,600397,600398,600400,600416,600417,600418,600420,
                600452,600453,600454,600456,600457,600604,600624,600625,600626,600632,600708,600712,600714,602273,602274,
                602275,602276,602292,602293,602336,602337,602340,602341,602352,602353,602356,602357,602528,602529,602560,
                602561,602564,602565,602576,602577,602580,602581,603336,603337,603341,603536,603537,603540,603541,603584,
                603585,603588,603589,603600,603601,608436,608438,608439,608482,608483,608510,608511,608682,608683,608686,
                608687,609044,609046,609047,609118,609119,609802,609830,609831,609854,609855,609990,609991,610002,610184,
                610186,610187,610202,610228,610230,610231,610284,610286,610287,614848,614849,614876,614877,615560,615561,
                615564,615565,615576,615577,615624,615625,615628,615629,615640,615641,615772,615774,615796,615798,615816,
                615817,615820,615821,615832,615833,615835,615894,615900,615902,615929,615932],
            "9":[1712228,1712229,1712231,1712369,1712371,1712377,1712733,1712735,1713025,1713027,1713666,1713890,1714481,1715013,1715015,
                1715312,1715314,1715315,1715592,1715594,1715628,1715630,1715631,1715992,1715994,1715995,1738353,1738355,1738461,1740045,
                1740265,1740267,1741452,1741454,1741484,1741486,1742884,1742886,1743012,1743014,2119108,2119592,2119594,2121956,2121957,
                2121959,2122317,2122319,2127080,2127082,2127438,2128908,2128910,2147340,2147341,2147343,2147385,2147387,2149885,2151716,
                2151718,2151844,2151846,2152961,2152973,2153153,2153936,2153938,2154364,2154366,2154460,2154462,2159068,2159069,2159071,
                2159956,2159958,2160084,2160086,2160092,2160094,2160496,2160497,2160498,2369449,2369450,2369451,2372386,2372387,2373378,
                2373379,2384062,2384063,2388498,2388499,2389530,2389531,2389862,2389863,2389874,2389875,2396148,2396149,2396150,2398180,
                2398700,2398702,2398860,2398861,2398862,2399012,2399013,2401596,2401597,2401598,2401608,2401610,2401676,2401677,2401832,
                2401833,2401834,2409090,2409091,2413360,2413361,2414172,2414173,2414348,2414349,2414360,2414361,2439954,2439955,2440012,
                2440014,2440015,2440740,2440742,2440743,2458128,2458129,2458176,2458177,2459405,2463064,2463066,2463067,2463444,2463445,
                2463568,2463570]}

    var gw0914_lali_hl = A.MOCFromJSON(json, {name:'MSB 004', opacity: 0.50,color: '#F0E68C', lineWidth: 1,adaptativeDisplay: false});
    aladin.addMOC(gw0914_lali_hl);
    gw0914_lali_hl.hide();

    //GW151226: LALINFERENCE
    var json =
        {"4":[54,55,116,2614,2620,2622,2708,2710,2716],
            "5":[128,129,134,135,146,147,150,153,156,157,200,201,204,205,207,
                392,393,394,396,397,406,407,408,409,412,413,450,451,453,454,
                455,456,457,460,468,469,470,1757,1758,1767,1772,1777,1836,1922,4363,
                4400,4407,4457,4460,4461,4474,4475,4478,4565,6400,6402,6403,6409,6411,6436,
                6438,6445,6447,6546,6555,6577,6588,10324,10325,10326,10329,10331,10332,10334,10353,
                10355,10356,10361,10363,10448,10449,10451,10873,10875,10961,10964,10966,10972,10974,10996,
                10997,10999,11005,11178,11411,11427,11432],
            "6":[170,171,520,521,524,525,527,528,530,531,534,535,564,565,578,
                606,607,608,609,637,778,779,782,783,808,809,812,813,824,825,
                827,1531,1533,1534,1535,1580,1581,1592,1593,1594,1596,1597,1611,1614,1615,
                1640,1641,1644,1645,1656,1657,1660,1661,1798,1799,1810,1811,1844,1845,1846,
                1884,1885,1888,1889,1892,6911,7005,7006,7007,7022,7023,7027,7036,7063,7067,
                7078,7079,7081,7082,7083,7084,7085,7086,7092,7105,7106,7107,7112,7113,7114,
                7120,7121,7268,7273,7274,7317,7319,7323,7324,7325,7326,7341,7342,7343,7348,
                7352,7354,7360,7681,7682,7683,7684,7685,7686,7712,16759,17449,17466,17467,17470,
                17553,17556,17557,17606,17607,17613,17618,17619,17624,17625,17627,17653,17800,17802,17803,
                17806,17807,17818,17824,17825,17848,17849,17852,17853,17855,17890,17891,17894,17895,17918,
                17919,18241,18244,18245,18256,18257,18259,24917,24919,25604,25606,25633,25635,25648,25650,
                25656,25658,25659,25733,25735,25741,25756,25758,25776,25777,25779,25785,25832,25834,26132,
                26133,26135,26141,26176,26178,26179,26208,26209,26211,26212,26214,26217,26219,26317,26319,
                26320,26322,26328,26330,26361,26363,26364,26366,27732,27734,27735,27741,27743,27914,27936,
                27938,27944,41287,41293,41294,41295,41308,41310,41315,41321,41323,41332,41409,41411,41417,
                41419,41432,41433,41434,41441,41443,41449,41450,41451,41456,41458,41464,41466,41801,41802,
                41803,41808,41810,43489,43491,43497,43499,43506,43512,43514,43841,43852,43853,43855,43877,
                43879,43892,43894,43900,43902,43903,43992,43993,43995,44017,44028,44029,44031,44680,44682,
                44704,44706,44707,45482,45621,45622,45623,45625,45626,45627,45628,45629,45630,45643,45649,
                45650,45651,45652,45653,45654,45656,45664,45665,45666,45668,45701,45703,45705,45706,45707,
                45712,45713,45714,45736],
            "7":[698,699,702,2092,2093,2104,2105,2107,2118,2119,2130,2131,2135,2241,2244,
                2245,2269,2316,2318,2319,2330,2331,2334,2416,2418,2419,2422,2423,2440,2441,
                2444,2445,2447,2529,2532,2533,2544,2545,3106,3107,3110,3178,3179,3182,3183,
                3192,3194,3195,3198,3199,3245,3256,3257,3260,3261,3304,3305,3307,3370,3371,
                3924,3925,6075,6078,6079,6122,6123,6130,6131,6207,6251,6254,6255,6266,6267,
                6270,6271,6328,6329,6330,6332,6333,6334,6380,6381,6392,6393,6396,6441,6442,
                6443,6450,6451,6453,6454,6455,6636,7179,7181,7182,7183,7234,7238,7239,7328,
                7329,7332,7333,7344,7345,7348,7388,7389,7391,7544,7545,7560,7561,7564,7565,
                7572,7573,7574,7576,7577,7616,7617,7620,27639,27643,27999,28019,28079,28083,28085,
                28086,28087,28101,28102,28103,28105,28106,28107,28148,28152,28154,28263,28265,28266,28267,
                28302,28303,28307,28309,28310,28311,28321,28322,28323,28348,28349,28372,28373,28374,28376,
                28384,28385,28386,28388,28417,28418,28419,28460,28464,28465,28488,28489,28544,28925,28927,
                28982,28987,28988,29063,29069,29070,29071,29080,29082,29089,29090,29091,29100,29101,29102,
                29273,29274,29275,29285,29287,29289,29291,29308,29310,29341,29342,29343,29358,29359,29361,
                29362,29363,29400,29402,29412,29413,29414,29420,29444,29448,29449,29450,30723,30748,30749,
                30750,30768,30769,30770,30772,30776,30784,30786,30852,30856,67033,67035,67060,67061,69770,
                69771,69774,69775,69792,69793,69795,69804,69805,69858,69859,69863,69884,69886,69887,70058,
                70164,70165,70208,70209,70211,70232,70233,70236,70237,70239,70418,70419,70422,70436,70437,
                70448,70449,70451,70461,70466,70490,70491,70494,70495,70504,70505,70507,70597,70608,70609,
                71178,71204,71206,71207,71218,71219,71278,71279,71290,71304,71305,71308,71309,71311,71344,
                71348,71349,71404,71405,71416,71417,71419,71554,71555,71558,71559,71570,71626,71627,71666,
                71667,71670,72960,72961,72989,73032,73033,73072,73073,73076,73077,73079,99665,99667,99701,
                99703,99709,102422,102428,102430,102504,102506,102529,102531,102565,102567,102573,102606,102628,102630,
                102631,102928,102929,102973,102975,102994,103000,103002,103030,103036,103038,103113,103115,103148,103149,
                103151,103298,103304,103306,103342,104517,104536,104537,104539,104573,104575,104708,104710,104754,104760,
                104762,104763,104840,104841,104843,104860,104862,104863,104865,104930,104936,104938,104939,105221,105223,
                105265,105267,105294,105316,105318,105324,105326,105327,105365,105426,105432,105434,105435,105441,105443,
                105468,105470,110916,110917,110919,110932,110934,110935,110961,110963,111060,111061,111063,111069,111071,
                111093,111626,111648,111650,111651,111748,111758,111780,111782,111785,111788,111790,165141,165143,165169,
                165171,165236,165238,165244,165255,165283,165289,165336,165337,165338,165360,165641,165643,165665,165667,
                165673,165675,165740,165742,165761,165763,165769,165771,165793,165794,165795,165828,165829,165830,165836,
                167200,167201,167203,167264,167266,167272,167274,167360,167362,167368,167370,167392,167394,167400,167402,
                167744,167746,167752,167754,167874,167936,167938,173277,173279,173898,173920,173922,173928,173930,173953,
                173954,173955,173961,173963,173985,173987,173993,174016,174018,174060,174062,175372,175373,175375,175397,
                175416,175417,175419,175472,175474,175480,175482,175504,175505,175507,175541,175543,175549,175551,175582,
                175604,175606,175607,175893,175895,175977,175979,176076,176077,176079,176101,176120,176121,176123,178688,
                178690,178696,178698,178734,178820,178822,178823,178864,178866,178872,178874,181246,181247,182399,182463,
                182477,182478,182479,182481,182483,182497,182499,182524,182526,182555,182557,182558,182559,182566,182567,
                182569,182570,182571,182594,182595,182620,182628,182629,182630,182632,182668,182669,182670,182676,182688,
                182689,182690,182803,182809,182810,182811,182819,182860,182861,182862,182864,182865,182866,182880,182881,
                182882,182884,182928,182929,182930,182932,182936,182948,182950,182952,182953,182954,183296,183298],
            "8":[2698,2699,2702,2784,2786,2787,2814,2815,8352,8353,8356,8357,8359,8380,8381,
                8424,8425,8464,8466,8467,8470,8471,8514,8515,8536,8538,8539,8960,8961,8988,
                8989,9061,9072,9073,9226,9270,9271,9314,9315,9340,9342,9343,9514,9515,9518,
                9519,9530,9531,9668,9670,9671,9680,9682,9683,9686,9687,9772,9773,9784,9785,
                10112,10113,10140,10141,10184,10185,10188,10189,10191,12446,12447,12706,12707,12710,12711,
                12722,12723,12726,12727,12774,12775,12786,12787,12976,12977,13048,13049,13052,13053,13224,
                13225,13227,13498,13499,13758,13759,13802,13803,13806,13807,13822,13823,15365,15376,15377,
                15380,15381,15424,15425,15428,15429,15440,15441,15444,15445,15616,15617,15632,15633,15636,
                15637,15680,15681,15684,15685,24254,24255,24297,24298,24299,24311,24443,24446,24447,24479,
                24482,24487,24515,24517,24518,24519,24815,24826,24827,25002,25003,25062,25063,25078,25079,
                25324,25325,25340,25341,25528,25529,25532,25533,25576,25588,25589,25590,25762,25763,25799,
                25810,25811,25915,25962,25982,25983,26272,26273,26352,26353,26356,26357,26528,26529,26532,
                26533,26548,26549,26592,26593,26624,26625,28711,28713,28714,28715,28722,28723,28941,28942,
                28943,29320,29321,29322,29324,29325,29340,29396,29397,29560,29561,29562,29568,29569,29572,
                29573,29584,29585,29632,30184,30185,30186,30188,30192,30193,30194,30196,30300,30301,30302,
                30320,30484,110527,110569,110570,110571,112061,112063,112255,112309,112310,112311,112313,112314,112315,
                112338,112339,112399,112401,112403,112419,112596,112597,112598,112600,112601,112602,112612,112613,112614,
                112991,113005,113006,113007,113047,113050,113051,113206,113207,113227,113233,113234,113235,113400,113401,
                113402,113508,113509,113510,113512,113513,113520,113548,113549,113550,113568,113844,113845,113864,113865,
                113866,113872,113873,115705,115707,115919,115923,115932,115941,115942,115943,115945,115946,115947,115960,
                115962,116251,116269,116271,116273,116274,116275,116304,116306,116324,116325,116326,116355,116412,116414,
                116416,116418,117069,117070,117071,117089,117090,117091,117145,117146,117147,117236,117238,117244,117341,
                117342,117343,117359,117361,117363,117429,117430,117431,117584,117585,117586,117604,117606,117660,117661,
                117662,117688,117696,117784,117786,117804,117806,117888,117889,117890,117896,122885,122886,122887,123004,
                123006,123084,123085,123086,123140,123141,123142,123168,123412,123428,268129,268130,268131,268136,268137,
                268253,279074,279075,279078,279079,279090,279144,279146,279147,279150,279151,279176,279177,279179,279204,
                279205,279228,279229,279426,279427,279448,279450,279451,279542,280238,280239,280645,280669,280840,280841,
                280884,280885,280952,280953,280955,281666,281667,281670,281671,281692,281694,281695,281729,281732,281733,
                281735,281757,281800,281801,281803,281841,281870,281954,281955,281970,282024,282025,282384,282385,282444,
                282445,282447,282484,282485,282487,284822,284823,284890,284891,285106,285107,285166,285167,285229,285240,
                285241,285243,285333,285380,285381,285383,285400,285401,285404,285405,285407,285604,285605,285672,285673,
                285675,286210,286211,286286,286287,286298,286299,286498,286499,286502,286520,286522,286523,286656,286658,
                286659,286662,286686,286687,291156,291157,291159,291852,291940,291941,291952,291953,291955,292136,292137,
                292140,292141,292143,292241,292244,292245,292247,292300,292301,292312,292313,292315,398693,398801,398803,
                398845,409682,409716,409718,409724,409726,409727,409992,409994,410030,410113,410115,410149,410151,410256,
                410257,410259,410265,410301,410303,410416,410418,410419,410516,410518,410519,410594,410600,410602,411724,
                411725,411727,411749,411751,411889,411968,411970,412006,412012,412014,412015,412150,412156,412158,412549,
                412551,412601,412603,413230,413360,413362,413363,418065,418077,418244,418245,418247,418288,418289,418291,
                418644,418645,418647,418653,418655,418836,418838,418844,418846,418847,418914,418920,418922,419008,419010,
                419011,419022,419044,419046,419368,419369,419371,419408,419410,419416,419418,419419,419446,419468,419469,
                419471,419493,419495,419714,419750,420881,420883,420917,420919,421057,421059,421138,421144,421146,421168,
                421170,421171,421300,421302,421303,421457,421459,421468,421469,421471,421696,421698,421699,421732,421734,
                421735,421761,421796,421797,421799,421840,421842,421848,421850,421851,443673,443675,443700,443701,443703,
                443709,443732,443734,443840,443841,443843,443877,443879,444249,444251,444275,446496,446498,446510,446596,
                446598,446599,446618,446640,446642,446648,446650,447024,447026,447149,448528,660561,660563,660569,660570,
                660571,660589,660591,660673,660675,660681,660682,660683,660948,660950,660956,660984,660986,661013,661014,
                661015,661017,661018,661019,661328,661356,661358,661444,661448,661449,661450,661472,661474,662541,662543,
                662964,662965,662966,662972,662973,662974,663049,663051,663073,663075,663081,663082,663083,663169,663170,
                663171,663352,663354,663448,663450,663472,663474,668509,668637,668639,668661,668663,668669,668671,668809,
                668810,668811,669060,669062,669068,669444,669446,669452,669572,669574,670037,670039,670079,670173,670175,
                670205,670207,670549,670551,670581,670583,670719,671104,671106,671112,671114,671136,671138,671144,671146,
                671488,671490,671520,671521,671522,671528,671530,671616,671618,671748,671750,671776,671778,692565,692567,
                692573,692575,692597,692599,692605,692607,693077,693079,693205,693207,693213,693215,693237,693239,693245,
                693247,694018,694024,694026,694144,694146,694176,694178,694184,694186,694741,694743,694749,695552,695554,
                695560,695561,695562,695584,695585,695586,695718,695724,695726,695808,695809,695811,695849,695981,695983,
                696068,696070,696076,696078,696218,696252,696254,701445,701497,701499,701596,701597,701599,701621,701623,
                701672,701673,701675,701794,701800,701802,701932,701934,701935,702052,702053,702055,702061,702160,702161,
                702163,702169,702298,702320,702322,703604,703605,703607,703613,703615,703701,703703,703905,703907,703913,
                703915,704260,704261,704263,704313,704413,704415,704489,713378,713384,713386,714796,714798,715284,715286,
                715362,715368,715370,715492,715494,715500,715502,715503,724927,724973,724974,724975,724979,724982,724983,
                727728,727729,727730,727736,729593,729594,729595,729823,729845,729846,729847,729849,729850,729851,729923,
                729929,729930,729931,729993,729994,729995,730100,730101,730102,730108,730207,730219,730225,730226,730227,
                730255,730262,730263,730273,730274,730275,730484,730524,730532,730533,730534,730536,730537,730538,730544,
                730560,730561,730562,730684,730685,730686,730708,730712,730720,730721,730722,730764,730768,730784,731197,
                731199,731205,731207,731211,731233,731234,731235,731452,731454,731468,731470,731488,731489,731490,731532,
                731552,731724,731725,731726,731748,731752,731754,731796,731797,731798,731820,733188,733190,753664,753665,
                753666],
            "9":[10862,10863,11142,11143,11946,11947,33862,33863,33874,36240,36241,36300,36301,36922,37074,
                37075,38678,38679,39072,39073,39076,39077,40760,40761,51840,51841,51844,51845,54010,54011,
                61440,61441,61772,61773,97002,97003,97005,97006,97007,97186,97187,97230,97231,97242,97243,
                97782,97783,97913,97914,97915,97934,97935,97945,97946,97947,98986,98987,99002,99003,99258,
                99259,100063,100238,100239,101304,101305,101308,101309,101368,101369,101372,101373,102308,102309,102320,
                102321,103658,103659,103854,103855,103866,103867,105104,105105,106512,106513,115762,115763,115787,115790,
                115791,117292,117293,120756,120757,120788,120789,121212,121213,442223,448249,448250,448251,449019,449251,
                449311,449323,449325,449326,449327,449591,452187,452237,452238,452239,452823,452907,454224,454225,454226,
                456720,463704,463706,463707,463736,463738,463759,463824,463826,463844,463845,463846,463852,463854,465081,
                465083,465668,465669,465670,468579,468948,468949,468950,470368,470370,470736,471564,471566,492448,492449,
                492450,1116290,1116291,1116366,1116367,1116582,1116583,1117698,1117722,1117723,1118174,1118175,1120946,1120947,1122576,
                1122577,1122579,1123548,1123549,1123748,1123749,1126656,1126658,1126659,1126662,1126663,1126730,1126731,1126774,1126775,
                1126912,1126913,1126915,1126936,1126937,1127024,1127025,1127027,1127360,1127361,1127363,1127373,1127413,1127486,1127487,
                1127814,1129493,1140442,1140912,1140913,1140915,1141528,1141529,1141531,1141557,1144856,1144858,1144859,1144862,1144863,
                1167412,1167413,1167415,1169257,1595201,1638722,1640112,1640114,1640115,1641068,1641069,1641071,1641201,1641203,1646677,
                1646904,1646905,1646907,1648592,1648594,1649013,1652912,1652914,1652915,1672305,1672307,1672316,1672317,1672319,1673013,
                1673015,1674585,1674587,1675380,1675382,1675383,1676036,1676038,1677668,1677670,1677776,1677778,1678848,1678850,1678851,
                1678906,1678992,1678994,1678995,1683701,1684544,1684546,1685112,1685114,1687052,1687053,1687055,1687396,1687398,1774808,
                1774809,1774811,1774833,1775541,1775543,1777092,1777093,1777095,1785996,1785998,1785999,1786034,1786464,1786466,1788593,
                1788595,1788604,1788605,1788607,2642273,2642274,2642275,2642699,2642721,2642722,2642723,2645804,2645806,2651868,2651869,
                2651870,2652321,2652323,2652673,2652675,2653296,2653298,2671989,2671991,2674007,2674013,2674015,2674045,2674047,2675233,
                2675235,2677816,2677818,2678320,2678322,2678424,2680309,2680311,2682741,2682743,2682869,2682871,2684420,2684422,2687108,
                2770933,2770935,2770941,2770943,2782252,2782254,2782348,2782350,2782351,2784316,2784318,2784864,2784866,2805789,2805791,
                2805821,2806340,2806341,2806343,2806517,2806696,2806697,2806699,2808685,2808687,2809184,2809186,2809187,2809292,2809294,
                2815616,2815617,2815619,2817964,2817965,2817967,2853548,2853550,2859624,2859626,2910924,2910925,2910926,2910952,2910953,
                2910954,2919713,2919714,2919715,2919949,2919950,2919951,2919969,2919970,2919971,2920412,2920413,2920414,2920827,2920871,
                2920874,2920875,2921045,2921046,2921047,2921940,2923076,2924793,2924794,2924795,2925812,2925813,2925814,2925876,2926132,
                2926212,2926908,2926909,2926910,2927296,2927297,2927298,2932756,2932757,2932758]}

    var gw1226_lali_hl = A.MOCFromJSON(json, {name:'MSB 005', opacity: 0.50,color: '#ff00ff', lineWidth: 1,adaptativeDisplay: false});
    aladin.addMOC(gw1226_lali_hl);
    gw1226_lali_hl.hide();

    //GW170104: LALINFERENCE
    var json =
        {"3":[118],
            "4":[296,299,302,389,400,401,403,406,407,450,451,457,460,461,478,
                479,501,735,758,761,762,1025,1056,1058,1064,1066,1155,1161,1163,1190,
                1196,1352,1358,1381,1392,1395,1398,1405,2200,2214,2219],
            "5":[1162,1188,1190,1191,1192,1193,1195,1202,1212,1214,1215,1258,1259,1541,1552,
                1553,1608,1609,1616,1618,1619,1622,1623,1652,1653,1794,1816,1818,1819,1822,
                1823,1824,1825,1849,1852,1853,1866,1904,1906,1907,1910,1911,1989,2000,2001,
                2003,2911,2933,2934,2935,3006,3007,3023,3025,3027,3028,3030,3036,3043,3052,
                3053,3054,3056,3057,3058,3089,3091,3092,3094,3100,3102,4011,4014,4015,4026,
                4105,4107,4108,4109,4110,4129,4131,4132,4134,4137,4138,4139,4140,4142,4228,
                4230,4236,4238,4260,4262,4268,4270,4609,4611,4612,4614,4615,4617,4619,4641,
                4664,4666,4740,4741,4743,4749,4751,4752,4754,4792,4793,4795,4798,5199,5210,
                5211,5214,5215,5233,5236,5237,5239,5414,5415,5417,5420,5421,5423,5426,5436,
                5438,5439,5482,5521,5572,5574,5575,5576,5577,5586,5596,5598,5599,5616,5617,
                8437,8438,8439,8441,8442,8443,8444,8507,8509,8510,8511,8547,8549,8552,8582,
                8583,8585,8586,8587,8588,8589,8590,8592,8593,8594,8608,8609,8765,8766,8767,
                8773,8774,8775,8779,8780,8781,8782,8784,8785,8786,8808,8851,8852,8853,8854,
                8860,8869,8871,8880,8881,8882,8888,8890],
            "6":[4642,4652,4654,4655,4666,4756,4758,4759,4777,4802,4812,4814,4815,4826,4852,
                4854,4855,5026,5027,5050,5051,5054,6160,6161,6216,6217,6220,6221,6223,6257,
                6260,6261,6263,6441,6444,6445,6470,6471,6482,6548,6549,6592,6593,6596,6597,
                6599,7182,7183,7194,7195,7270,7271,7282,7283,7304,7305,7308,7309,7349,7392,
                7393,7417,7420,7421,7470,7471,7482,7483,7622,7623,7634,7635,7638,7639,7941,
                7952,7953,7955,7965,8008,8009,8011,8048,8049,8052,8053,11615,11637,11639,11729,
                11731,11751,11757,11758,11759,12015,12021,12022,12023,12085,12087,12091,12099,12105,12106,
                12107,12116,12118,12124,12126,12152,12153,12154,12167,12171,12220,12221,12236,12237,12238,
                12240,12256,12257,12258,12353,12355,12389,12391,16039,16050,16051,16110,16111,16122,16389,
                16391,16397,16398,16399,16427,16444,16446,16448,16450,16456,16513,16515,16521,16523,16532,
                16534,16540,16542,16545,16547,17052,17054,17076,17078,17084,17086,18433,18435,18441,18443,
                18452,18454,18465,18467,18473,18538,18572,18573,18575,18597,18599,18605,18624,18626,18632,
                18634,18968,18969,18971,18993,18995,19012,19014,19020,19022,19092,19093,19095,19101,19103,
                19152,19154,19160,19162,19176,19177,19179,19184,19186,20787,20790,20791,20793,20834,20835,
                20838,20839,20885,20928,20929,20931,20941,20952,20953,20955,20981,21546,21547,21550,21648,
                21650,21651,21654,21655,21664,21665,21667,21677,21688,21689,21691,21710,21711,21748,21750,
                21751,21922,21932,21934,21935,21946,22037,22080,22081,22083,22093,22132,22133,22292,22294,
                22295,22316,22317,22338,22348,22350,22351,22362,22388,22390,22391,22420,22421,22473,22476,
                22477,22479,22513,22516,22517,22519,33661,33662,33663,33725,33727,33741,33742,33743,33745,
                33746,33747,33761,33762,33763,33780,33781,33782,33784,33785,33786,34015,34026,34027,34033,
                34034,34035,34154,34183,34185,34186,34187,34193,34194,34195,34200,34201,34202,34204,34212,
                34213,34214,34216,34240,34319,34325,34326,34327,34338,34339,34364,34380,34381,34382,34384,
                34385,34386,34388,34400,34401,34440,34441,34442,34444,34448,35031,35037,35038,35039,35055,
                35057,35059,35087,35091,35109,35110,35111,35113,35115,35132,35134,35148,35168,35216,35217,
                35218,35236,35240,35241,35242,35389,35391,35397,35398,35399,35403,35420,35422,35448,35450,
                35481,35483,35503,35532,35533,35534,35556,35584],
            "7":[24889,24890,24891,48057,48058,48059],
            "8":[99555]}

    var gw0104_lali_hl = A.MOCFromJSON(json, {name:'MSB 006', opacity: 0.50,color: '#ff8080', lineWidth: 1,adaptativeDisplay: false});
    aladin.addMOC(gw0104_lali_hl);
    gw0104_lali_hl.hide();

    //GW170814: gw1408_ref_hlv.fits.gz,0; moc = 90%
    var json =
        {"5":[8438,8439,8442,8445,8616,8617],
            "6":[33719,33725,33741,33742,33743,33762,33763,33764,33765,33776,33777,33779,33789,34440,34442,
                34443,34446,34472,34473,34476,34477,34479,34482,34488,34489],
            "7":[134867,134869,134870,134871,134873,134875,134897,134899,134908,134909,134911,134942,134943,134957,134959,
                134961,134962,134963,134986,134987,134990,134991,135002,135003,135006,135040,135042,135043,135046,135064,
                135066,135068,135069,135088,135090,135096,135098,135112,135113,135115,135141,135152,135153,135155,137766,
                137767,137790,137791,137896,137897,137900,137901,137912,137913,137920,137922,137923,137932,137934,137935,
                137960,137961,137962,137964,137965,140544,140545,140548,140549,140560],
            "8":[539463,539467,539473,539474,539475,539489,539490,539491,539496,539497,539499,539585,539587,539621,539623,
                539640,539641,539807,539833,539834,539835,539842,539843,539958,539959,540002,540003,540030,540031,540166,
                540167,540176,540177,540178,540180,540181,540188,540190,540191,540260,540261,540262,540268,540270,540285,
                540356,540358,540364,540366,540388,540390,540396,540398,540456,540457,540459,540560,540561,540617,540656,
                540657,540660,540661,550954,550955,551056,551058,551059,551114,551115,551118,551152,551154,551155,551158,
                551336,551338,551339,551656,551657,551660,551661,551663,551684,551686,551687,551704,551706,551707,551734,
                551852,551853,551854,551864,551865,551868,551869,551872,551874,551880,551882,551904,551906,551912,561493,
                562188,562189,562200,562201,562204,562205],
            "9":[2160759],
            "10":[8643033,8643034,8643035]}

    var gw1408_ref_hlv = A.MOCFromJSON(json, {name:'MSB 003', opacity: 0.65,color: '#7CFC00', lineWidth: 1,adaptativeDisplay: false});
    aladin.addMOC(gw1408_ref_hlv);
    gw1408_ref_hlv.hide();

    // define custom draw function: LIGO and Virgo localization
    var drawFunction = function(source, canvasCtx, viewParams) {
        canvasCtx.beginPath();
        canvasCtx.arc(source.x, source.y, source.data['size'] * 2, 0, 2 * Math.PI, false);
        canvasCtx.closePath();
        canvasCtx.strokeStyle = '#c38';
        canvasCtx.lineWidth = 3;
        canvasCtx.globalAlpha = 0.7,
            canvasCtx.stroke();
        var fov = Math.max(viewParams['fov'][0], viewParams['fov'][1]);

        // object name is displayed
        if (fov>180) {
            return;
        }

        canvasCtx.globalAlpha = 0.9;
        canvasCtx.globalAlpha = 1;

        var xShift = -190;
        var xShift2 = -290;

        canvasCtx.font = 'small-caps bold 22px arial'
        canvasCtx.fillStyle = '#FF8100';
        canvasCtx.fillText(source.data['name'], source.x + xShift, source.y -8);

        // object type is displayed
        if (fov>180) {
            return;
        }
        canvasCtx.font = 'small-caps bold 20px arial'
        canvasCtx.fillStyle = '#ffffff';
        canvasCtx.fillText(source.data['otype'], source.x + 2 + xShift2, source.y + 10);
    };
    // create sources objects Area (90%) = 97.4 sq. deg
    var ligo_virgo_loc = A.source(46.2083, -34.7261, {name: 'MSB 002', size: 0, otype: 'LIGO and Virgo Localization'});

    // create catalog layer with custom draw function
    var gw1408_info_hlv = A.catalog({name: 'cat', shape: drawFunction, color:'white'});
    // add sources to the new layer
    gw1408_info_hlv.addSources([ligo_virgo_loc]);
    aladin.addCatalog(gw1408_info_hlv);
    gw1408_info_hlv.hide();


    // define custom draw function: LIGO and Virgo localization refined
    var drawFunction = function(source, canvasCtx, viewParams) {
        canvasCtx.beginPath();
        canvasCtx.arc(source.x, source.y, source.data['size'] * 2, 0, 2 * Math.PI, false);
        canvasCtx.closePath();
        canvasCtx.strokeStyle = '#c38';
        canvasCtx.lineWidth = 3;
        canvasCtx.globalAlpha = 0.7,
            canvasCtx.stroke();
        var fov = Math.max(viewParams['fov'][0], viewParams['fov'][1]);

        // object name is displayed
        if (fov>180) {
            return;
        }

        canvasCtx.globalAlpha = 0.9;
        canvasCtx.globalAlpha = 1;

        var xShift = -210;
        var xShift2 = -150;

        canvasCtx.font = 'small-caps bold 22px arial'
        canvasCtx.fillStyle = '#7CFC00';
        canvasCtx.fillText(source.data['name'], source.x + xShift2, source.y -8);

        // object type is displayed
        if (fov>180) {
            return;
        }
        canvasCtx.font = 'italic small-caps bold 20px arial'
        canvasCtx.fillStyle = '#ffffff';
        canvasCtx.fillText(source.data['otype'], source.x + 2 + xShift, source.y + 10);
    };
    // create sources objects Area (90%) = 97.4 sq. deg
    var ligo_virgo_ref = A.source(46.90736, -48.14671, {name: 'MSB 003', size: 0, otype: 'of PID 002'});

    // create catalog layer with custom draw function
    var gw1408_info_ref = A.catalog({name: 'cat', shape: drawFunction, color:'white'});
    // add sources to the new layer
    gw1408_info_ref.addSources([ligo_virgo_ref]);
    aladin.addCatalog(gw1408_info_ref);
    gw1408_info_ref.hide();

    // overlay layers we wish to showcase
    var myOverlays = [gw1408_bays_hl, gw1408_info_hl, gw1408_pop_hl,
        gw1408_bays_hlv, gw1408_info_hlv, gw1408_pop_hlv,
        gw1408_ref_hlv, gw1408_info_ref, gw1408_pop_ref,
        gw0914_lali_hl, gw0914_info_hl, gw0914_pop_hl,
        gw1226_lali_hl, gw1226_info_hl, gw1226_pop_hl,
        gw0104_lali_hl, gw0104_info_hl, gw0104_pop_hl];

    //change image layers using radio btns
    $('input[name=moc]').change(function() {
        // find index of changed input
        var index = $("label input").index(this);

        if (this.checked) {
            myOverlays[index].show();
        }
        else {
            myOverlays[index].hide();
        }
    });


    // from Thomas Boch to query constellations HIPS
    var constellationsHiPS = aladin.createImageSurvey("P/CONSTELLATIONS6", "CONSTELLATIONS", 'http://darts.isas.jaxa.jp/pub/judo2/HiPS/Constellations6/', 'j2000', 4, {imgFormat: 'png'});
    $('fieldset ').on('change', 'input[name=image]', function() {
        var hipsId = $(this).val();
        if (hipsId==='P/CONSTELLATIONS6') {
            aladin.setImageSurvey(constellationsHiPS);
        }
        else {
            aladin.setImageSurvey(hipsId);
        }
    });

</script>

<script>
    $('input[name=survey]').change(function() {
        aladin.setImageSurvey($(this).val());
    });
</script>

<script type="text/javascript">

    function show(a) {
        if(a == 0)
            window.location.href= "/constellation";
        else if(a == 1)
            window.location.href= "/constellation/moc";
        else
            window.location.href= "/constellation/multisourcefusion";

    }

</script>


<%--<!-- d3.js  -->--%>
<%--<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>--%>


<!-- wwt Advanced Search  -->
<%--<jsp:include page="../common/msb_searchbox.jsp"></jsp:include>--%>

</body>
</html>