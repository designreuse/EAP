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
	<jsp:include page="../shell_frame/shell_frame_sidebar-1-1.jsp"/>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
    	<div class="row">    	
	      <div class="col-md-12">
	          <div class="box box-info frame-mini">
	            <div class="box-header with-border">
	              <h3 class="box-title">技术服务详情</h3>
	            </div>
	            <div class="box-body" >	
	            
	            <h3 class="text-center">${technology.title}
        		<c:if test="${pageContext.request.userPrincipal.name != null}">
        		<% int collection_on=0;%>
        			<c:forEach items="${list_jsfw}" var="jsfw">
        				<c:if test="${jsfw.collection_id eq technology.id}">        				
        					<c:if test="${jsfw.user_id.id eq admin.id}">
        						<% collection_on=1;%>      						
        						<a href="<c:url value='/collection/${jsfw.id}/remove/${technology.id}/jsfw' />">
									<i class="fa fa-star pull-left" id="edit_collection_img"></i>										
								</a>
								<span id="edit_collection" style="display:none; font-size:70%">
        							<font style="font-size:80%;color:#0033FF">已收藏，点击取消收藏</font>
        						</span>	
        					</c:if>
        				</c:if>
        			</c:forEach>
        		<% 
        			if(collection_on==0)
        			{
        				%> 
        				<c:url var="addAction" value="/collection/${technology.id}/add/jsfw" ></c:url>
						<form:form action="${addAction}" commandName="collection" style="float:left;" id="collection_info">
							<form:input path="user_id.id" value="${admin.id}" type="hidden"/>
        					<form:input path="classification" value="jsfw" type="hidden"/>
							<form:input path="collection_id" value="${technology.id}" type="hidden"/>
							<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>
							<i style="cursor:pointer" class="fa fa-star-o pull-left" id="edit_collection_img" onclick="$('#collection_info').submit();"></i>										
						</form:form>
						<span id="edit_collection" style="display:none; font-size:70%">
        					<font style="font-size:80%;color:#0033FF">未收藏，点击添加收藏</font>
        				</span>
        				<%
        			}
				%>
        		</c:if>  	
        		</h3>
      			<div class="main_window">
<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      				<div class="faceplate" >
						<div class="embed">			
							<div class="row col-md-12">	
	      						<div class="callout callout-gray">
									<c:if test="${!empty technology.target}">
										<li>
											<strong>品系/类型：</strong>${technology.target}					
										</li>
										<div class="dotted-line"></div>
									</c:if>												
									<c:if test="${!empty technology.abstract_text}">
										<li>
											<strong>主要服务内容：</strong>${technology.abstract_text}				
										</li>
										<div class="dotted-line"></div>
									</c:if>
									<c:if test="${!empty technology.cycle}">
										<li>
											<strong>预定期限：</strong>${technology.cycle}
										</li>
										<div class="dotted-line"></div>	
									</c:if>
									<c:if test="${!empty technology.price_public}">
										<li>
											<strong>市场价格：</strong>${technology.price_public}
										</li>
										<div class="dotted-line"></div>
									</c:if>
									<c:if test="${pageContext.request.userPrincipal.name != null}">											
										<c:if test="${!empty technology.price_private}">
										<li>
											<strong>所内价格：</strong>${technology.price_private}
										</li>
										<div class="dotted-line"></div>	
									</c:if>
									</c:if>												
									<c:if test="${!empty technology.organization.name}">
										<li>		
											<strong>提供机构：</strong>${technology.organization.name}
										</li>
										<div class="dotted-line"></div>	
									</c:if>												
									<c:if test="${!empty technology.contact}">
										<li>		
											<strong>联系人：</strong>${technology.contact}
										</li>
									</c:if>	
								</div>	
							</div>
						</div>
					</div>
<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
<!-- ====================================================以下为第二层信息【详情】=============================================================== -->    																
      								<div id="second_level_menu_title-01" class="second_leve_menu row col-md-12">
      										<a href="javascript:void(0);">
      										<img id="second_level_menu_image-01" src="resources/images/plus.png">
      											<span>技术详情</span>
      										</a>
      									</div>
      									<div id="second_level_menu-01" class="second_level_text row col-md-12">
											<p></p>
											<c:if test="${!empty technology.note}">
												${technology.note}
											</c:if>											
										</div>
<!-- ====================================================以上为第二层信息【相关实验】=============================================================== -->  
      							<div class="row col-md-12">
								<c:if test="${!empty technology.time}">
									<p><div class="text-right" style=" text-align:right;">发布时间：${technology.time}&nbsp;</div></p>
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