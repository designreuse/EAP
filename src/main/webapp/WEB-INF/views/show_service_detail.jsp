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
<title>中国科学院特色与模式动物信息化平台台</title>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<jsp:include page="head.jsp"/>

<div id="content">
		<div class="inner">
			<div class="container_12">				
				<div class="wrapper">
				<div class="block"></div>
				</div>
						<div class="block">
							<h2>详情</h2>
							<form:form action="${addAction}" commandName="function">
							<div class="testimonial-block">
										<!--<p>动物名称:<form:input path="name" readonly="true" /></p>-->
									<strong class="picture-frame-black" >${function.name}</strong>
											<p><strong class="class">类别：${function.classification}</strong><div class="text-right" style=" text-align:right;">发布时间：${function.time}</div></p>
											<hr style="height:1px;border:none;border-top:1px solid #555555;" /><br/>
												<div class="picture-frame-gray">
												<p></p>	
												<c:if test="${!empty function.note}">
												<strong class="f-deepblue">简介：</strong>${function.note}<p></p>
												</c:if>
												</div>
												<br/>
												
												
												
												<div class="picture-frame-gray">
												<p></p>
												<c:if test="${!empty function.contact.name}">
												<strong class="f-deepblue">联系人：</strong>${function.contact.name}<p></p>
												<hr style="height:10px;border:none;border-top:3px groove #009999;" />
												</c:if>
												<c:if test="${!empty function.contact.organization.address}">
												<strong class="f-deepblue">联系地址：</strong>${function.contact.organization.address}<p></p>
												<hr style="height:10px;border:none;border-top:3px groove #009999;" />
												</c:if>
												<c:if test="${!empty function.contact.organization.name}">
												<strong class="f-deepblue">联系单位：</strong>${function.contact.organization.name}<p></p>
												<hr style="height:10px;border:none;border-top:3px groove #009999;" />
												</c:if>
												<c:if test="${!empty function.contact.telephone}">
												<strong class="f-deepblue">联系电话：</strong>${function.contact.telephone}<p></p>
												<hr style="height:10px;border:none;border-top:3px groove #009999;" />
												</c:if>
												<c:if test="${!empty function.contact.email}">
												<strong class="f-deepblue">邮箱：</strong>${function.contact.email}<p></p>
												</c:if>
												</div>
							</div>											
							</form:form>
							</div>
			</div>
			</div>
</div>	

<jsp:include page="foot.jsp"/>
</body>
</html>
