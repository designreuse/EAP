
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
        	<title>技术服务详情</title>       
      </head>
      <body>  
		<jsp:include page="head.jsp"/> 
		<div id="content">
		<div class="inner">
		<p></p><p></p><p></p><p></p><p></p><p></p>
		<div class="container_12">	
      	<div class="picture-frame-gray">
           
    			<div class="title_name">
        			${technology.title}  
        		<c:if test="${pageContext.request.userPrincipal.name != null}">
        		<% int collection_on=0;%>
        			<c:forEach items="${list_jsfw}" var="jsfw">
        				<c:if test="${jsfw.collection_id eq technology.id}">        				
        					<c:if test="${jsfw.user_id.name eq pageContext.request.userPrincipal.name}">
        						<% collection_on=1;%>        						
        						<c:forEach items="${listAdmins}" var="admin"> 
        							<c:if test="${admin.name eq pageContext.request.userPrincipal.name}"> 
									<a href="<c:url value='/collection/${jsfw.id}/remove/${technology.id}/jsfw' />" >
										<input type="image" style="float:left;width:22px;background-color:#DFDFDF;border:solid 0px #DFDFDF;" id="edit_collection_img" alt="收藏" src="resources/images/star_on.png" onclick="document.formName.submit();" style="width:22px;" /> 
									</a>
									<span id="edit_collection" style="display:none; font-size:70%">
        								<font style="font-size:80%;">已收藏，点击取消收藏</font>
        							</span>
        							</c:if>
        						</c:forEach>	
        					</c:if>
        				</c:if>
        			</c:forEach>
        		<% 
        			if(collection_on==0)
        			{
        				%> 
        				<c:forEach items="${listAdmins}" var="admin"> 
        					<c:if test="${admin.name eq pageContext.request.userPrincipal.name}"> 
        					<c:url var="addAction" value="/collection/${technology.id}/add/jsfw" ></c:url>
							<form:form action="${addAction}" commandName="collection" style="float:left;">
								<form:input path="user_id.id" value="${admin.id}" type="hidden"/>
        						<form:input path="classification" value="jsfw" type="hidden"/>
								<form:input path="collection_id" value="${technology.id}" type="hidden"/>
								<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>
								<input type="image" id="edit_collection_img" alt="收藏" src="resources/images/star_off.png" onclick="document.formName.submit();" style="width:22px;background-color:#DFDFDF;border:solid 0px #DFDFDF;" /> 
							</form:form>
							<span id="edit_collection" style="display:none; font-size:70%">
        						<font style="font-size:80%;">未收藏，点击添加收藏</font>
        					</span>
        					</c:if>
        				</c:forEach>
        				<%
        			}
				%>
        		</c:if>      	
        		
        		
 
        		
        		
        				
      			</div>
      				<div class="main_window">
      					<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      						 						
      							<li>
      								<font class="title_name_little">
      									服务项目名称：${technology.title}
      								</font>
      								<div class="faceplate" >
										<div class="embed">
											
											<strong>类型：</strong>常规技术服务
											<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											<c:if test="${!empty technology.target}">
												<strong>品系/类型：</strong>												
												${technology.target}	
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											</c:if>		
											
											<c:if test="${!empty technology.abstract_text}">
												<strong>主要服务内容：</strong>${technology.abstract_text}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty technology.cycle}">
												<strong>预定期限：</strong>${technology.cycle}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty technology.price_public}">
												<strong>市场价格：</strong>${technology.price_public}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${pageContext.request.userPrincipal.name != null}">											
												<c:if test="${!empty technology.price_private}">
													<strong>所内价格：</strong>${technology.price_private}
													<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
												</c:if>
											</c:if>												
											<c:if test="${!empty technology.organization.name}">
													<strong>提供机构：</strong>${technology.organization.name}
													<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<div  id="contacts" class="contacts">											
													<c:if test="${!empty technology.contact}">
														<font class="f-deepblue">联系人：</font>${technology.contact}
														<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
													</c:if>													
											</div>
											<a id="contacts_more" class="contacts_more" href="javascript:void(0);">+&nbsp;&nbsp;联系方式</a>
											<a id="contacts_less" class="contacts_less" href="javascript:void(0);">-&nbsp;&nbsp;收起</a>									
											<p></p>										
																		
										</div>
									</div>
								</li>  
						<div class="line"></div>
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
      					     	<ul> 
      							<!-- ====================================================以下为第二层信息【技术详情】=============================================================== -->    																
      								<li class="line">
      									<div id="second_level_menu_title-01" class="second_leve_menu">
      										<a href="javascript:void(0);">
      										<img id="second_level_menu_image-01" src="resources/images/plus.png">
      											<span>技术详情</span>
      										</a>
      									</div>
      									<div id="second_level_menu-01" class="second_level_text">
											<p></p>
											<c:if test="${!empty technology.note}">
												${technology.note}
											</c:if>											
										</div>
									</li>  
      								<!-- ====================================================以上为第二层信息【技术详情】=============================================================== -->  
      								</ul>	
								<c:if test="${!empty technology.time}">
									<p><div class="text-right" style=" text-align:right;">发布时间：${technology.time}&nbsp;</div></p>
								</c:if>	
						</div>
			</div>
		</div>
		</div>
		</div>
		
<jsp:include page="foot.jsp"/>
	</body>
</html>