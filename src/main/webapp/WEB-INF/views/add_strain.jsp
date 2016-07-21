
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
      	<c:url var="addAction" value="/super/strain/add" ></c:url>
      		<form:form action="${addAction}" commandName="strain" id="input-date">
      					<div class="main_window"><br/> <br/> <br/>
      					<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      						  <li>
      								<font class="title_name_little">
      									<form:label path="name">品系名称：</form:label><form:input path="name"/>
      								</font>
      								<div class="faceplate" >
										<div class="embed">
											
												<strong>物种：</strong>
												<form:select path="species_id.id">			
													<c:forEach items="${listSpeciess}" var="species">
														<option value="${species.id}">${species.species_ch}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（${species.species_en}）</option>
													</c:forEach>
  												</form:select>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
												<form:label path="cultivation_year"><strong>培育年份：</strong></form:label><form:input path="cultivation_year"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											
											
												<form:label path="introduce_year"><strong>引入时间：</strong></form:label><form:input path="introduce_year"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											
											
												<form:label path="cultivationer"><strong>培育机构或人：</strong></form:label><form:input path="cultivationer"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											
											
												<form:label path="hereditary_feature"><strong>遗传特征：</strong></form:label><form:input path="hereditary_feature"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											
											
												<form:label path="microbiological_grade"><strong>微生物学等级：</strong></form:label><form:input path="microbiological_grade"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											
											
												<form:label path="germplasm_resources"><strong>种质来源：</strong></form:label><form:input path="germplasm_resources"/>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
																		
										</div>
										<div id="submit">
											<input type="submit" value="<spring:message text="添加基本品系信息"/>" />
										</div>
									</div>
								</li>
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
      						
      																
							</div>
								
									<c:if test="${!empty strain.time}">
											<p><div class="text-right" style=" text-align:right;">发布时间：${strain.time}</div></p>
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