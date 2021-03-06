
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
							<form:input id="biochemical_classification" path="biochemical_classification" value="blood_biochemical_data" readonly="true" type="hidden"/>
							<strong>
								测定组数据：
							</strong>
								<div class="dotted-line-nocolor"></div>
								<form:label path="age"><font class="second-embed">年龄：</font></form:label><form:input path="age"/><div class="dotted-line-nocolor"></div>
								<form:label path="sex"><font class="second-embed">性别：</font></form:label><form:input path="sex"/><div class="dotted-line-nocolor"></div>
								<form:label path="number"><font class="second-embed">测定数量：</font></form:label><form:input path="number"/><div class="dotted-line-nocolor"></div>
								<br/><div class="dotted-line"></div>
      							
      									<strong>
												血液生化参数：
										</strong>
											<div class="dotted-line-nocolor"></div>
											<form:label path="blood_ph"><font class="second-embed">血液pH：</font></form:label><form:input path="blood_ph"/><div class="dotted-line-nocolor"></div>
											<font class="second-embed">
												血电解质：
											</font>
											<div class="dotted-line-nocolor"></div>
											<form:label path="blood_na"><font class="third-embed">Na<span style="vertical-align:super; font-size:80%">+</span>：</font></form:label><form:input path="blood_na"/><font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="blood_k"><font class="third-embed">K<span style="vertical-align:super; font-size:80%">+</span>：</font></form:label><form:input path="blood_k"/><font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="blood_ca"><font class="third-embed">Ca<span style="vertical-align:super; font-size:80%">2+</span>：</font></form:label><form:input path="blood_ca"/><font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="blood_mg"><font class="third-embed">Mg<span style="vertical-align:super; font-size:80%">2+</span>：</font></form:label><form:input path="blood_mg"/><font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="blood_cl"><font class="third-embed">Cl<span style="vertical-align:super; font-size:80%">-</span>：</font></form:label><form:input path="blood_cl"/><font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="blood_p"><font class="third-embed">P<span style="vertical-align:super; font-size:80%">+</span>：</font></form:label><form:input path="blood_p"/><font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="blood_fe"><font class="third-embed">Fe<span style="vertical-align:super; font-size:80%">2+</span>：</font></form:label><form:input path="blood_fe"/><font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="ast"><font class="second-embed">谷草转氨酶：</font></form:label><form:input path="ast"/><font class="second-embed-unit">U/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="alt"><font class="second-embed">谷丙转氨酶：</font></form:label><form:input path="alt"/><font class="second-embed-unit">U/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="alp"><font class="second-embed">碱性磷酸酶：</font></form:label><form:input path="alp"/><font class="second-embed-unit">U/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="ldh"><font class="second-embed">乳酸脱氢酶：</font></form:label><form:input path="ldh"/><font class="second-embed-unit">U/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="cre"><font class="second-embed">肌苷：</font></form:label><form:input path="cre"/><font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="bun"><font class="second-embed">尿素氮：</font></form:label><form:input path="bun"/><font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="tch"><font class="second-embed">总胆固醇：</font></form:label><form:input path="tch"/><font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="tp"><font class="second-embed">血清总蛋白：</font></form:label><form:input path="tp"/><font class="second-embed-unit">g/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="alb"><font class="second-embed">白蛋白：</font></form:label><form:input path="alb"/><font class="second-embed-unit">g/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="tg"><font class="second-embed">甘油三脂：</font></form:label><form:input path="tg"/><font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="glu"><font class="second-embed">血糖：</font></form:label><form:input path="glu"/><font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="progesterone"><font class="second-embed">孕酮：</font></form:label><form:input path="progesterone"/><font class="second-embed-unit">ng/mL</font><div class="dotted-line-nocolor"></div>
											<form:label path="total_bilirubin"><font class="second-embed">总胆红素：</font></form:label><form:input path="total_bilirubin"/><font class="second-embed-unit">μmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="c_hdl"><font class="second-embed">高密度脂蛋白胆固醇：</font></form:label><form:input path="c_hdl"/><font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="c_ldl"><font class="second-embed">低密度脂蛋白胆固醇：</font></form:label><form:input path="c_ldl"/><font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
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
					</div>
					</form:form>
						</div>
					</div>
				</div>
			</div>		
<jsp:include page="../backstage_foot.jsp"/>
	</body>
</html>