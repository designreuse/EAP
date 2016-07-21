<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    %>
<html xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
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
  <!-- Select2 -->
  <link rel="stylesheet" href="resources/plugins/select2/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/plugins/AdminLTE/css/AdminLTE.css">  
  <!-- 我自己的CSS -->
  <link rel="stylesheet" href="resources/css/wts_home_style.css">
  <link rel="stylesheet" href="resources/plugins/AdminLTE/css/skins/skin-cas.css">
</head>
<body>
	
    <div class="content">  
    	<c:url var="addAction" value="admin/save/experiment" ></c:url>
		<form:form action="${addAction}" commandName="experiment">
			   		<%@ include file="experiment_form.jsp"%> 	  
			    <div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<p></p>
						<input class="btn btn-success pull-right" type="submit" value="<spring:message text="发布"/>" />
					</div>
				</div> 
				
		</form:form> 	
	</div>   

<!-- jQuery 2.1.4 -->
	<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script src="resources/plugins/bootstrap-3.3.5/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="resources/plugins/AdminLTE/js/app.js"></script>
	<!-- Responsive tables -->
	<script type="text/javascript" src="resources/plugins/Responsive-tables/js/rwd-table.js"></script>
	<!-- bootstrap-formhelpers -->
	<script src="resources/plugins/bootstrap-formhelper-2.3.0/js/bootstrap-formhelpers.js"></script>
	<!-- Select2 -->
	<script src="resources/plugins/select2/select2.full.min.js"></script>
	<!-- Page script -->
<script>
$(function () {
  $(".select2").select2();
	});
</script>
</body>
</html>