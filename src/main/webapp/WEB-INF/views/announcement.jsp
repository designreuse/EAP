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
<title>中国科学院特色与模式动物信息化平台台</title>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<jsp:include page="backstage_head.jsp"/>	
<div class="inner">
<div class="container_13">
<c:url value="/j_spring_security_logout" var="logoutUrl" />
    <form action="${logoutUrl}" method="post" id="logoutForm">
        <input type="hidden" name="${_csrf.parameterName}"
            value="${_csrf.token}" />
    </form>
    <script>
        function formSubmit() {
            document.getElementById("logoutForm").submit();
        }
    </script>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>
            Welcome : ${pageContext.request.userPrincipal.name} | <a
                href="javascript:formSubmit()"> Logout</a> | <a href="welcome">welcome</a>
        </h2>
    </c:if>
<p>===================================</p>

<div class="testimonial-block">
<h1>
	添加记录
</h1>
<c:url var="addAction" value="/super/announcement/add" ></c:url>
<form:form action="${addAction}" commandName="announcement">
<table class="pfont">
	<c:if test="${!empty announcement.title}">
	<tr>
		<td>
			<form:label path="id">
				<spring:message text="ID&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="id" readonly="true" size="8"  disabled="true" />
			<form:hidden path="id" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="title">
				<spring:message text="公告标题&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="title" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="classification">
				<spring:message text="类别&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:select path="classification">
			<option value="平台公告">平台公告</option>
  			<option value="法律法规">法律法规</option>
  			<option value="平台规定">平台规定</option>
  			<option value="培训通知">培训通知</option>
  			<option value="科普信息">科普信息</option>
  			</form:select>
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="note">
				<spring:message text="正文&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>			
			<form:textarea path="note"/>
			<script type="text/javascript">CKEDITOR.replace('note');</script>
		</td>
	</tr>
	
	<tr>	
		<%
		String admin_name = "${pageContext.request.userPrincipal.name}";
		%>		
		<c:forEach items="${listAdmins}" var="admin">
			<c:if test="${admin.name eq pageContext.request.userPrincipal.name}">
			<td>
			<form:input path="issuer.id" value="${admin.id}" readonly="true" type="hidden"/>
			</td>	
			</c:if>
		</c:forEach>
	
		<td>
			<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>
		</td>		
	</tr>
		
	<tr>
		<td colspan="2">
			<c:if test="${!empty announcement.title}">
				<input type="submit"
					value="<spring:message text="修改信息"/>" />
			</c:if>
			<c:if test="${empty announcement.title}">
				<input type="submit"
					value="<spring:message text="发布信息"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
</div>
<br>

<h3>用户列表</h3>
<c:if test="${!empty listAllRecords}">
	<table class="tg" style="color:#000000">
	<tr>		
		<th>服务项目</th>
		<th>类别</th>	
		<th>发布者</th>
		<th>发布时间</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<c:forEach items="${listAllRecords}" var="announcement">
		<tr>
			
			<td>${announcement.title}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${announcement.classification}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${announcement.issuer.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${announcement.time}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><a href="<c:url value='/super/announcement/edit/${announcement.id}' />" >修改&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
			<td><a href="<c:url value='/super/announcement/remove/${announcement.id}' />" >删除</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</div></div>
<jsp:include page="backstage_foot.jsp"/>
</body>
</html>
