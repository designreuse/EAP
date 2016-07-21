
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
        	<title>品系详情</title>  
	</head>
      <body>  
		<jsp:include page="../backstage_head.jsp"/> 
		<a name="top" id="top"></a>
		<div id="content">
		<div class="inner">
		<p></p><p></p><p></p><p></p><p></p><p></p>
		<div class="container_12">	
      	<div class="picture-frame-gray">
      					
      					<div class="title_name">
        					品系编号：${strain.id}
      					</div>
      					<div class="main_window">
      					<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      						<c:if test="${!empty listStrains}">      						
      							<li>
      								<font class="title_name_little">
      									品系名称：${strain.name}
      								</font>
      								<div class="faceplate" >
										<div class="embed">
      										<c:if test="${!empty strain.cultivation_year}">
												<strong>培育年份：</strong>${strain.cultivation_year}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty strain.introduce_year}">
												<strong>引入时间：</strong>${strain.introduce_year}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty strain.cultivationer}">
												<strong>培育机构或人：</strong>${strain.cultivationer}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty strain.hereditary_feature}">
												<strong>遗传特征：</strong>${strain.hereditary_feature}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty strain.microbiological_grade}">
												<strong>微生物学等级：</strong>${strain.microbiological_grade}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty strain.germplasm_resources}">
												<strong>种质来源：</strong>${strain.germplasm_resources}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>								
										</div>
									</div>
								</li>  
							</c:if>	
						<div class="line"></div>
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
      					
						<c:url var="addAction" value="/super/autopsy_data/add"></c:url>
      					<form:form action="${addAction}" commandName="autopsy_data" id="input-date">
      					<ul> 
      					<!-- ====================================================以下为第二层信息【生化数据】=============================================================== -->    																
      					<li class="line">
      						<div class="second_leve_menu">
	      						<a href="javascript:void(0);">
      								<span>解剖数据</span>
      							</a>
      						</div>
      						<div class="second_level_input">
      						<p></p>
							<form:input path="strain_id.id" value="${strain.id}" readonly="true" type="hidden"/>
							<form:input id="autopsy_classification" path="autopsy_classification" value="skeleton_data" readonly="true" type="hidden"/>
							<strong>
								测定组数据：
							</strong>
								<div class="dotted-line-nocolor"></div>
								<form:label path="age"><font class="second-embed">年龄：</font></form:label><form:input path="age"/><div class="dotted-line-nocolor"></div>
								<form:label path="sex"><font class="second-embed">性别：</font></form:label><form:input path="sex"/><div class="dotted-line-nocolor"></div>
								<form:label path="number"><font class="second-embed">测定数量：</font></form:label><form:input path="number"/><div class="dotted-line-nocolor"></div>
								<br/><div class="dotted-line"></div>
      								<strong>
										骨骼：
									</strong>
									<div class="dotted-line-nocolor"></div>
										<form:label path="totality_skeleton"><font class="second-embed">骨骼总数：</font></form:label><form:input path="totality_skeleton"/><div class="dotted-line-nocolor"></div>
										<form:label path="skull"><font class="second-embed">头骨：</font></form:label><form:input path="skull"/><div class="dotted-line-nocolor"></div>
										<form:label path="cervical_vertebra"><font class="second-embed">颈椎：</font></form:label><form:input path="cervical_vertebra"/><div class="dotted-line-nocolor"></div>
										<form:label path="thoracalis_vertebra"><font class="second-embed">胸椎：</font></form:label><form:input path="thoracalis_vertebra"/><div class="dotted-line-nocolor"></div>
										<form:label path="lumbalis_vertebra"><font class="second-embed">腰椎：</font></form:label><form:input path="lumbalis_vertebra"/><div class="dotted-line-nocolor"></div>
										<form:label path="sacrales_vertebra"><font class="second-embed">骶椎：</font></form:label><form:input path="sacrales_vertebra"/><div class="dotted-line-nocolor"></div>
										<form:label path="coccygeal_vertebra"><font class="second-embed">尾椎：</font></form:label><form:input path="coccygeal_vertebra"/><div class="dotted-line-nocolor"></div>
										<form:label path="bird_sternum_length"><font class="second-embed">龙骨长：</font></form:label><form:input path="bird_sternum_length"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
										<form:label path="pelvis_width"><font class="second-embed">股盆宽：</font></form:label><form:input path="pelvis_width"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
										<form:label path="tibia_length"><font class="second-embed">胫长：</font></form:label><form:input path="tibia_length"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
										<br/><div class="dotted-line"></div>
								</div>
      							<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>
									<div id="submit">
											<input type="submit" value="<spring:message text="添加骨骼数据"/>" />
									</div>
									<p></p>
      						</li>  	
      						<!-- ====================================================以上为第二层信息【遗传数据】=============================================================== -->  
      					</ul>
					</div>
					</form:form>
						</div>
					</div>
				</div>
			</div>		
<jsp:include page="../backstage_foot.jsp"/>
	</body>
</html>