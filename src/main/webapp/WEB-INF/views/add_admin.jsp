
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
        	<title>注册用户</title>               
      </head>
      <body>  
		<jsp:include page="head.jsp"/> 
		<a name="top" id="top"></a>
		<div id="content">
		<div class="inner">
		<p></p><p></p><p></p><p></p><p></p><p></p>
		<div class="container_12">	
      	<div class="picture-frame-gray">
      	<c:url var="addAction" value="/user_register/add" ></c:url>
      		<form:form action="${addAction}" commandName="user" id="input-date">
      					<div class="main_window"><br/> <br/> <br/>
      					<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      						  <li>
      								<font class="title_name_little">
      									<form:label path="name">账号：</form:label><form:input path="name"/>
      								</font>
      								<div class="faceplate" >
										<div class="embed">				
												<form:label path="username"><strong>用户名：</strong></form:label><form:input path="username"/>
												<form:label path="password"><strong>密码：</strong></form:label><form:password path="password"/>
												<form:label path="email"><strong>邮箱：</strong></form:label><form:input path="email"/>
												<form:label path="phone"><strong>电话：</strong></form:label><form:input path="phone"/>
												<form:label path="remarks"><strong>备注：</strong></form:label><form:input path="remarks"/>
												<form:select path="organization.id">			
													<c:forEach items="${listOrganizations}" var="organization">
														<option value="${organization.id}">${organization.name}</option>
													</c:forEach>
  												</form:select>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
													
																		
										</div>
										<div id="submit">
											<input type="submit" value="<spring:message text="注册"/>" />
										</div>
									</div>
								</li>
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
      					
						</form:form>
						</div>
					</div>
				</div>
			</div>		
<jsp:include page="foot.jsp"/>
	</body>
</html>