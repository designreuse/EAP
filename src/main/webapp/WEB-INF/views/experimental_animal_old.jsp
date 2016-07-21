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
										<form:form action="${addAction}" commandName="experimental_animal">
										<table class="animallist-black" id="#select_table">
											<tr>
												<td style="color:#60aff6">										
													物种:									
												</td>
												<td>										
													<form:select path="strain_id.id">
														<option value="1">Mesocricetus auratuserere</option>
														<option value="2">Mesocricetus werwrewreauratus</option>
														<option value="3">Mesocricetus auratus</option>
  													</form:select>											
												</td>
											</tr>
											<tr>
												<td style="color:#60aff6">										
													<br/>品系:										
												</td>
												<td>										
													<br/><form:select path="strain_id.id">
														<option value="1">Slac</option>
														<option value="2">Srrlac</option>
														<option value="3">Sltttac</option>
  													</form:select>											
												</td>
											</tr>
											<tr>
												<td style="color:#60aff6">										
													<br/>基因:									
												</td>
												<td>										
													<br/><form:input path="strain_id.id"></form:input>									
												</td>
											</tr>
											<tr>
												<td style="color:#60aff6">										
													<br/>用途:									
												</td>
												<td>										
													<br/><form:input path="strain_id.id"></form:input>									
												</td>
											</tr>
											<tr>
												<td style="color:#60aff6">										
													<br/>表型:									
												</td>
												<td>										
													<br/><form:input path="strain_id.id"></form:input>									
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
									<c:if test="${pageContext.request.userPrincipal.name != null}">
										<c:forEach items="${listAdmins}" var="admin">
											<c:if test="${admin.name eq pageContext.request.userPrincipal.name}">
												<div style="text-align:right;">
													<c:if test="${admin.authority eq 'SUPER'}">
														<td style="text-align:right"><a class="button" href="super/experimental_animal/create">添加新实验动物</a></td>
													</c:if>
													<c:if test="${admin.authority eq 'ADMIN'}">
														<td style="text-align:right"><a class="button" href="amdin/experimental_animal/create">添加新实验动物</a></td>
													</c:if>
												</div>
											</c:if>
										</c:forEach>
									</c:if>
									</tr>
									<tr>
											<td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td>
									</tr>
									</table>
									<table class="animallist-black">
										<tr>
											<td style="color:#60aff6;font-size:16px">										
												动物名称											
											</td>
											<td style="text-align:lift;color:#60aff6;font-size:16px">
												物种
											</td>
											<td style="text-align:lift;color:#60aff6;font-size:16px">
												品系
											</td>
											<td style="text-align:lift;color:#60aff6;font-size:16px">
												基因
											</td>
											<td style="text-align:lift;color:#60aff6;font-size:16px">
												
											</td>
											<td style="text-align:right;color:#60aff6;font-size:16px">
												
											</td>
										</tr>
										<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td></tr>
										<c:if test="${!empty showExperimental_animals}">
											<c:forEach items="${showExperimental_animals}" var="experimental_animal">									
												<tr>
													<td>
													<a href="show/experimental_animal/detail/${experimental_animal.id}" target="_blank">&nbsp;												
														${experimental_animal.name}												
													</a>
													</td>
													
													<td style="text-align:lift">${experimental_animal.strain_id.species_id.name}</td>
													<td style="text-align:lift">${experimental_animal.strain_id.name}</td>
													<td style="text-align:lift">${experimental_animal.dna_name}</td>
													
													<c:if test="${pageContext.request.userPrincipal.name != null}">
													
														<c:forEach items="${listAdmins}" var="admin">
															<c:if test="${admin.name eq pageContext.request.userPrincipal.name}">
																<c:if test="${admin.authority eq 'SUPER'}">
																<td style="text-align:center"><a class="button" href="<c:url value='/super/experimental_animal/edit/${experimental_animal.id}'/>" >编辑</a></td>
																<td style="text-align:right"><a class="button" href="<c:url value='/super/experimental_animal/remove/${experimental_animal.id}'/>" >删除</a></td>
																</c:if>
																<c:if test="${admin.authority eq 'ADMIN'}">
																<td style="text-align:center"><a class="button" href="<c:url value='/admin/experimental_animal/edit/${experimental_animal.id}'/>" >编辑</a></td>
																<td style="text-align:right"><a class="button" href="<c:url value='/admin/experimental_animal/remove/${admin.id}/${experimental_animal.id}'/>" >删除</a></td>
																</c:if>
															</c:if>
														</c:forEach>
													</c:if>
													
												</tr>
													<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td></tr>
										</c:forEach>
										</c:if>									
									</table>	
								</div>
							<div align="center">	
								<% int i=0;%>								
							<c:forEach var="i" begin="1" end="${numberExperimental_animals/15+0.934}">
									<% i=i+1; %>								
									<a href="super/experimental_animal/${i}" class="button2">第${i}页</a>														
							</c:forEach>
							<div>共<%= i %>页|${numberExperimental_animals}条数据</div>
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
