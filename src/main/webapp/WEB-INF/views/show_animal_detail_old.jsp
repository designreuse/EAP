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
							<form:form action="${addAction}" commandName="animal">
							<div class="testimonial-block">
										<!--<p>动物名称:<form:input path="name" readonly="true" /></p>-->
									<figure class="img-indent"><img src="${animal.image.url}${animal.image.name}${animal.image.type}" alt=""><br/><p></p></figure>
										<strong class="picture-frame-black" >${animal.name}</strong>
											<p><strong class="class">类别：${animal.classification}</strong><div class="text-right" style=" text-align:right;">发布时间：${animal.time}</div></p>
											<hr style="height:1px;border:none;border-top:1px solid #555555;" /><br/>
												<div class="picture-frame-gray">
												<p></p>												
												<c:if test="${!empty animal.strain}">
												<strong class="f-deepblue">品系：</strong>${animal.strain}<p></p>
												<hr style="height:10px;border:none;border-top:3px groove #009999;" />
												</c:if>
												<c:if test="${!empty animal.preparation}">
												<strong class="f-deepblue">制备方法：</strong>${animal.preparation}<p></p>
												<hr style="height:10px;border:none;border-top:3px groove #009999;" />
												</c:if>
												<c:if test="${!empty animal.phenotype}">
												<strong class="f-deepblue">表型特征：</strong>${animal.phenotype}<p></p>
												<hr style="height:10px;border:none;border-top:3px groove #009999;" />
												</c:if>
												<c:if test="${!empty animal.origin}">
												<strong class="f-deepblue">来源：</strong>${animal.origin}<p></p>
												<hr style="height:10px;border:none;border-top:3px groove #009999;" />
												</c:if>
												<c:if test="${!empty animal.note}">
												<strong class="f-deepblue">简介：</strong>${animal.note}<p></p>
												</c:if>
												</div>
												<br/>
												
													<div class="picture-frame-gray">
													<p></p>
													<c:if test="${!empty animal.experiments}">
													<strong class="f-deepblue">相关实验：</strong>
														<c:forEach items="${animal.experiments}" var="experiments">
      															<td><a target="_blank" href="show/experiment/detail/${experiments.id}" class="button1">${experiments.title}</a></td>
      													</c:forEach>
													<p></p>
													<hr style="height:10px;border:none;border-top:3px groove #009999;" />
													</c:if>
													<c:if test="${!empty animal.strain}">
													<strong class="f-deepblue">相关成果：</strong>${animal.strain}<p></p>
													</c:if>
													</div>
													<br/>
												
												<div class="picture-frame-gray">
												<p></p>
												<c:if test="${!empty animal.contact.name}">
												<strong class="f-deepblue">联系人：</strong>${animal.contact.name}<p></p>
												<hr style="height:10px;border:none;border-top:3px groove #009999;" />
												</c:if>
												<c:if test="${!empty animal.contact.organization.address}">
												<strong class="f-deepblue">联系地址：</strong>${animal.contact.organization.address}<p></p>
												<hr style="height:10px;border:none;border-top:3px groove #009999;" />
												</c:if>
												<c:if test="${!empty animal.contact.organization.name}">
												<strong class="f-deepblue">联系单位：</strong>${animal.contact.organization.name}<p></p>
												<hr style="height:10px;border:none;border-top:3px groove #009999;" />
												</c:if>
												<c:if test="${!empty animal.contact.telephone}">
												<strong class="f-deepblue">联系电话：</strong>${animal.contact.telephone}<p></p>
												<hr style="height:10px;border:none;border-top:3px groove #009999;" />
												</c:if>
												<c:if test="${!empty animal.contact.email}">
												<strong class="f-deepblue">邮箱：</strong>${animal.contact.email}<p></p>
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
