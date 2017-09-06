<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="../common/import.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>u/lib/easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>u/lib/easyui/themes/icon.css">
    <script type="text/javascript" src="<%=basePath%>u/lib/easyui/jquery.easyui.min.js"></script>
    <style>
        .datagrid-row-selected {
            color: #000;
            background-color: #fce98e;
        }
    </style>
</head>
<body>
<div class="container">
    <table class="table">
        <tr>
            <th colspan="3" style="text-align: left;">
                New Time Slot:
            </th>
            <th style="text-align: right;">
                <div class="btn-group">
                    <button class="btn btn-default btn-sm" type="button" style="width:75px" onclick="newslot()">Submit
                    </button>
                    <button class="btn btn-default btn-sm" type="button" style="width:75px">Reset</button>
                </div>
            </th>
        </tr>
        <tr>
            <td>Begin Time:</td>
            <td>
                <input id="n_begintime" name="begintime" class="easyui-datetimebox"
                       data-options="required:true,showSeconds:false,onChange:onIntervalSelected,formatter:toStr,parser:toDate"
                       style="width:200px">
            </td>
            <td>End Time:</td>
            <td>
                <input id="n_endtime" name="endtime" class="easyui-datetimebox"
                       data-options="required:true,showSeconds:false,onChange:onIntervalSelected,formatter:toStr,parser:toDate"
                       style="width:200px"
                >
            </td>
        </tr>
        <tr>
            <td>Interval Size:</td>
            <td>
                <select id="n_interval" class="easyui-combobox" data-options="onChange:onIntervalSelected"
                        style="width: 200px;">
                    <option value="0.5">0.5 h</option>
                    <option value="1.0">1.0 h</option>
                    <option value="2.0" selected>2.0 h</option>
                    <option value="4.0">4.0 h</option>
                </select>
            </td>
            <td>Time Slot:</td>
            <td>
                <select id="cc" class="easyui-combogrid" name="dept" style="width:200px;"
                        data-options="
			                panelWidth:450,
			                value:'006',
			                idField:'_id',
			                textField:'name',
			                columns:[[
			               		{field:'_id',title:'_id',width:40},
			                    {field:'begintime',title:'Begin Time',width:140},
			                    {field:'endtime',title:'End Time',width:140},
			                    {field:'interval',title:'interval',width:80}
			                ]]"></select>
            </td>
        </tr>
    </table>

    <table id="dg" class="easyui-datagrid" title="Time Slot Editing in DataGrid" style="width:720px;height:auto"
           data-options="
				iconCls: 'icon-edit',
				singleSelect: true,
				toolbar: '#tb',
				url: 'sysstatus/timeslotlist',
				method: 'get',
				onClickRow: onClickRow
			" rownumbers="true" pagination="true">
        <thead>
        <tr>
            <th data-options="field:'id',width:80">Slot ID</th>
            <th data-options="field:'begintime',width:130,editor:{type:'datetimebox',options:{showSeconds:false}}">Begin
                Time
            </th>
            <th data-options="field:'endtime',width:130,editor:{type:'datetimebox',options:{showSeconds:false}}">End
                Time
            </th>
            <th data-options="field:'note',width:220">End Time</th>
            <th data-options="field:'status',width:100,
						formatter:function(value,row){
							return value==0?'disabled':'normal';
						},editor:{type:'combobox',options:{data: slot_status}}">Status
            </th>
        </tr>
        </thead>
    </table>

    <div id="tb" style="height:auto">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"
           onclick="append()">Add User</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"
           onclick="removeit()">Remove User</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"
           onclick="edit()">Edit User</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true"
           onclick="accept()">Accept</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true"
           onclick="reject()">Reject</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-lock',plain:true"
           onclick="resetpwd()">Reset Password</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true"
           onclick="getChanges()">GetChanges</a>
    </div>
</div>
<script type="text/javascript">
    var newSlotArray = {total: 0, rows: []};

    function toStr(date) {
        return date.pattern("yyyy-MM-dd HH:mm:ss");
    }

    function toDate(str) {
        var s = str.split(/[\-\s:]/);
        if (s.length < 6) {
            return new Date();
        }
        for (i = 0; i < 6; i++) s[i] = Number(s[i]);
        s[1] = s[1] - 1;
        var d = new Date();
        d.setFullYear(s[0], s[1], s[2]);
        d.setHours(s[3], s[4], s[5], 0);
        return d;
    }

    function newslot() {
        $('#n_begintime').datetimebox('isValid');
    }

    function onIntervalSelected(newValue, oldValue) {
        var begin = $('#n_begintime').datetimebox('getValue');
        var end = $('#n_endtime').datetimebox('getValue');
        var array = new Array();
        try {
            begin = toDate(begin);
            end = toDate(end);
            var gap = end - begin;
            if (gap > 0) {
                var interval = $('#n_interval').combobox('getValue');
                interval = interval * 60 * 60 * 1000;
                var bt = new Date();
                var et = new Date();
                var i = 0;
                bt.setTime(begin.getTime());
                while (gap > 0) {
                    if (gap < interval) {
                        interval = gap;
                    }
                    et.setTime(bt.getTime() + interval);
                    array.push({
                        _id: i,
                        begintime: toStr(bt),
                        endtime: toStr(et),
                        interval: (interval / 60.0 / 60 / 1000)
                    });
                    bt.setTime(et.getTime());
                    gap -= interval;
                    i++;
                }

            }
        } catch (e) {
            console(e);
        }
        newSlotArray = {total: array.length, rows: array};
        $("#cc").combogrid({data: newSlotArray});
        console.log(newSlotArray);
    }

    var slot_status = [{"value": 0, "text": "disabled"}, {"value": 1, "text": "normal"}];

    var editIndex = undefined;
    var clickIndex = undefined;

    function endEditing() {
        if (editIndex == undefined) {
            return true
        }
        if ($('#dg').datagrid('validateRow', editIndex)) {
            //var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'productid'});
            //	var productname = $(ed.target).combobox('getText');
            //$('#dg').datagrid('getRows')[editIndex]['productname'] = productname;
            $('#dg').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }

    function onClickRow(index) {
        clickIndex = index;
        endEditing();
    }

    function append() {
        if (endEditing()) {
            $('#dg').datagrid('appendRow', {createtime: getDateStr(), status: '2', role: '1'});
            editIndex = $('#dg').datagrid('getRows').length - 1;
            $('#dg').datagrid('selectRow', editIndex)
                .datagrid('beginEdit', editIndex);
        }
    }

    function removeit() {
        if (editIndex == undefined) {
            return
        }
        $('#dg').datagrid('cancelEdit', editIndex)
            .datagrid('deleteRow', editIndex);
        editIndex = undefined;
    }

    function edit() {
        var index = clickIndex;
        if (editIndex != index) {
            if (endEditing()) {
                $('#dg').datagrid('selectRow', index)
                    .datagrid('beginEdit', index);
                editIndex = index;
            } else {
                $('#dg').datagrid('selectRow', editIndex);
            }
        }
    }

    function accept() {
        if (endEditing()) {
            var r = getChanges();
            r = JSON.stringify(r);
            $.post('user/changessubmit', {data: r}, function (json, status) {
                if (json.status == 'success') {
                    $('#dg').datagrid('acceptChanges');
                    $('#dg').datagrid('reload');
                } else {

                }
            });

        }
    }

    function reject() {
        $('#dg').datagrid('rejectChanges');
        editIndex = undefined;
    }

    function getChanges() {
        return $('#dg').datagrid('getChanges');
    }

    function resetpwd() {
        var index = clickIndex;
        var userid = $('#dg').datagrid('getRows')[index]['userid'];
        $.post('user/resetpassword', {userid: userid}, function (json, status) {
            if (json.status == 'success') {
                $('#dg').datagrid('reload');
            } else {
                toastr.error("Operation Status: " + json.status);
            }
        });
    }

    $(document).ready(function () {
        //$('#dg').datagrid('reload');\
    });
</script>
</body>
</html>