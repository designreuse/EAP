<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
    <%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    %>
<html>
<head>  
  <base href="<%=basePath%>"> 
</head>
<body>
<script>
	var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	parent.layer.msg('更新成功');	
 	parent.location.reload();
 	parent.layer.close(index);		
</script>
更新成功
</body>
</html>