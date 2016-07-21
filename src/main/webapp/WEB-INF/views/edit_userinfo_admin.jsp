
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
	</head>
      <body>  
      修改个人资料
<c:url var="addAction" value="/update_userinfo/${admin.id}/${admin.name}" ></c:url>
<form:form action="${addAction}" commandName="admin">
      								<div class="faceplate" >
										<div class="embed">
										<table>
											<tr>
												<td width="160px">
													<c:if test="${!empty admin.photo_id.id}">
														<figure class="img-indent"><img src="${admin.photo_id.url}${admin.photo_id.name}" width="160px" alt="" ></figure>
													</c:if>														
													<c:if test="${empty admin.photo_id.id}">
														<figure class="img-indent"><img src="resources/images/admin_image.jpg" width="160px" alt="" ></figure>
													</c:if>
												</td>
												<td width="300px">
													<strong>账号：</strong>												
													${admin.name}
													<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
													<c:if test="${!empty admin.enable}">
														<strong>激活状态：</strong>												
														已激活	
														<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
													</c:if>		
													<c:if test="${!empty admin.authority}">
														<strong>用户组：</strong>												
														管理员	
														<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
													</c:if>		
													<strong>注册时间：</strong>												
													${admin.register_time}
													<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
														<strong>用户名：</strong><form:input path="username" /> 
														<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
														<strong>所属机构：</strong>
															<form:select path="organization.id">
																<option value="${admin.organization.id}">${admin.organization.name}</option>
																<c:forEach items="${listOrganizations}" var="organization">
																	<c:if test="${organization.id ne admin.organization.id}">
																		<option value="${organization.id}">${organization.name}</option>
																	</c:if>
																</c:forEach>
  															</form:select>
														<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
														<strong>简介：</strong><form:textarea path="remarks" style="resize:none; width:100%; height:100px;" />
														<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
															<font class="f-deepblue">联系电话：</font><form:input path="phone" />
															<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
															<font class="f-deepblue">email：</font><form:input path="email" />
															<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />	
													<br />
													<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
													<input type="submit" value="<spring:message text="更新"/>" />	
												</td>
												<td>
													<img src="resources/images/vertical.png" /><br/>
													<img src="resources/images/vertical.png" />
												</td>
												<td width="200px">
													服务类信件<hr width="100%" color=#708090 />
													<a href="animal_resources">未读信息</a><br/>
													<a href="animal_resources">所有信息</a><br/><br/>	
													系统通知<hr width="100%" color=#708090 />
													<a href="admin/message/${admin.id}/${admin.name}"  target="_blank">未读通知（${inbox_noread}）</a><br/>
													<a href="admin/message/${admin.id}/${admin.name}"  target="_blank">所有通知（${inbox}）</a><br/>
													<a href="admin/message/${admin.id}/${admin.name}"  target="_blank">发布通知</a><br/><br/>
												</td>
											</tr>
										</table>
																	
										</div>
									</div>
									</form:form>
									
	</body>
</html>