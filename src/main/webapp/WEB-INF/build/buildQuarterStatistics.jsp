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
                  <c:when test="${permission.key.permissionname == '楼盘管理'}">
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
                    <c:when test="${permission.key.permissionname == '楼盘管理'}">
                    <ul class="nav child_menu" style="display: block;">
                      </c:when>
                      <c:otherwise>
                      <ul class="nav child_menu">
                        </c:otherwise>
                        </c:choose>
                        <c:forEach items="${permission.value}" var="fun">
                          <c:choose>
                            <c:when test="${fun.permissionname == '楼盘统计'}">
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
            <div class="page-title">
              <div class="title_left">
                <h3>&nbsp;${buildName}</h3>
                <br/>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>售房统计</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li style="float: right;"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div id="sell" style="height:350px;"></div>

                  </div>
                </div>
              </div>
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>出租统计</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li style="float: right;"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div id="lease" style="height:350px;"></div>

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
    <!-- ECharts -->
    <script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/echarts/dist/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath}/gentelella-1.4.0/vendors/echarts/map/js/world.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/gentelella-1.4.0/build/js/custom.min.js"></script>

    <script>
      $(document).ready(function () {
        init_echarts();
      });

      function init_echarts() {
        var theme = {
          color: [
            '#26B99A', '#34495E', '#BDC3C7', '#3498DB',
            '#9B59B6', '#8abb6f', '#759c6a', '#bfd3b7'
          ],

          title: {
            itemGap: 8,
            textStyle: {
              fontWeight: 'normal',
              color: '#408829'
            }
          },

          dataRange: {
            color: ['#1f610a', '#97b58d']
          },

          toolbox: {
            color: ['#408829', '#408829', '#408829', '#408829']
          },

          tooltip: {
            backgroundColor: 'rgba(0,0,0,0.5)',
            axisPointer: {
              type: 'line',
              lineStyle: {
                color: '#408829',
                type: 'dashed'
              },
              crossStyle: {
                color: '#408829'
              },
              shadowStyle: {
                color: 'rgba(200,200,200,0.3)'
              }
            }
          },

          dataZoom: {
            dataBackgroundColor: '#eee',
            fillerColor: 'rgba(64,136,41,0.2)',
            handleColor: '#408829'
          },
          grid: {
            borderWidth: 0
          },

          categoryAxis: {
            axisLine: {
              lineStyle: {
                color: '#408829'
              }
            },
            splitLine: {
              lineStyle: {
                color: ['#eee']
              }
            }
          },

          valueAxis: {
            axisLine: {
              lineStyle: {
                color: '#408829'
              }
            },
            splitArea: {
              show: true,
              areaStyle: {
                color: ['rgba(250,250,250,0.1)', 'rgba(200,200,200,0.1)']
              }
            },
            splitLine: {
              lineStyle: {
                color: ['#eee']
              }
            }
          },
          timeline: {
            lineStyle: {
              color: '#408829'
            },
            controlStyle: {
              normal: {color: '#408829'},
              emphasis: {color: '#408829'}
            }
          },

          k: {
            itemStyle: {
              normal: {
                color: '#68a54a',
                color0: '#a9cba2',
                lineStyle: {
                  width: 1,
                  color: '#408829',
                  color0: '#86b379'
                }
              }
            }
          },
          map: {
            itemStyle: {
              normal: {
                areaStyle: {
                  color: '#ddd'
                },
                label: {
                  textStyle: {
                    color: '#c12e34'
                  }
                }
              },
              emphasis: {
                areaStyle: {
                  color: '#99d2dd'
                },
                label: {
                  textStyle: {
                    color: '#c12e34'
                  }
                }
              }
            }
          },
          force: {
            itemStyle: {
              normal: {
                linkStyle: {
                  strokeColor: '#408829'
                }
              }
            }
          },
          chord: {
            padding: 4,
            itemStyle: {
              normal: {
                lineStyle: {
                  width: 1,
                  color: 'rgba(128, 128, 128, 0.5)'
                },
                chordStyle: {
                  lineStyle: {
                    width: 1,
                    color: 'rgba(128, 128, 128, 0.5)'
                  }
                }
              },
              emphasis: {
                lineStyle: {
                  width: 1,
                  color: 'rgba(128, 128, 128, 0.5)'
                },
                chordStyle: {
                  lineStyle: {
                    width: 1,
                    color: 'rgba(128, 128, 128, 0.5)'
                  }
                }
              }
            }
          },
          gauge: {
            startAngle: 225,
            endAngle: -45,
            axisLine: {
              show: true,
              lineStyle: {
                color: [[0.2, '#86b379'], [0.8, '#68a54a'], [1, '#408829']],
                width: 8
              }
            },
            axisTick: {
              splitNumber: 10,
              length: 12,
              lineStyle: {
                color: 'auto'
              }
            },
            axisLabel: {
              textStyle: {
                color: 'auto'
              }
            },
            splitLine: {
              length: 18,
              lineStyle: {
                color: 'auto'
              }
            },
            pointer: {
              length: '90%',
              color: 'auto'
            },
            title: {
              textStyle: {
                color: '#333'
              }
            },
            detail: {
              textStyle: {
                color: 'auto'
              }
            }
          },
          textStyle: {
            fontFamily: 'Arial, Verdana, sans-serif'
          }
        };

        if ($('#sell').length) {

          var sell = echarts.init(document.getElementById('sell'), theme);

          // 装配数据
          var sellQuarter = [];
          var totalSales = [];
          <c:forEach items="${sellQuarter}" var="item">
          sellQuarter.push("第" + "${item}" + "季度");
          </c:forEach>
          <c:forEach items="${totalSales}" var="item" varStatus="statu">
          var quarter = {};
          quarter.value = "${item}";
          quarter.name = sellQuarter[${statu.index}];
          totalSales.push(quarter);
          </c:forEach>
          console.log(sellQuarter);
          console.log(totalSales);

          sell.setOption({
            title: {
              text: '季度销售数量统计'
            },
            tooltip: {
              trigger: 'item',
              formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
              x: 'center',
              y: 'bottom',
              data: sellQuarter
            },
            toolbox: {
              show: true,
              feature: {
                magicType: {
                  show: true,
                  type: ['pie', 'funnel'],
                  option: {
                    funnel: {
                      x: '25%',
                      width: '50%',
                      funnelAlign: 'left',
                      max: 1548
                    }
                  }
                },
                restore: {
                  show: true,
                  title: "重置"
                },
                saveAsImage: {
                  show: true,
                  title: "保存图片"
                }
              }
            },
            calculable: true,
            series: [{
              name: '销量(户/季度)',
              type: 'pie',
              radius: '55%',
              center: ['50%', '48%'],
              data: totalSales
            }]
          });

        }

        if ($('#lease').length) {

          var lease = echarts.init(document.getElementById('lease'), theme);

          // 装配数据
          var leaseQuarter = [];
          var totalLeases = [];
          <c:forEach items="${leaseQuarter}" var="item">
          leaseQuarter.push("第" + "${item}" + "季度");
          </c:forEach>
          <c:forEach items="${totalLeases}" var="item" varStatus="statu">
          var quarter = {};
          quarter.value = "${item}";
          quarter.name = leaseQuarter[${statu.index}];
          totalLeases.push(quarter);
          </c:forEach>

          lease.setOption({
            title: {
              text: '季度出租数量统计'
            },
            tooltip: {
              trigger: 'item',
              formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
              x: 'center',
              y: 'bottom',
              data: leaseQuarter
            },
            toolbox: {
              show: true,
              feature: {
                magicType: {
                  show: true,
                  type: ['pie', 'funnel'],
                  option: {
                    funnel: {
                      x: '25%',
                      width: '50%',
                      funnelAlign: 'left',
                      max: 1548
                    }
                  }
                },
                restore: {
                  show: true,
                  title: "重置"
                },
                saveAsImage: {
                  show: true,
                  title: "保存图片"
                }
              }
            },
            calculable: true,
            series: [{
              name: '出租量(户/季度)',
              type: 'pie',
              radius: '55%',
              center: ['50%', '48%'],
              data: totalLeases
            }]
          });

        }

      }

    </script>
  </body>
</html>