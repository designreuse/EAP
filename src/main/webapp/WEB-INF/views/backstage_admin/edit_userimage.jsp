<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    %>
<html xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
	<c:url var="addAction" value="/face_image/update/${user.id}?${_csrf.parameterName}=${_csrf.token}" ></c:url>
	<form:form action="${addAction}" method="POST" enctype="multipart/form-data"> 
		<c:if test="${!empty user.photo_id.id}">
			<figure><img id="img0" src="${user.photo_id.url}${user.photo_id.name}" alt="" width="90%" height="90%"></figure>
		</c:if>														
		<c:if test="${empty user.photo_id.id}">
			<figure><img id="img0" src="resources/img/user_image.jpg" alt="" width="90%" height="90%"></figure>
		</c:if>
		<input type="file" name="myfiles" id="myfiles" style="font-size:75%" width="150px" />
		<input type="submit" value="更新头像"/>
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
			} 
			else if (window.URL!=undefined) { // mozilla(firefox)
				url = window.URL.createObjectURL(file) ;
			} 
			else if (window.webkitURL!=undefined) { // webkit or chrome
				url = window.webkitURL.createObjectURL(file) ;
			}
			return url ;
		}
	</script>	
</html>
