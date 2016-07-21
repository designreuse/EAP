
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
		<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
        <link rel="stylesheet" type="text/css" href="resources/css/new_style.css" />
        <script type="text/javascript" src="resources/js/javascript.js"></script>
        <script type="text/javascript">
		$(document).ready(function(){
		t=setTimeout("$('#box').animate({width:'toggle'},800)",300);
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
  		$("#inbox_noread_img").click(function(){
  			htmlobj=$.ajax({url:"inbox_noread/${admin.id}/${admin.name}",async:false});
  			$("#box").html(htmlobj.responseText);
  			});
  		$("#inbox_read_img").click(function(){
  	  		htmlobj=$.ajax({url:"inbox_read/${admin.id}/${admin.name}",async:false});
  	  		$("#box").html(htmlobj.responseText);
  	  		});
  		$("#write_message_img").click(function(){
  	  		htmlobj=$.ajax({url:"write_message/${admin.id}/${admin.name}",async:false});
  	  		$("#box").html(htmlobj.responseText);
  	  		});
		});
		</script>
        	<title>实验动物详情</title>       
      </head>
      <body>  
      <c:choose>  
	  	<c:when test="${admin.authority eq 'ADMIN' ||admin.authority eq 'SUPER' }"> 
	  	    <jsp:include page="backstage_head.jsp"/>
   		</c:when>       
   		<c:otherwise> 
   		  <jsp:include page="head.jsp"/>
   		</c:otherwise>  
	  </c:choose>  		 
		<div id="content">
		<div class="inner">
		<p></p><p></p><p></p><p></p><p></p><p></p>
		<div class="container_12">	
      	<div class="picture-frame-gray">
            <form:form action="${addAction}" commandName="admin">
    			<div class="title_name">
        		
      			</div>
      				<div class="main_window">
      					<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      						<li>
      								<font class="title_name_little">
      									${admin.username}的系统通知
      								</font>
      								<div class="faceplate" >
										<div class="embed">
										
										<table>
											<tr>
												<td width="100px">
												<div id="message_number">
													<a id="inbox_noread" href="javascript:void(0)">未读通知（${inbox_noread}）</a><br/>
													<a id="inbox_read" href="javascript:void(0)">所有通知（${inbox}）</a><br/>
													<c:if test="${admin.authority eq 'ADMIN' ||admin.authority eq 'SUPER' }">
														<a id="write_message" href="javascript:void(0)">发布通知</a><br/>
													</c:if>
												</div>
												</td>
												<td>
													<img src="resources/images/vertical.png" /><br/>
													<img src="resources/images/vertical.png" />
												</td>
												<td width="600px">
												<div id="box" style="display:none;">
													<table  style="text-align:center">
													<tr>
													<td><a id="inbox_noread_img" href="javascript:void(0)"><img src="resources/images/add_message.png" onmouseout="this.src='resources/images/add_message.png'" onmouseover="this.src='resources/images/add_message_on.png'"></a></td>
													<td><a id="inbox_read_img" href="javascript:void(0)"><img src="resources/images/message_inbox.png" onmouseout="this.src='resources/images/message_inbox.png'" onmouseover="this.src='resources/images/message_inbox_on.png'"></a></td>
													
													<c:if test="${admin.authority eq 'ADMIN' ||admin.authority eq 'SUPER' }">
														<td><a id="write_message_img" href="javascript:void(0)"><img src="resources/images/write_message.png" onmouseout="this.src='resources/images/write_message.png'" onmouseover="this.src='resources/images/write_message_on.png'"></a></td>
													</c:if>	
													</tr>
													<tr>
													<td>未读通知（${inbox_noread}）</td>
													<td>所有通知（${inbox}）</td>													
													<c:if test="${admin.authority eq 'ADMIN' ||admin.authority eq 'SUPER' }">
														<td>发布通知</td>
													</c:if>	
													</tr>
													</table>											
												</div>
												</td>
											</tr>
										</table>
										</div>	
									</div>
									
								</li>  
						<div class="line"></div>
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
      					
						</div>
					</form:form>
			</div>
		</div>
		</div>
		</div>
		  
      <c:choose>  
	  	<c:when test="${admin.authority eq 'ADMIN' ||admin.authority eq 'SUPER' }"> 
	  	    <jsp:include page="backstage_foot.jsp"/>
   		</c:when>       
   		<c:otherwise> 
   		  <jsp:include page="foot.jsp"/>
   		</c:otherwise>  
	  </c:choose>  	

	</body>
</html>