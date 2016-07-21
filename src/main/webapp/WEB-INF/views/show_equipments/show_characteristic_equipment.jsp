<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currentTime = new java.util.Date();
String str_date1 = formatter.format(currentTime); 
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
	              <h3 class="box-title">特色设备详情</h3>
	            </div>
	            <div class="box-body" >		            
	            <h3 class="text-center">${characteristic_equipment.name}</h3>		
      			<div class="main_window">
					<div class="faceplate" >
						<div class="embed">										
	      					<div class="callout callout-gray">
	      						<div class="row">
									<c:if test="${!empty characteristic_equipment.image.id}">											
				  						<div class="col-md-3">
											<figure><img src="${characteristic_equipment.image.url}${characteristic_equipment.image.name}" alt="" width="90%" height="90%"></figure>
										</div>
									</c:if>	
								<div class="col-md-9">
									<p></p>										
									<c:if test="${!empty characteristic_equipment.version}">
										<li>
											<strong>型号：</strong>${characteristic_equipment.version}											
										</li>
										<div class="dotted-line"></div>
									</c:if>									
									<c:if test="${!empty characteristic_equipment.organization.id}">
										<li>
											<strong>所属单位：</strong>${characteristic_equipment.organization.name}											
										</li>
										<div class="dotted-line"></div>
									</c:if>
									<div  id="contacts" class="contacts">											
										<c:if test="${!empty characteristic_equipment.contact.name}">
											<li>
												<font class="f-deepblue">联系人：</font>${characteristic_equipment.contact.name}					
											</li>
											<div class="dotted-line"></div>
										</c:if>
										<c:if test="${!empty characteristic_equipment.contact.organization.address}">
											<li>
												<font class="f-deepblue">联系地址：</font>${characteristic_equipment.contact.organization.address}				
											</li>
											<div class="dotted-line"></div>
										</c:if>
										<c:if test="${!empty characteristic_equipment.contact.organization.name}">
											<li>
												<font class="f-deepblue">联系单位：</font>${characteristic_equipment.contact.organization.name}			
											</li>
											<div class="dotted-line"></div>
										</c:if>
										<c:if test="${!empty characteristic_equipment.contact.telephone}">
											<li>
												<font class="f-deepblue">联系电话：</font>${characteristic_equipment.contact.telephone}			
											</li>
											<div class="dotted-line"></div>
										</c:if>
										<c:if test="${!empty characteristic_equipment.contact.email}">
											<li>
												<font class="f-deepblue">邮箱：</font>${characteristic_equipment.contact.email}		
											</li>
											<div class="dotted-line"></div>
										</c:if>		
									</div>
									<a id="contacts_more" class="contacts_more" href="javascript:void(0);">+&nbsp;&nbsp;联系方式</a>
									<a id="contacts_less" class="contacts_less" href="javascript:void(0);">-&nbsp;&nbsp;收起</a>									
									<p></p>
								</div>	
							</div>									
						</div>	
	      					<div class="callout callout-gray">
								<div class="announcement_note">									
									<c:if test="${!empty characteristic_equipment.note}">
										${characteristic_equipment.note}
									</c:if>												
								</div>
							</div>	
						</div>
      					<div class="row col-md-12">
							<c:if test="${!empty characteristic_equipment.time}">
								<p><div class="text-right" style=" text-align:right;">发布时间：${characteristic_equipment.time}&nbsp;</div></p>
							</c:if>	
						</div>
					</div>
				</div>
	          </div>
	      </div>
		</div>		
    </section>    
    
    <!-- Main content -->
    <section class="content">

      <!-- Your Page Content Here -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


  <!-- Main Footer -->
	<jsp:include page="../shell_frame/shell_frame_footer.jsp"/>


  
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- Responsive tables -->
<script type="text/javascript" src="resources/plugins/bootstrap-table-master/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="resources/plugins/bootstrap-table-master/js/bootstrap-table-zh-CN.js"></script>
<!-- Echarts -->
<script type="text/javascript" src="resources/js/echarts-all.js"></script>
<!-- 我的js -->
<script type="text/javascript" src="resources/js/javascript.js"></script>   
</body>
</html>