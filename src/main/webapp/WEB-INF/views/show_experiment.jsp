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
				<div class="wrapper">
						<div class="block">
							<div class="wrapper">
									<h2>实验列表</h2>
									<div class="testimonial-block">
									<table class="announcementlist-big">
										<c:if test="${!empty showExperiments}">
										<c:forEach items="${showExperiments}" var="experiment">
										
											<tr><td>•<a href="show/experiment/detail/${experiment.id}" target="_blank">&nbsp;${experiment.title}</a>&nbsp;&nbsp;&nbsp;</td><td>${experiment.time}</td></tr>
													<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td></tr>
										
										</c:forEach>
										</c:if>									
									</table>								
									</div>
								</div>
							</div>
						</div>
				</div>
			</div>			
		</div>

<jsp:include page="foot.jsp"/>
</body>
</html>
