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
	添加用户
</h1>
<c:url var="addAction" value="/super/add" ></c:url>
<form:form action="${addAction}" commandName="admin">
<table class="pfont">
	<c:if test="${!empty admin.name}">
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
				<spring:message text="用户名&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="name" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="password">
				<spring:message text="密码&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="password" />
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="enable" readonly="true" type="hidden">
				<spring:message text=" "/>
			</form:label>
		</td>
		<td>
			<form:input path="enable" readonly="true" type="hidden" value="1"/>
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="authority">
				<spring:message text="权限&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:select path="authority">
			<option value="ADMIN">普通管理员</option>
  			<option value="SUPER">超级管理员</option>
  			</form:select>
		</td>
	</tr>
	<c:if test="${empty admin.name}">
	<tr>
		<td>
			<form:label path="organization">
				<spring:message text="所属机构&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:select path="organization.id">
			<c:forEach items="${listOrganizations}" var="organization">
			<option value="${organization.id}">${organization.name}</option>
			</c:forEach>
  			</form:select>
		</td>
	</tr>
	</c:if>
	<c:if test="${!empty admin.name}">
	<tr>
		<td>
			<form:label path="organization">
				<spring:message text="所属机构&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:select path="organization.id">
			<option value="${admin.organization.id}">${admin.organization.name}</option>			
			<c:forEach items="${listOrganizations}" var="organization">
				<c:if test="${admin.organization.id != organization.id}">
					<option value="${organization.id}">${organization.name}</option>
				</c:if>	
			</c:forEach>
  			</form:select>
		</td>
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="email">
				<spring:message text="Email&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="email" />
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="remarks">
			<spring:message text="备注&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>			
			<form:textarea path="remarks"/>
			<script type="text/javascript">CKEDITOR.replace('remarks');</script>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty admin.name}">
				<input type="submit"
					value="<spring:message text="修改管理员信息"/>" />
			</c:if>
			<c:if test="${empty admin.name}">
				<input type="submit"
					value="<spring:message text="添加管理员"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
</div>
<br>

<h3>用户列表</h3>
<c:if test="${!empty listAdmins}">
	<table class="tg" style="color:#000000">
	<tr>
		<th>ID</th>
		<th>用户名</th>
		<th>密码</th>	
		<th>权限</th>
		<th>单位</th>
		<th>邮箱</th>
		<th>备注</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<c:forEach items="${listAdmins}" var="admin">
		<tr>
			<td>${admin.id}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${admin.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${admin.password}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${admin.authority}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${admin.organization.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${admin.email}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${admin.remarks}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><a href="<c:url value='/super/edit/${admin.id}' />" >修改&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
			<td><a href="<c:url value='/super/remove/${admin.id}' />" >删除</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</div></div>
<jsp:include page="backstage_foot.jsp"/>
</body>
</html>
