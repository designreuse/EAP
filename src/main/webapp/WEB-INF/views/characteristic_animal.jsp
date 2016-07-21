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
	添加实验动物
</h1>

<c:url var="addAction" value="/super/characteristic_animal/add" ></c:url>

<form:form action="${addAction}" commandName="characteristic_animal">
<table class="pfont">
	<c:if test="${!empty characteristic_animal.name}">
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
				<spring:message text="名称："/>
			</form:label>
		</td>
		<td>
			<form:input path="name" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="species_id.id">
				<spring:message text="物种的id："/>
			</form:label>
		</td>
		<td>
			<form:input path="species_id.id" />
		</td> 
	</tr>
	
	<tr>
		<td>
			<form:label path="preparation">
				<spring:message text="制备方式："/>
			</form:label>
		</td>
		<td>
			<form:input path="preparation" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="save_place">
				<spring:message text="养殖地："/>
			</form:label>
		</td>
		<td>
			<form:input path="save_place" />
		</td> 
	</tr>
	
	<tr>
		<td>
			<form:label path="save_info">
				<spring:message text="养殖方式："/>
			</form:label>
		</td>
		<td>
			<form:input path="save_info" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="quantity">
				<spring:message text="储存量："/>
			</form:label>
		</td>
		<td>
			<form:input path="quantity" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="note">
				<spring:message text="备注信息："/>
			</form:label>
		</td>
		<td>
			<form:input path="note" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="contact_id.id">
				<spring:message text="联系人id："/>
			</form:label>
		</td>
		<td>
			<form:input path="contact_id.id" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="issuer_id.id">
				<spring:message text="发布人id："/>
			</form:label>
		</td>
		<td>
			<form:input path="issuer_id.id" />
		</td> 
	</tr>

	<tr>	
		<td>
			<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>
		</td>		
	</tr>	
	<tr>
		<td colspan="2">
			<c:if test="${!empty characteristic_animal.time}">
				<input type="submit"
					value="<spring:message text="Edit characteristic_animal"/>" />
			</c:if>
			<c:if test="${empty characteristic_animal.time}">
				<input type="submit"
					value="<spring:message text="Add characteristic_animal"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
</div>
<br>
<h3>机构列表</h3>
<c:if test="${!empty listCharacteristic_animals}">
	<table class="tg">
	<tr>
		<th>ID</th>
		<th>特色动物的名称</th>	
		<th>物种名</th>
		<th>制备方式</th>
		<th>养殖地</th>
		<th>培养方式</th>
		<th>储存量</th>
		<th>备注</th>
		<th>发布时间</th>
	</tr>
	<c:forEach items="${listCharacteristic_animals}" var="characteristic_animal">
		<tr>
			<td>${characteristic_animal.id}</td>
			<td>${characteristic_animal.name}</td>
			<td>${characteristic_animal.species_id.species_ch}（${characteristic_animal.species_id.species_en}）</td>	
			<td>${characteristic_animal.preparation}</td>
			<td>${characteristic_animal.save_place}</td>
			<td>${characteristic_animal.save_info}</td>
			<td>${characteristic_animal.quantity}</td>
			<td>${characteristic_animal.note}</td>
			<td>${characteristic_animal.time}</td>
			<td><a href="<c:url value='/super/characteristic_animal/edit/${characteristic_animal.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/super/characteristic_animal/remove/${characteristic_animal.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</div></div>
<jsp:include page="backstage_foot.jsp"/>
</body>
</html>
