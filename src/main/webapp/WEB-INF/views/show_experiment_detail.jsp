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
							<form:form action="${addAction}" commandName="experiment">
							<div class="testimonial-block">								
										<strong class="picture-frame-black" >${experiment.title}</strong>										
											<p><strong class="class">所属单位：${experiment.organization.name}</strong></p>
											<hr style="height:1px;border:none;border-top:1px solid #555555;" /><br/>
												
												<p></p>
												<div class="picture-frame-gray">
												<p></p>												
												<c:if test="${!empty experiment.team}">
												研究团队：${experiment.team}<p></p>
												<hr style="height:10px;border:none;border-top:3px groove #009999;" />
												</c:if>
												
												
												<p></p>
													<c:if test="${!empty experiment.animals}">
													<strong class="f-deepblue">使用动物：</strong>
														<c:forEach items="${experiment.animals}" var="animals">
      															<td><a target="_blank" href="show/animal/detail/${animals.id}" class="button1">${animals.name}</a></td>
      													</c:forEach>
													<p></p>
													<hr style="height:10px;border:none;border-top:3px groove #009999;" />
													</c:if>																								
												</div>
												<p></p>
												<div class="picture-frame-gray">												
												<p></p>											
												<c:if test="${!empty experiment.note}">
												${experiment.note}<p></p>
												</c:if>
												<c:if test="${!empty experiment.time}">
												<hr style="height:10px;border:none;border-top:3px groove #009999;" />
													<c:if test="${!empty experiment.issuer.id}">
														<div class="text-right" style=" text-align:right;">发布人：${experiment.issuer.name}&nbsp;&nbsp; | &nbsp;&nbsp;发布时间：${experiment.time}</div><p></p>
													</c:if>
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
