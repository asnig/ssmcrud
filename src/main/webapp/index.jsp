<%--
  Created by IntelliJ IDEA.
  User: 10727
  Date: 2019/4/6
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    session.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户信息展示</title>
    <script src="${APP_PATH}/static/jquery/jquery-3.3.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--两个按钮--%>
    <div class="row" style="margin-bottom:15px;">
        <div class="col-md-4 col-md-offset-8" style="padding-left: 112px;">
            <button class="btn btn-primary" id="add_emp_btn">新增</button>
            <!-- 添加用户的模态框 -->
            <div class="modal fade" id="add_emp_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">新增员工</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">员工名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="epmName" class="form-control" id="empName_input"
                                               placeholder="员工名">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">电子邮箱</label>
                                    <div class="col-sm-10">
                                        <input type="email" name="email" class="form-control" id="email_input"
                                               placeholder="name@qq.com">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-10">
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" id="gender1" value="M" checked="checked">
                                            男
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" id="gender2" value="F"> 女
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">部门名称</label>
                                    <div class="col-sm-4">
                                        <select class="form-control" name="dId"></select>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="save_btn">保存</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 修改用户的模态框 -->
            <div class="modal fade" id="update_emp_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">修改员工</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">员工名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="epmName" class="form-control" id="update_empName_input"
                                               placeholder="员工名">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">电子邮箱</label>
                                    <div class="col-sm-10">
                                        <input type="email" name="email" class="form-control" id="update_email_input"
                                               placeholder="name@qq.com">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-10">
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" id="update_gender1" value="M"
                                                   checked="checked">
                                            男
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" id="update_gender2" value="F"> 女
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">部门名称</label>
                                    <div class="col-sm-4">
                                        <select class="form-control" name="dId"></select>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="update_btn">更新</button>
                        </div>
                    </div>
                </div>
            </div>
            <button class="btn btn-danger" id="deletes_btn">删除</button>
        </div>
    </div>
    <%--表格--%>
    <div class="row">
        <div class="col-md-12">
            <form id="emp_data">
                <table class="table table-hover" id="emps_table">
                    <thead>
                    <tr>
                        <th><input id="selAllBox" type="checkbox"></th>
                        <th>id</th>
                        <th>用户名</th>
                        <th>邮箱</th>
                        <th>性别</th>
                        <th>部门名称</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </form>
        </div>
    </div>
    <%--分页样式--%>
    <div class="row">
        <div class="col-md-6" id="page_info"></div>
        <div class="col-md-6 text-center" id="page_nav">
            <nav>
                <ul class="pagination">
                </ul>
            </nav>
        </div>
    </div>
    <!-- 点击删除按钮弹出的模态框 -->
    <div class="modal fade" id="delete_modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示框</h4>
                </div>
                <div class="modal-body">
                    <p style="font-size: 25px;" class="text-center">确认删除？</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="delete_modal_ok_btn">确认</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>
<script>
    var totalRecord, currentPage;
    $(function () {
        pageQuery(1);
        /*客户名表单 ajax校验*/
        $("#empName_input").change(function () {
            var epmName = $("#empName_input").val();
            $.ajax({
                type: "GET",
                url: "${APP_PATH}/checkUse",
                data: {"epmName": epmName},
                success: function (result) {
                    if ("200" === result.code) {
                        show_validate_msg("#empName_input", "error", result.datas.val_msg);
                        $("#save_btn").attr("ajax-val", "error");
                    } else {
                        show_validate_msg("#empName_input", "success", "用户名可用");
                        $("#save_btn").attr("ajax-val", "success");
                    }
                }
            });
        });
        $("#update_empName_input").change(function () {
            var epmName = $("#update_empName_input").val();
            $.ajax({
                type: "GET",
                url: "${APP_PATH}/checkUse",
                data: {"epmName": epmName},
                success: function (result) {
                    if ("200" === result.code) {
                        show_validate_msg("#update_empName_input", "error", result.datas.val_msg);
                        $("#save_btn").attr("ajax-val", "error");
                    } else {
                        show_validate_msg("#update_empName_input", "success", "用户名可用");
                        $("#save_btn").attr("ajax-val", "success");
                    }
                }
            });
        });
        /*点击保存，保存用户*/
        $("#save_btn").click(function () {
            /*表单验证*/
            var empName = $("#empName_input").val();
            var nameReg = /^\w{6,15}$|^[\u4e00-\u9fa5]{2,6}$/;
            if (!nameReg.test(empName)) {
                show_validate_msg("#empName_input", "error", "用户名格式不正确！6-15位数字字母下划线或者2-6位中文");
                return false;
            } else {
                show_validate_msg("#empName_input", "success", "");
            }
            var email = $("#email_input").val();
            var emailReg = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
            if (!emailReg.test(email)) {
                show_validate_msg("#email_input", "error", "邮箱格式错误！");
                return false;
            } else {
                show_validate_msg("#email_input", "success", "");
            }

            /*校验表单是否完全验证成功*/
            if ($(this).attr("ajax-val") === "error") {
                return false;
            }

            $.ajax({
                type: "POST",
                url: "${APP_PATH}/emps",
                data: $("#add_emp_modal form").serialize(),
                success: function (result) {
                    if ("100" === result.code) {
                        $("#add_emp_modal").modal('hide');
                        pageQuery(totalRecord)
                    } else {
                        alert(result.datas.errorMap);
                    }
                }
            });
        });
        /*给更新按钮绑定事件*/
        $("#update_btn").click(function () {
            /*表单验证*/
            var empName = $("#update_empName_input").val();
            var nameReg = /^\w{6,15}$|^[\u4e00-\u9fa5]{2,6}$/;
            if (!nameReg.test(empName)) {
                show_validate_msg("#update_empName_input", "error", "用户名格式不正确！6-15位数字字母下划线或者2-6位中文");
                return false;
            } else {
                show_validate_msg("#update_empName_input", "success", "");
            }
            var email = $("#update_email_input").val();
            var emailReg = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
            if (!emailReg.test(email)) {
                show_validate_msg("#update_email_input", "error", "邮箱格式错误！");
                return false;
            } else {
                show_validate_msg("#update_email_input", "success", "");
            }

            /*校验表单是否完全验证成功*/
            if ($(this).attr("ajax-val") === "error") {
                return false;
            }

            $.ajax({
                type: "PUT",
                url: "${APP_PATH}/emps/" + $("#update_btn").attr("update-id"),
                data: $("#update_emp_modal form").serialize(),
                success: function (result) {
                    if ("100" === result.code) {
                        $("#update_emp_modal").modal('hide');
                        pageQuery(currentPage);
                    } else {
                        alert(result.datas.errorMap);
                    }
                }
            });
        });
        /*点击新增按钮弹出模态框*/
        $("#add_emp_btn").click(function () {
            reset_form("#add_emp_modal form");
            getDepts("#add_emp_modal select");
            $("#add_emp_modal").modal({
                backdrop: "static"
            })
        });
        /*给删除模态框的确认按钮绑定事件*/
        $("#delete_modal_ok_btn").click(function () {
            $.ajax({
                type: "DELETE",
                url: "${APP_PATH}/emps/" + $(this).attr("delete-id"),
                success: function (result) {
                    if ("100" === result.code) {
                        $('#delete_modal').modal('hide');
                        pageQuery(currentPage);
                    }
                }
            })
        })
        $("#selAllBox").click(function () {
            $("#emps_table :checkbox").prop("checked", $("#selAllBox").prop("checked"));
        });
        $("#deletes_btn").click(function () {
            var boxes = $("#emps_table tbody input:checkbox:checked");
            var empIds = [];
            boxes.each(function (index, box) {
                empIds.push(box.value);
            });
            $.ajax({
                type: "DELETE",
                url: "${APP_PATH}/emps",
                data: {"empIds": empIds.toString()},
                success: function (result) {
                    if ("100" === result.code) {
                        alert("删除成功");
                        pageQuery(currentPage);
                    } else {
                        alert("删除失败")
                    }
                }
            })
        })
    });

    function reset_form(ele) {
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    function show_validate_msg(ele, status, msg) {
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" === status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/depts",
            success: function (result) {
                var depts = result.datas.depts;
                $.each(depts, function () {
                    var opt = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    opt.appendTo($(ele));
                });
            }
        });
    }

    function getEmp(id) {
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/emps/" + id,
            success: function (result) {
                $("#update_empName_input").val(result.datas.emp.epmName);
                $("#update_email_input").val(result.datas.emp.email);
                $("#update_emp_modal input[name=gender]").val([result.datas.emp.gender]);
                $("#update_emp_modal select").val([result.datas.emp.dId]);
            }
        });
    }

    function pageQuery(pn) {
        $("#selAllBox")[0].checked = false;
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/emps",
            data: "pageNo=" + pn,
            success: function (result) {
                build_tbody(result);
                build_page_nav(result);
                build_page_info(result);
                totalRecord = result.datas.pageInfo.total;
                currentPage = result.datas.pageInfo.pageNum;
            }
        })
    }

    function build_tbody(result) {
        var emps = result.datas.pageInfo.list;
        var datasContent = "";
        $.each(emps, function (index, item) {
            datasContent += '<tr>';
            datasContent += '	<td><input type="checkbox" name="empId" value="' + item.empId + '""/></td>';
            datasContent += '	<td>' + item.empId + '</td>';
            datasContent += '	<td>' + item.epmName + '</td>';
            datasContent += '	<td>' + item.email + '</td>';
            datasContent += '	<td>' + (item.gender === "M" ? "男" : "女") + '</td>';
            datasContent += '   <td>' + item.department.deptName + '</td>';
            datasContent += '	<td>';
            datasContent += '		<button class="btn btn-primary edit_btn" edit-id="' + item.empId + '"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 编辑</button>';
            datasContent += '		<button class="btn btn-danger delete_btn" delete-id="' + item.empId + '"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除</button>';
            datasContent += '	</td>';
            datasContent += '</tr>';
        });
        $("#emps_table tbody").html(datasContent);
    }

    function build_page_info(result) {
        var pageNum = result.datas.pageInfo.pageNum;
        var pages = result.datas.pageInfo.pages;
        var total = result.datas.pageInfo.total;
        $("#page_info").html('<p>当前第' + pageNum + '页，共' + pages + '页，总记录数' + total + '</p>');
    }

    function build_page_nav(result) {
        var pageNavContent = "";

        /*首页*/
        if (!result.datas.pageInfo.isFirstPage) {
            pageNavContent += '<li><a href="#" onclick="pageQuery(1)"><span aria-hidden="true">首页</span></a></li>';
        } else {
            pageNavContent += '<li class="disabled"><a href="#"><span aria-hidden="true">首页</span></a></li>';
        }

        /*上一页*/
        if (result.datas.pageInfo.hasPreviousPage) {
            pageNavContent += '<li><a href="#" aria-label="Previous" onclick="pageQuery(' + (result.datas.pageInfo.pageNum - 1) + ')"><span aria-hidden="true">&laquo;</span></a></li>';
        } else {
            pageNavContent += '<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
        }

        /*页码展示*/
        $.each(result.datas.pageInfo.navigatepageNums, function (index, item) {
            if (result.datas.pageInfo.pageNum === item) {
                pageNavContent += '<li class="active"><a href="#" onclick="pageQuery(' + item + ')">' + item + '</a></li>';
            } else {
                pageNavContent += '<li><a href="#" onclick="pageQuery(' + item + ')">' + item + '</a></li>';
            }
        });

        /*下一页*/
        if (result.datas.pageInfo.hasNextPage) {
            pageNavContent += '<li><a href="#" aria-label="Next" onclick="pageQuery(' + (result.datas.pageInfo.pageNum + 1) + ')"><span aria-hidden="true">&raquo;</span></a></li>';
        } else {
            pageNavContent += '<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li>';
        }

        /*尾页*/
        if (!result.datas.pageInfo.isLastPage) {
            pageNavContent += '<li><a href="#" onclick="pageQuery(' + result.datas.pageInfo.pages + ')"><span aria-hidden="true">尾页</span></a></li>';
        } else {
            pageNavContent += '<li class="disabled"><a href="#"><span aria-hidden="true">尾页</span></a></li>';
        }
        $(".pagination").html(pageNavContent);
    }

    /*给编辑按钮绑定事件*/
    $(document).on("click", ".edit_btn", function () {
        reset_form("#update_emp_modal form");
        getDepts("#update_emp_modal select");
        getEmp($(this).attr("edit-id"));
        $("#update_emp_modal").modal({
            backdrop: "static"
        });
        $("#update_btn").attr("update-id", $(this).attr("edit-id"));
    });
    /*给删除按钮绑定事件*/
    $(document).on("click", ".delete_btn", function () {
        $("#delete_modal_ok_btn").attr("delete-id", $(this).attr("delete-id"));
        $("#delete_modal").modal({
            backdrop: "static"
        });
    });
    $(document).on("click", "#emps_table :checkbox", function () {
        var flag = $("#emps_table tbody :checkbox:checked").length === $("#emps_table tbody :checkbox").length;
        $("#selAllBox").prop("checked", flag);
    })

</script>
</body>
</html>

