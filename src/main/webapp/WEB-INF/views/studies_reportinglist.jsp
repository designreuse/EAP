<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="resources/css/listtable.css" rel="stylesheet" type="text/css" media="screen"/>
</head>
<body>
<%
	int i=0;
%>
<c:if test="${!empty listMessages}">
	<table class="zebra">
	<tr>【研究报告】</tr>

	<c:forEach items="${listMessages}" var="message">
		<%
			if(i<5)
		 {
		%>
		<c:if test="${message.newtype=='studies_reporting'}">
			<%
				i=i+1;
			%>
			<tr>
				<td>${message.title}</td>
				<td width="200px">${message.time}</td>
			</tr>

		</c:if>
			<%
				}
			%>
	</c:forEach>
	</table>
</c:if>
</body>
</html>
