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
	添加研究成果
</h1>
<c:url var="addAction" value="/super/achievement/add" ></c:url>
<form:form action="${addAction}" commandName="achievement">
<table class="pfont">
	<c:if test="${!empty achievement.title}">
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
		<c:if test="${empty achievement.title}">
		<td>
			<form:select path="organization.id">
			<c:forEach items="${listOrganizations}" var="organization">
			<option value="${organization.id}">${organization.name}</option>
			</c:forEach>
  			</form:select>
		</td>
		</c:if>
		<c:if test="${!empty achievement.title}">
		<td>
			<form:select path="organization.id">
			<option value="${achievement.organization.id}">${achievement.organization.name}</option>			
			<c:forEach items="${listOrganizations}" var="organization">
				<c:if test="${achievement.organization.id != organization.id}">
					<option value="${organization.id}">${organization.name}</option>
				</c:if>	
			</c:forEach>
  			</form:select>
		</td>
		</c:if>	
	</tr>
	
	
	<tr>
		<td>
			<form:label path="animal">
				<spring:message text="相关动物&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<c:if test="${empty achievement.title}">
		<td>
			<form:select path="animal.id">
			<c:forEach items="${listAnimals}" var="animal">
			<option value="${animal.id}">${animal.name}</option>
			</c:forEach>
  			</form:select>
		</td>
		</c:if>
		<c:if test="${!empty achievement.title}">
		<td>
			<form:select path="animal.id">
			<option value="${achievement.animal.id}">${achievement.animal.name}</option>			
			<c:forEach items="${listAnimals}" var="animal">
				<c:if test="${achievement.animal.id != animal.id}">
					<option value="${animal.id}">${animal.name}</option>
				</c:if>	
			</c:forEach>
  			</form:select>
		</td>
		</c:if>	
	</tr>
	
	<tr>
		<td>
			<form:label path="equipment">
				<spring:message text="相关设备&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<c:if test="${empty achievement.title}">
		<td>
			<form:select path="equipment.id">
			<c:forEach items="${listEquipments}" var="equipment">
			<option value="${equipment.id}">${equipment.name}</option>
			</c:forEach>
  			</form:select>
		</td>
		</c:if>
		<c:if test="${!empty achievement.title}">
		<td>
			<form:select path="equipment.id">
			<option value="${achievement.equipment.id}">${achievement.equipment.name}</option>			
			<c:forEach items="${listEquipments}" var="equipment">
				<c:if test="${achievement.equipment.id != equipment.id}">
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
			<script type="text/javascript">CKEDITOR.replace('note');</script>
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="experiment">
				<spring:message text="相关实验&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</form:label>
		</td>
		<c:if test="${empty achievement.title}">
		<td>
			<form:select path="experiment.id">
			<c:forEach items="${listExperiments}" var="experiment">
			<option value="${experiment.id}">${experiment.title}</option>
			</c:forEach>
  			</form:select>
		</td>
		</c:if>
		<c:if test="${!empty achievement.title}">
		<td>
			<form:select path="experiment.id">
			<option value="${achievement.experiment.id}">${achievement.experiment.title}</option>			
			<c:forEach items="${listExperiments}" var="experiment">
				<c:if test="${achievement.experiment.id != experiment.id}">
					<option value="${experiment.id}">${experiment.title}</option>
				</c:if>	
			</c:forEach>
  			</form:select>
		</td>
		</c:if>	
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
			<c:if test="${!empty achievement.title}">
				<input type="submit"
					value="<spring:message text="修改人员信息"/>" />
			</c:if>
			<c:if test="${empty achievement.title}">
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
<c:if test="${!empty listAchievements}">
	<table class="tg" style="color:#000000">
	<tr>		
		<th>成果标题</th>
		<th>研究团队</th>	
		<th>所属单位</th>
		<th>相关动物</th>
		<th>相关设备</th>
		<th>详情</th>
		<th>相关实验</th>
		<th>发布者</th>
		<th>发布时间</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<c:forEach items="${listAchievements}" var="achievement">
		<tr>
			
			<td>${achievement.title}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${achievement.team}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${achievement.organization.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${achievement.animal.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${achievement.equipment.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${achievement.note}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${achievement.experiment.title}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${achievement.issuer.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${achievement.time}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><a href="<c:url value='/super/achievement/edit/${achievement.id}' />" >修改&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
			<td><a href="<c:url value='/super/achievement/remove/${achievement.id}' />" >删除</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</div></div>
<jsp:include page="backstage_foot.jsp"/>
</body>
</html>
