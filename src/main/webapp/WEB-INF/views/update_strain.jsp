
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
      		<c:url var="addAction" value="/super/strain/update/${strain.id}" ></c:url>
      		<form:form action="${addAction}" commandName="strain" id="input-date">
      					<div class="title_name">
      						<c:if test="${!empty strain.name}">
      							品系编号：${strain.id}
      							<form:input path="id" readonly="true" size="8"  disabled="true" hidden="none"/>
								<form:hidden path="id" />
        					</c:if>
      					</div>
      					<div class="main_window">
      					<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      						<li>
      								<font class="title_name_little">
      									品系名称：<form:input path="name"/>
      								</font>
      								<div class="faceplate" >
										<div class="embed">
											
												<strong>物种：</strong>
												<form:select path="species_id.id">
													<option value="${strain.species_id.id}">${strain.species_id.species_ch}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（${strain.species_id.species_en}）</option>			
														<c:forEach items="${listSpeciess}" var="species">
															<c:if test="${strain.species_id.id != species.id}">
																<option value="${species.id}">${species.species_ch}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（${species.species_en}）</option>
															</c:if>	
														</c:forEach>
  												</form:select>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
												<form:label path="cultivation_year"><strong>培育年份：</strong></form:label>
													<form:input path="cultivation_year"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
												<form:label path="introduce_year"><strong>引入时间：</strong></form:label>
													<form:input path="introduce_year"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
												<form:label path="cultivationer"><strong>培育机构或人：</strong></form:label>
													<form:input path="cultivationer"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
												<form:label path="hereditary_feature"><strong>遗传特征：</strong></form:label>
													<form:input path="hereditary_feature"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
												<form:label path="microbiological_grade"><strong>微生物学等级：</strong></form:label>
													<form:input path="microbiological_grade"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
												<form:label path="germplasm_resources"><strong>种质来源：</strong></form:label>
													<form:input path="germplasm_resources"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</div>
											<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>
										<div id="submit">
											<input type="submit" value="<spring:message text="更新基本品系信息"/>" />
										</div>
									</div>
								</li>
						<div class="line"></div>
			</form:form>
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
      						<ul> 
      							<!-- ====================================================以下为第二层信息【遗传数据】=============================================================== -->    																
      							    <li class="line">
      									<div id="second_level_menu_title-02" class="second_leve_menu">
      										<a href="javascript:void(0);">
      										<img id="second_level_menu_image-02" src="resources/images/plus.png">
      											<span>遗传数据</span>
      										</a>
      									</div>
      									<div id="second_level_menu-02" class="second_level_text">
											<p></p>
											<c:forEach items="${strain.genetic_data}" var="genetic_data">
   														<strong>
															细胞遗传标记：
														</strong>
														<div class="dotted-line-nocolor"></div>
															<c:if test="${!empty genetic_data.chromosome_number}">
																<font class="second-embed">染色体数：</font>${genetic_data.chromosome_number}<div class="dotted-line-nocolor"></div>
															</c:if>
															<c:if test="${!empty genetic_data.standard_karyotype_id}">
																<font class="second-embed">染色体标准核型：</font>${genetic_data.standard_karyotype_id}<div class="dotted-line-nocolor"></div>	
															</c:if>
															<c:if test="${!empty genetic_data.chromosome_c_image_id}">
																<font class="second-embed">染色体C带:</font>${genetic_data.chromosome_c_image_id}<div class="dotted-line-nocolor"></div>
															</c:if>
															<c:if test="${!empty genetic_data.chromosome_g_image_id}">	
																<font class="second-embed">染色体G带:</font>${genetic_data.chromosome_g_image_id}<div class="dotted-line-nocolor"></div>
															</c:if>
														<br/><div class="dotted-line"></div>
														<c:if test="${!empty genetic_data.biochemical_gene_markers}">	
															<strong>生化基因标记：</strong>${genetic_data.biochemical_gene_markers}
															<div class="dotted-line"></div>
														</c:if>
														<c:if test="${!empty genetic_data.histocompatibility_gene}">	
															<strong>组织相容性基因：</strong>${genetic_data.histocompatibility_gene}															
															<div class="dotted-line"></div>
														</c:if>
														<c:if test="${!empty genetic_data.frame_type}">	
															<strong>肋骨类型：</strong>${genetic_data.frame_type}
															<div class="dotted-line"></div>
														</c:if>
														<c:if test="${!empty genetic_data.coat_color_gene}">	
															<strong>毛色或羽色基因：</strong>${genetic_data.coat_color_gene}
															<div class="dotted-line"></div>
														</c:if>
														<c:if test="${!empty genetic_data.blood_group_gene}">	
															<strong>血型基因：</strong>${genetic_data.blood_group_gene}
															<div class="dotted-line"></div>
														</c:if>
														<c:if test="${!empty genetic_data.mandibular_characteristics}">	
															<strong>下颌骨特征：</strong>${genetic_data.mandibular_characteristics}
															<div class="dotted-line"></div>
														</c:if>
														<c:if test="${!empty genetic_data.microsatellite}">	
															<strong>微卫星DNA：</strong>${genetic_data.microsatellite}
															<div class="dotted-line"></div>
														</c:if>
														<c:if test="${(!empty genetic_data.tra_name)||(!empty genetic_data.tra_background)||(!empty genetic_data.tra_insert_transgene_name)||(!empty genetic_data.tra_insertion_site)||(!empty genetic_data.tra_copy_number)||(!empty genetic_data.tra_abnormal_phenotype)||(!empty genetic_data.tra_references)}">	
															<strong>
																转基因动物系:
															</strong>
															<div class="dotted-line-nocolor"></div>
																<c:if test="${!empty genetic_data.tra_name}">
																	<font class="second-embed">命名：</font>${genetic_data.tra_name}<div class="dotted-line-nocolor"></div>
																</c:if>
																<c:if test="${!empty genetic_data.tra_background}">
																	<font class="second-embed">背景品系：</font>${genetic_data.tra_background}<div class="dotted-line-nocolor"></div>
																</c:if>
																<c:if test="${!empty genetic_data.tra_insert_transgene_name}">
																	<font class="second-embed">插入转基因名称：</font>${genetic_data.tra_insert_transgene_name}<div class="dotted-line-nocolor"></div>
																</c:if>
																<c:if test="${!empty genetic_data.tra_insertion_site}">
																	<font class="second-embed">插入位点：</font>${genetic_data.tra_insertion_site}<div class="dotted-line-nocolor"></div>
																</c:if>
																<c:if test="${!empty genetic_data.tra_copy_number}">
																	<font class="second-embed">拷贝数：</font>${genetic_data.tra_copy_number}<div class="dotted-line-nocolor"></div>
																</c:if>
																<c:if test="${!empty genetic_data.tra_abnormal_phenotype}">
																	<font class="second-embed">异常表型：</font>${genetic_data.tra_abnormal_phenotype}<div class="dotted-line-nocolor"></div>
																</c:if>
																<c:if test="${!empty genetic_data.tra_references}">
																	<font class="second-embed">参考文献：</font>${genetic_data.tra_references}<div class="dotted-line-nocolor"></div>
																</c:if>
															<br/><div class="dotted-line"></div>
														</c:if>
														<c:if test="${(!empty genetic_data.tar_name)||(!empty genetic_data.tar_background)||(!empty genetic_data.tar_insert_transgene_name)||(!empty genetic_data.tar_eliminating_gene_name)||(!empty genetic_data.tar_abnormal_phenotype)||(!empty genetic_data.tar_references)}">	
															<strong>
																基因定位突变系:
															</strong>
															<div class="dotted-line-nocolor"></div>
																<c:if test="${!empty genetic_data.tar_name}">
																	<font class="second-embed">命名：</font>${genetic_data.tar_name}<div class="dotted-line-nocolor"></div>
																</c:if>
																<c:if test="${!empty genetic_data.tar_background}">
																	<font class="second-embed">背景品系：</font>${genetic_data.tar_background}<div class="dotted-line-nocolor"></div>
																</c:if>
																<c:if test="${!empty genetic_data.tar_insert_transgene_name}">
																	<font class="second-embed">插入基因名：</font>${genetic_data.tar_insert_transgene_name}<div class="dotted-line-nocolor"></div>
																</c:if>
																<c:if test="${!empty genetic_data.tar_eliminating_gene_name}">
																	<font class="second-embed">被剔出基因名：</font>${genetic_data.tar_eliminating_gene_name}<div class="dotted-line-nocolor"></div>
																</c:if>
																<c:if test="${!empty genetic_data.tar_abnormal_phenotype}">
																	<font class="second-embed">异常表型：</font>${genetic_data.tar_abnormal_phenotype}<div class="dotted-line-nocolor"></div>
																</c:if>
																<c:if test="${!empty genetic_data.tar_references}">
																	<font class="second-embed">参考文献：</font>${genetic_data.tar_references}<div class="dotted-line-nocolor"></div>
																</c:if>
															<br/><div class="dotted-line"></div>
														</c:if>
														<c:if test="${(!empty genetic_data.oth_name)||(!empty genetic_data.oth_background)||(!empty genetic_data.oth_mutant_gene)||(!empty genetic_data.oth_mutant_site)||(!empty genetic_data.oth_abnormal_phenotype)||(!empty genetic_data.oth_references)}">	
															<strong>
																其他突变动物系:
															</strong>
															<div class="dotted-line-nocolor"></div>
																<c:if test="${!empty genetic_data.oth_name}">
																	<font class="second-embed">命名：</font>${genetic_data.oth_name}<div class="dotted-line-nocolor"></div>
																</c:if>
																<c:if test="${!empty genetic_data.oth_background}">
																	<font class="second-embed">背景品系：</font>${genetic_data.oth_background}<div class="dotted-line-nocolor"></div>
																</c:if>
																<c:if test="${!empty genetic_data.oth_mutant_gene}">
																	<font class="second-embed">突变基因：</font>${genetic_data.oth_mutant_gene}<div class="dotted-line-nocolor"></div>
																</c:if>
																<c:if test="${!empty genetic_data.oth_mutant_site}">
																	<font class="second-embed">突变位点：</font>${genetic_data.oth_mutant_site}<div class="dotted-line-nocolor"></div>
																</c:if>
																<c:if test="${!empty genetic_data.oth_abnormal_phenotype}">
																	<font class="second-embed">异常表型：</font>${genetic_data.oth_abnormal_phenotype}<div class="dotted-line-nocolor"></div>
																</c:if>
																<c:if test="${!empty genetic_data.oth_references}">
																	<font class="second-embed">参考文献：</font>${genetic_data.oth_references}<div class="dotted-line-nocolor"></div>
																</c:if>
															<br/><div class="dotted-line"></div>
														</c:if>
										
												<br/><br/>				
												<c:if test="${!empty strain.genetic_data}">
													<div class="submit">
														<a href="super/genetic_data/edit/${strain.id}/${genetic_data.id}">更新基因数据</a>
													</div>
												</c:if>
											</c:forEach>
											
												<c:if test="${empty strain.genetic_data}">
												<br/><br/>	
													<div class="submit">
														<a href="super/genetic_data/create/${strain.id}">+&nbsp;添加基因数据</a>
													</div>
												</c:if>
										</div>
									</li>  
      								<!-- ====================================================以上为第二层信息【遗传数据】=============================================================== -->  
      								<!-- ====================================================以下为第二层信息【生理数据】=============================================================== -->    																
      								<li class="line">
      									<div id="second_level_menu_title-03" class="second_leve_menu">
      										<a href="javascript:void(0);">
      										<img id="second_level_menu_image-03" src="resources/images/plus.png">
      											<span>生理数据</span>
      										</a>
      									</div>
      									<div id="second_level_menu-03" class="second_level_text">
											<p></p>
											<%
											int blood_physiological_data=0;
											int reproduction_physiological_data=0;
											int grow_physiological_data=0;
											int breathe_physiological_data=0;
											int temperature_physiological_data=0;
											int digestive_physiological_data=0;
											int immune_physiological_data=0;
											int cardiovascular_physiological_data=0;
											%>
											<c:forEach items="${strain.physiological_data}" var="physiological_data">
												<div class="dotted-line-nocolor"></div>
												<c:if test="${physiological_data.physiological_classification eq 'blood_physiological_data'}">
												<%
												if(blood_physiological_data==0)
												{out.println("<p></p><strong>血液生理参数：</strong><p></p>");}
												blood_physiological_data=1;
												%>
												</c:if>
												<c:if test="${physiological_data.physiological_classification eq 'blood_physiological_data'}">
												<div id="physiological${physiological_data.id}" class="physiological_data-select">【测定组】年龄:${physiological_data.age} &nbsp;|&nbsp;性别:${physiological_data.sex} &nbsp;|&nbsp;测定数量:${physiological_data.number}</div>  
    											<div id="text_physiological${physiological_data.id}" class="physiological_data">
													<div class="dotted-line-nocolor"></div>
													<c:if test="${!empty physiological_data.blood_volume}">
														<font class="second-embed">血量：</font>${physiological_data.blood_volume}<font class="second-embed-unit">ml</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty physiological_data.plasma_volume}">
														<font class="second-embed">血浆量：</font>${physiological_data.plasma_volume}<font class="second-embed-unit">ml</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty physiological_data.rbc||!empty physiological_data.mcv||!empty physiological_data.mct||!empty physiological_data.rdw||!empty physiological_data.hb||!empty physiological_data.hct||!empty physiological_data.mch||!empty physiological_data.mchc}">
														<font class="second-embed">红细胞：</font><div class="dotted-line-nocolor"></div>
													</c:if>
														<c:if test="${!empty physiological_data.rbc}">
															<font class="third-embed">计数：</font>${physiological_data.rbc}<font class="third-embed-unit">×10<span style="vertical-align:super; font-size:80%">6</span>/μL</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.mcv}">
															<font class="third-embed">体积：</font>${physiological_data.mcv}<font class="third-embed-unit">fL</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.mct}">
															<font class="third-embed">平均厚度：</font>${physiological_data.mct}<font class="third-embed-unit">μm</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.rdw}">
															<font class="third-embed">分布宽度：</font>${physiological_data.rdw}<font class="third-embed-unit">%CV</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.hb}">
															<font class="third-embed">血红蛋白：</font>${physiological_data.hb}<font class="third-embed-unit">g/L</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.hct}">
															<font class="third-embed">压积：</font>${physiological_data.hct}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.mch}">
															<font class="third-embed">血红蛋白含量：</font>${physiological_data.mch}<font class="third-embed-unit">pG</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.mchc}">
															<font class="third-embed">血红蛋白浓度：</font>${physiological_data.mchc}<font class="third-embed-unit">g/L</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.wbc||!empty physiological_data.w_ne||!empty physiological_data.eo||!empty physiological_data.ba||!empty physiological_data.ly||!empty physiological_data.mo}">
															<font class="second-embed">白细胞：</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.wbc}">
															<font class="third-embed">计数：</font>${physiological_data.wbc}<font class="third-embed-unit">×10<span style="vertical-align:super; font-size:80%">3</span>/μL</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.w_ne}">
															<font class="third-embed">嗜中性白细胞：</font>${physiological_data.w_ne}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.eo}">
															<font class="third-embed">嗜酸性白细胞：</font>${physiological_data.eo}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.ba}">
															<font class="third-embed">嗜硷性白细胞：</font>${physiological_data.ba}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.ly}">
															<font class="third-embed">淋巴细胞：</font>${physiological_data.ly}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.mo}">
															<font class="third-embed">单核细胞：</font>${physiological_data.mo}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.plt||!empty physiological_data.mpv||!empty physiological_data.pdw}">
															<font class="second-embed">血小板：</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.plt}">
															<font class="third-embed">计数：</font>${physiological_data.plt}<font class="third-embed-unit">×10<span style="vertical-align:super; font-size:80%">3</span>/μL</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.mpv}">
															<font class="third-embed">平均容积：</font>${physiological_data.mpv}<font class="third-embed-unit">fL</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.pdw}">
															<font class="third-embed">分布宽度：</font>${physiological_data.pdw}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<br/>
														<div class="submit">
															<a href="super/physiological_data/create/${strain.id}/blood_physiological_data">+&nbsp;添加血液生理数据</a>
															<a href="super/physiological_data/edit/${strain.id}/${physiological_data.id}">✎&nbsp;更新该测定组数据</a>
															<a href="super/physiological_data/remove/${physiological_data.id}">×&nbsp;删除该测定组数据</a>
														</div>
														<br/><div class="dotted-line"></div>
													</div>
												</c:if>
												<c:if test="${physiological_data.physiological_classification eq 'reproduction_physiological_data'}">
												<%
												if(reproduction_physiological_data==0)
												{out.println("<p></p><strong>生殖生理参数：</strong><p></p>");}
												reproduction_physiological_data=1;
												%>
												</c:if>
												<c:if test="${physiological_data.physiological_classification eq 'reproduction_physiological_data'}">
												<div id="physiological${physiological_data.id}" class="physiological_data-select">【测定组】年龄:${physiological_data.age} &nbsp;|&nbsp;性别:${physiological_data.sex} &nbsp;|&nbsp;测定数量:${physiological_data.number}</div>  
    											<div id="text_physiological${physiological_data.id}" class="physiological_data">
													<div class="dotted-line-nocolor"></div>
													
													<c:if test="${!empty physiological_data.estrus_period||!empty physiological_data.first_estrus||!empty physiological_data.estrus}">
														<font class="second-embed">性成熟：</font><div class="dotted-line-nocolor"></div>
													</c:if>
														<c:if test="${!empty physiological_data.first_estrus}">
															<font class="third-embed">初次发情：</font>${physiological_data.first_estrus}<font class="third-embed-unit">d</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.estrus}">
															<font class="third-embed">发情期：</font>${physiological_data.estrus}<font class="third-embed-unit">h</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.estrus_period}">
															<font class="third-embed">发情周期：</font>${physiological_data.estrus_period}<font class="third-embed-unit">d</font><div class="dotted-line-nocolor"></div>
														</c:if>
													<c:if test="${!empty physiological_data.estrus_season}">
														<font class="second-embed">发情季节：</font>${physiological_data.estrus_season}<div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty physiological_data.body_maturation}">
														<font class="second-embed">体成熟：</font>${physiological_data.body_maturation}<font class="second-embed-unit">d</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty physiological_data.gestation_period}">
														<font class="second-embed">妊娠期：</font>${physiological_data.gestation_period}<font class="second-embed-unit">d</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty physiological_data.suckling_period}">
														<font class="second-embed">哺乳期：</font>${physiological_data.suckling_period}<font class="second-embed-unit">d</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty physiological_data.production_index}">
														<font class="second-embed">生产指数：</font>${physiological_data.production_index}<div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty physiological_data.sperm_concentration||!empty physiological_data.sperm_survival_time}">
														<font class="second-embed">精子：</font><div class="dotted-line-nocolor"></div>
													</c:if>
														<c:if test="${!empty physiological_data.sperm_concentration}">
															<font class="third-embed">计数：</font>${physiological_data.sperm_concentration}<font class="third-embed-unit">×10<span style="vertical-align:super; font-size:80%">6</span>/mL</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.sperm_survival_time}">
															<font class="third-embed">存活时间：</font>${physiological_data.sperm_survival_time}<font class="third-embed-unit">d</font><div class="dotted-line-nocolor"></div>
														</c:if>
													<c:if test="${!empty physiological_data.ovum_size||!empty physiological_data.ovum_number||!empty physiological_data.ovulation_period||!empty physiological_data.fertilization_ability}">
														<font class="second-embed">卵子：</font><div class="dotted-line-nocolor"></div>
													</c:if>
														<c:if test="${!empty physiological_data.ovum_size}">
															<font class="third-embed">大小：</font>${physiological_data.ovum_size}<div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.ovum_number}">
															<font class="third-embed">数量：</font>${physiological_data.ovum_number}<div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.ovulation_period}">
															<font class="third-embed">排卵时间：</font>${physiological_data.ovulation_period}<font class="third-embed-unit">h</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.fertilization_ability}">
															<font class="third-embed">受精能力：</font>${physiological_data.fertilization_ability}<font class="third-embed-unit">h</font><div class="dotted-line-nocolor"></div>
														</c:if>
													<c:if test="${!empty physiological_data.lay_eggs_age||!empty physiological_data.lay_eggs_weight}">
														<font class="second-embed">产蛋性能：</font><div class="dotted-line-nocolor"></div>
													</c:if>
														<c:if test="${!empty physiological_data.lay_eggs_age}">
															<font class="third-embed">开产日龄：</font>${physiological_data.lay_eggs_age}<font class="third-embed-unit">d</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.lay_eggs_weight}">
															<font class="third-embed">开产体重：</font>${physiological_data.lay_eggs_weight}<font class="third-embed-unit">kg</font><div class="dotted-line-nocolor"></div>
														</c:if>
													<c:if test="${!empty physiological_data.egg_weight||!empty physiological_data.shell_thickness||!empty physiological_data.egg_type_index||!empty physiological_data.haugh_unit||!empty physiological_data.egg_relative_density||!empty physiological_data.egg_yolk_ratio||!empty physiological_data.fertilization_rate||!empty physiological_data.hatchability_of_fertile_eggs||!empty physiological_data.shell_color||!empty physiological_data.brood_stage}">
														<font class="second-embed">蛋的品质：</font><div class="dotted-line-nocolor"></div>
													</c:if>
														<c:if test="${!empty physiological_data.egg_weight}">
															<font class="third-embed">蛋重：</font>${physiological_data.egg_weight}<font class="third-embed-unit">g</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.shell_thickness}">
															<font class="third-embed">蛋壳厚度：</font>${physiological_data.shell_thickness}<font class="third-embed-unit">nm</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.egg_type_index}">
															<font class="third-embed">蛋型指数：</font>${physiological_data.egg_type_index}<div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.haugh_unit}">
															<font class="third-embed">哈氏单位：</font>${physiological_data.haugh_unit}<div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.egg_relative_density}">
															<font class="third-embed">蛋相对密度：</font>${physiological_data.egg_relative_density}<font class="third-embed-unit">级</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.egg_yolk_ratio}">
															<font class="third-embed">蛋黄比色级别：</font>${physiological_data.egg_yolk_ratio}<div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.fertilization_rate}">
															<font class="third-embed">受精率：</font>${physiological_data.fertilization_rate}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.hatchability_of_fertile_eggs}">
															<font class="third-embed">受精蛋孵化率：</font>${physiological_data.hatchability_of_fertile_eggs}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.shell_color}">
															<font class="third-embed">蛋壳颜色：</font>${physiological_data.shell_color}<div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.brood_stage}">
															<font class="third-embed">孵化期：</font>${physiological_data.brood_stage}<font class="third-embed-unit">d</font><div class="dotted-line-nocolor"></div>
														</c:if>
														
														<br/>
														<div class="submit">
															<a href="super/physiological_data/create/${strain.id}/reproduction_physiological_data">+&nbsp;添加生殖生理数据</a>
															<a href="super/physiological_data/edit/${strain.id}/${physiological_data.id}">✎&nbsp;更新该测定组数据</a>
															<a href="super/physiological_data/remove/${physiological_data.id}">×&nbsp;删除该测定组数据</a>
														</div>
														<br/><div class="dotted-line"></div>
													</div>	
												</c:if>	
												<c:if test="${physiological_data.physiological_classification eq 'grow_physiological_data'}">
												<%
												if(grow_physiological_data==0)
												{out.println("<p></p><strong>生长发育生理参数：</strong><p></p>");}
												grow_physiological_data=1;
												%>
												</c:if>
												<c:if test="${physiological_data.physiological_classification eq 'grow_physiological_data'}">
												<div id="physiological${physiological_data.id}" class="physiological_data-select">【测定组】年龄:${physiological_data.age} &nbsp;|&nbsp;性别:${physiological_data.sex} &nbsp;|&nbsp;测定数量:${physiological_data.number}</div>  
    											<div id="text_physiological${physiological_data.id}" class="physiological_data">
													<div class="dotted-line-nocolor"></div>
													<c:if test="${!empty physiological_data.birth_weight}">
														<font class="second-embed">初生体重：</font>${physiological_data.birth_weight}<font class="second-embed-unit">g</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty physiological_data.weaning_weight}">
														<font class="second-embed">断奶体重：</font>${physiological_data.weaning_weight}<font class="second-embed-unit">g</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty physiological_data.adult_weight}">
														<font class="second-embed">成年体重：</font>${physiological_data.adult_weight}<font class="second-embed-unit">g</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty physiological_data.growth_curve_url}">
														<font class="second-embed">生长曲线：</font>${physiological_data.growth_curve_url}<div class="dotted-line-nocolor"></div>
													</c:if>
													<br/>
													<div class="submit">
														<a href="super/physiological_data/create/${strain.id}/grow_physiological_data">+&nbsp;添加生长发育生理数据</a>
														<a href="super/physiological_data/edit/${strain.id}/${physiological_data.id}">✎&nbsp;更新该测定组数据</a>
														<a href="super/physiological_data/remove/${physiological_data.id}">×&nbsp;删除该测定组数据</a>
													</div>
													<br/><div class="dotted-line"></div>
													</div>	
												</c:if>		
												<c:if test="${physiological_data.physiological_classification eq 'breathe_physiological_data'}">
												<%
												if(breathe_physiological_data==0)
												{out.println("<p></p><strong>呼吸生理参数：</strong><p></p>");}
												breathe_physiological_data=1;
												%>
												</c:if>
												<c:if test="${physiological_data.physiological_classification eq 'breathe_physiological_data'}">
												<div id="physiological${physiological_data.id}" class="physiological_data-select">【测定组】年龄:${physiological_data.age} &nbsp;|&nbsp;性别:${physiological_data.sex} &nbsp;|&nbsp;测定数量:${physiological_data.number}</div>  
    											<div id="text_physiological${physiological_data.id}" class="physiological_data">
													<div class="dotted-line-nocolor"></div>
													<c:if test="${!empty physiological_data.breathing_rate}">
														<font class="second-embed">呼吸频率：</font>${physiological_data.breathing_rate}<font class="second-embed-unit">次/m</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<br/>
													<div class="submit">
														<a href="super/physiological_data/create/${strain.id}/breathe_physiological_data">+&nbsp;添加呼吸生理数据</a>
														<a href="super/physiological_data/edit/${strain.id}/${physiological_data.id}">✎&nbsp;更新该测定组数据</a>
														<a href="super/physiological_data/remove/${physiological_data.id}">×&nbsp;删除该测定组数据</a>
													</div>
													<br/><div class="dotted-line"></div>
													</div>	
												</c:if>		
												<c:if test="${physiological_data.physiological_classification eq 'temperature_physiological_data'}">
												<%
												if(temperature_physiological_data==0)
												{out.println("<p></p><strong>体温参数：</strong><p></p>");}
												temperature_physiological_data=1;
												%>
												</c:if>
												<c:if test="${physiological_data.physiological_classification eq 'temperature_physiological_data'}">
												<div id="physiological${physiological_data.id}" class="physiological_data-select">【测定组】年龄:${physiological_data.age} &nbsp;|&nbsp;性别:${physiological_data.sex} &nbsp;|&nbsp;测定数量:${physiological_data.number}</div>  
    											<div id="text_physiological${physiological_data.id}" class="physiological_data">
													<div class="dotted-line-nocolor"></div>
													<c:if test="${!empty physiological_data.temperature}">
														<font class="second-embed">体温：</font>${physiological_data.temperature}<font class="second-embed-unit">℃</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<br/>
													<div class="submit">
														<a href="super/physiological_data/create/${strain.id}/temperature_physiological_data">+&nbsp;添加体温生理数据</a>
														<a href="super/physiological_data/edit/${strain.id}/${physiological_data.id}">✎&nbsp;更新该测定组数据</a>
														<a href="super/physiological_data/remove/${physiological_data.id}">×&nbsp;删除该测定组数据</a>
													</div>
													<br/><div class="dotted-line"></div>
												</div>	
												</c:if>		
												<c:if test="${physiological_data.physiological_classification eq 'digestive_physiological_data'}">
												<%
												if(digestive_physiological_data==0)
												{out.println("<p></p><strong>消化生理参数：</strong><p></p>");}
												digestive_physiological_data=1;
												%>
												</c:if>
												<c:if test="${physiological_data.physiological_classification eq 'digestive_physiological_data'}">
												<div id="physiological${physiological_data.id}" class="physiological_data-select">【测定组】年龄:${physiological_data.age} &nbsp;|&nbsp;性别:${physiological_data.sex} &nbsp;|&nbsp;测定数量:${physiological_data.number}</div>  
    											<div id="text_physiological${physiological_data.id}" class="physiological_data">
													<div class="dotted-line-nocolor"></div>
													<c:if test="${!empty physiological_data.digestive_index}">
														<font class="second-embed">消化能力：</font>${physiological_data.digestive_index}<div class="dotted-line-nocolor"></div>
													</c:if>
													<br/>
													<div class="submit">
														<a href="super/physiological_data/create/${strain.id}/digestive_physiological_data">+&nbsp;添加消化生理数据</a>
														<a href="super/physiological_data/edit/${strain.id}/${physiological_data.id}">✎&nbsp;更新该测定组数据</a>
														<a href="super/physiological_data/remove/${physiological_data.id}">×&nbsp;删除该测定组数据</a>
													</div>
													<br/><div class="dotted-line"></div>
												</div>	
												</c:if>	
												<c:if test="${physiological_data.physiological_classification eq 'immune_physiological_data'}">
												<%
												if(immune_physiological_data==0)
												{out.println("<p></p><strong>免疫生理参数：</strong><p></p>");}
												immune_physiological_data=1;
												%>
												</c:if>
												<c:if test="${physiological_data.physiological_classification eq 'immune_physiological_data'}">
												<div id="physiological${physiological_data.id}" class="physiological_data-select">【测定组】年龄:${physiological_data.age} &nbsp;|&nbsp;性别:${physiological_data.sex} &nbsp;|&nbsp;测定数量:${physiological_data.number}</div>  
    											<div id="text_physiological${physiological_data.id}" class="physiological_data">
													<div class="dotted-line-nocolor"></div>
													<c:if test="${!empty physiological_data.igg||!empty physiological_data.igm||!empty physiological_data.igd||!empty physiological_data.iga||!empty physiological_data.ige}">
														<font class="second-embed">免疫球蛋白：</font><div class="dotted-line-nocolor"></div>
													</c:if>
														<c:if test="${!empty physiological_data.igg}">
															<font class="third-embed">IgG：</font>${physiological_data.igg}<font class="third-embed-unit">mg/dl</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.igm}">
															<font class="third-embed">IgM：</font>${physiological_data.igm}<font class="third-embed-unit">mg/dl</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.igd}">
															<font class="third-embed">IgD：</font>${physiological_data.igd}<font class="third-embed-unit">mg/dl</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.iga}">
															<font class="third-embed">IgA：</font>${physiological_data.iga}<font class="third-embed-unit">mg/dl</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.ige}">
															<font class="third-embed">IgE：</font>${physiological_data.ige}<font class="third-embed-unit">mg/dl</font><div class="dotted-line-nocolor"></div>
														</c:if>
													<c:if test="${!empty physiological_data.t_cell||!empty physiological_data.b_cell}">
														<font class="second-embed">免疫活性细胞表型：</font><div class="dotted-line-nocolor"></div>
													</c:if>
														<c:if test="${!empty physiological_data.t_cell}">
															<font class="third-embed">T细胞：</font>${physiological_data.t_cell}<div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.b_cell}">
															<font class="third-embed">B细胞：</font>${physiological_data.b_cell}<div class="dotted-line-nocolor"></div>
														</c:if>
													<br/>
													<div class="submit">
														<a href="super/physiological_data/create/${strain.id}/immune_physiological_data">+&nbsp;添加免疫生理数据</a>
														<a href="super/physiological_data/edit/${strain.id}/${physiological_data.id}">✎&nbsp;更新该测定组数据</a>
														<a href="super/physiological_data/remove/${physiological_data.id}">×&nbsp;删除该测定组数据</a>
													</div>
													<br/><div class="dotted-line"></div>
													</div>
												</c:if>
												<c:if test="${physiological_data.physiological_classification eq 'cardiovascular_physiological_data'}">
												<%
												if(cardiovascular_physiological_data==0)
												{out.println("<p></p><strong>心血管生理参数：</strong><p></p>");}
												cardiovascular_physiological_data=1;
												%>
												</c:if>
												<c:if test="${physiological_data.physiological_classification eq 'cardiovascular_physiological_data'}">
												<div id="physiological${physiological_data.id}" class="physiological_data-select">【测定组】年龄:${physiological_data.age} &nbsp;|&nbsp;性别:${physiological_data.sex} &nbsp;|&nbsp;测定数量:${physiological_data.number}</div>  
    											<div id="text_physiological${physiological_data.id}" class="physiological_data">
													<div class="dotted-line-nocolor"></div>
													<c:if test="${!empty physiological_data.systolic_pressure||!empty physiological_data.diastolic_pressure}">
														<font class="second-embed">血压：</font><div class="dotted-line-nocolor"></div>
													</c:if>
														<c:if test="${!empty physiological_data.systolic_pressure}">
															<font class="third-embed">收缩压：</font>${physiological_data.systolic_pressure}<font class="third-embed-unit">mmHg</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty physiological_data.diastolic_pressure}">
															<font class="third-embed">舒张压：</font>${physiological_data.diastolic_pressure}<font class="third-embed-unit">mmHg</font><div class="dotted-line-nocolor"></div>
														</c:if>
													<c:if test="${!empty physiological_data.heart_rate}">
														<font class="second-embed">心率：</font>${physiological_data.heart_rate}<font class="second-embed-unit">次/m</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty physiological_data.electrocardiogram_url}">
														<font class="second-embed">心电图：</font>${physiological_data.electrocardiogram_url}<div class="dotted-line-nocolor"></div>
													</c:if>
													<br/>
													<div class="submit">
														<a href="super/physiological_data/create/${strain.id}/cardiovascular_physiological_data">+&nbsp;添加心血管生理数据</a>
														<a href="super/physiological_data/edit/${strain.id}/${physiological_data.id}">✎&nbsp;更新该测定组数据</a>
														<a href="super/physiological_data/remove/${physiological_data.id}">×&nbsp;删除该测定组数据</a>
													</div>
													<br/><div class="dotted-line"></div>
													</div>
												</c:if>
											</c:forEach>
											<%
												if(blood_physiological_data==0)
												{
													out.println("<p></p><strong>血液生理参数：</strong><p></p>");
													out.println("<div class='submit'><a href='super/physiological_data/create/");%>${strain.id}<%out.println("/blood_physiological_data'>+&nbsp;添加血液生理数据</a></div><br/><div class='dotted-line'></div>");
												}
												blood_physiological_data=1;
												if(reproduction_physiological_data==0)
												{
													out.println("<p></p><strong>生殖生理参数：</strong><p></p>");
													out.println("<div class='submit'><a href='super/physiological_data/create/");%>${strain.id}<%out.println("/reproduction_physiological_data'>+&nbsp;添加生殖生理数据</a></div><br/><div class='dotted-line'></div>");
												}
												reproduction_physiological_data=1;
												if(grow_physiological_data==0)
												{
													out.println("<p></p><strong>生长发育生理参数：</strong><p></p>");
													out.println("<div class='submit'><a href='super/physiological_data/create/");%>${strain.id}<%out.println("/grow_physiological_data'>+&nbsp;添加生长发育生理数据</a></div><br/><div class='dotted-line'></div>");
												}
												grow_physiological_data=1;
												if(breathe_physiological_data==0)
												{
													out.println("<p></p><strong>呼吸生理参数：</strong><p></p>");
													out.println("<div class='submit'><a href='super/physiological_data/create/");%>${strain.id}<%out.println("/breathe_physiological_data'>+&nbsp;添加呼吸生理数据</a></div><br/><div class='dotted-line'></div>");
												}
												breathe_physiological_data=1;
												if(temperature_physiological_data==0)
												{
													out.println("<p></p><strong>体温参数：</strong><p></p>");
													out.println("<div class='submit'><a href='super/physiological_data/create/");%>${strain.id}<%out.println("/temperature_physiological_data'>+&nbsp;添加体温数据</a></div><br/><div class='dotted-line'></div>");
												}
												temperature_physiological_data=1;
												if(digestive_physiological_data==0)
												{
													out.println("<p></p><strong>消化生理参数：</strong><p></p>");
													out.println("<div class='submit'><a href='super/physiological_data/create/");%>${strain.id}<%out.println("/digestive_physiological_data'>+&nbsp;添加消化生理数据</a></div><br/><div class='dotted-line'></div>");
												}
												digestive_physiological_data=1;
												if(immune_physiological_data==0)
												{
													out.println("<p></p><strong>免疫生理参数：</strong><p></p>");
													out.println("<div class='submit'><a href='super/physiological_data/create/");%>${strain.id}<%out.println("/immune_physiological_data'>+&nbsp;添加免疫生理数据</a></div><br/><div class='dotted-line'></div>");
												}
												immune_physiological_data=1;
												if(cardiovascular_physiological_data==0)
												{
													out.println("<p></p><strong>心血管生理参数：</strong><p></p>");
													out.println("<div class='submit'><a href='super/physiological_data/create/");%>${strain.id}<%out.println("/cardiovascular_physiological_data'>+&nbsp;添加心血管生理数据</a></div><br/><div class='dotted-line'></div>");
												}
												cardiovascular_physiological_data=1;
											%>											
										</div>
									</li>  
      								<!-- ====================================================以上为第二层信息【生理数据】=============================================================== -->    
      								<!-- ====================================================以下为第二层信息【生化数据】=============================================================== -->    																
      								<li class="line">
      									<div id="second_level_menu_title-04" class="second_leve_menu">
      										<a href="javascript:void(0);">
      										<img id="second_level_menu_image-04" src="resources/images/plus.png">
      											<span>生化数据</span>
      										</a>
      									</div>
      									<div id="second_level_menu-04" class="second_level_text">
											<p></p>
											<%
											int blood_biochemical_data=0;
											int urine_biochemical_data=0;
											%>
											<c:forEach items="${strain.biochemical_data}" var="biochemical_data">
												<div class="dotted-line-nocolor"></div>
												<c:if test="${biochemical_data.biochemical_classification eq 'blood_biochemical_data'}">
												<%
												if(blood_biochemical_data==0)
												{out.println("<p></p><strong>血液生化参数：</strong><p></p>");}
												blood_biochemical_data=1;
												%>
												</c:if>
												<c:if test="${biochemical_data.biochemical_classification eq 'blood_biochemical_data'}">
												<div id="biochemical${biochemical_data.id}" class="physiological_data-select">【测定组】年龄:${biochemical_data.age} &nbsp;|&nbsp;性别:${biochemical_data.sex} &nbsp;|&nbsp;测定数量:${biochemical_data.number}</div>  
    											<div id="text_biochemical${biochemical_data.id}" class="physiological_data">
													<div class="dotted-line-nocolor"></div>
													<c:if test="${!empty biochemical_data.blood_ph}">
														<font class="second-embed">血液pH：</font>${biochemical_data.blood_ph}<div class="dotted-line-nocolor"></div>
													</c:if>
													
													<c:if test="${!empty biochemical_data.blood_na||!empty biochemical_data.blood_k||!empty biochemical_data.blood_ca||!empty biochemical_data.blood_mg||!empty biochemical_data.blood_cl||!empty biochemical_data.blood_p}">
														<font class="second-embed">血电解质：</font><div class="dotted-line-nocolor"></div>
													</c:if>
														<c:if test="${!empty biochemical_data.blood_na}">
															<font class="third-embed">Na<span style="vertical-align:super; font-size:80%">+</span>：</font>${biochemical_data.blood_na}<font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty biochemical_data.blood_k}">
															<font class="third-embed">K<span style="vertical-align:super; font-size:80%">+</span>：</font>${biochemical_data.blood_k}<font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty biochemical_data.blood_ca}">
															<font class="third-embed">Ca<span style="vertical-align:super; font-size:80%">2+</span>：</font>${biochemical_data.blood_ca}<font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty biochemical_data.blood_mg}">
															<font class="third-embed">Mg<span style="vertical-align:super; font-size:80%">2+</span>：</font>${biochemical_data.blood_mg}<font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty biochemical_data.blood_cl}">
															<font class="third-embed">Cl<span style="vertical-align:super; font-size:80%">-</span>：</font>${biochemical_data.blood_cl}<font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty biochemical_data.blood_p}">
															<font class="third-embed">P<span style="vertical-align:super; font-size:80%">+</span>：</font>${biochemical_data.blood_p}<font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty biochemical_data.blood_fe}">
															<font class="third-embed">Fe<span style="vertical-align:super; font-size:80%">2+</span>：</font>${biochemical_data.blood_fe}<font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
														</c:if>
													<c:if test="${!empty biochemical_data.ast}">
														<font class="second-embed">谷草转氨酶：</font>${biochemical_data.ast}<font class="second-embed-unit">U/L</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.alt}">
														<font class="second-embed">谷丙转氨酶：</font>${biochemical_data.alt}<font class="second-embed-unit">U/L</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.alp}">
														<font class="second-embed">碱性磷酸酶：</font>${biochemical_data.alp}<font class="second-embed-unit">U/L</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.ldh}">
														<font class="second-embed">乳酸脱氢酶：</font>${biochemical_data.ldh}<font class="second-embed-unit">U/L</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.cre}">
														<font class="second-embed">肌苷：</font>${biochemical_data.cre}<font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.bun}">
														<font class="second-embed">尿素氮：</font>${biochemical_data.bun}<font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.tch}">
														<font class="second-embed">总胆固醇：</font>${biochemical_data.tch}<font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.tp}">
														<font class="second-embed">血清总蛋白：</font>${biochemical_data.tp}<font class="second-embed-unit">g/L</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.alb}">
														<font class="second-embed">白蛋白：</font>${biochemical_data.alb}<font class="second-embed-unit">g/L</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.tg}">
														<font class="second-embed">甘油三脂：</font>${biochemical_data.tg}<font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.glu}">
														<font class="second-embed">血糖：</font>${biochemical_data.glu}<font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.progesterone}">
														<font class="second-embed">孕酮：</font>${biochemical_data.progesterone}<font class="second-embed-unit">ng/mL</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.total_bilirubin}">
														<font class="second-embed">总胆红素：</font>${biochemical_data.total_bilirubin}<font class="second-embed-unit">μmol/L</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.c_hdl}">
														<font class="second-embed">高密度脂蛋白胆固醇：</font>${biochemical_data.c_hdl}<font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.c_ldl}">
														<font class="second-embed">低密度脂蛋白胆固醇：</font>${biochemical_data.c_ldl}<font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
													</c:if>
														<br/>
														<div class="submit">
															<a href="super/biochemical_data/create/${strain.id}/blood_biochemical_data">+&nbsp;添加血液生化数据</a>
															<a href="super/biochemical_data/edit/${strain.id}/${biochemical_data.id}">✎&nbsp;更新该测定组数据</a>
															<a href="super/biochemical_data/remove/${biochemical_data.id}">×&nbsp;删除该测定组数据</a>
														</div>
														<br/><div class="dotted-line"></div>
													</div>
												</c:if>
												<c:if test="${biochemical_data.biochemical_classification eq 'urine_biochemical_data'}">
												<%
												if(urine_biochemical_data==0)
												{out.println("<p></p><strong>尿生化参数：</strong><p></p>");}
												urine_biochemical_data=1;
												%>
												</c:if>
												<c:if test="${biochemical_data.biochemical_classification eq 'urine_biochemical_data'}">
												<div id="biochemical${biochemical_data.id}" class="physiological_data-select">【测定组】年龄:${biochemical_data.age} &nbsp;|&nbsp;性别:${biochemical_data.sex} &nbsp;|&nbsp;测定数量:${biochemical_data.number}</div>  
    											<div id="text_biochemical${biochemical_data.id}" class="physiological_data">
													<div class="dotted-line-nocolor"></div>
													<c:if test="${!empty biochemical_data.urine_ph}">
														<font class="second-embed">尿液pH：</font>${biochemical_data.urine_ph}<div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.up}">
														<font class="second-embed">尿蛋白：</font>${biochemical_data.up}<font class="second-embed-unit">ng/mL</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.ua}">
														<font class="second-embed">尿酸：</font>${biochemical_data.ua}<font class="second-embed-unit">ng/mL</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.urine_na||!empty biochemical_data.urine_k||!empty biochemical_data.urine_ca||!empty biochemical_data.urine_mg||!empty biochemical_data.urine_cl}">
														<font class="second-embed">尿电解质：</font><div class="dotted-line-nocolor"></div>
													</c:if>
														<c:if test="${!empty biochemical_data.urine_na}">
															<font class="third-embed">Na<span style="vertical-align:super; font-size:80%">+</span>：</font>${biochemical_data.urine_na}<font class="third-embed-unit">mg/dL</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty biochemical_data.urine_k}">
															<font class="third-embed">K<span style="vertical-align:super; font-size:80%">+</span>：</font>${biochemical_data.urine_k}<font class="third-embed-unit">mg/dL</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty biochemical_data.urine_ca}">
															<font class="third-embed">Ca<span style="vertical-align:super; font-size:80%">2+</span>：</font>${biochemical_data.urine_ca}<font class="third-embed-unit">mg/dL</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty biochemical_data.urine_mg}">
															<font class="third-embed">Mg<span style="vertical-align:super; font-size:80%">2+</span>：</font>${biochemical_data.urine_mg}<font class="third-embed-unit">mg/dL</font><div class="dotted-line-nocolor"></div>
														</c:if>
														<c:if test="${!empty biochemical_data.urine_cl}">
															<font class="third-embed">Cl<span style="vertical-align:super; font-size:80%">-</span>：</font>${biochemical_data.urine_cl}<font class="third-embed-unit">mg/dL</font><div class="dotted-line-nocolor"></div>
														</c:if>
													<c:if test="${!empty biochemical_data.specific_weight}">
														<font class="second-embed">比重：</font>${biochemical_data.specific_weight}<div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty biochemical_data.upd}">
														<font class="second-embed">尿量：</font>${biochemical_data.upd}<font class="second-embed-unit">ml/g/天</font><div class="dotted-line-nocolor"></div>
													</c:if>
													
													
														<br/>
														<div class="submit">
															<a href="super/biochemical_data/create/${strain.id}/urine_biochemical_data">+&nbsp;添加尿生化数据</a>
															<a href="super/biochemical_data/edit/${strain.id}/${biochemical_data.id}">✎&nbsp;更新该测定组数据</a>
															<a href="super/biochemical_data/remove/${biochemical_data.id}">×&nbsp;删除该测定组数据</a>
														</div>
														<br/><div class="dotted-line"></div>
													</div>
												</c:if>
												
											</c:forEach>
											<%
												if(blood_biochemical_data==0)
												{
													out.println("<p></p><strong>血液生化参数：</strong><p></p>");
													out.println("<div class='submit'><a href='super/biochemical_data/create/");%>${strain.id}<%out.println("/blood_biochemical_data'>+&nbsp;添加血液生化数据</a></div><br/><div class='dotted-line'></div>");
												}
												blood_biochemical_data=1;
												if(urine_biochemical_data==0)
												{
													out.println("<p></p><strong>尿生化参数：</strong><p></p>");
													out.println("<div class='submit'><a href='super/biochemical_data/create/");%>${strain.id}<%out.println("/urine_biochemical_data'>+&nbsp;添加尿生化数据</a></div><br/><div class='dotted-line'></div>");
												}
												urine_biochemical_data=1;
												
											%>											
										</div>
									</li>  
      								<!-- ====================================================以上为第二层信息【生化数据】=============================================================== -->  
      								<!-- ====================================================以下为第二层信息【解剖数据】=============================================================== -->    																
      								<li class="line">
      									<div id="second_level_menu_title-05" class="second_leve_menu">
      										<a href="javascript:void(0);">
      										<img id="second_level_menu_image-05" src="resources/images/plus.png">
      											<span>解剖数据</span>
      										</a>
      									</div>
      									<div id="second_level_menu-05" class="second_level_text">
											<p></p>
											<%
											int body_measurement_data=0;
											int skeleton_data=0;
											int organ_weight_data=0;
											int intestinal_length_data=0;
											int nipple_data=0;
											int dental_formula_data=0;
											%>
											<c:forEach items="${strain.autopsy_data}" var="autopsy_data">
												<div class="dotted-line-nocolor"></div>
												<c:if test="${autopsy_data.autopsy_classification eq 'body_measurement_data'}">
												<%
												if(body_measurement_data==0)
												{out.println("<p></p><strong>体尺：</strong><p></p>");}
												body_measurement_data=1;
												%>
												</c:if>
												<c:if test="${autopsy_data.autopsy_classification eq 'body_measurement_data'}">
												<div id="autopsy${autopsy_data.id}" class="physiological_data-select">【测定组】年龄:${autopsy_data.age} &nbsp;|&nbsp;性别:${autopsy_data.sex} &nbsp;|&nbsp;测定数量:${autopsy_data.number}</div>  
    											<div id="text_autopsy${autopsy_data.id}" class="physiological_data">
													<div class="dotted-line-nocolor"></div>
													<c:if test="${!empty autopsy_data.body_height}">
														<font class="second-embed">体高：</font>${autopsy_data.body_height}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.body_length}">
														<font class="second-embed">体长：</font>${autopsy_data.body_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.tail_length}">
														<font class="second-embed">尾长：</font>${autopsy_data.tail_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.length_body_proportion}">
														<font class="second-embed">尾／体比：</font>${autopsy_data.length_body_proportion}<div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.body_inclined_length}">
														<font class="second-embed">体斜长：</font>${autopsy_data.body_inclined_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.ear_length}">
														<font class="second-embed">耳长：</font>${autopsy_data.ear_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.ear_width}">
														<font class="second-embed">耳宽：</font>${autopsy_data.ear_width}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.chest_width}">
														<font class="second-embed">胸宽：</font>${autopsy_data.chest_width}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.chest_depth}">
														<font class="second-embed">胸深：</font>${autopsy_data.chest_depth}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.stem_length}">
														<font class="second-embed">躯干长：</font>${autopsy_data.stem_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.fore_limb_length}">
														<font class="second-embed">前肢长：</font>${autopsy_data.fore_limb_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.posterior_limb_length}">
														<font class="second-embed">后肢长：</font>${autopsy_data.posterior_limb_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<br/>
														<div class="submit">
															<a href="super/autopsy_data/create/${strain.id}/body_measurement_data">+&nbsp;添加体尺数据</a>
															<a href="super/autopsy_data/edit/${strain.id}/${autopsy_data.id}">✎&nbsp;更新该测定组数据</a>
															<a href="super/autopsy_data/remove/${autopsy_data.id}">×&nbsp;删除该测定组数据</a>
														</div>
														<br/><div class="dotted-line"></div>
													</div>
												</c:if>
												<c:if test="${autopsy_data.autopsy_classification eq 'skeleton_data'}">
												<%
												if(skeleton_data==0)
												{out.println("<p></p><strong>骨骼：</strong><p></p>");}
												skeleton_data=1;
												%>
												</c:if>
												<c:if test="${autopsy_data.autopsy_classification eq 'skeleton_data'}">
												<div id="autopsy${autopsy_data.id}" class="physiological_data-select">【测定组】年龄:${autopsy_data.age} &nbsp;|&nbsp;性别:${autopsy_data.sex} &nbsp;|&nbsp;测定数量:${autopsy_data.number}</div>  
    											
    											<div id="text_autopsy${autopsy_data.id}" class="physiological_data">
													<div class="dotted-line-nocolor"></div>
													<c:if test="${!empty autopsy_data.totality_skeleton}">
														<font class="second-embed">骨骼总数：</font>${autopsy_data.totality_skeleton}<div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.skull}">
														<font class="second-embed">头骨：</font>${autopsy_data.skull}<div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.cervical_vertebra}">
														<font class="second-embed">颈椎：</font>${autopsy_data.cervical_vertebra}<div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.thoracalis_vertebra}">
														<font class="second-embed">胸椎：</font>${autopsy_data.thoracalis_vertebra}<div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.lumbalis_vertebra}">
														<font class="second-embed">腰椎：</font>${autopsy_data.lumbalis_vertebra}<div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.sacrales_vertebra}">
														<font class="second-embed">骶椎：</font>${autopsy_data.sacrales_vertebra}<div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.coccygeal_vertebra}">
														<font class="second-embed">尾椎：</font>${autopsy_data.coccygeal_vertebra}<div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.bird_sternum_length}">
														<font class="second-embed">龙骨长：</font>${autopsy_data.bird_sternum_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.pelvis_width}">
														<font class="second-embed">股盆宽：</font>${autopsy_data.pelvis_width}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.tibia_length}">
														<font class="second-embed">胫长：</font>${autopsy_data.tibia_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<br/>
														<div class="submit">
															<a href="super/autopsy_data/create/${strain.id}/skeleton_data">+&nbsp;添加骨骼数据</a>
															<a href="super/autopsy_data/edit/${strain.id}/${autopsy_data.id}">✎&nbsp;更新该测定组数据</a>
															<a href="super/autopsy_data/remove/${autopsy_data.id}">×&nbsp;删除该测定组数据</a>
														</div>
														<br/><div class="dotted-line"></div>
													</div>
												</c:if>
												<c:if test="${autopsy_data.autopsy_classification eq 'organ_weight_data'}">
												<%
												if(organ_weight_data==0)
												{out.println("<p></p><strong>脏器重量：</strong><p></p>");}
												organ_weight_data=1;
												%>
												</c:if>
												<c:if test="${autopsy_data.autopsy_classification eq 'organ_weight_data'}">
												<div id="autopsy${autopsy_data.id}" class="physiological_data-select">【测定组】年龄:${autopsy_data.age} &nbsp;|&nbsp;性别:${autopsy_data.sex} &nbsp;|&nbsp;测定数量:${autopsy_data.number}</div>  
    											<div id="text_autopsy${autopsy_data.id}" class="physiological_data">
													<div class="dotted-line-nocolor"></div>
													<c:if test="${!empty autopsy_data.heart}">
														<font class="second-embed">心：</font>${autopsy_data.heart}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.lung}">
														<font class="second-embed">肺：</font>${autopsy_data.lung}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.liver}">
														<font class="second-embed">肝：</font>${autopsy_data.liver}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.spleen}">
														<font class="second-embed">脾：</font>${autopsy_data.spleen}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.kidney}">
														<font class="second-embed">肾：</font>${autopsy_data.kidney}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.brain}">
														<font class="second-embed">脑：</font>${autopsy_data.brain}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.thyroid}">
														<font class="second-embed">甲状腺：</font>${autopsy_data.thyroid}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.renicapsule}">
														<font class="second-embed">肾上腺：</font>${autopsy_data.renicapsule}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.oarium}">
														<font class="second-embed">卵巢：</font>${autopsy_data.oarium}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.testicle}">
														<font class="second-embed">睾丸：</font>${autopsy_data.testicle}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.thymus_gland}">
														<font class="second-embed">胸腺：</font>${autopsy_data.thymus_gland}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.bursa_of_fabricius}">
														<font class="second-embed">法氏囊：</font>${autopsy_data.bursa_of_fabricius}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<br/>
														<div class="submit">
															<a href="super/autopsy_data/create/${strain.id}/organ_weight_data">+&nbsp;添加脏器重量数据</a>
															<a href="super/autopsy_data/edit/${strain.id}/${autopsy_data.id}">✎&nbsp;更新该测定组数据</a>
															<a href="super/autopsy_data/remove/${autopsy_data.id}">×&nbsp;删除该测定组数据</a>
														</div>
														<br/><div class="dotted-line"></div>
													</div>
												</c:if>
												<c:if test="${autopsy_data.autopsy_classification eq 'intestinal_length_data'}">
												<%
												if(intestinal_length_data==0)
												{out.println("<p></p><strong>肠道长度：</strong><p></p>");}
												intestinal_length_data=1;
												%>
												</c:if>
												<c:if test="${autopsy_data.autopsy_classification eq 'intestinal_length_data'}">
												<div id="autopsy${autopsy_data.id}" class="physiological_data-select">【测定组】年龄:${autopsy_data.age} &nbsp;|&nbsp;性别:${autopsy_data.sex} &nbsp;|&nbsp;测定数量:${autopsy_data.number}</div>  
    											<div id="text_autopsy${autopsy_data.id}" class="physiological_data">
													<div class="dotted-line-nocolor"></div>
													<c:if test="${!empty autopsy_data.small_intestine}">
														<font class="second-embed">小肠：</font>${autopsy_data.small_intestine}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.caecum}">
														<font class="second-embed">盲肠：</font>${autopsy_data.caecum}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.large_intesting}">
														<font class="second-embed">结肠：</font>${autopsy_data.large_intesting}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.rectum}">
														<font class="second-embed">直肠：</font>${autopsy_data.rectum}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<br/>
														<div class="submit">
															<a href="super/autopsy_data/create/${strain.id}/intestinal_length_data">+&nbsp;添加肠道长度数据</a>
															<a href="super/autopsy_data/edit/${strain.id}/${autopsy_data.id}">✎&nbsp;更新该测定组数据</a>
															<a href="super/autopsy_data/remove/${autopsy_data.id}">×&nbsp;删除该测定组数据</a>
														</div>
														<br/><div class="dotted-line"></div>
													</div>
												</c:if>
												<c:if test="${autopsy_data.autopsy_classification eq 'nipple_data'}">
												<%
												if(nipple_data==0)
												{out.println("<p></p><strong>乳头：</strong><p></p>");}
												nipple_data=1;
												%>
												</c:if>
												<c:if test="${autopsy_data.autopsy_classification eq 'nipple_data'}">
												<div id="autopsy${autopsy_data.id}" class="physiological_data-select">【测定组】年龄:${autopsy_data.age} &nbsp;|&nbsp;性别:${autopsy_data.sex} &nbsp;|&nbsp;测定数量:${autopsy_data.number}</div>  
    											<div id="text_autopsy${autopsy_data.id}" class="physiological_data">
													<div class="dotted-line-nocolor"></div>
													<c:if test="${!empty autopsy_data.nipple}">
														<font class="second-embed">乳头：</font>${autopsy_data.nipple}<font class="second-embed-unit">个</font><div class="dotted-line-nocolor"></div>
													</c:if>
													<br/>
														<div class="submit">
															<a href="super/autopsy_data/create/${strain.id}/nipple_data">+&nbsp;添加乳头数据</a>
															<a href="super/autopsy_data/edit/${strain.id}/${autopsy_data.id}">✎&nbsp;更新该测定组数据</a>
															<a href="super/autopsy_data/remove/${autopsy_data.id}">×&nbsp;删除该测定组数据</a>
														</div>
														<br/><div class="dotted-line"></div>
													</div>
												</c:if>
												<c:if test="${autopsy_data.autopsy_classification eq 'dental_formula_data'}">
												<%
												if(dental_formula_data==0)
												{out.println("<p></p><strong>齿式：</strong><p></p>");}
												dental_formula_data=1;
												%>
												</c:if>
												<c:if test="${autopsy_data.autopsy_classification eq 'dental_formula_data'}">
												<div id="autopsy${autopsy_data.id}" class="physiological_data-select">【测定组】年龄:${autopsy_data.age} &nbsp;|&nbsp;性别:${autopsy_data.sex} &nbsp;|&nbsp;测定数量:${autopsy_data.number}</div>  
    											<div id="text_autopsy${autopsy_data.id}" class="physiological_data">
													<div class="dotted-line-nocolor"></div>
													<c:if test="${!empty autopsy_data.milk_tooth}">
														<font class="second-embed">乳齿：</font>${autopsy_data.milk_tooth}<div class="dotted-line-nocolor"></div>
													</c:if>
													<c:if test="${!empty autopsy_data.permanent_tooth}">
														<font class="second-embed">恒齿：</font>${autopsy_data.permanent_tooth}<div class="dotted-line-nocolor"></div>
													</c:if>
													<br/>
														<div class="submit">
															<a href="super/autopsy_data/create/${strain.id}/dental_formula_data">+&nbsp;添加齿式数据</a>
															<a href="super/autopsy_data/edit/${strain.id}/${autopsy_data.id}">✎&nbsp;更新该测定组数据</a>
															<a href="super/autopsy_data/remove/${autopsy_data.id}">×&nbsp;删除该测定组数据</a>
														</div>
														<br/><div class="dotted-line"></div>
													</div>
												</c:if>
												
											</c:forEach>
											<%
												if(body_measurement_data==0)
												{
													out.println("<p></p><strong>体尺：</strong><p></p>");
													out.println("<div class='submit'><a href='super/autopsy_data/create/");%>${strain.id}<%out.println("/body_measurement_data'>+&nbsp;添加体尺数据</a></div><br/><div class='dotted-line'></div>");
												}
												body_measurement_data=1;
												if(skeleton_data==0)
												{
													out.println("<p></p><strong>骨骼：</strong><p></p>");
													out.println("<div class='submit'><a href='super/autopsy_data/create/");%>${strain.id}<%out.println("/skeleton_data'>+&nbsp;添加骨骼数据</a></div><br/><div class='dotted-line'></div>");
												}
												skeleton_data=1;
												if(organ_weight_data==0)
												{
													out.println("<p></p><strong>脏器重量：</strong><p></p>");
													out.println("<div class='submit'><a href='super/autopsy_data/create/");%>${strain.id}<%out.println("/organ_weight_data'>+&nbsp;添加脏器重量数据</a></div><br/><div class='dotted-line'></div>");
												}
												organ_weight_data=1;
												if(intestinal_length_data==0)
												{
													out.println("<p></p><strong>肠道长度：</strong><p></p>");
													out.println("<div class='submit'><a href='super/autopsy_data/create/");%>${strain.id}<%out.println("/intestinal_length_data'>+&nbsp;添加肠道长度数据</a></div><br/><div class='dotted-line'></div>");
												}
												intestinal_length_data=1;
												if(nipple_data==0)
												{
													out.println("<p></p><strong>乳头：</strong><p></p>");
													out.println("<div class='submit'><a href='super/autopsy_data/create/");%>${strain.id}<%out.println("/nipple_data'>+&nbsp;添加乳头数据</a></div><br/><div class='dotted-line'></div>");
												}
												nipple_data=1;
												if(dental_formula_data==0)
												{
													out.println("<p></p><strong>齿式：</strong><p></p>");
													out.println("<div class='submit'><a href='super/autopsy_data/create/");%>${strain.id}<%out.println("/dental_formula_data'>+&nbsp;添加齿式数据</a></div><br/><div class='dotted-line'></div>");
												}
												dental_formula_data=1;
											%>											
										</div>
									</li>  
      								<!-- ====================================================以上为第二层信息【解剖数据】=============================================================== -->  
      							</ul>
      																
							</div>
								
									<c:if test="${!empty strain.time}">
											<p><div class="text-right" style=" text-align:right;">发布时间：${strain.time}</div></p>
									</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>		
<jsp:include page="backstage_foot.jsp"/>
	</body>
</html>