<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<jsp:include page="head.jsp"/>
<div id="content">
		<div class="inner">
			<div class="container_12">
				<div class="wrapper">
					<div class="block">
						<div class="grid_seletanimal">
							<h2>检索条件</h2>
									<div class="testimonial-block-little">
										<form:form action="${addAction}" commandName="species">
										<table class="animallist-black">
											<tr>
												<td style="color:#60aff6">										
													门:									
												</td>
												<td>										
													<form:select path="name">
														<option value="1">Mesocricetus auratuserere</option>
														<option value="2">Mesocricetus werwrewreauratus</option>
														<option value="3">Mesocricetus auratus</option>
  													</form:select>											
												</td>
											</tr>
											<tr>
												<td style="color:#60aff6">										
													<br/>纲:										
												</td>
												<td>										
													<br/><form:select path="name">
														<option value="1">Slac</option>
														<option value="2">Srrlac</option>
														<option value="3">Sltttac</option>
  													</form:select>											
												</td>
											</tr>
											<tr>
												<td style="color:#60aff6">										
													<br/>名称:									
												</td>
												<td>										
													<br/><form:input path="name"></form:input>									
												</td>
											</tr>
											<tr>
												<td style="color:#60aff6">										
													<br/>目:									
												</td>
												<td>										
													<br/><form:input path="name"></form:input>									
												</td>
											</tr>
											<tr>
												<td style="color:#60aff6">										
													<br/>科:									
												</td>
												<td>										
													<br/><form:input path="name"></form:input>									
												</td>
											</tr>
											<tr>
												<td style="color:#60aff6">										
													<br/>属:									
												</td>
												<td>										
													<br/><form:input path="name"></form:input>									
												</td>
											</tr>
											<tr>
												<td style="color:#60aff6">										
													<br/>种:									
												</td>
												<td>										
													<br/><form:input path="name"></form:input>									
												</td>
											</tr>
											<tr>
												<td width="100px">										
													<br/><input type="submit" class="button" value="<spring:message text="清空"/>" />									
												</td>
												<td width="100px">										
													<br/><input type="submit" class="button" value="<spring:message text="检索"/>" />									
												</td>
											</tr>
										</table>
										</form:form>
									</div>
							</div>
							
						<div class="grid_animallist">
							<h2>实验动物列表</h2>
								<div class="testimonial-block-little">
									<table class="animallist-black">
										<tr>
											<td style="color:#60aff6;font-size:16px">										
												名称											
											</td>
											<td style="text-align:lift;color:#60aff6;font-size:16px">
												种名
											</td>
											<td style="text-align:lift;color:#60aff6;font-size:16px">
												属名
											</td>
											<td style="text-align:right;color:#60aff6;font-size:16px">
												发布时间
											</td>
										</tr>
										<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td></tr>
										<c:if test="${!empty showSpeciess}">
											<c:forEach items="${showSpeciess}" var="species">									
												<tr>
													<td>
													<a href="show/species/detail/${species.id}" target="_blank">&nbsp;												
														${species.name}												
													</a>
													</td>
													<td style="text-align:lift">${species.species_en}</td>
													<td style="text-align:lift">${species.genus_en}</td>
													<td style="text-align:right">${species.time}</td>
												</tr>
													<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td></tr>
										</c:forEach>
										</c:if>									
									</table>	
								</div>
							<div align="center">	
								<% int i=0;%>								
							<c:forEach var="i" begin="1" end="${numberSpeciess/15+0.934}">
									<% i=i+1; %>								
									<a href="show/species/${i}" class="button2">第${i}页</a>														
							</c:forEach>
							<div>共<%= i %>页|${numberSpeciess}条数据</div>
						</div>	
					</div>	
				</div>
			</div>	
		</div>	
	</div>	
</div>
<jsp:include page="foot.jsp"/>
</body>
</html>
