
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
      					
						<c:url var="addAction" value="/super/biochemical_data/add"></c:url>
      					<form:form action="${addAction}" commandName="biochemical_data" id="input-date">
      					<ul> 
      					<!-- ====================================================以下为第二层信息【生化数据】=============================================================== -->    																
      					<li class="line">
      						<div class="second_leve_menu">
	      						<a href="javascript:void(0);">
      								<span>生化数据</span>
      							</a>
      						</div>
      						<div class="second_level_input">
      						<p></p>
							<form:input path="strain_id.id" value="${strain.id}" readonly="true" type="hidden"/>
							<form:input id="biochemical_classification" path="biochemical_classification" value="urine_biochemical_data" readonly="true" type="hidden"/>
							<strong>
								测定组数据：
							</strong>
								<div class="dotted-line-nocolor"></div>
								<form:label path="age"><font class="second-embed">年龄：</font></form:label><form:input path="age"/><div class="dotted-line-nocolor"></div>
								<form:label path="sex"><font class="second-embed">性别：</font></form:label><form:input path="sex"/><div class="dotted-line-nocolor"></div>
								<form:label path="number"><font class="second-embed">测定数量：</font></form:label><form:input path="number"/><div class="dotted-line-nocolor"></div>
								<br/><div class="dotted-line"></div>
      							
      									<strong>
												尿生化参数：
										</strong>
											<div class="dotted-line-nocolor"></div>
											<form:label path="urine_ph"><font class="second-embed">尿液pH：</font></form:label><form:input path="urine_ph"/><div class="dotted-line-nocolor"></div>
											<form:label path="up"><font class="second-embed">尿蛋白：</font></form:label><form:input path="up"/><font class="second-embed-unit">ng/mL</font><div class="dotted-line-nocolor"></div>
											<form:label path="ua"><font class="second-embed">尿酸：</font></form:label><form:input path="ua"/><font class="second-embed-unit">ng/mL</font><div class="dotted-line-nocolor"></div>
											<font class="second-embed">
												尿电解质：
											</font>
											<div class="dotted-line-nocolor"></div>
											<form:label path="urine_na"><font class="third-embed">Na<span style="vertical-align:super; font-size:80%">+</span>：</font></form:label><form:input path="urine_na"/><font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="urine_k"><font class="third-embed">K<span style="vertical-align:super; font-size:80%">+</span>：</font></form:label><form:input path="urine_k"/><font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="urine_ca"><font class="third-embed">Ca<span style="vertical-align:super; font-size:80%">2+</span>：</font></form:label><form:input path="urine_ca"/><font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="urine_mg"><font class="third-embed">Mg<span style="vertical-align:super; font-size:80%">2+</span>：</font></form:label><form:input path="urine_mg"/><font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="urine_cl"><font class="third-embed">Cl<span style="vertical-align:super; font-size:80%">-</span>：</font></form:label><form:input path="urine_cl"/><font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="specific_weight"><font class="second-embed">比重：</font></form:label><form:input path="specific_weight"/><div class="dotted-line-nocolor"></div>
											<form:label path="upd"><font class="second-embed">尿量：</font></form:label><form:input path="upd"/><font class="second-embed-unit">ml/g/天</font><div class="dotted-line-nocolor"></div>
											<br/><div class="dotted-line"></div>
								
      							</div>
      							<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>
									<div id="submit">
											<input type="submit" value="<spring:message text="添加生化数据"/>" />
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