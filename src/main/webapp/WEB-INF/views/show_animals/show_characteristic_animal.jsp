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
	<jsp:include page="../shell_frame/shell_frame_sidebar-2-1.jsp"/>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
    	<div class="row">    	
	      <div class="col-md-12">
	          <div class="box box-info frame-mini">
	            <div class="box-header with-border">
	              <h3 class="box-title">特色动物详情</h3>
	            </div>
	            <div class="box-body" >					    
    			<h3 class="text-center">${characteristic_animal.name}  
        		<c:if test="${pageContext.request.userPrincipal.name != null}">
        		<% int collection_on=0;%>
        			<c:forEach items="${list_tsdw}" var="tsdw">
        				<c:if test="${tsdw.collection_id eq characteristic_animal.id}">        				
        					<c:if test="${tsdw.user_id.id eq admin.id}">
        						<% collection_on=1;%>        						
        						<a href="<c:url value='/collection/${sydw.id}/remove/${experimental_animal.id}/tsdw' />">
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
        					<c:url var="addAction" value="/collection/${characteristic_animal.id}/add/tsdw" ></c:url>
							<form:form action="${addAction}" commandName="collection" style="float:left;" id="collection_info">
								<form:input path="user_id.id" value="${admin.id}" type="hidden"/>
        						<form:input path="classification" value="tsdw" type="hidden"/>
								<form:input path="collection_id" value="${characteristic_animal.id}" type="hidden"/>
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
	      					<div class="callout callout-gray">
	      						<div class="row">
								<c:if test="${!empty characteristic_animal.photo_id.id}">											
				  					<div class="col-md-3">
										<figure><img src="${characteristic_animal.photo_id.url}${characteristic_animal.photo_id.name}" alt="" width="90%" height="90%"></figure>
									</div>
								</c:if>	
								<div class="col-md-9">
								<p></p>
									<c:if test="${!empty characteristic_animal.species_id.species_ch}">
										<li>
											<strong>物种：</strong>												
												<a href="show/species/detail/${characteristic_animal.species_id.id}" target="_blank">											
													${characteristic_animal.species_id.species_ch}												
												</a>
										</li>
										<div class="dotted-line"></div>
									</c:if>		
									<c:if test="${!empty characteristic_animal.preparation}">
										<li>
											<strong>培养方式：</strong>${characteristic_animal.preparation}											
										</li>
										<div class="dotted-line"></div>
									</c:if>
									<c:if test="${!empty characteristic_animal.save_place}">
										<li>
											<strong>养殖地：</strong>${characteristic_animal.save_place}								
										</li>
									</c:if>	
								</div>	
							</div>									
						</div>	
						<div class="callout callout-gray">	
								<c:if test="${!empty characteristic_animal.save_info}">
									<li>
										<strong>储存信息：</strong>${characteristic_animal.save_info}					
									</li>
									<div class="dotted-line"></div>
								</c:if>	
								<c:if test="${!empty characteristic_animal.quantity}">
									<li>
										<strong>储存量：</strong>${characteristic_animal.quantity}					
									</li>
									<div class="dotted-line"></div>
								</c:if>
								<c:if test="${!empty characteristic_animal.note}">
									<li>
										<strong>备注：</strong>${characteristic_animal.note}					
									</li>
									<div class="dotted-line"></div>
								</c:if>	
									<div  id="contacts" class="contacts">											
										<c:if test="${!empty characteristic_animal.contact_id.name}">
											<li>
												<font class="f-deepblue">联系人：</font>${characteristic_animal.contact_id.name}					
											</li>
											<div class="dotted-line"></div>
										</c:if>
										<c:if test="${!empty characteristic_animal.contact_id.organization.address}">
											<li>
												<font class="f-deepblue">联系地址：</font>${characteristic_animal.contact_id.organization.address}				
											</li>
											<div class="dotted-line"></div>
										</c:if>
										<c:if test="${!empty characteristic_animal.contact_id.organization.name}">
											<li>
												<font class="f-deepblue">联系单位：</font>${characteristic_animal.contact_id.organization.name}			
											</li>
											<div class="dotted-line"></div>
										</c:if>
										<c:if test="${!empty characteristic_animal.contact_id.telephone}">
											<li>
												<font class="f-deepblue">联系电话：</font>${characteristic_animal.contact_id.telephone}			
											</li>
											<div class="dotted-line"></div>
										</c:if>
										<c:if test="${!empty characteristic_animal.contact_id.email}">
											<li>
												<font class="f-deepblue">邮箱：</font>${characteristic_animal.contact_id.email}		
											</li>
											<div class="dotted-line"></div>
										</c:if>		
											</div>
											<a id="contacts_more" class="contacts_more" href="javascript:void(0);">+&nbsp;&nbsp;联系方式</a>
											<a id="contacts_less" class="contacts_less" href="javascript:void(0);">-&nbsp;&nbsp;收起</a>									
											<p></p>
											<c:if test="${!empty characteristic_animal.quantity}">
												<li>
													<strong>储存量：</strong>${characteristic_animal.quantity}		
												</li>
												<div class="dotted-line"></div>
											</c:if>
											<c:if test="${!empty characteristic_animal.note}">
												<li>
													<strong>备注：</strong>${characteristic_animal.note}
												</li>
											</c:if>								
							</div>
						</div>
					</div>
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
      					<!-- ====================================================以下为第二层信息【相关实验】=============================================================== -->    																
      								<div id="second_level_menu_title-01" class="second_leve_menu row col-md-12">
      										<a href="javascript:void(0);">
      										<img id="second_level_menu_image-01" src="resources/images/plus.png">
      											<span>相关实验</span>
      										</a>
      									</div>
      									<div id="second_level_menu-01" class="second_level_text row col-md-12">
											<p></p>
											<c:if test="${!empty characteristic_animal.note}">
												<li>
													<strong>相关实验：</strong>${characteristic_animal.note}
												</li>
												<div class="dotted-line"></div>
											</c:if>
											<c:if test="${!empty characteristic_animal.note}">
												<li>
													<strong>相关实验：</strong>${characteristic_animal.note}
												</li>
												<div class="dotted-line"></div>
											</c:if>
										</div>
      								<!-- ====================================================以上为第二层信息【相关实验】=============================================================== -->  
      								<!-- ====================================================以下为第二层信息【可提供的相关供技术服务】=============================================================== -->    																
      								
      									<div id="second_level_menu_title-02" class="second_leve_menu row col-md-12">
      										<a href="javascript:void(0);">
      										<img id="second_level_menu_image-02" src="resources/images/plus.png">
      											<span>可提供的相关供技术服务</span>
      										</a>
      									</div>
      									<div id="second_level_menu-02" class="second_level_text row col-md-12">
											<p></p>
											<c:if test="${!empty characteristic_animal.note}">
												<li>
													<strong>相关实验：</strong>${characteristic_animal.note}
												</li>
												<div class="dotted-line"></div>
											</c:if>
											<c:if test="${!empty characteristic_animal.note}">
												<li>
													<strong>相关实验：</strong>${characteristic_animal.note}
												</li>
												<div class="dotted-line"></div>
											</c:if>
										</div>
									
      								<!-- ====================================================以上为第二层信息【可提供的相关供技术服务】=============================================================== -->  
      							<div class="row col-md-12">
								<c:if test="${!empty characteristic_animal.time}">
									<p><div class="text-right" style=" text-align:right;">发布时间：${characteristic_animal.time}&nbsp;</div></p>
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