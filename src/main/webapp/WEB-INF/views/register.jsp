
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
        	<title>添加图片</title>       
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
        					插入文件
      					</div>
      					<div class="main_window">
      					<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      						<c:url var="addAction" value="/super/file/add?${_csrf.parameterName}=${_csrf.token}" ></c:url>     						
      							<li>
      								<font class="title_name_little">
      									文件名：<input id="newfilename" readonly="true"/>
      								</font>
      								<div class="faceplate" >
										<div class="embed">
											<form:form action="${addAction}" method="POST" enctype="multipart/form-data"> 
												<img src="" id="img0" alt="">
											<p></p>	
												文件大小：<input id="newfilesize" readonly="true"/>
											<p></p>
											<input type="file" name="myfiles" id="myfiles"/>
											<p></p>	
											<input type="submit" value="添加"/>
      										</form:form>
											<script>	
												$("#myfiles").change(function(){
												var objUrl = getObjectURL(this.files[0]) ;
												var fileinfo = document.getElementById("myfiles");
												var newfilesize=fileinfo.size;
												console.log("objUrl = "+objUrl) ;
												if (objUrl) {
													$("#img0").attr("src", objUrl) ;
													$("#newfilename").attr("value", fileinfo.value) ;
													$("#newfilesize").attr("value", newfilesize+"B") ;
													}
												}) ;
													//建立一個可存取到該file的url
												function getObjectURL(file) {
												var url = null ; 
												if (window.createObjectURL!=undefined) { // basic
													url = window.createObjectURL(file) ;
												} else if (window.URL!=undefined) { // mozilla(firefox)
													url = window.URL.createObjectURL(file) ;
												} else if (window.webkitURL!=undefined) { // webkit or chrome
													url = window.webkitURL.createObjectURL(file) ;
												}
													return url ;
												}
											</script>					
										</div>
									</div>
								</li>  
						<div class="line"></div>
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 

						</div>
					</div>
				</div>
			</div>		
<jsp:include page="backstage_foot.jsp"/>
	</body>
</html>