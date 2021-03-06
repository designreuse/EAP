
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
        <script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script> 
      </head>
      <body>  
		<jsp:include page="backstage_head.jsp"/> 
		<a name="top" id="top"></a>
		<div id="content">
		<div class="inner">
		<p></p><p></p><p></p><p></p><p></p><p></p>
		<div class="container_12">	
      	<div class="picture-frame-gray">
      		<c:if test="${pageContext.request.userPrincipal.name != null}">
				<c:forEach items="${listAdmins}" var="admin">
					<c:if test="${admin.name eq pageContext.request.userPrincipal.name}">							
						<c:if test="${admin.authority eq 'SUPER'}">										
							<c:url var="addAction" value="/super/experimental_animal/update/${experimental_animal.id}" ></c:url>
						</c:if>								
						<c:if test="${admin.authority eq 'ADMIN'}">										
							<c:url var="addAction" value="/admin/experimental_animal/update/${experimental_animal.id}" ></c:url>
						</c:if>	
					</c:if>
				</c:forEach>
			</c:if>
      		
      		
      		<form:form action="${addAction}" commandName="experimental_animal" id="input-date">
      					<div class="title_name">
      						<c:if test="${!empty experimental_animal.name}">
      							实验动物编号：${experimental_animal.id}
      							<form:input path="id" readonly="true" size="8"  disabled="true" hidden="none"/>
								<form:hidden path="id" />
        					</c:if>
      					</div>
      					<div class="main_window">
      					<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      						<li>
      								<font class="title_name_little">
      									实验动物名称：<form:input path="name"/>
      								</font>
      								<div class="faceplate" >
										<div class="embed">
												<strong>品系：</strong>
												<form:select path="strain_id.id">
													<option value="${experimental_animal.strain_id.id}">${experimental_animal.strain_id.name}</option>			
														<c:forEach items="${listStrains}" var="strain">
															<c:if test="${experimental_animal.strain_id.id != strain.id}">
																<option value="${strain.id}">${strain.name}</option>
															</c:if>	
														</c:forEach>
  												</form:select>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
												<strong>图片：</strong>
												<form:select path="photo_id.id">
													<option value="${experimental_animal.photo_id.id}">${experimental_animal.photo_id.name}</option>			
														<c:forEach items="${listFiles}" var="photo">
															<c:if test="${experimental_animal.photo_id.id != photo.id}">
																<option value="${photo.id}">${photo.name}</option>
															</c:if>	
														</c:forEach>
  												</form:select>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											<form:label path="dna_name"><strong>基因名：</strong></form:label><form:input path="dna_name"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											<form:label path="phenotype"><strong>表型描述：</strong></form:label><form:input path="phenotype"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											<form:label path="application"><strong>主要用途：</strong></form:label><form:input path="application"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											<form:label path="preparation"><strong>制备方式：</strong></form:label><form:input path="preparation"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											<form:label path="preparation_ref"><strong>参考文献：</strong></form:label><form:textarea path="preparation_ref"/>
												<script type="text/javascript">CKEDITOR.replace('preparation_ref');</script>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											<form:label path="origin"><strong>动物模型来源：</strong></form:label><form:input path="origin"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											<form:label path="save_info"><strong>储存信息：</strong></form:label><form:input path="save_info"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											<strong>联系人：</strong>
											<form:select path="contact_id.id">
													<option value="${experimental_animal.contact_id.id}">${experimental_animal.contact_id.name}</option>			
														<c:forEach items="${listPersons}" var="contact">
															<c:if test="${experimental_animal.contact_id.id != contact.id}">
																<option value="${contact.id}">${contact.name}</option>
															</c:if>	
														</c:forEach>
  											</form:select>
											<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											<form:label path="quantity"><strong>储存量：</strong></form:label><form:input path="quantity"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											<form:label path="note"><strong>备注：</strong></form:label><form:textarea path="note"/>
												<script type="text/javascript">CKEDITOR.replace('note');</script>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											<%
												String admin_name = "${pageContext.request.userPrincipal.name}";
											%>		
											<c:forEach items="${listAdmins}" var="admin">
												<c:if test="${admin.name eq pageContext.request.userPrincipal.name}">
													<form:input path="issuer_id.id" value="${admin.id}" readonly="true" type="hidden"/>
												</c:if>
											</c:forEach>
											<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>	
											</div>
										<div id="submit">
											<input type="submit" value="<spring:message text="更新实验动物信息"/>" />
										</div>
									</div>
								</li>
			</form:form>
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
      						
						</div>
					</div>
				</div>
			</div>		
<jsp:include page="backstage_foot.jsp"/>
	</body>
</html>