<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--
这是主框架.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
  <link rel="stylesheet" href="resources/plugins/AdminLTE/css/skins/skin-cas.css">
  <!-- 我自己的CSS -->
  <link rel="stylesheet" href="resources/css/wts_home_style.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
  <!-- Main Header -->
  <header class="main-header" >
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
        <span class="sr-only"> </span>
      </a>
      <div class="">      
      </div>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
	        <li class="dropdown">
	            <!-- title menu -->
				<jsp:include page="title_menu.jsp"/>            
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
	                 	 ${sessionScope.user.username}${user.username}：<i class="fa fa-circle text-success"></i> 在线
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
	                  	<a href="super/index" class="btn bg-orange">后台入口</a>
	                  </c:if>
	              	  <c:if test="${user.authority eq 'ADMIN'}">
	                  	<a href="admin/index" class="btn bg-orange">后台入口</a>
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
<script type="text/javascript" src="resources/js/layer_db.js"></script>	
</body>
</html>