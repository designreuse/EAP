
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
		<meta charset="utf-8" />        
		<script type="text/javascript" src="resources/js/jquery-2.1.4.js"> </script>
        <script type="text/javascript" src="resources/js/animal_broker.js"></script> 	
        <link rel="stylesheet" type="text/css" href="resources/css/animal_style.css" />
        <script type="text/javascript" src="resources/js/animal_script.js"></script>
        	<title>详情</title>       
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
        					${animal.name}
      				</div>
      			</div>
      			<div class="row-fluid no-margin-row">
      				<div class="row-fluid no-margin-row" data-view4="1" data-view3="1" data-view2="1" data-view1="1" data-cols="1">
      					<div class="span bp0-col-1-1 bp1-col-1-1 bp2-col-1-1 bp3-col-1-1 download-main-article"> 
      					<form:form action="${addAction}" commandName="animal">
      					<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      						<c:if test="${!empty listAnimals}">      						
      							<li class=" mscom-accordion-item" id="storey-00">
      								<a class="mscom-link mscom-accordion-item-link">
      									<span class="mscom-accordion-item-image"></span>
      									<span class="mscom-accordion-item-title">${animal.classification}</span>
      								</a>
      								<div class="mscom-accordion-item-container">
										<div class="fileinfo">
											
												
												<c:if test="${!empty animal.strain}">
													<strong>品系：</strong>${animal.strain}
													<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
												</c:if>
												<c:if test="${!empty animal.dna_name}">
													<strong>基因名称：</strong>${animal.dna_name}
													<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
												</c:if>
												<c:if test="${!empty animal.preparation}">	
													<strong>制备方法及种质来源：</strong>${animal.preparation}
													<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
												</c:if>
												<c:if test="${!empty animal.phenotype}">
													<strong>表现特征：</strong>${animal.phenotype}
													<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
												</c:if>
												<c:if test="${!empty animal.save_address}">	
													<strong>保存方式及保存地点：</strong>${animal.save_address}
													<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
												</c:if>
													
													<div class="kb-sb">
													<div class="files-more">													
													<c:if test="${!empty animal.contact.name}">
														<strong>联系人：</strong>${animal.contact.name}
														<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
													</c:if>
													<c:if test="${!empty animal.contact.organization.address}">
														<strong>联系地址：</strong>${animal.contact.organization.address}
														<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
													</c:if>
													<c:if test="${!empty animal.contact.organization.name}">
														<strong>联系单位：</strong>${animal.contact.organization.name}
														<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
													</c:if>
													<c:if test="${!empty animal.contact.telephone}">
														<strong>联系电话：</strong>${animal.contact.telephone}
														<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
													</c:if>
													<c:if test="${!empty animal.contact.email}">
														<strong>邮箱：</strong>${animal.contact.email}
														<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
													</c:if>													
													</div>		
													</div>	
													<a target="_self" class="mscom-link files-switch-btn more invisible" href="javascript:void(0);"><span class="loc" >+ 联系方式</span></a>
													<a target="_self" class="mscom-link files-switch-btn less invisible" href="javascript:void(0);"><span class="loc" >- 收起</span></a>											
													<p><strong>备注：</strong>${animal.note}</p>
											
												
										</div>
									</div>
								</li>  
							</c:if>	
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
      						<div id="storey-01" class="CMSvNextComp mscom-accordion" role="tablist">      															
      							<ul> 
      								<!-- ====================================================以下为第二层信息【基本信息】=============================================================== -->    																
      									<li class=" mscom-accordion-item">
      										<a class="mscom-link mscom-accordion-item-link">
      											<span class="mscom-accordion-item-image"></span>
      											<span class="mscom-accordion-item-title">基本信息</span>
      										</a>
      										<div class="mscom-accordion-item-container">
												<div class="fileinfo">
													<div class="span bp0-col-1-1 bp1-col-1-1 bp2-col-1-1 bp3-col-1-1">
														<p><strong>名称：</strong>叙利亚仓鼠</p>														
														<p><strong>英文名称：</strong>Golden hamster</p>
														<p><strong>科名：</strong>Muridae</p>
														<p><strong>属名：</strong>Mesocricetus</p>
														<p><strong>种名或亚种名：</strong>Mesocricetus auratus</p>
														<p><strong>俗称：</strong>金黄地鼠</p>
														<p><strong>培育年份：</strong>1999-09-09</p>
														<p><strong>引入时间：</strong>2009-09-09</p>
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
      								<!-- ====================================================以上为第二层信息【基本信息】=============================================================== -->  
      								<!-- ====================================================以下为第二层信息【实验数据】=============================================================== -->    																
      									<li class=" mscom-accordion-item" id="storey-02-01">
      										<a class="mscom-link mscom-accordion-item-link">
      											<span class="mscom-accordion-item-image"></span>
      											<span class="mscom-accordion-item-title">实验数据</span>
      										</a>
      										<div class="mscom-accordion-item-container">
												<div class="fileinfo">
													<div class="span bp0-col-1-1 bp1-col-1-1 bp2-col-1-1 bp3-col-1-1">
														<c:if test="${!empty animal.experiments}">
														<strong>相关实验：</strong>
														<c:forEach items="${animal.experiments}" var="experiments">
      															【<a target="_blank" href="show/experiment/detail/${experiments.id}">${experiments.title}</a>】
      													</c:forEach>
													<p></p>
													</c:if>
													<c:if test="${!empty animal.strain}">
													<strong>相关成果：</strong>${animal.strain}<p></p>
													</c:if>
													</div>
												</div>
											</div>
										</li>  
      								<!-- ====================================================以上为第二层信息【实验数据】=============================================================== -->  
      								<!-- ====================================================以下为第二层信息【遗传数据】=============================================================== -->    																
      									<li class=" mscom-accordion-item" id="storey-02-01">
      										<a class="mscom-link mscom-accordion-item-link">
      											<span class="mscom-accordion-item-image"></span>
      											<span class="mscom-accordion-item-title">遗传数据</span>
      										</a>
      										<div class="mscom-accordion-item-container">
												<div class="fileinfo">
													<div class="span bp0-col-1-1 bp1-col-1-1 bp2-col-1-1 bp3-col-1-1">
														<div class="file-header">
															细胞遗传标记：
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;染色体数：</font>2n=44</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;染色体标准核型：</font>chromosome number</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;染色体C带:</font>chromosome C</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;染色体G带:</font>chromosome G</p>
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<p><strong>组织相容性基因：</strong>叙利亚仓鼠</p>
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<p><strong>肋骨类型：</strong>叙利亚仓鼠</p>
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<p><strong>毛色或羽色基因：</strong>叙利亚仓鼠</p>
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<p><strong>血型基因：</strong>叙利亚仓鼠</p>
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<p><strong>微卫星DNA：</strong>叙利亚仓鼠</p>
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<div class="file-header">
															转基因动物系:
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;命名：</font>transgenic animal name</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;背景品系：</font>transgenic animal insert transgene name </p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;插入转基因名称：</font>transgenic animal insertion site</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;插入位点：</font>transgenic animal copy number</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;拷贝数：</font>transgenic animal abnormal phenotype </p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;异常表型：</font>transgenic animal background</p>
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<div class="file-header">
															基因定位突变系:
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;命名：</font>transgenic animal name</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;背景品系：</font>transgenic animal insert transgene name </p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;插入转基因名称：</font>transgenic animal insertion site</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;插入位点：</font>transgenic animal copy number</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;拷贝数：</font>transgenic animal abnormal phenotype </p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;异常表型：</font>transgenic animal background</p>
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<div class="file-header">
															其他突变动物系:
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;命名：</font>transgenic animal name</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;背景品系：</font>transgenic animal insert transgene name </p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;插入转基因名称：</font>transgenic animal insertion site</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;插入位点：</font>transgenic animal copy number</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;拷贝数：</font>transgenic animal abnormal phenotype </p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;异常表型：</font>transgenic animal background</p>															
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
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
      								<!-- ====================================================以上为第二层信息【遗传数据】=============================================================== -->  
      								<!-- ====================================================以下为第二层信息【生理数据】=============================================================== -->    																
      									<li class=" mscom-accordion-item" id="storey-02-01">
      										<a class="mscom-link mscom-accordion-item-link">
      											<span class="mscom-accordion-item-image"></span>
      											<span class="mscom-accordion-item-title">生理数据</span>
      										</a>
      										<div class="mscom-accordion-item-container">
												<div class="fileinfo">
													<div class="span bp0-col-1-1 bp1-col-1-1 bp2-col-1-1 bp3-col-1-1">
														<div class="file-header">
															血液生理参数：
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;血量：</font>2n=44</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;血浆量：</font>chromosome number</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;红细胞:</font></p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计数:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;体积:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;平均厚度:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分布宽度:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;血红蛋白:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;压积:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;血红蛋白含量:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;血红蛋白浓度:</font>chromosome C</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;白细胞:</font></p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计数:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;嗜中性白细胞:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;嗜酸性白细胞:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;嗜硷性白细胞:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;淋巴细胞:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单核细胞:</font>chromosome C</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;血小板:</font></p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计数:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;平均容积:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分布宽度:</font>chromosome C</p>
													<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<div class="file-header">
															生殖生理参数：
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性成熟:</font></p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;初次发情:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发情期:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发情周期:</font>chromosome C</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发情季节:</font>sperm concentration</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;体成熟:</font>sperm concentration</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;妊娠期:</font>sperm concentration</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;哺乳期:</font>sperm concentration</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生产指数:</font>sperm concentration</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;精子:</font></p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计数:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存活时间:</font>chromosome C</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;卵子:</font></p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;大小:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;排卵时间:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;受精能力:</font>chromosome C</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产蛋性能:</font></p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开产日龄:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开产体重:</font>chromosome C</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;蛋的品质:</font></p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;蛋重:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;蛋壳厚度:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;蛋型指数:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;哈氏单位:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;蛋相对密度:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;蛋黄比色级别:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;受精率:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;受精蛋孵化率:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;蛋壳颜色:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;孵化期:</font>chromosome C</p>
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<div class="file-header">
															生长发育生理参数：
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;初生体重:</font>9999t</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;断奶体重:</font>9999t</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;成年体重:</font>9999t</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生长曲线:</font>9999t</p>
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<div class="file-header">
															呼吸生理参数：
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;呼吸频率:</font>9999c</p>
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<div class="file-header">
															体温参数：
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;体温:</font>9999c</p>
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<div class="file-header">
															消化生理参数：
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消化能力:</font>9999c</p>																	
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<div class="file-header">
															免疫生理参数：
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;免疫球蛋白:</font></p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IgG:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IgM:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IgD:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IgA:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IgE:</font>chromosome C</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;免疫活性细胞表型:</font></p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;T细胞:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B细胞:</font>chromosome C</p>
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<div class="file-header">
															心血管生理参数：
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;血压:</font></p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收缩压:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;舒张压:</font>chromosome C</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;心率:</font>545643653465</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;心电图:</font>月投入与日月潭</p>																
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
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
      								<!-- ====================================================以上为第二层信息【生理数据】=============================================================== -->
									<!-- ====================================================以下为第二层信息【生化数据】=============================================================== -->    																
      									<li class=" mscom-accordion-item" id="storey-02-01">
      										<a class="mscom-link mscom-accordion-item-link">
      											<span class="mscom-accordion-item-image"></span>
      											<span class="mscom-accordion-item-title">生化数据</span>
      										</a>
      										<div class="mscom-accordion-item-container">
												<div class="fileinfo">
													<div class="span bp0-col-1-1 bp1-col-1-1 bp2-col-1-1 bp3-col-1-1">
														<div class="file-header">
															血液生化参数：
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;血液pH：</font>2n=44</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;血电解质:</font></p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Na+:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;K+:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ca++:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mg++:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CL-:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;P+:</font>chromosome C</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;谷草转氨酶:</font>9999.99</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;谷丙转氨酶:</font>9999.99</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;碱性磷酸酶:</font>9999.99</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乳酸脱氢酶:</font>9999.99</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;肌苷:</font>9999.99</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尿素氮:</font>9999.99</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总胆固醇:</font>9999.99</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;血清总蛋白:</font>9999.99</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;白蛋白:</font>9999.99</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;甘油三脂:</font>9999.99</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;血糖:</font>9999.99</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;孕酮:</font>9999.99</p>
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<div class="file-header">
															尿生化参数：
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尿液pH：</font>2n=44</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尿蛋白：</font>2n=44</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尿酸：</font>2n=44</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尿电解质:</font></p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Na+:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;K+:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ca++:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mg++:</font>chromosome C</p>
																<p><font class="f-deeprrid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CL-:</font>chromosome C</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;比重：</font>2n=44</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尿量：</font>2n=44</p>
																
																												
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
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
      								<!-- ====================================================以上为第二层信息【生理数据】=============================================================== -->
									<!-- ====================================================以下为第二层信息【解剖数据】=============================================================== -->    																
      									<li class=" mscom-accordion-item" id="storey-02-01">
      										<a class="mscom-link mscom-accordion-item-link">
      											<span class="mscom-accordion-item-image"></span>
      											<span class="mscom-accordion-item-title">解剖数据</span>
      										</a>
      										<div class="mscom-accordion-item-container">
												<div class="fileinfo">
													<div class="span bp0-col-1-1 bp1-col-1-1 bp2-col-1-1 bp3-col-1-1">
														<div class="file-header">
															体尺：
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;体高：</font>2n=44</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;体长：</font>chromosome number</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尾长:</font>chromosome C</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尾／体比:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;体斜长:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;耳长:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;耳宽:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;胸宽:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;胸深:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;躯干长:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;前肢长:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;后肢长:</font>chromosome G</p>
													<div class="span bp0-col-1-1 bp1-col-1-1 bp2-col-1-1 bp3-col-1-1">
														<div class="file-header">
															骨骼：
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;骨骼总数：</font>2n=44</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;头骨：</font>chromosome number</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;颈椎:</font>chromosome C</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;胸椎:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;腰椎:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;骶椎:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尾椎:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龙骨长:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;股盆宽:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;胫长:</font>chromosome G</p>
													<div class="span bp0-col-1-1 bp1-col-1-1 bp2-col-1-1 bp3-col-1-1">
														<div class="file-header">
															脏器重量：
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;心：</font>2n=44</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;肺：</font>chromosome number</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;肝:</font>chromosome C</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;脾:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;肾:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;脑:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;甲状腺:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;肾上腺:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;卵巢:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;睾丸:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;胸腺:</font>chromosome G</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;法氏囊:</font>chromosome G</p>
													<div class="span bp0-col-1-1 bp1-col-1-1 bp2-col-1-1 bp3-col-1-1">
														<div class="file-header">
															肠道长度：
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小肠：</font>2n=44</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;盲肠：</font>chromosome number</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结肠:</font>chromosome C</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;直肠:</font>chromosome G</p>
													<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
														<p><strong>乳头：</strong>chromosome G</p>
													<div class="span bp0-col-1-1 bp1-col-1-1 bp2-col-1-1 bp3-col-1-1">
														<div class="file-header">
															齿式：
														</div>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乳齿：</font>2n=44</p>
															<p><font class="f-deepblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;恒齿：</font>chromosome number</p>
																												
														<hr style="height:1px;border:none;border-top:1px dashed #c0c0c0;" />
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
      								<!-- ====================================================以上为第二层信息【解剖数据】=============================================================== -->  
      								
									</ul>												
							</div>
								<script type="text/javascript">/*<![CDATA[*/typeof $!="undefined"&&$(function(){if(Mscom&&Mscom.Accordion)var n=new Mscom.Accordion("storey-01")})/*]]>*/</script>
								<script type="text/javascript">/*<![CDATA[*/$(document).ready(function(){var n="storey-01";$("#"+n+" .files-more").hide(),$("#"+n+" .files-switch-btn.more").show(),$("#"+n+" .files-switch-btn").click(function(t){$("#"+n+" .files-more").toggle(),$(this).hide(),$(this).siblings().show(),t.preventDefault()})})/*]]>*/</script>
						
								<script type="text/javascript">/*<![CDATA[*/$(document).ready(function(){var n="storey-00";$("#"+n+" .files-more").hide(),$("#"+n+" .files-switch-btn.more").show(),$("#"+n+" .files-switch-btn").click(function(t){$("#"+n+" .files-more").toggle(),$(this).hide(),$(this).siblings().show(),t.preventDefault()})})/*]]>*/</script>
						
									<c:if test="${!empty animal.time}">
											<p><div class="text-right" style=" text-align:right;">发布时间：${animal.time}</div></p>
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