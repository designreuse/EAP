
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
      					
						<c:url var="addAction" value="/super/autopsy_data/update/${autopsy_data.id}" ></c:url>
      					<form:form action="${addAction}" commandName="autopsy_data" id="input-date">
      					<ul> 
      					<!-- ====================================================以下为第二层信息【解剖数据】=============================================================== -->    																
      					<li class="line">
      						<div class="second_leve_menu">
	      						<a href="javascript:void(0);">
      								<span>解剖数据</span>
      							</a>
      						</div>
      						<div class="second_level_input">
      						<p></p>
							<form:input path="strain_id.id" value="${strain.id}" readonly="true" type="hidden"/>
							<form:input path="autopsy_classification" value="${autopsy_data.autopsy_classification}" readonly="true" type="hidden"/>
							<strong>
								测定组数据：
							</strong>
								<div class="dotted-line-nocolor"></div>
								<form:label path="age"><font class="second-embed">年龄：</font></form:label><form:input path="age"/><div class="dotted-line-nocolor"></div>
								<form:label path="sex"><font class="second-embed">性别：</font></form:label><form:input path="sex"/><div class="dotted-line-nocolor"></div>
								<form:label path="number"><font class="second-embed">测定数量：</font></form:label><form:input path="number"/><div class="dotted-line-nocolor"></div>
								<br/><div class="dotted-line"></div>
      							<c:if test="${autopsy_data.autopsy_classification eq 'body_measurement_data'}">
      									<strong>
												体尺：
										</strong>
											<div class="dotted-line-nocolor"></div>
											<form:label path="body_height"><font class="second-embed">体高：</font></form:label><form:input path="body_height"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
											<form:label path="body_length"><font class="second-embed">体长：</font></form:label><form:input path="body_length"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
											<form:label path="tail_length"><font class="second-embed">尾长：</font></form:label><form:input path="tail_length"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
											<form:label path="length_body_proportion"><font class="second-embed">尾／体比：</font></form:label><form:input path="length_body_proportion"/><div class="dotted-line-nocolor"></div>
											<form:label path="body_inclined_length"><font class="second-embed">体斜长：</font></form:label><form:input path="body_inclined_length"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
											<form:label path="ear_length"><font class="second-embed">耳长：</font></form:label><form:input path="ear_length"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
											<form:label path="ear_width"><font class="second-embed">耳宽：</font></form:label><form:input path="ear_width"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
											<form:label path="chest_width"><font class="second-embed">胸宽：</font></form:label><form:input path="chest_width"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
											<form:label path="chest_depth"><font class="second-embed">胸深：</font></form:label><form:input path="chest_depth"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
											<form:label path="stem_length"><font class="second-embed">躯干长：</font></form:label><form:input path="stem_length"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
											<form:label path="fore_limb_length"><font class="second-embed">前肢长：</font></form:label><form:input path="fore_limb_length"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
											<form:label path="posterior_limb_length"><font class="second-embed">后肢长：</font></form:label><form:input path="posterior_limb_length"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
											<br/><div class="dotted-line"></div>
								</c:if>
								<c:if test="${autopsy_data.autopsy_classification eq 'skeleton_data'}">
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
								</c:if>
								<c:if test="${autopsy_data.autopsy_classification eq 'organ_weight_data'}">
      									<strong>
												脏器重量：
										</strong>
											<div class="dotted-line-nocolor"></div>
											<form:label path="heart"><font class="second-embed">心：</font></form:label><form:input path="heart"/><font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
											<form:label path="lung"><font class="second-embed">肺：</font></form:label><form:input path="lung"/><font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
											<form:label path="liver"><font class="second-embed">肝：</font></form:label><form:input path="liver"/><font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
											<form:label path="spleen"><font class="second-embed">脾：</font></form:label><form:input path="spleen"/><font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
											<form:label path="kidney"><font class="second-embed">肾：</font></form:label><form:input path="kidney"/><font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
											<form:label path="brain"><font class="second-embed">脑：</font></form:label><form:input path="brain"/><font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
											<form:label path="thyroid"><font class="second-embed">甲状腺：</font></form:label><form:input path="thyroid"/><font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
											<form:label path="renicapsule"><font class="second-embed">肾上腺：</font></form:label><form:input path="renicapsule"/><font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
											<form:label path="oarium"><font class="second-embed">卵巢：</font></form:label><form:input path="oarium"/><font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
											<form:label path="testicle"><font class="second-embed">睾丸：</font></form:label><form:input path="testicle"/><font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
											<form:label path="thymus_gland"><font class="second-embed">胸腺：</font></form:label><form:input path="thymus_gland"/><font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
											<form:label path="bursa_of_fabricius"><font class="second-embed">法氏囊：</font></form:label><form:input path="bursa_of_fabricius"/><font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
											<br/><div class="dotted-line"></div>
								</c:if>
								<c:if test="${autopsy_data.autopsy_classification eq 'intestinal_length_data'}">
      									<strong>
												肠道长度：
										</strong>
											<div class="dotted-line-nocolor"></div>
											<form:label path="small_intestine"><font class="second-embed">小肠：</font></form:label><form:input path="small_intestine"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
											<form:label path="caecum"><font class="second-embed">盲肠：</font></form:label><form:input path="caecum"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
											<form:label path="large_intesting"><font class="second-embed">结肠：</font></form:label><form:input path="large_intesting"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
											<form:label path="rectum"><font class="second-embed">直肠：</font></form:label><form:input path="rectum"/><font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
											<br/><div class="dotted-line"></div>
								</c:if>
								<c:if test="${autopsy_data.autopsy_classification eq 'nipple_data'}">
      									<strong>
												乳头：
										</strong>
											<div class="dotted-line-nocolor"></div>
											<form:label path="nipple"><font class="second-embed">乳头：</font></form:label><form:input path="nipple"/><font class="second-embed-unit">个</font><div class="dotted-line-nocolor"></div>
											<br/><div class="dotted-line"></div>
								</c:if>
								<c:if test="${autopsy_data.autopsy_classification eq 'dental_formula_data'}">
      									<strong>
												齿式：
										</strong>
											<div class="dotted-line-nocolor"></div>
											<form:label path="milk_tooth"><font class="second-embed">乳齿：</font></form:label><form:input path="milk_tooth"/><div class="dotted-line-nocolor"></div>
											<form:label path="permanent_tooth"><font class="second-embed">恒齿：</font></form:label><form:input path="permanent_tooth"/><font class="second-embed-unit">U/L</font><div class="dotted-line-nocolor"></div>
											<br/><div class="dotted-line"></div>
								</c:if>
      									
      							</div>
      							<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>
									<div id="submit">
											<input type="submit" value="<spring:message text="更新生化数据"/>" />
									</div>
									<p></p>
      						</li>  
									
      						<!-- ====================================================以上为第二层信息【解剖数据】=============================================================== -->  
      					</ul>
								
									<c:if test="${!empty autopsy_data.time}">
											<p><div class="text-right" style=" text-align:right;">上次更新时间：${autopsy_data.time}</div></p>
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