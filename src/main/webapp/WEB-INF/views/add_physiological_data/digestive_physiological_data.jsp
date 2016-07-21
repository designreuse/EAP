
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
										<form:input id="physiological_classification" path="physiological_classification" value="digestive_physiological_data" readonly="true" type="hidden"/>
										<strong>
												测定组数据：
										</strong>
											<div class="dotted-line-nocolor"></div>
											<form:label path="age"><font class="second-embed">年龄：</font></form:label><form:input path="age"/><div class="dotted-line-nocolor"></div>
											<form:label path="sex"><font class="second-embed">性别：</font></form:label><form:input path="sex"/><div class="dotted-line-nocolor"></div>
											<form:label path="number"><font class="second-embed">测定数量：</font></form:label><form:input path="number"/><div class="dotted-line-nocolor"></div>
											<br/><div class="dotted-line"></div>
      								<div id="blood_physiological_data" class="second_classification">
										<strong>
												血液生理参数：
										</strong>
											<div class="dotted-line-nocolor"></div>
											<form:label path="blood_volume"><font class="second-embed">血量：</font></form:label><form:input path="blood_volume"/><font class="second-embed-unit">ml</font><div class="dotted-line"></div>
											<form:label path="plasma_volume"><font class="second-embed">血浆量：</font></form:label><form:input path="plasma_volume"/><font class="second-embed-unit">ml</font><div class="dotted-line"></div>
											<font class="second-embed">
												红细胞：
											</font>
											<div class="dotted-line-nocolor"></div>
											<form:label path="rbc"><font class="third-embed">计数：</font></form:label><form:input path="rbc"/><font class="third-embed-unit">×10<span style="vertical-align:super; font-size:80%">6</span>/μL</font><div class="dotted-line-nocolor"></div>
											<form:label path="mcv"><font class="third-embed">体积：</font></form:label><form:input path="mcv"/><font class="third-embed-unit">fL</font><div class="dotted-line-nocolor"></div>
											<form:label path="mct"><font class="third-embed">平均厚度：</font></form:label><form:input path="mct"/><font class="third-embed-unit">μm</font><div class="dotted-line-nocolor"></div>
											<form:label path="rdw"><font class="third-embed">分布宽度：</font></form:label><form:input path="rdw"/><font class="third-embed-unit">%CV</font><div class="dotted-line-nocolor"></div>
											<form:label path="hb"><font class="third-embed">血红蛋白：</font></form:label><form:input path="hb"/><font class="third-embed-unit">g/L</font><div class="dotted-line-nocolor"></div>
											<form:label path="hct"><font class="third-embed">压积：</font></form:label><form:input path="hct"/><font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
											<form:label path="mch"><font class="third-embed">血红蛋白含量：</font></form:label><form:input path="mch"/><font class="third-embed-unit">pG</font><div class="dotted-line-nocolor"></div>
											<form:label path="mchc"><font class="third-embed">血红蛋白浓度：</font></form:label><form:input path="mchc"/><font class="third-embed-unit">g/L</font><div class="dotted-line-nocolor"></div>
											<br/><div class="dotted-line"></div>				
      										<font class="second-embed">
												白细胞：
											</font>
											<div class="dotted-line-nocolor"></div>
											<form:label path="wbc"><font class="third-embed">计数：</font></form:label><form:input path="wbc"/><font class="third-embed-unit">×10<span style="vertical-align:super; font-size:80%">3</span>/μL</font><div class="dotted-line-nocolor"></div>
											<form:label path="w_ne"><font class="third-embed">嗜中性白细胞：</font></form:label><form:input path="w_ne"/><div class="dotted-line-nocolor"></div>
											<form:label path="eo"><font class="third-embed">嗜酸性白细胞：</font></form:label><form:input path="eo"/><font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
											<form:label path="ba"><font class="third-embed">嗜硷性白细胞：</font></form:label><form:input path="ba"/><font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
											<form:label path="ly"><font class="third-embed">淋巴细胞：</font></form:label><form:input path="ly"/><font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
											<form:label path="mo"><font class="third-embed">单核细胞：</font></form:label><form:input path="mo"/><font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
											<br/><div class="dotted-line"></div>				
      										<font class="second-embed">
												血小板：
											</font>
											<div class="dotted-line-nocolor"></div>
											<form:label path="plt"><font class="third-embed">计数：</font></form:label><form:input path="plt"/><font class="third-embed-unit">×10<span style="vertical-align:super; font-size:80%">3</span>/μL</font><div class="dotted-line-nocolor"></div>
											<form:label path="mpv"><font class="third-embed">平均容积：</font></form:label><form:input path="mpv"/><font class="third-embed-unit">fL</font><div class="dotted-line-nocolor"></div>
											<form:label path="pdw"><font class="third-embed">分布宽度：</font></form:label><form:input path="pdw"/><font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
											<br/><div class="dotted-line"></div>
									</div>
									
      								
      									<strong>
												消化生理参数：
										</strong>						
      										<form:label path="digestive_index"><font class="second-embed">消化能力：</font></form:label><form:input path="digestive_index"/><div class="dotted-line-nocolor"></div><div class="dotted-line"></div>
									
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