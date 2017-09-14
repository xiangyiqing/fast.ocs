$(function () {
    //参数设置，若用默认值可以省略以下面代
    toastr.options = {
        "closeButton": true, //是否显示关闭按钮
        "debug": false, //是否使用debug模式
        //"positionClass": "toast-top-full-width",//弹出窗的位置
        "showDuration": "300",//显示的动画时间
        "hideDuration": "300",//消失的动画时间
        "timeOut": "2000", //展现时间
        // "extendedTimeOut": "3000",//加长展示时间
        // "showEasing": "swing",//显示时的动画缓冲方式
        // "hideEasing": "linear",//消失时的动画缓冲方式
        // "showMethod": "fadeIn",//显示时的动画方式
        // "hideMethod": "fadeOut" //消失时的动画方式
    };
});

//Search box js
var srchArray = new Array();
var currentItem = -1;

function addSrchItem() {
    var row_html = '';
    $('#srch_row').children().each(function () {
        row_html += '<td>' + $(this).html() + '</td>';
    });

    currentItem++;
    row_html = '<tr id="srch_row_' + currentItem + '">' + row_html + '</tr>';
    $('#search_table').append(row_html);
    $('#srch_row_' + (currentItem - 1) + " .andorbtn").show();
    $('#srch_row_' + currentItem + ' select').selectpicker();
    srchArray.push($('#srch_row_' + currentItem));
}

function deleteSrchItem(arg) {
    var a = $(arg).parent().parent();
    if (a.next().length == 0) {
        var last_tr = a.prev();
        last_tr.find('.andorbtn').hide();
    }
    a.html('');
}

function clearSrchArray() {
    for (x in srchArray) {
        $(srchArray[x]).html('');
    }
    srchArray = new Array();
}

// search achieving
var globalSearchCond;

function achieveData(arg) {
    var andors = new Array();
    var types = new Array();
    var conds = new Array();
    var opts = new Array();
    $(arg + " select[name='andor']").each(function () {
        var a = $(this).val();
        andors.push(a);
    });
    $(arg + " select[name='type']").each(function () {
        var a = $(this).val();
        types.push(a);
    });
    $(arg + " input[name='cond']").each(function () {
        var a = $(this).val();
        conds.push(a);
    });
    $(arg + " select[name='opt']").each(function () {
        var a = $(this).val();
        opts.push(a);
    });
    //alert(andors.length+' '+nots.length+' '+types.length+' '+conds.length+' '+opts.length);
    var array = new Array();
    for (x in conds) {
        var t = {};
        t['andor'] = andors[x];
        t['type'] = types[x];
        t['cond'] = conds[x];
        t['opt'] = opts[x];
        array.push(t);
    }
    return JSON.stringify(array);

}

function addSearchStatus(arg) {
    $('#' + arg).show();
    var str = '<strong>Search filter : </strong>';
    var json = eval(globalSearchCond);
    for (i in json) {
        str += convertor((json[i])['type']) + ' '
        str += convertor((json[i])['opt']) + ' ';
        str += (json[i])['cond'] + ' ';
        if (i < json.length - 1) {
            str += convertor((json[i])['andor']) + ' ';
        }
    }
    $('#' + arg + '_content').html(str);
}

function convertor(arg) {
    switch (arg) {
        case "pid":
            return "Proposal Id";
        case "ptit":
            return "Proposal Title";
        case "ppor":
            return "Proposer";
        case "prate":
            return "Rate";
        case "mid":
            return "MSB Id";
        case "mtit":
            return "MSB Title";
        case "mrc":
            return "Repeat Counts";
        case "mws":
            return "Wind Speed";
        case "mhd":
            return "Humidity";
        case "mdn":
            return "Day or Night";
        case "mat":
            return "Airtemp";
        case "mop":
            return "Opacity";
        case "met":
            return "Estimated Time";
        case "oeq":
            return "=";
        case "olt":
            return "<";
        case "olq":
            return "<=";
        case "ogt":
            return ">";
        case "ogq":
            return ">=";
        case "onot":
            return "!=";
        case "olk":
            return "like";
        case "onlk":
            return "not like";
        case "and":
            return "and";
        case "or":
            return "or";
    }
    return null;
}

function getColor(status) {
    if (status == '0') {
        return '#AAA';
    } else if (status == '1') {
        //#32CD32
        return '#FF6200';
    } else if (status == '2') {
        return "#00B0F0";
    }
    return "#111";
}

function msbObservationStatus(arg) {
    switch (arg) {
        case "0":
            return "Observed";
        case "1":
            return "Observing";
        case "2":
            return "Unobserved";
    }
    return null;

}

Date.prototype.format = function (fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1,                 //月份
        "d+": this.getDate(),                    //日
        "h+": this.getHours(),                   //小时
        "m+": this.getMinutes(),                 //分
        "s+": this.getSeconds(),                 //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds()             //毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
/**
 * 对Date的扩展，将 Date 转化为指定格式的String
 * 月(M)、日(d)、12小时(h)、24小时(H)、分(m)、秒(s)、周(E)、季度(q) 可以用 1-2 个占位符
 * 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
 * java风格
 * eg:
 * (new Date()).pattern("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
 * (new Date()).pattern("yyyy-MM-dd E HH:mm:ss") ==> 2009-03-10 二 20:09:04
 * (new Date()).pattern("yyyy-MM-dd EE hh:mm:ss") ==> 2009-03-10 周二 08:09:04
 * (new Date()).pattern("yyyy-MM-dd EEE hh:mm:ss") ==> 2009-03-10 星期二 08:09:04
 * (new Date()).pattern("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18
 */
Date.prototype.pattern = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours() % 12 == 0 ? 12 : this.getHours() % 12, //小时
        "H+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    var week = {
        "0": "/u65e5",
        "1": "/u4e00",
        "2": "/u4e8c",
        "3": "/u4e09",
        "4": "/u56db",
        "5": "/u4e94",
        "6": "/u516d"
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    if (/(E+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "/u661f/u671f" : "/u5468") : "") + week[this.getDay() + ""]);
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
}

/**
 * convert timestamp to string with the format of yyyy-M-d h:m:s
 * @param arg
 * @returns {String}
 */
function toDateStr(arg) {
    var d = new Date(arg.time);
    return d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
}

function getDateStr(arg) {
    if (arg !== undefined) {
        return arg.pattern("yyyy-MM-dd HH:mm:ss");
    } else {
        return (new Date()).format("yyyy-MM-dd hh:mm:ss");
    }
}


function autoSchedule() {
    $.post('msb/autoSchedule', {}, function (json, status) {
        if (json.status == 'success') {
            toastr.info("MSB Auto Schedule Status: " + json.status);
            toastr.info("Refreshing page ...");
            setTimeout(function () {
                location.reload(true);
            }, 3000);
        } else {
            toastr.error("MSB Auto Schedule Status: " + json.status);
        }

    });
}

function handleJSONResponse(json) {
    if (json.status == 'success') {
        toastr.info("Operation Status: " + json.status);
        return json.content;
    } else {
        toastr.error("Operation Status: " + json.status);
        return {};
    }
}

function bool(str) {
    str = $.trim(str);
    return str == '1' || str == 'true' || str == true;
}

function setBool(arg) {
    return arg ? '1' : '0';
}