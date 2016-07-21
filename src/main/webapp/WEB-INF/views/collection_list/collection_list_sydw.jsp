
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
      	实验动物收藏夹<hr width="100%" color=#708090 />
      	<c:if test="${!empty collection_list}">
		<table width="100%">
			<tr>
				<td style="color:#60aff6;">										
					名称											
				</td>
				<td style="text-align:lift;color:#60aff6;">
					品系
				</td>
				<td style="text-align:lift;color:#60aff6;">
					收藏时间
				</td>				
			</tr>
			<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td></tr>
				<c:forEach items="${collection_list}" var="collection">									
					<tr>
						<c:forEach items="${list_sydw}" var="sydw">
							<c:if test="${sydw.id eq collection.collection_id}">
								<td>
									<a href="show/experimental_animal/detail/${collection.collection_id}" id="${collection.id}" target="_blank">&nbsp;		
									${sydw.name}
									</a>
								</td>
								<td style="text-align:lift">${sydw.strain_id.name}</td>
							</c:if>
						</c:forEach>		
						<td style="text-align:lift">${collection.time}</td>
					</tr>
					<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td></tr>
				</c:forEach>								
		</table>	
		</c:if>			
      	<c:if test="${empty collection_list}">
      	<br/>${user.username},您还没有收藏相关内容，<a href="show/experimental_animal/1">点我进行收藏</a><br/>
      	</c:if>
	</body>
</html>