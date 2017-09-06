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
    <table id="dg" class="easyui-datagrid" title="User Editing in DataGrid" style="width:720px;height:auto"
           data-options="
				iconCls: 'icon-edit',
				singleSelect: true,
				toolbar: '#tb',
				url: 'user/userlist',
				method: 'get',
				onClickRow: onClickRow
			" rownumbers="true" pagination="true">
        <thead>
        <tr>
            <th data-options="field:'userid',width:80">User ID</th>
            <th data-options="field:'username',width:100,editor:{type:'validatebox',options:{required:true,validType:['email','length[0,20]']}}">
                User Name
            </th>
            <th data-options="field:'createtime',width:120">Create Time</th>
            <th data-options="field:'lastlogintime',width:120">Last Login Time</th>
            <th data-options="field:'status',width:100,
						formatter:function(value,row){
							return value==0?'disabled':(value==1?'normal':'pwd changing');
						},editor:{type:'combobox',options:{data: user_status}}">Status
            </th>
            <th data-options="field:'role',width:100,formatter:function(value,row){
							return value==0?'admin':'operator';
						},editor:{type:'combobox',options:{data: user_role}}">Role
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
    var user_status = [{"value": 0, "text": "disabled"}, {"value": 1, "text": "normal"}, {
        "value": 2,
        "text": "pwd changing"
    }];
    var user_role = [{"value": 0, "text": "admin"}, {"value": 1, "text": "operator"}];
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
        //$('#dg').datagrid('reload');
    });
</script>
</body>
</html>