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
				<div class="wrapper444">
						<div class="block">
							<div class="wrapper">
									<h2>设备资源列表</h2>
									<c:if test="${!empty showEquipments}">
									<c:forEach items="${showEquipments}" var="equipment">
									<div class="wrapper">
									<div class="testimonial-block">
										<figure class="img-indent"><img src="${equipment.image.url}${equipment.image.name}${equipment.image.type}" alt=""><br/><a target="_blank" href="show/equipment/detail/${equipment.id}" class="button1">>详情</a><p></p></figure>
										<strong class="picture-frame-black" >${equipment.name}</strong>

											<p><strong class="class">类别：${equipment.classification}设备</strong></p><p></p>
											<hr style="height:1px;border:none;border-top:1px solid #555555;" /><br/>
											${equipment.version}<br/>	
									</div>	
									</div>
									<p></p>	
									</c:forEach>
									</c:if>
								</div>
							</div>
						</div>
				</div>
			</div>			
		</div>

<jsp:include page="foot.jsp"/>
</body>
</html>
