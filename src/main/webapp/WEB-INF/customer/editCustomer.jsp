<%--
  Created by IntelliJ IDEA.
  User: 曾佳
  Date: 2019/3/6
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <c:when test="${permission.key.permissionname == '客户管理'}">
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
                                <c:when test="${permission.key.permissionname == '客户管理'}">
                                <ul class="nav child_menu" style="display: block;">
                                    </c:when>
                                    <c:otherwise>
                                    <ul class="nav child_menu">
                                        </c:otherwise>
                                        </c:choose>
                                        <c:forEach items="${permission.value}" var="fun">
                                            <c:choose>
                                                <c:when test="${fun.permissionname == '查看客户'}">
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
                                <h2>修改客户 <small>Modify Customer</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li style="float: right;"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <br />
                                <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="/customer/saveCustomer">
                                    <input type="hidden" name="id" value="${customer.id}"/>
                                    <input type="hidden" name="type" value="edit"/>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="customername">客户姓名 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" name="customername" value="${customer.customername}" id="customername" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">邮箱 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" name="email" value="${customer.email}" id="email" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone" >联系电话 <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" name="phone" value="${customer.phone}" id="phone" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">性别 </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div id="gender" class="btn-group" data-toggle="buttons">
                                                <label id="male" class="${customer.sex == 1 ? 'btn btn-primary' : 'btn btn-default'}" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                    <input type="radio" name="sex" value="1" checked="${customer.sex == 1 ? 'checked' : ''}"> &nbsp; 男 &nbsp;
                                                </label>
                                                <label id="female" class="${customer.sex == 0 ? 'btn btn-primary' : 'btn btn-default'}" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                    <input type="radio" name="sex" value="0" checked="${customer.sex == 0 ? 'checked' : ''}"> &nbsp; 女 &nbsp;
                                                </label>
                                            </div>
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

<script>
    $("#male").click(function () {
        $("#male").addClass("btn-primary");
        $("#male").removeClass("btn-default");
        $("#female").addClass("btn-default");
        $("#female").removeClass("btn-primary");
    });
    $("#female").click(function () {
        $("#male").addClass("btn-default");
        $("#male").removeClass("btn-primary");
        $("#female").addClass("btn-primary");
        $("#female").removeClass("btn-default");
    });
</script>

</body>
</html>

