<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
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
  <!-- Bootstrap-table -->
  <link rel="stylesheet" href="resources/plugins/bootstrap-table-master/css/bootstrap-table.min.css">
  <!-- 我的CSS -->
  <link rel="stylesheet" href="resources/css/wts_animal_style.css">
  <link rel="stylesheet" type="text/css" href="resources/css/wts_text_detail_style.css" />	

</head>
<body>
<div class="wrapper">

  <!-- Main Header -->
	<jsp:include page="../shell_frame/shell_frame_head.jsp"/>
  <!-- Main Sidebar -->
	<jsp:include page="../shell_frame/shell_frame_sidebar-2-2.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
    	<div class="row">    	
	      <div class="col-md-12">
	          <div class="box box-info frame-mini">
	            <div class="box-header with-border">
	              <h3 class="box-title">设备资源</h3>	              	            
		            <div class="box-tools pull-right">
		               <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		            </div>
	            </div>
	            <div class="box-body" >	
	            <div class="row">
					<div class="col-md-6">					  
				    	<div class="callout callout-gray">
							<strong>特色设备</strong>
							<p></p><div class="line"></div><p></p>
							<p><img width="100%" src="resources/img/characteristic_equipment.jpg" alt=""></p>
		                	<p>【特色设备】为平台成员拥有的稀有、贵重设备和自主设计的设备。一般数量少，功能独特</p>
							<p>【特点】适合做特定的动物实验，也可根据自主设计的设备功能定制特定的设备。</p>				
		              		<p><a href="characteristic_equipment_list" class="btn bg-navy">查看详情</a></p>				
		              </div>
	              	</div>
					<div class="col-md-6">					  
				    	<div class="callout callout-gray">
							<strong>常规设备</strong>
							<p></p><div class="line"></div><p></p>
							<p><img width="100%" src="resources/img/common_equipment.jpg" alt=""></p>
		                	<p>【常规设备】动物实验常见和必须的重要设备，常见于动物实验室的重要设备。</p>
							<p>【特点】动物实验中必须、常见且重要的设备，可根据该类信息来参考动物实验室设备配置要求。</p>				
		              		<p><a href="common_equipment_list" class="btn bg-navy">查看详情</a></p>				
		              </div>
	              	</div>
	            </div>
	            </div>
	          </div>
	      </div>
		</div>		
    </section>
    <section class="content">


    </section>
  </div>
  <!-- Main Footer -->
	<jsp:include page="../shell_frame/shell_frame_footer.jsp"/>

  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

</body>
</html>