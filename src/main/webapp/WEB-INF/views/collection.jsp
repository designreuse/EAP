
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
  		$("#sydw_list").click(function(){
  			htmlobj=$.ajax({url:"collection_list/${admin.id}/${admin.name}/sydw",async:false});
  			$("#box").html(htmlobj.responseText);
  			});
		});
		</script>      
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
      									${admin.username}的收藏夹
      								</font>
      								<div class="faceplate" >
										<div class="embed">
										
										<table>
											<tr>
												<td width="100px">
												<div id="message_number">
													资源收藏<hr width="100%" color=#708090 />
													<a id="sydw_list" href="javascript:void(0)">实验动物(${collection_number_sydw})</a><br/>
													<a href="user/collection/${admin.id}/${admin.name}"  target="_blank">特色动物(${collection_number_tsdw})</a><br/>
													<a href="user/collection/${admin.id}/${admin.name}"  target="_blank">常规设备(${collection_number_cgsb})</a><br/>
													<a href="user/collection/${admin.id}/${admin.name}"  target="_blank">特色设备(${collection_number_tssb})</a><br/>
													<p></p>服务收藏<hr width="100%" color=#708090 />
													<a href="animal_resources">技术支持(${collection_number_jszc})</a><br/>
													<a href="animal_resources">检测服务(${collection_number_jcfw})</a><br/>
													<a href="animal_resources">委托实验(${collection_number_wtsy})</a><br/>
													<p></p>信息收藏<hr width="100%" color=#708090 />
													<a href="animal_resources">特色实验(${collection_number_tssy})</a><br/>
													<a href="animal_resources">科研成果(${collection_number_kycg})</a><br/>
													<a href="animal_resources">培训通知(${collection_number_pxtz})</a><br/>
													<a href="animal_resources">法律法规(${collection_number_flfg})</a><br/>
												</div>
												</td>
												<td>
													<img src="resources/images/vertical.png" /><br/>
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