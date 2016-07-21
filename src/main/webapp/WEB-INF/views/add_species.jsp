
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
      	<c:url var="addAction" value="/super/species/add" ></c:url>
      		<form:form action="${addAction}" commandName="species" id="input-date">
      					<div class="main_window"><br/> <br/> <br/>
      					<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      						  <li>
      								<font class="title_name_little">
      									<form:label path="name">名称：</form:label><form:input path="name"/>
      								</font>
      								<div class="faceplate" >
										<div class="embed">
											
											<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											<p></p>
											<table width="100%">
												<tr>
													<td></td><td style="text-align:lift">中文名</td><td style="text-align:lift">英文名</td>
												</tr>
												<tr>
													<td>
														<strong>门：</strong>	
													</td>
													<td>
														<form:input path="phylum_ch"/>
													</td>
													<td>
														<form:input path="phylum_en"/>
													</td>
												</tr>
												<tr>
													<td>
														<strong>纲：</strong>	
													</td>
													<td>
														<form:input path="class_ch"/>
													</td>
													<td>
														<form:input path="class_en"/>
													</td>
												</tr>
												<tr>
													<td>
														<strong>目：</strong>	
													</td>
													<td>
														<form:input path="order_ch"/>
													</td>
													<td>
														<form:input path="order_en"/>
													</td>
												</tr>
												<tr>
													<td>
														<strong>科：</strong>	
													</td>
													<td>
														<form:input path="family_ch"/>
													</td>
													<td>
														<form:input path="family_en"/>
													</td>
												</tr>
												<tr>
													<td>
														<strong>属：</strong>	
													</td>
													<td>
														<form:input path="genus_ch"/>
													</td>
													<td>
														<form:input path="genus_en"/>
													</td>
												</tr>
												<tr>
													<td>
														<strong>种：</strong>	
													</td>
													<td>
														<form:input path="species_ch"/>
													</td>
													<td>
														<form:input path="species_en"/>
													</td>
												</tr>
											
											</table>
											
											<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											<form:label path="note"><strong>备注：</strong></form:label><form:input path="note"/>
											<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
										</div>
										<div id="submit">
											<input type="submit" value="<spring:message text="添加基本品系信息"/>" />
										</div>
									</div>
								</li>
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
      						
      																
							</div>
								
									<c:if test="${!empty species.time}">
											<p><div class="text-right" style=" text-align:right;">发布时间：${species.time}</div></p>
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