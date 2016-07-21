
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
		<jsp:include page="backstage_head.jsp"/> 
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
      					
						<c:url var="addAction" value="/super/physiological_data/update/${physiological_data.id}" ></c:url>
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
										<form:input path="physiological_classification" value="${physiological_data.physiological_classification}" readonly="true" type="hidden"/>
										<strong>
												测定组数据：
										</strong>
											<div class="dotted-line-nocolor"></div>
											<form:label path="age"><font class="second-embed">年龄：</font></form:label><form:input path="age"/><div class="dotted-line-nocolor"></div>
											<form:label path="sex"><font class="second-embed">性别：</font></form:label><form:input path="sex"/><div class="dotted-line-nocolor"></div>
											<form:label path="number"><font class="second-embed">测定数量：</font></form:label><form:input path="number"/><div class="dotted-line-nocolor"></div>
											<br/><div class="dotted-line"></div>
      									<c:if test="${physiological_data.physiological_classification eq 'blood_physiological_data'}">
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
									</c:if>
									<c:if test="${physiological_data.physiological_classification eq 'reproduction_physiological_data'}">		
										<strong>
												生殖生理参数：
										</strong><div class="dotted-line-nocolor"></div>		
      										<font class="second-embed">
												性成熟：
											</font>
											<div class="dotted-line-nocolor"></div>
											<form:label path="first_estrus"><font class="third-embed">初次发情：</font></form:label><form:input path="first_estrus"/><font class="third-embed-unit">d</font><div class="dotted-line-nocolor"></div>
											<form:label path="estrus"><font class="third-embed">发情期：</font></form:label><form:input path="estrus"/><font class="third-embed-unit">h</font><div class="dotted-line-nocolor"></div>
											<form:label path="estrus_period"><font class="third-embed">发情周期：</font></form:label><form:input path="estrus_period"/><font class="third-embed-unit">d</font><div class="dotted-line-nocolor"></div><div class="dotted-line"></div>
											<form:label path="estrus_season"><font class="second-embed">发情季节：</font></form:label><form:input path="estrus_season"/><div class="dotted-line"></div>
											<form:label path="body_maturation"><font class="second-embed">体成熟：</font></form:label><form:input path="body_maturation"/><font class="second-embed-unit">d</font><div class="dotted-line"></div>
											<form:label path="gestation_period"><font class="second-embed">妊娠期：</font></form:label><form:input path="gestation_period"/><font class="second-embed-unit">d</font><div class="dotted-line"></div>
											<form:label path="suckling_period"><font class="second-embed">哺乳期：</font></form:label><form:input path="suckling_period"/><font class="second-embed-unit">d</font><div class="dotted-line"></div>
											<form:label path="production_index"><font class="second-embed">生产指数：</font></form:label><form:input path="production_index"/><div class="dotted-line"></div>
											<font class="second-embed">
												精子：
											</font>
											<div class="dotted-line-nocolor"></div>
											<form:label path="sperm_concentration"><font class="third-embed">计数：</font></form:label><form:input path="sperm_concentration"/><font class="third-embed-unit">×10<span style="vertical-align:super; font-size:80%">6</span>/mL</font><div class="dotted-line-nocolor"></div>
											<form:label path="sperm_survival_time"><font class="third-embed">存活时间：</font></form:label><form:input path="sperm_survival_time"/><font class="third-embed-unit">d</font><div class="dotted-line-nocolor"></div>
											<font class="second-embed">
												卵子：
											</font>
											<div class="dotted-line-nocolor"></div>
											<form:label path="ovum_size"><font class="third-embed">大小：</font></form:label><form:input path="ovum_size"/><div class="dotted-line-nocolor"></div>
											<form:label path="ovum_number"><font class="third-embed">数量：</font></form:label><form:input path="ovum_number"/><div class="dotted-line-nocolor"></div>
											<form:label path="ovulation_period"><font class="third-embed">排卵时间：</font></form:label><form:input path="ovulation_period"/><font class="third-embed-unit">h</font><div class="dotted-line-nocolor"></div>
											<form:label path="fertilization_ability"><font class="third-embed">受精能力：</font></form:label><form:input path="fertilization_ability"/><font class="third-embed-unit">h</font><div class="dotted-line-nocolor"></div>
											<font class="second-embed">
												产蛋性能：
											</font>
											<div class="dotted-line-nocolor"></div>
											<form:label path="lay_eggs_age"><font class="third-embed">开产日龄：</font></form:label><form:input path="lay_eggs_age"/><font class="third-embed-unit">d</font><div class="dotted-line-nocolor"></div>
											<form:label path="lay_eggs_weight"><font class="third-embed">开产体重：</font></form:label><form:input path="lay_eggs_weight"/><font class="third-embed-unit">kg</font><div class="dotted-line-nocolor"></div>
											<font class="second-embed">
												蛋的品质：
											</font>
											<div class="dotted-line-nocolor"></div>
											<form:label path="egg_weight"><font class="third-embed">蛋重：</font></form:label><form:input path="egg_weight"/><font class="third-embed-unit">g</font><div class="dotted-line-nocolor"></div>
											<form:label path="shell_thickness"><font class="third-embed">蛋壳厚度：</font></form:label><form:input path="shell_thickness"/><font class="third-embed-unit">nm</font><div class="dotted-line-nocolor"></div>
											<form:label path="egg_type_index"><font class="third-embed">蛋型指数：</font></form:label><form:input path="egg_type_index"/><div class="dotted-line-nocolor"></div>
											<form:label path="haugh_unit"><font class="third-embed">哈氏单位：</font></form:label><form:input path="haugh_unit"/><div class="dotted-line-nocolor"></div>
											<form:label path="egg_relative_density"><font class="third-embed">蛋相对密度：</font></form:label><form:input path="egg_relative_density"/><font class="third-embed-unit">级</font><div class="dotted-line-nocolor"></div>
											<form:label path="egg_yolk_ratio"><font class="third-embed">蛋黄比色级别：</font></form:label><form:input path="egg_yolk_ratio"/><div class="dotted-line-nocolor"></div>
											<form:label path="fertilization_rate"><font class="third-embed">受精率：</font></form:label><form:input path="fertilization_rate"/><font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
											<form:label path="hatchability_of_fertile_eggs"><font class="third-embed">受精蛋孵化率：</font></form:label><form:input path="hatchability_of_fertile_eggs"/><font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
											<form:label path="shell_color"><font class="third-embed">蛋壳颜色：</font></form:label><form:input path="shell_color"/><div class="dotted-line-nocolor"></div>
											<form:label path="brood_stage"><font class="third-embed">孵化期：</font></form:label><form:input path="brood_stage"/><font class="third-embed-unit">d</font><div class="dotted-line-nocolor"></div>
											<br/><div class="dotted-line"></div>				
      								</c:if>
									<c:if test="${physiological_data.physiological_classification eq 'grow_physiological_data'}">		
										<strong>
												生长发育生理参数：
										</strong>						
      										<form:label path="birth_weight"><font class="second-embed">初生体重：</font></form:label><form:input path="birth_weight"/><font class="second-embed-unit">g</font><div class="dotted-line-nocolor"></div><div class="dotted-line"></div>
											<form:label path="weaning_weight"><font class="second-embed">断奶体重：</font></form:label><form:input path="weaning_weight"/><font class="second-embed-unit">g</font><div class="dotted-line"></div>
											<form:label path="adult_weight"><font class="second-embed">成年体重：</font></form:label><form:input path="adult_weight"/><font class="second-embed-unit">g</font><div class="dotted-line"></div>
											<form:label path="growth_curve_url"><font class="second-embed">生长曲线：</font></form:label><form:input path="growth_curve_url"/><div class="dotted-line"></div>
									</c:if>
      								<c:if test="${physiological_data.physiological_classification eq 'breathe_physiological_data'}">		
										<strong>
												呼吸生理参数：
										</strong>										
      										<form:label path="breathing_rate"><font class="second-embed">呼吸频率：</font></form:label><form:input path="breathing_rate"/><font class="second-embed-unit">次/m</font><div class="dotted-line-nocolor"></div><div class="dotted-line"></div>
									</c:if>
      								<c:if test="${physiological_data.physiological_classification eq 'temperature_physiological_data'}">		
										<strong>
												体温参数：
										</strong>						
      										<form:label path="temperature"><font class="second-embed">体温：</font></form:label><form:input path="temperature"/><font class="second-embed-unit">℃</font><div class="dotted-line-nocolor"></div><div class="dotted-line"></div>
									</c:if>
      								<c:if test="${physiological_data.physiological_classification eq 'digestive_physiological_data'}">		
										<strong>
												消化生理参数：
										</strong>						
      										<form:label path="digestive_index"><font class="second-embed">消化能力：</font></form:label><form:input path="digestive_index"/><div class="dotted-line-nocolor"></div><div class="dotted-line"></div>
									</c:if>
      								<c:if test="${physiological_data.physiological_classification eq 'immune_physiological_data'}">		
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
									</c:if>
      								<c:if test="${physiological_data.physiological_classification eq 'cardiovascular_physiological_data'}">		
										<strong>
												心血管生理参数：
										</strong><div class="dotted-line-nocolor"></div>								
      									<font class="second-embed">
												血压：
										</font>
											<div class="dotted-line-nocolor"></div>
											<form:label path="systolic_pressure"><font class="third-embed">收缩压：</font></form:label><form:input path="systolic_pressure"/><font class="third-embed-unit">mmHg</font><div class="dotted-line-nocolor"></div>
											<form:label path="diastolic_pressure"><font class="third-embed">舒张压：</font></form:label><form:input path="diastolic_pressure"/><font class="third-embed-unit">mmHg</font><div class="dotted-line-nocolor"></div>
											<form:label path="heart_rate"><font class="second-embed">心率：</font></form:label><form:input path="heart_rate"/><font class="second-embed-unit">次/m</font><div class="dotted-line"></div>
											<form:label path="electrocardiogram_url"><font class="second-embed">心电图：</font></form:label><form:input path="electrocardiogram_url"/><div class="dotted-line"></div>
									</c:if>
      							</div>
      							<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>
									<div id="submit">
											<input type="submit" value="<spring:message text="更新生理数据"/>" />
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
<jsp:include page="backstage_foot.jsp"/>
	</body>
</html>