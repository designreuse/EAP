
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<jsp:include page="head.jsp"/> 
		<a name="top" id="top"></a>
		<div id="content">
		<div class="inner">
		<p></p><p></p><p></p><p></p><p></p><p></p>
		<div class="container_12">	
      	<div class="picture-frame-gray">
      					<div class="title_name">
        					<a href="${file.url}${file.name}">${file.name}</a>
      					</div>
      					<div class="main_window">
      					<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      						<c:if test="${!empty listFiles}">      						
      							<li>
      								<font class="title_name_little">
      									文件名：${file.name}
      								</font>
      								<div class="faceplate" >
										<div class="embed">
											<c:if test="${fn:contains(file.type, 'image')}">
												<img src="${file.url}${file.name}" alt="">
											</c:if>	
											<c:if test="${fn:contains(file.type, 'pdf')}">
												<embed width="800" height="600" src="${file.url}${file.name}"> </embed>
											</c:if>	
											<p></p>
      										<c:if test="${!empty file.size}">
												<strong>文件大小：</strong>${file.size}KB
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty file.url}">
												<strong>URL：</strong>${file.url}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty file.type}">
												<strong>文件类型：</strong>${file.type}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
																
										</div>
									</div>
								</li>  
							</c:if>	
						<div class="line"></div>
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
      						
      																
							</div>
								
									<c:if test="${!empty file.time}">
											<p><div class="text-right" style=" text-align:right;">上传时间：${file.time}</div></p>
									</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>		
<jsp:include page="foot.jsp"/>
	</body>
</html>