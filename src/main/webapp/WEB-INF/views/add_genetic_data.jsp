
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
      					
						<c:url var="addAction" value="/super/genetic_data/add" ></c:url>
      					<form:form action="${addAction}" commandName="genetic_data" id="input-date">
      					<ul> 
      							<!-- ====================================================以下为第二层信息【遗传数据】=============================================================== -->    																
      								<li class="line">
      									<div class="second_leve_menu">
      										<a href="javascript:void(0);">
      											<span>遗传数据</span>
      										</a>
      									</div>
      									<div class="second_level_input">
											<p></p>
														<form:input path="strain_id.id" value="${strain.id}" readonly="true" type="hidden"/>		
   														<strong>
															细胞遗传标记：
														</strong>
														<div class="dotted-line-nocolor"></div>
															<form:label path="chromosome_number"><font class="second-embed">染色体数：</font></form:label><form:input path="chromosome_number"/><div class="dotted-line-nocolor"></div>
															<form:label path="standard_karyotype_id"><font class="second-embed">染色体标准核型：</font></form:label><form:input path="standard_karyotype_id"/><div class="dotted-line-nocolor"></div>
															<form:label path="chromosome_c_image_id"><font class="second-embed">染色体C带：</font></form:label><form:input path="chromosome_c_image_id"/><div class="dotted-line-nocolor"></div>
															<form:label path="chromosome_g_image_id"><font class="second-embed">染色体G带：</font></form:label><form:input path="chromosome_g_image_id"/><div class="dotted-line-nocolor"></div>
														<br/><div class="dotted-line"></div>
															<form:label path="biochemical_gene_markers"><strong>生化基因标记：</strong></form:label><form:input path="biochemical_gene_markers"/><div class="dotted-line"></div>
															<form:label path="histocompatibility_gene"><strong>组织相容性基因：</strong></form:label><form:input path="histocompatibility_gene"/><div class="dotted-line"></div>
															<form:label path="frame_type"><strong>肋骨类型：</strong></form:label><form:input path="frame_type"/><div class="dotted-line"></div>
															<form:label path="coat_color_gene"><strong>毛色或羽色基因：</strong></form:label><form:input path="coat_color_gene"/><div class="dotted-line"></div>
															<form:label path="blood_group_gene"><strong>血型基因：</strong></form:label><form:input path="blood_group_gene"/><div class="dotted-line"></div>
															<form:label path="mandibular_characteristics"><strong>下颌骨特征：</strong></form:label><form:input path="mandibular_characteristics"/><div class="dotted-line"></div>
															<form:label path="microsatellite"><strong>微卫星DNA：</strong></form:label><form:input path="microsatellite"/><div class="dotted-line"></div>
														<strong>
															动物系列分类:
														</strong>
														<div id="tabbox">
															<ul class="tabs" id="tabs">	
																<label for="tra"><form:radiobutton path="animal_classification" value="tra" id="tra" tab="tab1"/>转基因动物</label> 
																<label for="tar"><form:radiobutton path="animal_classification" value="tar" id="tar" tab="tab2"/>基因定位突变动物</label>
														 		<label for="oth"><form:radiobutton path="animal_classification" value="oth" id="oth" tab="tab3"/>其他突变动物</label> 
															</ul>
    														<ul class="tab_conbox">
       	 														<li id="tab1" class="tab_con">
           															<div class="dotted-line-nocolor"></div>
           															<form:label path="tra_name"><font class="second-embed">命名：</font></form:label><form:input path="tra_name"/><div class="dotted-line-nocolor"></div>
																	<form:label path="tra_background"><font class="second-embed">背景品系：</font></form:label><form:input path="tra_background"/><div class="dotted-line-nocolor"></div>
																	<form:label path="tra_insert_transgene_name"><font class="second-embed">插入转基因名称：</font></form:label><form:input path="tra_insert_transgene_name"/><div class="dotted-line-nocolor"></div>
																	<form:label path="tra_insertion_site"><font class="second-embed">插入位点：</font></form:label><form:input path="tra_insertion_site"/><div class="dotted-line-nocolor"></div>
																	<form:label path="tra_copy_number"><font class="second-embed">拷贝数：</font></form:label><form:input path="tra_copy_number"/><div class="dotted-line-nocolor"></div>
																	<form:label path="tra_abnormal_phenotype"><font class="second-embed">异常表型：</font></form:label><form:input path="tra_abnormal_phenotype"/><div class="dotted-line-nocolor"></div>
																	<form:label path="tra_references"><font class="second-embed">参考文献：</font></form:label><form:input path="tra_references"/><div class="dotted-line-nocolor"></div>
																	<br/><div class="dotted-line"></div>
        														</li>
	            												<li id="tab2" class="tab_con">
            														<div class="dotted-line-nocolor"></div>
																	<form:label path="tar_name"><font class="second-embed">命名：</font></form:label><form:input path="tar_name"/><div class="dotted-line-nocolor"></div>
																	<form:label path="tar_background"><font class="second-embed">背景品系：</font></form:label><form:input path="tar_background"/><div class="dotted-line-nocolor"></div>
																	<form:label path="tar_insert_transgene_name"><font class="second-embed">插入基因名：</font></form:label><form:input path="tar_insert_transgene_name"/><div class="dotted-line-nocolor"></div>
																	<form:label path="tar_eliminating_gene_name"><font class="second-embed">被剔出基因名：</font></form:label><form:input path="tar_eliminating_gene_name"/><div class="dotted-line-nocolor"></div>
																	<form:label path="tar_abnormal_phenotype"><font class="second-embed">异常表型：</font></form:label><form:input path="tar_abnormal_phenotype"/><div class="dotted-line-nocolor"></div>
																	<form:label path="tar_references"><font class="second-embed">参考文献：</font></form:label><form:input path="tar_references"/><div class="dotted-line-nocolor"></div>
																	<br/><div class="dotted-line"></div>
        														</li>
    															<li id="tab3" class="tab_con">
            														
																	<div class="dotted-line-nocolor"></div>
																	<form:label path="oth_name"><font class="second-embed">命名：</font></form:label><form:input path="oth_name"/><div class="dotted-line-nocolor"></div>
																	<form:label path="oth_background"><font class="second-embed">背景品系：</font></form:label><form:input path="oth_background"/><div class="dotted-line-nocolor"></div>
																	<form:label path="oth_mutant_gene"><font class="second-embed">突变基因：</font></form:label><form:input path="oth_mutant_gene"/><div class="dotted-line-nocolor"></div>
																	<form:label path="oth_mutant_site"><font class="second-embed">突变位点：</font></form:label><form:input path="oth_mutant_site"/><div class="dotted-line-nocolor"></div>
																	<form:label path="oth_abnormal_phenotype"><font class="second-embed">异常表型：</font></form:label><form:input path="oth_abnormal_phenotype"/><div class="dotted-line-nocolor"></div>
																	<form:label path="oth_references"><font class="second-embed">参考文献：</font></form:label><form:input path="oth_references"/><div class="dotted-line-nocolor"></div>
																	<br/><div class="dotted-line"></div>
        														</li>
        														<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>
    								 						</ul>
						 								<br/>
										<div id="submit">
											<input type="submit" value="<spring:message text="添加遗传数据"/>" />
										</div>	
										</div>
									</li>  
      								<!-- ====================================================以上为第二层信息【遗传数据】=============================================================== -->  
      								</ul>													
							</div>
								
									<c:if test="${!empty strain.time}">
											<p><div class="text-right" style=" text-align:right;">更新时间：${strain.time}</div></p>
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