<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>用户登录</title>
<!--                       CSS                       -->
<!-- Reset Stylesheet -->
<link rel="stylesheet" href="resources/css/login-reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="resources/css/login-style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="resources/css/invalid.css" type="text/css" media="screen" />
</head>
<body id="login">
<div id="login-wrapper" class="png_bg">
  <div id="login-top">
    <!-- Logo (221px width) -->
    <a href="welcome"><img id="logo" src="resources/images/logo.png" alt="Simpla Admin logo" /></a> </div>
  <!-- End #logn-top -->
  <div id="login-content">
        <c:if test="${not empty error}">
            <div class="notification information png_bg"><div>用户名或密码错误</div></div>
        </c:if>
        <c:if test="${not empty msg}">
            <div class="notification information png_bg"><div>您已注销！!</div></div>
        </c:if>
        
        <c:url value="/j_spring_security_logout" var="logoutUrl" />
    	<form action="${logoutUrl}" method="post" id="logoutForm">
        	<input type="hidden" name="${_csrf.parameterName}"
            	value="${_csrf.token}" />
    	</form>
  
       <form id="loginForm" name='loginForm' 
            action="<c:url value='j_spring_security_check'/>"  method="post">
	<div class="notification information png_bg"></div>
           <p><label>用户名：</label></p>
           <p><input type='text' name='username' value='' class="text-input"></p>
           <div class="clear"></div>
           <p><label>密码:</label></p>
           <p><input type='password' name='password' class="text-input" /></p>
           <div class="clear"></div>
		   <p><label>验证码：</label></p>
		   <p><input id="id_code" class="text-input" type="text" name='random_code' placeholder="区分大小写" /></p>
                     <script language="javascript">
						function loadimage(){
						document.getElementById("randimage").src="random_image?"+Math.random();
						}
					</script> 
					<div class="clear"></div>
					 <span width="200" valign="middle" align="center"><img alt="code..." name="randimage" id="randimage" src="random_image" width="200" height="50" border="1" align="absmiddle">
					 <a href="javascript:loadimage();"><font class=pt95>点击刷新验证码</font></a></span></li>


           <div class="clear"></div>
           <p><input name="submit" type="submit" class="button" value="登录" />
           <p><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></p>
        </form>
  </div>
</div>
</body>
</html>
