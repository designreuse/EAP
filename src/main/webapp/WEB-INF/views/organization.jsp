<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">	
<title>中国科学院特色与模式动物信息化平台台</title>
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
       <h2>
           	 <a href="super/message"> 发布文本编辑</a> 
       </h2>
<p>===================================</p>

<div class="testimonial-block">
<h1>
	添加机构
</h1>

<c:url var="addAction" value="/super/organization/add" ></c:url>

<form:form action="${addAction}" commandName="organization">
<table class="pfont">
	<c:if test="${!empty organization.name}">
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
			<form:label path="name">
				<spring:message text="机构名&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="name" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="address">
				<spring:message text="地址&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="address" />
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="telephone">
				<spring:message text="联系电话&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="telephone" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty organization.name}">
				<input type="submit"
					value="<spring:message text="Edit Organization"/>" />
			</c:if>
			<c:if test="${empty organization.name}">
				<input type="submit"
					value="<spring:message text="Add Organization"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
</div>
<br>
<h3>机构列表</h3>
<c:if test="${!empty listOrganizations}">
	<table class="tg">
	<tr>
		<th width="30">ID</th>
		<th width="240">机构名</th>
		<th width="240">地址</th>	
		<th width="120">联系电话</th>
	</tr>
	<c:forEach items="${listOrganizations}" var="organization">
		<tr>
			<td>${organization.id}</td>
			<td>${organization.name}</td>
			<td>${organization.address}</td>
			<td>${organization.telephone}</td>
			<td><a href="<c:url value='/super/organization/edit/${organization.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/super/organization/remove/${organization.id}' />" >Delete</a></td>
			<c:forEach items="${organization.admin}" var="admin">
   				<c:forEach items="${admin.name}" var="name">
      				<td>【${name}】</td>
   				</c:forEach>
			</c:forEach>
			
		</tr>
	</c:forEach>
	</table>
</c:if>
</div></div>
<jsp:include page="backstage_foot.jsp"/>
</body>
</html>
