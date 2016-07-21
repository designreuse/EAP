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
	添加人员
</h1>
<c:url var="addAction" value="/super/person/add" ></c:url>
<form:form action="${addAction}" commandName="person">
<table class="pfont">
	<c:if test="${!empty person.name}">
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
				<spring:message text="人员名称&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="name" />
		</td> 
	</tr>
	<c:if test="${empty person.name}">
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
	<c:if test="${!empty person.name}">
	<tr>
		<td>
			<form:label path="organization">
				<spring:message text="所属机构&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:select path="organization.id">
			<option value="${person.organization.id}">${person.organization.name}</option>			
			<c:forEach items="${listOrganizations}" var="organization">
				<c:if test="${person.organization.id != organization.id}">
					<option value="${organization.id}">${organization.name}</option>
				</c:if>	
			</c:forEach>
  			</form:select>
		</td>
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="major">
				<spring:message text="研究方向&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="major" />
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="rank">
				<spring:message text="职称&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="rank" />
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="note">
			<spring:message text="详细信息&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>			
			<form:textarea path="note"/>
			<script type="text/javascript">CKEDITOR.replace('note');</script>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty person.name}">
				<input type="submit"
					value="<spring:message text="修改人员信息"/>" />
			</c:if>
			<c:if test="${empty person.name}">
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
<c:if test="${!empty listPersons}">
	<table class="tg" style="color:#000000">
	<tr>		
		<th>人员名称</th>
		<th>所属单位</th>	
		<th>研究方向</th>
		<th>职称</th>
		<th>详情</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<c:forEach items="${listPersons}" var="person">
		<tr>
			
			<td>${person.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${person.organization.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${person.major}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${person.rank}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${person.note}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><a href="<c:url value='/super/person/edit/${person.id}' />" >修改&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
			<td><a href="<c:url value='/super/person/remove/${person.id}' />" >删除</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</div></div>
<jsp:include page="backstage_foot.jsp"/>
</body>
</html>
