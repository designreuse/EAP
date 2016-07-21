
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
		function sendMessage(id)
		{
  			htmlobj=$.ajax({url:"send_message/"+id,async:false});
  			$("#box").html(htmlobj.responseText);
  		}
		</script>
    </head>
      <body>  
      	发布通知<hr width="100%" color=#708090 />
      	<c:url var="addAction" value="/add_message/${admin.id}/${admin.name}" ></c:url>
		<form:form action="${addAction}" commandName="message">
			<form:label path="title">通知标题：</form:label><form:input path="title"/>
			<form:label path="addressee_id.id">收件人：</form:label>			
			<form:select path="addressee_id.id">			
				<c:forEach items="${listAdmins}" var="users">
					<option value="${users.id}">${users.username}</option>
				</c:forEach>
  			</form:select>
  			<br/>
			<form:label path="text"><strong>内容：</strong></form:label><form:textarea path="text"/>
			<script type="text/javascript">CKEDITOR.replace('text');</script>
			<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>
			<div id="submit">
				<input type="submit" value="<spring:message text="发布"/>" />
			</div>
		</form:form>
	</body>
</html>