<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currentTime = new java.util.Date();
String str_date1 = formatter.format(currentTime); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic' rel='stylesheet' type='text/css'>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen">
	<link rel="stylesheet" href="resources/css/grid.css" type="text/css" media="screen">
	<link rel="stylesheet" href="resources/css/camera.css" type="text/css" media="screen">
	<link rel="stylesheet" href="resources/css/backstagestyle.css" type="text/css" media="screen">
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script type="text/javascript" src="resources/js/jquery-migrate-1.1.1.js"></script>
	<script type="text/javascript" src="resources/js/camera.js"></script>
	<script type="text/javascript" src="resources/js/jquery.easing.1.3.js"></script>
	<!--  
	<script src="resources/js/upimage.js"></script>
	-->
	<link rel="stylesheet" type="text/css" href="resources/diyUpload/css/webuploader.css">
	<link rel="stylesheet" type="text/css" href="resources/diyUpload/css/diyUpload.css">
	<script type="text/javascript" src="resources/diyUpload/js/webuploader.html5only.min.js"></script>
	<script type="text/javascript" src="resources/diyUpload/js/diyUpload.js"></script>
<script>
    jQuery(function(){      
      jQuery('#camera_wrap_1').camera({
        height: '317px',
        loader: false,
        pagination: false,
        thumbnails: false
      });
    });
  </script>
<script type="text/javascript">
jQuery(document).ready(function(){
	var qcloud={};
	$('[_t_nav]').hover(function(){
		var _nav = $(this).attr('_t_nav');
		clearTimeout( qcloud[ _nav + '_timer' ] );
		qcloud[ _nav + '_timer' ] = setTimeout(function(){
		$('[_t_nav]').each(function(){
		$(this)[ _nav == $(this).attr('_t_nav') ? 'addClass':'removeClass' ]('nav-up-selected');
		});
		$('#'+_nav).stop(true,true).slideDown(200);
		}, 150);
	},function(){
		var _nav = $(this).attr('_t_nav');
		clearTimeout( qcloud[ _nav + '_timer' ] );
		qcloud[ _nav + '_timer' ] = setTimeout(function(){
		$('[_t_nav]').removeClass('nav-up-selected');
		$('#'+_nav).stop(true,true).slideUp(200);
		}, 150);
	});
});
</script>
  <!--[if lt IE 8]><div style='text-align:center'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/img/upgrade.jpg"border="0"alt=""/></a></div><![endif]-->
  	<!--[if lt IE 9]>
	   	<script src="resources/js/html5shiv.js"></script>
	   	<link rel="stylesheet" href="resources/css/ie.css" type="text/css" media="screen">
	   	<link href='http://fonts.googleapis.com/css?family=Lato:300italic' rel='stylesheet' type='text/css'>
	   	<link href='http://fonts.googleapis.com/css?family=Lato:300' rel='stylesheet' type='text/css'>
	   	<link href='http://fonts.googleapis.com/css?family=Lato:400' rel='stylesheet' type='text/css'>
	   	<link href='http://fonts.googleapis.com/css?family=Lato:700' rel='stylesheet' type='text/css'>
    <![endif]-->
<style>  
#wrap {display:block;bottom:0px;right:1px!important;position:fixed;text-align:center;} 
* html{overflow-x:auto;overflow-y:auto;}   
* html #wrap {position:absolute;}
</style>

</head>
<body>
	<c:url value="/j_spring_security_logout" var="logoutUrl" />
    <form action="${logoutUrl}" method="post" id="logoutForm">
       	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
   	<script>
       function formSubmit() 
       {
       	document.getElementById("logoutForm").submit();
     	}
    </script>
	<header>
		<div class="container_13">
			<a href="super/index_backstage">
				<img src="resources/images/dws.png"  width="65">
				<img src="resources/images/blogo.png">
			</a>
			<c:if test="${pageContext.request.userPrincipal.name != null}">
        		<div style="text-align:right;color:#ffffff"> 【管理员: ${pageContext.request.userPrincipal.name} ，欢迎进入后台管理系统！】|【 
           		<a href="javascript:formSubmit()">注销</a>】</div>
	        </c:if>
		
		</div>
	</header>
	<div class="head-v3">
	<div class="navigation-up">
		<div class="navigation-inner">
			<div class="navigation-v3">
				<ul>
					<li class="" _t_nav="animal_resources">
						<h2>
							<a href="#" class="">资源管理</a>
						</h2>
					</li>
					<li class="" _t_nav="service">
						<h2>
							<a href="#">服务管理</a>
						</h2>
					</li>
					<li class="" _t_nav="industry_trends">
						<h2>
							<a href="#">动态管理</a>
						</h2>
					</li>
					<li class="" _t_nav="laws_and_regulations">
						<h2>
							<a href="#">法律法规</a>
						</h2>
					</li>
					<li _t_nav="education_and_training">
						<h2>
							<a href="#">培训管理</a>
						</h2>
					</li>
					<li _t_nav="other">
						<h2>
							<a href="#">其他信息</a>
						</h2>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="navigation-down">
		<div id="animal_resources" class="nav-down-menu menu-1" style="display: none;" _t_nav="animal_resources">
			<div class="navigation-down-inner">
				<dl style="margin-left: 100px;">
					<dt>物种品系管理</dt>
					<dd>
						<a href="super/species/1">物种管理</a>
					</dd>
					<dd>
						<a href="super/strain/1">品系管理</a>
					</dd>
				</dl>
				<dl>
					<dt>动物资源管理</dt>
					<dd>
						<a href="super/experimental_animal/1">实验动物管理</a>
					</dd>
					<dd>
						<a href="super/characteristic_animal">特色动物管理</a>
					</dd>
				</dl>
				<dl>
					<dt>设备资源管理</dt>
					<dd>
						<a href="#">特色设备管理</a>
					</dd>
					<dd>
						<a href="#">常规设备管理</a>
					</dd>
				</dl>
			</div>
		</div>
		<div id="service" class="nav-down-menu menu-3 menu-1" style="display: none;" _t_nav="service">
			<div class="navigation-down-inner">
				<dl style="margin-left: 380px;">
					<dd>
						<a class="" href="show/technology/1">技术支持管理</a>
					</dd>
				</dl>
				<dl>
					<dd>
						<a class="" href="show/detection/1">检测服务管理</a>
					</dd>
				</dl>
				<dl>
					<dd>
						<a class="" href="show/entrust/1">委托试验管理</a>
					</dd>
				</dl>
			</div>
		</div>
		<div id="industry_trends" class="nav-down-menu menu-3 menu-1" style="display: none;" _t_nav="industry_trends">
			<div class="navigation-down-inner">
				<dl style="margin-left: 380px;">
					<dd>
						<a class="" href="super/announcement">平台公告管理</a>
					</dd>
				</dl>
				<dl>
					<dd>
						<a class="" href="show/experiment">特色实验管理</a>
					</dd>
				</dl>
				<dl>
					<dd>
						<a class="" href="developing">科研成果管理</a>
					</dd>
				</dl>
			</div>
		</div>
		<div id="laws_and_regulations" class="nav-down-menu menu-3 menu-1" style="display: none;" _t_nav="laws_and_regulations">
			<div class="navigation-down-inner">
				<dl style="margin-left: 380px;">
					<dd>
						<a class="" href="show/law/1">相关法律管理</a>
					</dd>
				</dl>
				<dl>
					<dd>
						<a class="" href="show/stipulating/1">相关规定管理</a>
					</dd>
				</dl>
			</div>
		</div>
		<div id="education_and_training" class="nav-down-menu menu-3 menu-1" style="display: none;" _t_nav="education_and_training">
			<div class="navigation-down-inner">
				<dl style="margin-left: 380px;">
					<dd>
						<a class="" href="show/training/1">培训通知管理</a>
					</dd>
				</dl>
				<dl>
					<dd>
						<a class="" href="show/popularization/1">相关科普管理</a>
					</dd>
				</dl>
			</div>
		</div>
		<div id="other" class="nav-down-menu menu-3 menu-1" style="display: none;" _t_nav="other">
			<div class="navigation-down-inner">
				<dl style="margin-left: 380px;">
					<dd>
						<a class="" href="developing">管理员账号管理</a>
					</dd>
				</dl>
				<dl>
					<dd>
						<a class="" href="developing">机构单位管理</a>
					</dd>
				</dl>
				<dl>
					<dd>
						<a class="" href="developing">用户账户管理</a>
					</dd>
				</dl>
				<dl>
					<dd>
						<a class="" href="super/file/1">文件下载管理</a>
					</dd>
				</dl>
			</div>
		</div>
		
		
	</div>
</div>
<div id="wrap"><br>  
<a href="javascript:scroll(0,0)" mce_href="javascript:scroll(0,0)"><img src="resources/images/bgotop.png"  onmouseover="this.src='resources/images/bgotopon.png'" onmouseout="this.src='resources/images/bgotop.png'"/></a>  
</div>  

</html>