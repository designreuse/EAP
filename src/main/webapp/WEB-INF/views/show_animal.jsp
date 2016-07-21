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
									<h2>动物资源列表</h2>
									<c:if test="${!empty showAnimals}">
									<c:forEach items="${showAnimals}" var="animal">
									<div class="wrapper">
									<div class="testimonial-block">
										<figure class="img-indent"><img src="${animal.image.url}${animal.image.name}${animal.image.type}" alt=""><br/><a target="_blank" href="show/animal/detail/${animal.id}" class="button1">>详情</a><p></p></figure>
										<strong class="picture-frame-black" >${animal.name}</strong>

											<p><strong class="class">类别：${animal.classification}</strong></p><p></p>
											<hr style="height:1px;border:none;border-top:1px solid #555555;" /><br/>
											${animal.summary}<br/>	
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
