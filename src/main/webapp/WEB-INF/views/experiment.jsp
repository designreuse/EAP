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
	添加实验
</h1>
<c:url var="addAction" value="/super/experiment/add" ></c:url>
<form:form action="${addAction}" commandName="experiment">
<table class="pfont">
	<c:if test="${!empty experiment.title}">
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
				<spring:message text="成果标题&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="title" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="team">
				<spring:message text="研究团队&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			<form:input path="team" />
		</td> 
	</tr>
	
	<tr>		
		<td>
			<form:label path="organization">
				<spring:message text="所属机构&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<c:if test="${empty experiment.title}">
		<td>
			<form:select path="organization.id">
			<c:forEach items="${listOrganizations}" var="organization">
			<option value="${organization.id}">${organization.name}</option>
			</c:forEach>
  			</form:select>
		</td>
		</c:if>
		<c:if test="${!empty experiment.title}">
		<td>
			<form:select path="organization.id">
			<option value="${experiment.organization.id}">${experiment.organization.name}</option>			
			<c:forEach items="${listOrganizations}" var="organization">
				<c:if test="${experiment.organization.id != organization.id}">
					<option value="${organization.id}">${organization.name}</option>
				</c:if>	
			</c:forEach>
  			</form:select>
		</td>
		</c:if>	
	</tr>
	<!-- ==================================以下为相关动物插入=========================================  -->
	
	<tr>
		<td>
			<form:label path="animals">
				<spring:message text="相关动物&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<td>
			
			<c:forEach var="animals" items="${experiment.animals}">
			<form:select path="animals.animalid">
				<c:forEach items="${listAnimals}" var="animallist">
					<option value="${animallist.id}">${animallist.name}</option>
				</c:forEach>
  			</form:select>
  			</c:forEach>
		</td> 
	</tr>
	
	<!-- ==================================以上为相关动物插入=========================================  -->
	<tr>
		<td>
			<form:label path="equipment">
				<spring:message text="相关设备&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<c:if test="${empty experiment.title}">
		<td>
			<form:select path="equipment.id">
			<c:forEach items="${listEquipments}" var="equipment">
			<option value="${equipment.id}">${equipment.name}</option>
			</c:forEach>
  			</form:select>
		</td>
		</c:if>
		<c:if test="${!empty experiment.title}">
		<td>
			<form:select path="equipment.id">
			<option value="${experiment.equipment.id}">${experiment.equipment.name}</option>			
			<c:forEach items="${listEquipments}" var="equipment">
				<c:if test="${experiment.equipment.id != equipment.id}">
					<option value="${equipment.id}">${equipment.name}</option>
				</c:if>	
			</c:forEach>
  			</form:select>
		</td>
		</c:if>	
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
			<c:if test="${!empty experiment.title}">
				<input type="submit"
					value="<spring:message text="修改实验信息"/>" />
			</c:if>
			<c:if test="${empty experiment.title}">
				<input type="submit"
					value="<spring:message text="添加实验记录"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
</div>
<br>

<h3>用户列表</h3>
<c:if test="${!empty listExperiments}">
	<table class="tg" style="color:#000000">
	<tr>		
		<th>实验题目</th>
		<th>实验团队</th>	
		<th>所属单位</th>
		<th>相关设备</th>
		<th>发布者</th>
		<th>发布时间</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<c:forEach items="${listExperiments}" var="experiment">
		<tr>
			
			<td>${experiment.title}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${experiment.team}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${experiment.organization.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${experiment.equipment.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${experiment.issuer.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${experiment.time}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><a href="<c:url value='/super/experiment/edit/${experiment.id}' />" >修改&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
			<td><a href="<c:url value='/super/experiment/remove/${experiment.id}' />" >删除</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</div></div>
<jsp:include page="backstage_foot.jsp"/>
</body>
</html>
