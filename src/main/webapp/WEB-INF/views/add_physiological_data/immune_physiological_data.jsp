
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
      					
						<c:url var="addAction" value="/super/physiological_data/add" ></c:url>
      					<form:form action="${addAction}" commandName="physiological_data" id="input-date">
      					<ul> 
      							<!-- ====================================================以下为第二层信息【遗传数据】=============================================================== -->    																
      							<li class="line">
	      								<div class="second_leve_menu">
	      									<a href="javascript:void(0);">
      											<span>生理数据</span>
      										</a>
      									</div>
      								<div class="second_level_input">
      									<p></p>
										<form:input path="strain_id.id" value="${strain.id}" readonly="true" type="hidden"/>
										<form:input id="physiological_classification" path="physiological_classification" value="immune_physiological_data" readonly="true" type="hidden"/>
										<strong>
												测定组数据：
										</strong>
											<div class="dotted-line-nocolor"></div>
											<form:label path="age"><font class="second-embed">年龄：</font></form:label><form:input path="age"/><div class="dotted-line-nocolor"></div>
											<form:label path="sex"><font class="second-embed">性别：</font></form:label><form:input path="sex"/><div class="dotted-line-nocolor"></div>
											<form:label path="number"><font class="second-embed">测定数量：</font></form:label><form:input path="number"/><div class="dotted-line-nocolor"></div>
											<br/><div class="dotted-line"></div>
      								
      									<strong>
												免疫生理参数：
										</strong>								
      									<font class="second-embed">
												免疫球蛋白：
										</font>
											<div class="dotted-line-nocolor"></div>
											<form:label path="igg"><font class="third-embed">IgG：</font></form:label><form:input path="igg"/><font class="third-embed-unit">mg/dl</font><div class="dotted-line-nocolor"></div>
											<form:label path="igm"><font class="third-embed">IgM：</font></form:label><form:input path="igm"/><font class="third-embed-unit">mg/dl</font><div class="dotted-line-nocolor"></div>
											<form:label path="igd"><font class="third-embed">IgD：</font></form:label><form:input path="igd"/><font class="third-embed-unit">mg/dl</font><div class="dotted-line-nocolor"></div>
											<form:label path="iga"><font class="third-embed">IgA：</font></form:label><form:input path="iga"/><font class="third-embed-unit">mg/dl</font><div class="dotted-line-nocolor"></div>
											<form:label path="ige"><font class="third-embed">IgE：</font></form:label><form:input path="ige"/><font class="third-embed-unit">mg/dl</font><div class="dotted-line-nocolor"></div>
										<font class="second-embed">
												免疫活性细胞表型：
										</font>
											<div class="dotted-line-nocolor"></div>
											<form:label path="t_cell"><font class="third-embed">T细胞：</font></form:label><form:input path="t_cell"/><div class="dotted-line-nocolor"></div>
											<form:label path="b_cell"><font class="third-embed">B细胞：</font></form:label><form:input path="b_cell"/><div class="dotted-line-nocolor"></div>
									
      								</div>
      							<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>
									<div id="submit">
											<input type="submit" value="<spring:message text="添加生理数据"/>" />
									</div>
									<p></p>
      						</li>  
									
      						<!-- ====================================================以上为第二层信息【遗传数据】=============================================================== -->  
      					</ul>
								
									<c:if test="${!empty physiological_data.time}">
											<p><div class="text-right" style=" text-align:right;">上次更新时间：${physiological_data.time}</div></p>
									</c:if>
					</div>
					</form:form>
						</div>
					</div>
				</div>
			</div>		
<jsp:include page="../backstage_foot.jsp"/>
	</body>
</html>