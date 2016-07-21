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
	添加动物
</h1>
<c:url var="addAction" value="/super/animal/add" ></c:url>
<form:form action="${addAction}" commandName="animal">
<table class="pfont">
	<c:if test="${!empty animal.name}">
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
				<spring:message text="动物名称&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="name" /><p><br/></p>
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
  			<option value="其他动物">其他动物</option>
			<option value="特色动物">特色动物</option>
  			<option value="实验动物">实验动物</option>
  			</form:select><p><br/></p>
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="strain">
				<spring:message text="品系&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="strain" /><p><br/></p>
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="summary">
				<spring:message text="简介&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label><p><br/></p>
		</td>
		<td>
			<form:input path="summary" />
		</td> 
	</tr>
	
	<tr>
		<td>
			<form:label path="preparation">
				<spring:message text="制备方法&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>			
			<form:textarea path="preparation"/><p><br/></p>
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="phenotype">
				<spring:message text="表型&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>			
			<form:textarea path="phenotype"/><p><br/></p>
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="origin">
				<spring:message text="来源&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>			
			<form:textarea path="origin"/><p><br/></p>
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
			<script type="text/javascript">CKEDITOR.replace('note');</script><p><br/></p>
		</td>
		
	</tr>
	
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
  			</form:select><p><br/></p>
		</td>
	</tr>
	
	<tr>	
		<td>
			<form:input path="image.id" value="1" readonly="true" type="hidden"/>
		</td>		
		<td>
			<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>
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
		
	</tr>
		
	<tr>
		<td colspan="2">
			<c:if test="${!empty animal.name}">
				<input type="submit"
					value="<spring:message text="修改动物信息"/>" />
			</c:if>
			<c:if test="${empty animal.name}">
				<input type="submit" 
					value="<spring:message text="添加动物"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
</div>
<br>

<h3>用户列表</h3>
<c:if test="${!empty listAnimals}">
	<table class="tg" style="color:#000000">
	<tr>		
		<th>动物名称</th>
		<th>类别</th>	
		<th>联系人</th>
		<th>发布者</th>
		<th>发布时间</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<c:forEach items="${listAnimals}" var="animal">
		<tr>
			
			<td>${animal.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${animal.classification}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${animal.contact.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${animal.issuer.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${animal.time}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><a href="<c:url value='/super/animal/edit/${animal.id}' />" >修改&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
			<td><a href="<c:url value='/super/animal/remove/${animal.id}' />" >删除</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</div></div>
<jsp:include page="backstage_foot.jsp"/>
</body>
</html>
