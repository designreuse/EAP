
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
        <script type="text/javascript">
		$(document).ready(function(){
  		$("#inbox_noread").click(function(){
  			htmlobj=$.ajax({url:"inbox_noread/${admin.id}/${admin.name}",async:false});
  			$("#box").html(htmlobj.responseText);
  			});
  		$("#inbox_read").click(function(){
  	  		htmlobj=$.ajax({url:"inbox_read/${admin.id}/${admin.name}",async:false});
  	  		$("#box").html(htmlobj.responseText);
  	  		});
  		$("#write_message").click(function(){
  	  		htmlobj=$.ajax({url:"write_message/${admin.id}/${admin.name}",async:false});
  	  		$("#box").html(htmlobj.responseText);
  	  		});
		});
		</script>
        	
      </head>
      <body>  
		
													<a id="inbox_noread" href="javascript:void(0)">未读通知（${inbox_noread}）</a><br/>
													<a id="inbox_read" href="javascript:void(0)">所有通知（${inbox}）</a><br/>
													<c:if test="${admin.authority eq 'ADMIN' ||admin.authority eq 'SUPER' }">
														<a id="write_message" href="javascript:void(0)">发布通知</a><br/>
													</c:if>
											
	</body>
</html>