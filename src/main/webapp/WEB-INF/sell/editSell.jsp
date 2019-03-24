<%--
  Created by IntelliJ IDEA.
  User: 曾佳
  Date: 2019/3/6
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>地产项目管控平台</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/starrr/dist/starrr.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/gentelella-1.4.0/build/css/custom.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/myCss.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="/index" class="site_title"><i class="fa fa-paw"></i> <span>地产项目管控平台</span></a>
                </div>

                <div class="clearfix"></div>

                <!-- menu profile quick info -->
                <div class="profile clearfix">
                    <div class="profile_pic">
                        <img src="${pageContext.request.contextPath}/gentelella-1.4.0/production/images/img.jpg" alt="..." class="img-circle profile_img">
                    </div>
                    <div class="profile_info">
                        <span>Welcome,</span>
                        <h2>${sessionScope.user.username}</h2>
                    </div>
                </div>
                <!-- /menu profile quick info -->

                <br />

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <ul class="nav side-menu">
                            <c:forEach items="${permissions}" var="permission">
                            <c:choose>
                            <c:when test="${permission.key.permissionname == '售房管理'}">
                            <li class="active">
                                </c:when>
                                <c:otherwise>
                            <li>
                                </c:otherwise>
                                </c:choose>
                                <a>
                                    <c:choose>
                                        <c:when test="${permission.key.permissionname == '用户管理'}">
                                            <i class="fa fa-user"></i>
                                        </c:when>
                                        <c:when test="${permission.key.permissionname == '客户管理'}">
                                            <i class="fa fa-users"></i>
                                        </c:when>
                                        <c:when test="${permission.key.permissionname == '楼盘管理'}">
                                            <i class="fa fa-building"></i>
                                        </c:when>
                                        <c:when test="${permission.key.permissionname == '售房管理'}">
                                            <i class="fa fa-building-o"></i>
                                        </c:when>
                                        <c:when test="${permission.key.permissionname == '出租管理'}">
                                            <i class="fa fa-book"></i>
                                        </c:when>
                                    </c:choose>
                                        ${permission.key.permissionname}
                                    <span class="fa fa-chevron-down"></span>
                                </a>
                                <c:choose>
                                <c:when test="${permission.key.permissionname == '售房管理'}">
                                <ul class="nav child_menu" style="display: block;">
                                    </c:when>
                                    <c:otherwise>
                                    <ul class="nav child_menu">
                                        </c:otherwise>
                                        </c:choose>
                                        <c:forEach items="${permission.value}" var="fun">
                                            <c:choose>
                                                <c:when test="${fun.permissionname == '查看售房'}">
                                                    <li class="current-page"><a href="${fun.url}">${fun.permissionname}</a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li><a href="${fun.url}">${fun.permissionname}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </ul>
                                    </li>
                                    </c:forEach>
                                </ul>
                    </div>

                </div>
                <!-- /sidebar menu -->

                <!-- /menu footer buttons -->
                <div class="sidebar-footer hidden-small">
                    <a data-toggle="tooltip" data-placement="top" title="Settings">
                        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                        <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="Lock">
                        <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="Logout" href="/logout">
                        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                    </a>
                </div>
                <!-- /menu footer buttons -->
            </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <nav>
                    <div class="nav toggle">
                        <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                    </div>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="">
                            <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <img src="${pageContext.request.contextPath}/gentelella-1.4.0/production/images/img.jpg" alt="">${sessionScope.user.username}
                                <span class=" fa fa-angle-down"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-usermenu pull-right">
                                <li><a href="javascript:;"> Profile</a></li>
                                <li>
                                    <a href="javascript:;">
                                        <span class="badge bg-red pull-right">50%</span>
                                        <span>Settings</span>
                                    </a>
                                </li>
                                <li><a href="javascript:;">Help</a></li>
                                <li><a href="/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>修改售房 <small>Modify Sell</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li style="float: right;"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <br />
                                <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="/sell/saveSell">
                                    <input type="hidden" name="type" value="edit"/>
                                    <input type="hidden" name="id" value="${sell.id}">
                                    <input type="hidden" id="buildname" name="buildname" value="${sell.buildname}">
                                    <input type="hidden" id="customername" name="customername" value="${sell.customername}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">楼盘名 <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <select id="buildid" name="buildid" class="select2_single form-control" tabindex="-1">
                                                <option>选择楼盘</option>
                                                <c:forEach items="${builds}" var="build">
                                                    <c:choose>
                                                        <c:when test="${sell.buildid == build.id}">
                                                            <option value="${build.id}" selected="selected">${build.buildname}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${build.id}">${build.buildname}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="location">地址 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" name="location" value="${sell.location}" id="location" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="price">售价(元) <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" name="price" value="${sell.price}" id="price" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">客户名 <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <select id="customerid" name="customerid" class="select2_single form-control" tabindex="-1">
                                                <option>选择客户</option>
                                                <c:forEach items="${customers}" var="customer">
                                                    <c:choose>
                                                        <c:when test="${sell.customerid == customer.id}">
                                                            <option value="${customer.id}" selected="selected">${customer.customername}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${customer.id}">${customer.customername}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone">联系电话 <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" name="phone" value="${sell.phone}" id="phone" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">状态 <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" name="status" value="${sell.status}" id="status" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="selltype">销售方式 <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" name="selltype" value="${sell.selltype}" id="selltype" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="datetimepicker">销售日期 <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="datetimepicker" value="<fmt:formatDate value="${sell.date}" pattern="yyyy-MM-dd HH:mm:ss"/>" name="date" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>

                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button class="btn btn-primary" type="reset">重置</button>
                                            <button type="submit" class="btn btn-success">确认</button>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <!-- /page content -->

    </div>
</div>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/nprogress/nprogress.js"></script>
<!-- bootstrap-progressbar -->
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/iCheck/icheck.min.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap-wysiwyg -->
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/google-code-prettify/src/prettify.js"></script>
<!-- jQuery Tags Input -->
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
<!-- Switchery -->
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/switchery/dist/switchery.min.js"></script>
<!-- Select2 -->
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/select2/dist/js/select2.full.min.js"></script>
<!-- Parsley -->
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/parsleyjs/dist/parsley.min.js"></script>
<!-- Autosize -->
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/autosize/dist/autosize.min.js"></script>
<!-- jQuery autocomplete -->
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
<!-- starrr -->
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/starrr/dist/starrr.js"></script>
<!-- Custom Theme Scripts -->
<script src="${pageContext.request.contextPath}/gentelella-1.4.0/build/js/custom.min.js"></script>
<!-- jQuery-daterangepicker -->
<script src="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/static/datetimepicker/build/jquery.datetimepicker.full.js"></script>
<script src="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.js"></script>

<script>
    $("#buildid").change(function () {
        $("#buildname").val($("#buildid").find("option:selected").text());
    });

    $("#customerid").change(function () {
        $("#customername").val($("#customerid").find("option:selected").text());
    });

    $('#datetimepicker').datetimepicker({
        lang: 'ch', //设置中文
        format:"Y-m-d H:i:s" //格式化日期
    });
</script>
</body>
</html>

