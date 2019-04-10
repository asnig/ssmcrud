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
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--表格--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th><input type="checkbox"></th>
                    <th>id</th>
                    <th>lastName</th>
                    <th>email</th>
                    <th>gender</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>${emp.empId}</td>
                        <td>${emp.epmName}</td>
                        <td>${emp.email}</td>
                        <td>${emp.gender=="M"?"男":"女"}</td>
                        <td>${emp.department.deptName}</td>
                        <td>
                            <button class="btn btn-primary">编辑</button>
                            <button class="btn btn-danger">删除</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%--分页样式--%>
    <div class="row">
        <div class="col-md-6">
            当前${pageInfo.pageNum}页,共${pageInfo.pages}页.一共${pageInfo.total}条记录
        </div>
        <div class="col-md-6 text-center">
            <nav>
                <ul class="pagination">
                    <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!pageInfo.hasPreviousPage}">
                        <li class="disabled">
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="pn">
                        <c:if test="${pn==pageInfo.pageNum}">
                            <li class="active"><a href="${APP_PATH}/emps?pn=${pn}">${pn}</a></li>
                        </c:if>
                        <c:if test="${pn!=pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/emps?pn=${pn}">${pn}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!pageInfo.hasNextPage}">
                        <li class="disabled">
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">尾页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {

    })

    function pageQuery(pn) {
        $.ajax({
            type: "POST",
            url: "/ajaxEmps",
            date: {"pageNo": pn},
            success: function (result) {

            }
        })
        // alert(pn);

    }
</script>
</body>
</html>

