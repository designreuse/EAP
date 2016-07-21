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
	添加设备
</h1>
<c:url var="addAction" value="/super/equipment/add" ></c:url>
<form:form action="${addAction}" commandName="equipment">
<table class="pfont">
	<c:if test="${!empty equipment.name}">
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
				<spring:message text="设备名称&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="name" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="version">
				<spring:message text="设备型号&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="version" />
		</td> 
	</tr>

	
	<c:if test="${empty equipment.name}">
	<tr>
		<td>
			<form:label path="organization">
				<spring:message text="所属机构&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:select path="organization.id">
			<c:forEach items="${listOrganizations}" var="org">
			<option value="${org.id}">${org.name}</option>
			</c:forEach>
  			</form:select>
		</td>
	</tr>
	</c:if>
	<c:if test="${!empty equipment.name}">
	<tr>
		<td>
			<form:label path="organization">
				<spring:message text="所属机构&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:select path="organization.id">
			<option value="${equipment.organization.id}">${equipment.organization.name}</option>			
			<c:forEach items="${listOrganizations}" var="organization">
				<c:if test="${equipment.organization.id != organization.id}">
					<option value="${organization.id}">${organization.name}</option>
				</c:if>	
			</c:forEach>
  			</form:select>
		</td>
	</tr>
	</c:if>	
	
	<tr>
		<td>
			<form:label path="contact">
				<spring:message text="联系人&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:select path="contact.id">
			<c:forEach items="${listPersons}" var="person">
			<option value="${person.id}">${person.name}</option>
			</c:forEach>
  			</form:select>
		</td>
	</tr>
		<tr>
		<td>
			<form:label path="note">
				<spring:message text="详情&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>			
			<form:textarea path="note"/>
			<script type="text/javascript">CKEDITOR.replace('note');</script>
		</td>
	</tr>

	<tr>	
		<td>
			<form:input path="image.id" value="1" readonly="true" type="hidden"/>
		</td>	
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
			<c:if test="${!empty equipment.name}">
				<input type="submit"
					value="<spring:message text="修改人员信息"/>" />
			</c:if>
			<c:if test="${empty equipment.name}">
				<input type="submit"
					value="<spring:message text="添加人员"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
</div>
<br>

<h3>用户列表</h3>
<c:if test="${!empty listEquipments}">
	<table class="tg" style="color:#000000">
	<tr>		
		<th>设备名称</th>
		<th>设备型号</th>	
		<th>所属单位</th>
		<th>联系人</th>
		<th>详情</th>
		<th>发布者</th>
		<th>发布时间</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<c:forEach items="${listEquipments}" var="equipment">
		<tr>
			
			<td>${equipment.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${equipment.version}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${equipment.organization.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${equipment.contact.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${equipment.note}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${equipment.issuer.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${equipment.time}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><a href="<c:url value='/super/equipment/edit/${equipment.id}' />" >修改&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
			<td><a href="<c:url value='/super/equipment/remove/${equipment.id}' />" >删除</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</div></div>
<jsp:include page="backstage_foot.jsp"/>
</body>
</html>
