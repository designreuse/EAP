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
<jsp:include page="backstage_head.jsp"/>	
<div id="content">
		<div class="inner">
			<div class="container_12">
				<div class="wrapper">
					<div class="block">
						<div class="grid_seletanimal">
							<h2>检索条件</h2>
									<div class="testimonial-block-little">
										<form:form action="${addAction}" commandName="strain">
										<table class="animallist-black" id="select_table">
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
													物种:									
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
													引入时间:									
												</td>
												<td>										
													<form:select path="name">
														<option value="1">1990</option>
														<option value="2">1992</option>
														<option value="3">2001</option>
  													</form:select>											
												</td>
											</tr>
											<tr>
												<td style="color:#60aff6">										
													培育年份:									
												</td>
												<td>										
													<form:select path="name">
														<option value="1">1990</option>
														<option value="2">1992</option>
														<option value="3">2001</option>
  													</form:select>											
												</td>
											</tr>
											<tr>
												<td style="color:#60aff6">										
													<br/>用途:									
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
											<td style="text-align:right"><a class="button" href="super/strain/create">添加新品系</a></td>
									<tr>
									<tr>
											<td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td>
									<tr>
									</table>
									<table class="animallist-black">
										<tr>
											<td style="color:#60aff6;font-size:16px">										
												品系名称											
											</td>
											<td style="text-align:lift;color:#60aff6;font-size:16px">
												物种
											</td>
											<td style="text-align:lift;color:#60aff6;font-size:16px">
												
											</td>
											<td style="text-align:right;color:#60aff6;font-size:16px">
												
											</td>
										</tr>
										<tr><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td></tr>
										<c:if test="${!empty showStrains}">
											<c:forEach items="${showStrains}" var="strain">									
												<tr>
													<td>
													<a href="show/strain/detail/${strain.id}" target="_blank">&nbsp;												
														${strain.name}												
													</a>
													</td>
													<td style="text-align:lift">${strain.species_id.species_ch}（${strain.species_id.species_en}）</td>
													<td style="text-align:center"><a class="button" href="<c:url value='/super/strain/edit/${strain.id}'/>" >编辑</a></td>
													<td style="text-align:right"><a class="button" href="<c:url value='/super/strain/remove/${strain.id}'/>" >删除</a></td>
												</tr>
													<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td></tr>
										</c:forEach>
										</c:if>									
									</table>	
								</div>
							<div align="center">	
								<% int i=0;%>								
							<c:forEach var="i" begin="1" end="${numberStrains/15+0.934}">
									<% i=i+1; %>								
									<a href="super/strain/${i}" class="button2">第${i}页</a>														
							</c:forEach>
							<div>共<%= i %>页|${numberStrains}条数据</div>
						</div>	
					</div>	
				</div>
			</div>	
		</div>	
	</div>	
</div>
<jsp:include page="backstage_foot.jsp"/>
</body>
</html>
