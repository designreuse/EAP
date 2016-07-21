
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
         <script type="text/javascript">
		function watchMessage(id,user_id,name)
		{
  			htmlobj=$.ajax({url:"watch_message/"+id+"/"+user_id+"/"+name,async:false});
  			$("#box").html(htmlobj.responseText);
  			htmlobj=$.ajax({url:"message_number/"+user_id+"/"+name,async:false});
  			$("#message_number").html(htmlobj.responseText);
  		}
		</script>
    </head>
      <body>  
      	未读通知列表<hr width="100%" color=#708090 />
		<table width="100%">
			<tr>
				<td style="color:#60aff6;">										
					题目											
				</td>
				<td style="text-align:lift;color:#60aff6;">
					发件人
				</td>
				<td style="text-align:lift;color:#60aff6;">
					收件时间
				</td>				
			</tr>
			<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td></tr>
			<c:if test="${!empty List_inbox_noread}">
				<c:forEach items="${List_inbox_noread}" var="inbox_noread">									
					<tr>
						<td>
							<a href="javascript:watchMessage('${inbox_noread.id}','${inbox_noread.addressee_id.id}','${pageContext.request.userPrincipal.name}')" id="${inbox.id}">&nbsp;												
							${inbox_noread.title}												
							</a>
						</td>
						<td style="text-align:lift">${inbox_noread.sender_id.organization.name}管理员${inbox_noread.sender_id.username}</td>
						<td style="text-align:lift">${inbox_noread.time}</td>
					</tr>
					<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td></tr>
				</c:forEach>
			</c:if>									
		</table>	
	</body>
</html>