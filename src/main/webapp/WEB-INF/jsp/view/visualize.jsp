<%@ page language="java" pageEncoding="utf-8" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">

<meta http-equiv="refresh" content="0;URL=s/prototype/visualization.html">

<title>Visualization Panel</title>

<jsp:include page="../common/import.jsp"></jsp:include>
<!-- ztree -->
<link rel="stylesheet" href="<%=basePath%>u/lib/ztree/css/zTreeStyle/zTreeStyle.css">
<script src="<%=basePath%>u/lib/ztree/jquery.ztree.all.min.js"></script>
<!-- ezoom -->
<script src="<%=basePath%>u/lib/ezoom/e-smart-zoom-jquery.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>u/css/general.css">

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

    ul.ztree {
        margin-top: 10px;
        border: 1px solid #617775;
        background: #f0f6e4;
        width: 100%;
        height: 360px;
        overflow-y: scroll;
        overflow-x: auto;
    }

    ul.log {
        border: 1px solid #617775;
        background: #f0f6e4;
        width: 300px;
        height: 170px;
        overflow: hidden;
    }

    ul.log.small {
        height: 45px;
    }

    ul.log li {
        color: #666666;
        list-style: none;
        padding-left: 10px;
    }

    ul.log li.dark {
        background-color: #E3E3E3;
    }

    #imgContainer {
        width: 980px;
        height: 500px;
    }

    #positionButtonDiv {
        background: rgb(58, 56, 63);
        background: rgba(58, 56, 63, 0.8);
        border: solid 1px #100000;
        color: #fff;
        padding: 8px;
        text-align: left;
        position: absolute;
        right: 35px;
        top: 35px;
    }

    #positionButtonDiv .positionButtonSpan img {
        float: right;
        border: 0;
    }

    .positionMapClass area {
        cursor: pointer;
    }

    .zoomButton {
        border: 0;
        cursor: pointer;
    }

    .zoomableContainer {
        background-image: url("images/transparent.png");
    }

</style>
<body style="display: none;">
<section>
    <div class="container wrapper outterblock">
        <!-- title -->
        <div class="title">Visualization</div>
        <!-- content -->
        <div class="innerblock">
            <div class="row">
                <div class="col-lg-3">
                    <div class="box">
                        <h3 class="box_title">MSB Pigeonhole</h3>
                        <div class="content">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-default dropdown-toggle"
                                        data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                    Type <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">Separated link</a></li>
                                </ul>
                            </div>
                            <ul id="treeDemo" class="ztree"></ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div id="imgContainer">
                        <img id="imageFullScreen" src="<%=basePath%>u/img/sky.png"/>
                    </div>
                    <div id="positionButtonDiv">
                        <p>
								<span> <img id="zoomInButton" class="zoomButton"
                                            src="images/zoomIn.png" title="zoom in" alt="zoom in"/> <img
                                        id="zoomOutButton" class="zoomButton" src="images/zoomOut.png"
                                        title="zoom out" alt="zoom out"/>
								</span>
                        </p>
                        <p>
								<span class="positionButtonSpan"> <map name="positionMap"
                                                                       class="positionMapClass">
										<area id="topPositionMap" shape="rect" coords="20,0,40,20"
                                              title="move up" alt="move up"/>
										<area id="leftPositionMap" shape="rect" coords="0,20,20,40"
                                              title="move left" alt="move left"/>
										<area id="rightPositionMap" shape="rect" coords="40,20,60,40"
                                              title="move right" alt="move right"/>
										<area id="bottomPositionMap" shape="rect" coords="20,40,40,60"
                                              title="move bottom" alt="move bottom"/>
									</map> <img src="images/position.png" usemap="#positionMap"/>
								</span>
                        </p>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<SCRIPT type="text/javascript">
    var setting = {};

    var zNodes = [
        {
            name: "父节点1 - 展开", open: true,
            children: [
                {
                    name: "父节点11 - 折叠",
                    children: [
                        {name: "叶子节点111"},
                        {name: "叶子节点112"},
                        {name: "叶子节点113"},
                        {name: "叶子节点114"}
                    ]
                },
                {
                    name: "父节点12 - 折叠",
                    children: [
                        {name: "叶子节点121"},
                        {name: "叶子节点122"},
                        {name: "叶子节点123"},
                        {name: "叶子节点124"}
                    ]
                },
                {name: "父节点13 - 没有子节点", isParent: true}
            ]
        },
        {
            name: "父节点2 - 折叠",
            children: [
                {
                    name: "父节点21 - 展开", open: true,
                    children: [
                        {name: "叶子节点211"},
                        {name: "叶子节点212"},
                        {name: "叶子节点213"},
                        {name: "叶子节点214"}
                    ]
                },
                {
                    name: "父节点22 - 折叠",
                    children: [
                        {name: "叶子节点221"},
                        {name: "叶子节点222"},
                        {name: "叶子节点223"},
                        {name: "叶子节点224"}
                    ]
                },
                {
                    name: "父节点23 - 折叠",
                    children: [
                        {name: "叶子节点231"},
                        {name: "叶子节点232"},
                        {name: "叶子节点233"},
                        {name: "叶子节点234"}
                    ]
                }
            ]
        },
        {name: "父节点3 - 没有子节点", isParent: true}

    ];

    function zoomButtonClickHandler(e) {
        var scaleToAdd = 0.8;
        if (e.target.id == 'zoomOutButton')
            scaleToAdd = -scaleToAdd;
        $('#imageFullScreen').smartZoom('zoom', scaleToAdd);
    }

    function moveButtonClickHandler(e) {
        var pixelsToMoveOnX = 0;
        var pixelsToMoveOnY = 0;

        switch (e.target.id) {
            case "leftPositionMap":
                pixelsToMoveOnX = 50;
                break;
            case "rightPositionMap":
                pixelsToMoveOnX = -50;
                break;
            case "topPositionMap":
                pixelsToMoveOnY = 50;
                break;
            case "bottomPositionMap":
                pixelsToMoveOnY = -50;
                break;
        }
        $('#imageFullScreen').smartZoom('pan', pixelsToMoveOnX, pixelsToMoveOnY);
    }

    $(document).ready(function () {
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);

        $('#imageFullScreen').smartZoom({'containerClass': 'zoomableContainer'});
        $('#topPositionMap,#leftPositionMap,#rightPositionMap,#bottomPositionMap').bind("click", moveButtonClickHandler);
        $('#zoomInButton,#zoomOutButton').bind("click", zoomButtonClickHandler);

    });

</SCRIPT>
</body>
</html>
