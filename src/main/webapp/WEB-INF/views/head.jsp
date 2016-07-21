<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="resources/css/login.css" type="text/css" media="screen">
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/jquery-migrate-1.1.1.js"></script>
<script type="text/javascript" src="resources/js/camera.js"></script>
<script type="text/javascript" src="resources/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="resources/js/login.js"></script>

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
		<div class="container_12">
			<a href="welcome">
				<img src="resources/images/logo.png" href="welcome">
			</a>
		</div>
							<c:url value="/j_spring_security_logout" var="logoutUrl" />
    					<form action="${logoutUrl}" method="post" id="logoutForm">
       						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    					</form>
    	
			<c:url value="/j_spring_security_logout" var="logoutUrl" />
    		<form action="${logoutUrl}" method="post" id="logoutForm">
       			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    		</form>
			
	</header>
	<div class="head-v3">
	<div class="navigation-up">
		<div class="navigation-inner">
			<div class="navigation-v3">
				<ul>
					<li class="" _t_nav="animal_resources">
						<h2>
							<a href="javascript:void(0)">平台资源</a>
						</h2>
					</li>
					<li class="" _t_nav="service">
						<h2>
							<a href="javascript:void(0)">平台服务</a>
						</h2>
					</li>
					<li class="" _t_nav="industry_trends">
						<h2>
							<a href="javascript:void(0)">动态公告</a>
						</h2>
					</li>					
					<li _t_nav="other">
						<h2>
							<a href="javascript:void(0)">其他信息</a>
						</h2>
					</li>

						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<c:forEach items="${listAdmins}" var="admin">
								<c:if test="${admin.name eq pageContext.request.userPrincipal.name}">							
							<c:if test="${admin.authority eq 'SUPER'}">										
							<li>
								<h2>
									<a href="super/index_backstage/${admin.id}">后台管理入口</a>
								</h2>
							</li>	
							</c:if>	
							<c:if test="${admin.authority eq 'ADMIN'}">										
							<li>
								<h2>
									<a href="admin/index_backstage/${admin.id}/${pageContext.request.userPrincipal.name}">后台管理入口</a>
								</h2>
							</li>	
							</c:if>	
							<c:if test="${admin.authority eq 'USER'}">										
							<li>
								<h2>
									<a href="user/index/${admin.id}/${pageContext.request.userPrincipal.name}">个人中心</a>
								</h2>
							</li>	
							</c:if>									
							<li>
								<h2>
									<a href="javascript:formSubmit()">注销登录</a>
								</h2>
							</li>
								</c:if>
							</c:forEach>
						</c:if>
				        <c:if test="${pageContext.request.userPrincipal.name == null}">
							<li>
								<h2>
									<a  id="loginmodal" href="javascript:void(0)">用户登录</a>
								</h2>
							</li>							
							<li>
								<h2>
									<a  id="user_register" href="user_register">注册新用户</a>
								</h2>
							</li>
				        </c:if>

				</ul>
			</div>
		</div>
	</div>
	<div class="navigation-down">
		<div id="animal_resources" class="nav-down-menu menu-1" style="display: none;" _t_nav="animal_resources">
			<div class="navigation-down-inner">
				<dl style="margin-left: 100px;">
					<dt>动物资源</dt>
					<dd>
						<a href="show/experimental_animal/1">实验动物</a>
					</dd>
					<dd>
						<a href="show/characteristic_animal/1">特色动物</a>
					</dd>
				</dl>
				<dl>
					<dt>设备资源</dt>
					<dd>
						<a href="show/equipment">特色设备</a>
					</dd>
					<dd>
						<a href="show/equipment">常规设备</a>
					</dd>
				</dl>
			</div>
		</div>
		<div id="service" class="nav-down-menu menu-3 menu-1" style="display: none;" _t_nav="service">
			<div class="navigation-down-inner">
				<dl style="margin-left: 380px;">
					<dd>
						<a class="" href="show/technology/1">技术服务</a>
					</dd>
				</dl>
				<dl>
					<dd>
						<a class="" href="show/training/1">教育培训</a>
					</dd>
				</dl>
			</div>
		</div>
		<div id="industry_trends" class="nav-down-menu menu-3 menu-1" style="display: none;" _t_nav="industry_trends">
			<div class="navigation-down-inner">
				<dl style="margin-left: 400px;">
					<dt>公告通知</dt>
					<dd>
						<a href="show/announcement/1">平台公告</a>
					</dd>
				</dl>
				<dl style="margin-left: 0px;">
					<dt>行业动态</dt>
					<dd>
						<a href="show/experimental_animal/1">特色实验</a>
					</dd>
					<dd>
						<a href="show/experimental_animal/1">研究成果</a>
					</dd>
				</dl>
				<dl style="margin-left: 0px;">
					<dt>行业标准</dt>
					<dd>
						<a class="" href="show/law/1">相关法律</a>
					</dd>
					<dd>
						<a class="" href="show/stipulating/1">常规准则</a>
					</dd>
				</dl>
			</div>
		</div>
		<div id="other" class="nav-down-menu menu-3 menu-1" style="display: none;" _t_nav="other">
			<div class="navigation-down-inner">
				<dl style="margin-left: 380px;">
					<dd>
						<a class="" href="developing">关于我们</a>
					</dd>
				</dl>
				<dl>
					<dd>
						<a class="" href="developing">平台简介</a>
					</dd>
				</dl>
			</div>
		</div>
		
		
	</div>
</div>
<div class="theme-popover">
     <div class="theme-poptit">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>中国科学院模式与特色动物实验平台用户登录</h3>
     </div>
     
     
     
     <div class="theme-popbod dform">
            <form id="loginForm" name='loginForm' class="theme-signin" action="<c:url value='j_spring_security_check'/>"  method="post" onsubmit="return check()" >
                <ol>
                     <li><strong>账号：</strong><input class="ipt" type="text" name='username' id="username" /></li>
                     <li><strong>密码：</strong><input class="ipt" type="password" name='password' id="password" /></li>
                     <li><strong>验证码：</strong><input id="id_code" class="ipt-mini" type="text" name='random_code' placeholder="区分大小写" />
                     <script language="javascript">
						function loadimage(){
						document.getElementById("randimage").src="random_image?"+Math.random();
						}
					</script> 
					 <span width="135" valign="middle" align="center"><img alt="code..." name="randimage" id="randimage" src="random_image" width="60" height="23" border="1" align="absmiddle">
					 <a href="javascript:loadimage();"><font class=pt95>点击刷新验证码</font></a></span></li>
					 
					 <li><input name="submit" type="submit" class="button" value="登录" /></li>
					 <div id="test1"></div>
           			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
           			
                </ol>
           </form>
     </div>
</div>
<div id="wrap"><br>  
<a href="javascript:scroll(0,0)" mce_href="javascript:scroll(0,0)"><img src="resources/images/gotop.png"  onmouseover="this.src='resources/images/gotopon.png'" onmouseout="this.src='resources/images/gotop.png'"/></a>  
</div>  
<div class="menuHolder">
	<div class="menuWindow">
		<ul class="p1">
			<li class="s1"><a href="welcome"><img class="img"src="resources/images/zky.png"  width="80" href="welcome" border="10px 0 0 10px"></a>
				<ul class="p2">
					
					<li class="s2"><a href="javascript:void(0)"><span>平台资源</span></a>
						<ul class="p3 a3">
							<li><a href="animal_resources">动物资源</a></li>
							<li><a href="show/equipment">设备资源</a></li>
						</ul>
					</li>
					<li class="s2"><a href="javascript:void(0)"><span>平台服务</span></a>
						<ul class="p3 a6">
							<li><a href="developing">技术支持</a></li>
							<li><a href="developing">检测服务</a></li>
							<li><a href="developing">委托实验</a></li>
						</ul>
					</li>
					<li class="s2"><a href="javascript:void(0)"><span>动态公告</span></a>
						<ul class="p3 a3">
							<li><a href="show/announcement/1">平台公告</a></li>
							<li><a href="#">特色实验</a></li>
							<li><a href="#">科研成果</a></li>
						</ul>
					</li>
					<li class="s2"><a href="javascript:void(0)"><span>法律法规</span></a>
						<ul class="p3 a3">
							<li><a href="#">相关法律</a></li>
							<li><a href="#">相关规定</a></li>
						</ul>
					</li>
					<li class="s2"><a href="javascript:void(0)"><span>教育培训</span></a>
						<ul class="p3 a3">
							<li><a href="#">培训通知</a></li>
							<li><a href="#">相关科普</a></li>
						</ul>
					</li>
					<li class="s2"><a href="javascript:void(0)"><span>其他信息</span></a>
						<ul class="p3 a3">
							<li><a href="#">关于我们</a></li>
							<li><a href="#">文件下载</a></li>
						</ul>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</div>
</body>
<script type="text/javascript">
     function check(){  
    	   var check_r="false";
    	   var username = $('#username').val();
    	   //alert("!!!");
    	   var password = $('#password').val();    	  
    	   var id_code = $('#id_code').val();
    	   if(username ==  null || username == '' || password ==  null || password == ''){
    	        alert("用户名或密码不能为空");
    	        return false;
    	   }
    	   if(id_code ==  null || id_code == ''){
    	        alert("请填写验证码");
    	        return false;
    	   }
    	   
    	    $.get("login_validate",{random_code:$('#id_code').val()},
    		function(data){
    		   var validate= String($.trim(data));  
    		   //alert("validate="+validate);
    		   if(validate == 'validate_f')
   			{
   		   		alert("验证码错误");
   		   		loadimage();
   		   		return false;
   			}
   	   		if(validate == 'validate_t')
   			{
   	   			check_r='true';
   	   			return true;
   			}	
    		});
    	  //function test(callbackFun){ callbackFun();}
    	   alert("欢迎！");
    	      //if(check_r=='true')
    	    //	  {return true;}

    	     // if(check_r!='true')
    	    //	  {alert("XXX");}
    	     if(check_r == 'true')
   			{
   	   			return true;
   			}
	   		return false;
    	}
</script>
</html>