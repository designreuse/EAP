
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">	  
		<script type="text/javascript" src="resources/js/jquery-2.1.4.js"> </script>
        <link rel="stylesheet" type="text/css" href="resources/css/new_style.css" />
        <script type="text/javascript" src="resources/js/javascript.js"></script>
        	<title>实验动物详情</title>       
      </head>
      <body>  
		<jsp:include page="head.jsp"/> 
		<div id="content">
		<div class="inner">
		<p></p><p></p><p></p><p></p><p></p><p></p>
		<div class="container_12">	
      	<div class="picture-frame-gray">
           	<form:form action="${addAction}" commandName="characteristic_animal">
    			<div class="title_name">
        					${characteristic_animal.name}
      			</div>
      			<div class="main_window">
      					<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      						<c:if test="${!empty listCharacteristic_animals}">      						
      							<li>
      								<font class="title_name_little">
      								特色实验用动物名称：${characteristic_animal.name}
      								</font>
      								<div class="faceplate" >
										<div class="embed">
											<c:if test="${!empty characteristic_animal.species_id.species_ch}">
												<strong>品种：</strong>												
												<a href="show/species/detail/${characteristic_animal.species_id.id}" target="_blank">&nbsp;												
													${characteristic_animal.species_id.species_ch}												
												</a>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											</c:if>
											<c:if test="${!empty characteristic_animal.preparation}">
												<strong>培养方式：</strong>${characteristic_animal.preparation}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty characteristic_animal.save_place}">
												<strong>养殖地：</strong>${characteristic_animal.save_place}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<div  id="contacts" class="contacts">											
													<c:if test="${!empty characteristic_animal.contact_id.name}">
														<font class="f-deepblue">联系人：</font>${characteristic_animal.contact_id.name}
														<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
													</c:if>
													<c:if test="${!empty characteristic_animal.contact_id.organization.address}">
														<font class="f-deepblue">联系地址：</font>${characteristic_animal.contact_id.organization.address}
														<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
													</c:if>
													<c:if test="${!empty characteristic_animal.contact_id.organization.name}">
														<font class="f-deepblue">联系单位：</font>${characteristic_animal.contact_id.organization.name}
														<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
													</c:if>
													<c:if test="${!empty characteristic_animal.contact_id.telephone}">
														<font class="f-deepblue">联系电话：</font>${characteristic_animal.contact_id.telephone}
														<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
													</c:if>
													<c:if test="${!empty characteristic_animal.contact_id.email}">
														<font class="f-deepblue">邮箱：</font>${characteristic_animal.contact_id.email}
														<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
													</c:if>		
											</div>
											<a id="contacts_more" class="contacts_more" href="javascript:void(0);">+&nbsp;&nbsp;联系方式</a>
											<a id="contacts_less" class="contacts_less" href="javascript:void(0);">-&nbsp;&nbsp;收起</a>									
											<p></p>
											<c:if test="${!empty characteristic_animal.save_info}">
												<strong>培育方式：</strong>${characteristic_animal.save_info}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty characteristic_animal.quantity}">
												<strong>储存量：</strong>${characteristic_animal.quantity}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty characteristic_animal.note}">
												<strong>备注：</strong>${characteristic_animal.note}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
																			
										</div>
									</div>
								</li>  
							</c:if>	
						<div class="line"></div>
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
      					     <c:if test="${!empty experimental_animal.time}">
									<p><div class="text-right" style=" text-align:right;">发布时间：${experimental_animal.time}&nbsp;</div></p>
								</c:if>	
						</div>
					</form:form>
			</div>
		</div>
		</div>
		</div>
		
<jsp:include page="foot.jsp"/>
	</body>
</html>