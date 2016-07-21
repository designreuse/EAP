
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
        <script type="text/javascript" src="resources/js/animal_broker.js"></script> 	
        <link rel="stylesheet" type="text/css" href="resources/css/animal_style.css" />
        <script type="text/javascript" src="resources/js/animal_script.js"></script>
        	<title>品系详情</title>       
      </head>
      <body>  
		<jsp:include page="head.jsp"/> 
		<div id="content">
		<div class="inner">
			<div class="container_12">	
      	<div class="row-fluid dlc-body" >
      	<div class="picture-frame-gray">
           <div class="download-main-article">
    			<div class="row-fluid" >
    				<div class="span bp0-col-1-1 bp1-col-1-1 bp2-col-1-1 bp3-col-1-1 brief-description">
        				<c:if test="${!empty species.species_ch}">
							${species.species_ch}
						</c:if>
						<c:if test="${!empty species.species_en}">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（${species.species_en}）
						</c:if>
					</div>
      			</div>
      			<div class="row-fluid no-margin-row">
      				<div class="row-fluid no-margin-row" data-view4="1" data-view3="1" data-view2="1" data-view1="1" data-cols="1">
      					<div class="span bp0-col-1-1 bp1-col-1-1 bp2-col-1-1 bp3-col-1-1 download-main-article"> 
      					<form:form action="${addAction}" commandName="strain">
      					<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      						<c:if test="${!empty listStrains}">      						
      							<li class=" mscom-accordion-item" id="storey-00">
      								<a class="mscom-link mscom-accordion-item-link">
      									<span class="mscom-accordion-item-image"></span>
      									<span class="mscom-accordion-item-title">基本信息</span>
      								</a>
      								<div class="mscom-accordion-item-container">
										<div class="fileinfo">
											<c:if test="${!empty species.species_ch}">
												<strong>名称：</strong>${species.species_ch}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
										</div>
									</div>
								</li>  
							</c:if>	
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
      						<div id="storey-01" class="CMSvNextComp mscom-accordion" role="tablist">      															
      							<ul> 
      								<!-- ====================================================以下为第二层信息【分类信息】=============================================================== -->    																
      									<li class=" mscom-accordion-item">
      										<a class="mscom-link mscom-accordion-item-link">
      											<span class="mscom-accordion-item-image"></span>
      											<span class="mscom-accordion-item-title">分类信息</span>
      										</a>
      										<div class="mscom-accordion-item-container">
												<div class="fileinfo">
													<div class="span bp0-col-1-1 bp1-col-1-1 bp2-col-1-1 bp3-col-1-1">
													
													<c:if test="${(!empty species.phylum_ch)||(!empty species.phylum_en)}">
														<p><strong>门：</strong>
													</c:if>
														<c:if test="${!empty species.phylum_ch}">
															${species.phylum_ch}
														</c:if>
														<c:if test="${!empty species.phylum_en}">
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（${species.phylum_en}）
														</c:if>
													<c:if test="${(!empty species.phylum_ch)||(!empty species.phylum_en)}">
														</p>
													</c:if>
													
													<c:if test="${(!empty species.class_ch)||(!empty species.class_en)}">
														<p><strong>纲：</strong>
													</c:if>
														<c:if test="${!empty species.class_ch}">
															${species.class_ch}
														</c:if>
														<c:if test="${!empty species.class_en}">
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（${species.class_en}）
														</c:if>
													<c:if test="${(!empty species.class_ch)||(!empty species.class_en)}">
														</p>
													</c:if>
													
													<c:if test="${(!empty species.order_ch)||(!empty species.order_en)}">
														<p><strong>目：</strong>
													</c:if>
														<c:if test="${!empty species.order_ch}">
															${species.order_ch}
														</c:if>
														<c:if test="${!empty species.order_en}">
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（${species.order_en}）
														</c:if>
													<c:if test="${(!empty species.order_ch)||(!empty species.order_en)}">
														</p>
													</c:if>
													
													<c:if test="${(!empty species.family_ch)||(!empty species.family_en)}">
														<p><strong>科：</strong>
													</c:if>
														<c:if test="${!empty species.family_ch}">
															${species.family_ch}
														</c:if>
														<c:if test="${!empty species.family_en}">
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（${species.family_en}）
														</c:if>
													<c:if test="${(!empty species.family_ch)||(!empty species.family_en)}">
														</p>
													</c:if>
													
													<c:if test="${(!empty species.genus_ch)||(!empty species.genus_en)}">
														<p><strong>科：</strong>
													</c:if>
														<c:if test="${!empty species.genus_ch}">
															${species.genus_ch}
														</c:if>
														<c:if test="${!empty species.genus_en}">
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（${species.genus_en}）
														</c:if>
													<c:if test="${(!empty species.genus_ch)||(!empty species.genus_en)}">
														</p>
													</c:if>
													
													<c:if test="${(!empty species.species_ch)||(!empty species.species_en)}">
														<p><strong>种：</strong>
													</c:if>
														<c:if test="${!empty species.species_ch}">
															${species.species_ch}
														</c:if>
														<c:if test="${!empty species.species_en}">
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（${species.species_en}）
														</c:if>
													<c:if test="${(!empty species.species_ch)||(!empty species.species_en)}">
														</p>
													</c:if>
													
													<c:if test="${!empty species.note}">
														<p><strong>简介：</strong>${species.note}</p>
													</c:if>
													
													</div>
													<div class="kb-sb">
														<div class="files-more">
															<span class="loc" >
																参考文献： 
															</span>
															<br/>
															[1]易传辉,陈焱,和秋菊,周远,王琳,陈晓鸣. 格彩臂金龟(Cherirotonus gestroi Pouillaud)形态特征研究[J]. 西北林学院学报,2015,02:154-157.<br/>
															[2]易传辉,陈焱,和秋菊,周远,王琳,陈晓鸣. 格彩臂金龟(Cherirotonus gestroi Pouillaud)形态特征研究[J]. 西北林学院学报,2015,02:154-157.<br/>
														</div>
													</div>
														<a target="_self" class="mscom-link files-switch-btn more invisible" href="javascript:void(0);"><span class="loc" >+ 参考文献</span></a><a target="_self" class="mscom-link files-switch-btn less invisible" href="javascript:void(0);"><span class="loc" >- 收起参考文献</span></a>
												</div>
											</div>
										</li>  
      								</ul>												
							</div>
								<script type="text/javascript">/*<![CDATA[*/typeof $!="undefined"&&$(function(){if(Mscom&&Mscom.Accordion)var n=new Mscom.Accordion("storey-01")})/*]]>*/</script>
								<script type="text/javascript">/*<![CDATA[*/$(document).ready(function(){var n="storey-01";$("#"+n+" .files-more").hide(),$("#"+n+" .files-switch-btn.more").show(),$("#"+n+" .files-switch-btn").click(function(t){$("#"+n+" .files-more").toggle(),$(this).hide(),$(this).siblings().show(),t.preventDefault()})})/*]]>*/</script>
						
								<script type="text/javascript">/*<![CDATA[*/$(document).ready(function(){var n="storey-00";$("#"+n+" .files-more").hide(),$("#"+n+" .files-switch-btn.more").show(),$("#"+n+" .files-switch-btn").click(function(t){$("#"+n+" .files-more").toggle(),$(this).hide(),$(this).siblings().show(),t.preventDefault()})})/*]]>*/</script>
						
									<c:if test="${!empty animal.time}">
											<p><div class="text-right" style=" text-align:right;">发布时间：${species.time}</div></p>
									</c:if>
						
						</form:form>
						</div>
					</div>
				</div>
			</div>
			
			</div>
		</div>
		</div>
		</div>
		</div>
		
<jsp:include page="foot.jsp"/>
	</body>
</html>