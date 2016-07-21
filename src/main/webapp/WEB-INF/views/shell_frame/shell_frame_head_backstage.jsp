<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!--
这是主框架.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <base href="<%=basePath%>">
  <title>中国科学院 | 模式与特色动物实验平台</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="resources/plugins/bootstrap-3.3.5/css/bootstrap.css">
  <!-- Font Awesome -->  
  <link rel="stylesheet" href="http://apps.bdimg.com/libs/fontawesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap-glyphicons/1.0/css/bootstrap-glyphicons.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/plugins/AdminLTE/css/AdminLTE.css">  
  <!-- Responsive tables -->
  <link rel="stylesheet" href="resources/plugins/Responsive-tables/css/rwd-table.css">  
  <link rel="stylesheet" href="resources/plugins/AdminLTE/css/skins/skin-cas-backstage.css">
  <!-- 我自己的CSS -->
  <link rel="stylesheet" href="resources/css/wts_home_style.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-cas sidebar-mini">
  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="new" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><img src="resources/img/logo_cas_mini.png" width="80%" height="80%" alt="Logo Image"></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><img src="resources/img/logo_cas_big.png" width="auto" height="40px" alt="Logo Image"></span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      	
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <!-- Tasks Menu -->
          <li class="dropdown tasks-menu">

            <ul class="dropdown-menu">

              <li>
                <!-- Inner menu: contains the tasks -->
                <ul class="menu">
                  <li><!-- Task item -->
                    <a href="#">
                      <!-- Task title and progress text -->
                      <h3>
                        Design some buttons
                        <small class="pull-right">20%</small>
                      </h3>
                      <!-- The progress bar -->
                      <div class="progress xs">
                        <!-- Change the css width attribute to simulate progress -->
                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                </ul>
              </li>
              <li class="footer">
                <a href="#">View all tasks</a>
              </li>
            </ul>
          </li>
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
          	<c:if test="${pageContext.request.userPrincipal.name == null}">
	            <!-- 右上角用户信息【未登录状态】 -->
	            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	              <!-- The user image in the navbar-->
	              <img src="resources/img/user_image.jpg" class="user-image" alt="User Image">
	              <!-- hidden-xs hides the username on small devices so only the image appears. -->
	              <span class="hidden-xs"></span>
	            </a>
	            <ul class="dropdown-menu">
	              <!-- The user image in the menu -->
	              <li class="user-header">
	                <img src="resources/img/user_image.jpg" class="img-circle" alt="User Image">
	
	                <p>
	                 	 您现在的状态为：<i class="fa fa-circle text-danger"></i> 未登录
	                  <small>
	                    <script language=JavaScript>
	                      today=new Date();
	                      function initArray(){
	                      this.length=initArray.arguments.length
	                      for(var i=0;i<this.length;i++)
	                      this[i+1]=initArray.arguments[i] }
	                      var d=new initArray(
	                      " 周日",
	                      " 周一",
	                      " 周二",
	                      " 周三",
	                      " 周四",
	                      " 周五",
	                      " 周六");
	                      document.write(
	                      "<font>",
	                      today.getFullYear(),"年",
	                      today.getMonth()+1,"月",
	                      today.getDate(),"日",
	                      d[today.getDay()+1],
	                      "</font>" );
	                      </script>
	                    </small>
	                </p>
	              </li>
	              <!-- Menu Footer-->
	              <li class="user-footer">
	              	<div class="pull-left">
	                  <button class="btn btn-primary btn-flat" onclick="login_layer()">登录</button>
	                </div>
	                <div class="pull-right">
	                  <a href="#" class="btn btn-default btn-flat">注册</a>
	                </div>
	              </li>
	            </ul>
	         </c:if>
	         <c:if test="${pageContext.request.userPrincipal.name != null}">
	            <!-- 右上角用户信息【已登录状态】 -->
	            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	              <!-- The user image in the navbar-->
	              <img src="${user.photo_id.url}${user.photo_id.name}" class="user-image" alt="User Image">
	              <!-- hidden-xs hides the username on small devices so only the image appears. -->
	              <span class="hidden-xs"></span>
	            </a>
	            <ul class="dropdown-menu">
	              <!-- The user image in the menu -->
	              <li class="user-header">
	                <img src="${user.photo_id.url}${user.photo_id.name}" class="img-circle" alt="User Image">
	
	                <p>
	                 	 ${user.username}：<i class="fa fa-circle text-success"></i> 在线
	                  <small>
	                    <script language=JavaScript>
	                      today=new Date();
	                      function initArray(){
	                      this.length=initArray.arguments.length
	                      for(var i=0;i<this.length;i++)
	                      this[i+1]=initArray.arguments[i] }
	                      var d=new initArray(
	                      " 周日",
	                      " 周一",
	                      " 周二",
	                      " 周三",
	                      " 周四",
	                      " 周五",
	                      " 周六");
	                      document.write(
	                      "<font>",
	                      today.getFullYear(),"年",
	                      today.getMonth()+1,"月",
	                      today.getDate(),"日",
	                      d[today.getDay()+1],
	                      "</font>" );
	                      </script>
	                    </small>
	                </p>
	              </li>
	              <!-- Menu Footer-->
	              <li class="user-footer">
	              	<div class="pull-left">
	              	  <c:if test="${user.authority eq 'SUPER'}">
	                  	<a href="super/index" class="btn bg-orange">后台主页</a>
	                  </c:if>
	              	  <c:if test="${user.authority eq 'ADMIN'}">
	                  	<a href="admin/index" class="btn bg-orange">后台主页</a>
	                  </c:if>
	              	  <c:if test="${user.authority eq 'USER'}">
	                  	<a href="user/index" class="btn bg-orange">个人中心</a>
	                  </c:if>
	                </div>
	                <div class="pull-right">
	                	<c:url value="/j_spring_security_logout" var="logoutUrl" />
			    		<form action="${logoutUrl}" method="post" id="logoutForm">
			       			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			       			<input type="button"  onClick="logout();" class="btn bg-purple" value="注销">
			    		</form>
	                  	<script language="javascript">
							function logout(){
								if(confirm('您要注销登录吗?')){
									document.getElementById("logoutForm").submit();
									layer.msg('注销成功');
								}
							}
						</script> 
	                </div>
	              </li>
	            </ul>
	         </c:if>
	      </li>
          <!-- Control Sidebar Toggle Button -->

        </ul>
      </div>
    </nav>
  </header>

<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="resources/plugins/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="resources/plugins/AdminLTE/js/app.js"></script>
<!-- Responsive tables -->
<script type="text/javascript" src="resources/plugins/Responsive-tables/js/rwd-table.js"></script>
<!-- Layer -->
<script type="text/javascript" src="resources/plugins/layer/layer.js"></script>
<script>
function login_layer(){
	var form_width="100%";
	var form_height="75%";
	  if($(window).width()>=770){
	    form_width="400px"
	  	form_height="450px"
	   }
	    layer.open({
	      type: 2,//page层
	      title: '用户登录',//标题
	      moveType: 1, //拖拽风格，0是默认，1是传统拖动
	      shadeClose: true,
	      shift: 0, //0-6的动画形式，-1不开启
	      scrollbar: false,
	      shade: 0.6,//遮罩透明度
	      area: [form_width, form_height],
	      content: 'login', //iframe的url
	     // maxmin: false,
	    });
	}
</script>	
</body>
</html>