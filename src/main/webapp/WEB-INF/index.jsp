<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <img src="${pageContext.request.contextPath}/gentelella-1.4.0/production/images/img.jpg" alt="${pageContext.request.contextPath}/gentelella-1.4.0." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>${sessionScope.user.username}</h2>
              </div>
              <div class="clearfix"></div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <ul class="nav side-menu">
                  <c:forEach items="${permissions}" var="permission">
                    <li>
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
                      <ul class="nav child_menu">
                        <c:forEach items="${permission.value}" var="fun">
                          <li><a href="${fun.url}">${fun.permissionname}</a></li>
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
    
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/gentelella-1.4.0/build/js/custom.min.js"></script>
  </body>
</html>
