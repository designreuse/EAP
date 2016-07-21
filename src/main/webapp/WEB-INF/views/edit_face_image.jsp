
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
	</head>
      <c:url var="addAction" value="/face_image/add/${admin.id}/${admin.name}?${_csrf.parameterName}=${_csrf.token}" ></c:url>
      <form:form action="${addAction}" method="POST" enctype="multipart/form-data"> 
	  	<c:if test="${!empty admin.photo_id.id}">
			<figure class="img-indent"><img id="img0" src="${admin.photo_id.url}${admin.photo_id.name}" width="160px" alt="" /></figure>
		</c:if>														
		<c:if test="${empty admin.photo_id.id}">
			<figure class="img-indent"><img id="img0" src="resources/images/admin_image.jpg" alt="" width="160px" /></figure>
		</c:if>
		<input type="file" name="myfiles" id="myfiles" style="font-size:75%" width="150px" />
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
	</body>
</html>