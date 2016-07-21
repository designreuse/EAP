
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
		<script type="text/javascript" src="resources/js/jquery-2.1.4.js"> </script>
        <link rel="stylesheet" type="text/css" href="resources/css/new_style.css" />
        <script type="text/javascript" src="resources/js/javascript.js"></script>
        	<title>实验动物详情</title>       
      </head>
      <body>  
		<jsp:include page="backstage_head.jsp"/> 
		<div id="content">
		<div class="inner">
		<p></p><p></p><p></p><p></p><p></p><p></p>
		<div class="container_12">	
      	<div class="picture-frame-gray">
            <form:form action="${addAction}" commandName="user">
    			<div class="title_name">
        			${user.username}
      			</div>
      				<div class="main_window">
      					<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      						
      						      						
      							<li>
      								<font class="title_name_little">
      									欢迎您：${user.username}
      								</font>
      								<div class="faceplate" >
										<div class="embed">
											<c:if test="${!empty user.photo_id.id}">
												<figure class="img-indent"><img src="${user.photo_id.url}${user.photo_id.name}" alt="" ></figure>
											</c:if>	
											<strong>账号：</strong>												
													${user.name}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											<c:if test="${!empty user.enable}">
												<strong>激活状态：</strong>												
													已激活	
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											</c:if>		
											<c:if test="${!empty user.authority}">
												<strong>用户组：</strong>												
													超级管理员	
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											</c:if>		
											<strong>注册时间：</strong>												
													${user.register_time}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											<c:if test="${!empty user.last_login}">
												<strong>上次登录时间：</strong>${user.last_login}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											
											<c:if test="${!empty user.organization.name}">
												<strong>所属机构：</strong>${user.organization.name}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty user.remarks}">
												<strong>简介：</strong>${user.remarks}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<div  id="contacts" class="contacts">
													<c:if test="${!empty user.organization.address}">
														<font class="f-deepblue">联系地址：</font>${user.organization.address}
														<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
													</c:if>
													<c:if test="${!empty user.phone}">
														<font class="f-deepblue">联系电话：</font>${user.phone}
														<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
													</c:if>
													<c:if test="${!empty user.email}">
														<font class="f-deepblue">email：</font>${user.email}
														<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
													</c:if>
											</div>
											<a id="contacts_more" class="contacts_more" href="javascript:void(0);">+&nbsp;&nbsp;联系方式</a>
											<a id="contacts_less" class="contacts_less" href="javascript:void(0);">-&nbsp;&nbsp;收起</a>									
											<p></p>
																			
										</div>
									</div>
								</li>  
						<div class="line"></div>
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
      					 <ul> 
      							<!-- ====================================================以下为第二层信息【生理数据】=============================================================== -->    																
      								<li class="line">
      									<div id="second_level_menu_title-01" class="second_leve_menu">
      										<a href="javascript:void(0);">
      										<img id="second_level_menu_image-01" src="resources/images/reduce.png">
      											<span>管理功能</span>
      										</a>
      									</div>
      									<div id="second_level_menu-01" class="second_level_text_show">
      													
												<h2>资源管理<hr width="90%" color=#708090 /></h2>
													<table text-align="center">
													<tr>
													<td>
														<figure class="img-indent"><a href="animal_resources"><img src="resources/images/icon-02-01.jpg" onmouseout="this.src='resources/images/icon-02-01.jpg'" onmouseover="this.src='resources/images/icon-02-01-on.jpg'"></a></figure>
														物种品系管理<br/>
														<a href="super/species/1">物种管理</a><br/>
														<a href="super/strain/1">品系管理</a><br/>
													</td>
													<td><img src="resources/images/vertical.png" /></td>
													<td>
														<figure class="img-indent"><a href="animal_resources"><img src="resources/images/icon-02-02.jpg" onmouseout="this.src='resources/images/icon-02-02.jpg'" onmouseover="this.src='resources/images/icon-02-02-on.jpg'"></a></figure>
														动物资源管理<br/>
														<a href="super/experimental_animal/1">实验动物管理</a><br/>
														<a href="animal_resources">特色动物管理</a><br/>
													</td>
													<td><img src="resources/images/vertical.png" /></td>
													<td>
														<figure class="img-indent"><a href="animal_resources"><img src="resources/images/icon-02-03.jpg" onmouseout="this.src='resources/images/icon-02-03.jpg'" onmouseover="this.src='resources/images/icon-02-03-on.jpg'"></a></figure>
														设备资源管理<br/>
														<a href="animal_resources">特色设备管理</a><br/>
														<a href="animal_resources">常规设备管理</a><br/>
													</td>
													</tr>
													</table>
												<p></p>
												<table>
												<tr>
												<td><h2>服务管理<hr width="100%" color=#708090 /></h2></td>
												<td></td>
												<td><h2>动态管理<hr width="100%" color=#708090 /></h2></td>
												<td></td>
												<td><h2>培训管理<hr width="100%" color=#708090 /></h2></td>
												</tr>
												<tr>
													<td>
														<div class="wrapper">
															<figure class="img-indent"><a href="animal_resources"><img src="resources/images/icon-02-04.jpg" onmouseout="this.src='resources/images/icon-02-04.jpg'" onmouseover="this.src='resources/images/icon-02-04-on.jpg'"></a></figure>
															<a href="animal_resources">技术支持管理</a><br/>
															<a href="animal_resources">检测服务管理</a><br/>
															<a href="animal_resources">委托试验管理</a><br/>
														</div>
													</td>
													<td><img src="resources/images/vertical3.png" /></td>
													<td>
														<div class="wrapper">
															<figure class="img-indent"><a href="animal_resources"><img src="resources/images/icon-02-05.jpg" onmouseout="this.src='resources/images/icon-02-05.jpg'" onmouseover="this.src='resources/images/icon-02-05-on.jpg'"></a></figure>
															<a href="animal_resources">平台公告管理</a><br/>
															<a href="animal_resources">特色实验管理</a><br/>
															<a href="animal_resources">科研成果管理</a><br/>
														</div>
													</td>
													<td><img src="resources/images/vertical3.png" /></td>
													<td>
														<div class="wrapper">
															<figure class="img-indent"><a href="animal_resources"><img src="resources/images/icon-02-06.jpg" onmouseout="this.src='resources/images/icon-02-06.jpg'" onmouseover="this.src='resources/images/icon-02-06-on.jpg'"></a></figure>
															<a href="animal_resources">培训通知管理 </a><br/>
															<a href="animal_resources">相关科普管理</a><br/>
														</div>
													</td>
												</tr>
												</table>
      											<p></p>
												<table>
												<tr>
												<td><h2>法律法规管理<hr width="100%" color=#708090 /></h2></td>
												<td></td>
												<td><h2>其他管理<hr width="100%" color=#708090 /></h2></td>
												</tr>
												<tr>
													<td>
														<div class="wrapper">
															<figure class="img-indent"><a href="animal_resources"><img src="resources/images/icon-02-06.jpg" onmouseout="this.src='resources/images/icon-02-06.jpg'" onmouseover="this.src='resources/images/icon-02-06-on.jpg'"></a></figure>
															<a href="animal_resources">相关法律管理 </a><br/>
															<a href="animal_resources">相关规定管理</a><br/>
														</div>
													</td>
													<td><img src="resources/images/vertical3.png" /></td>
													<td>
														<div class="wrapper">
															<figure class="img-indent"><a href="animal_resources"><img src="resources/images/icon-02-07.jpg" onmouseout="this.src='resources/images/icon-02-07.jpg'" onmouseover="this.src='resources/images/icon-02-07-on.jpg'"></a></figure>
															<a href="animal_resources">管理员账号管理 </a><br/>
															<a href="animal_resources">机构单位管理</a><br/>
															<a href="animal_resources">用户管理</a><br/>
															<a href="super/file/1">文件管理</a><br/>
														</div>
													</td>
												</tr>
												</table>
										</div>
									</li>  
      								<!-- ====================================================以上为第二层信息【生理数据】=============================================================== -->  
      							</ul>  
								
									<p><div class="text-right" style=" text-align:right;">注销</div></p>
								
						</div>
					</form:form>
			</div>
		</div>
		</div>
		</div>
		
<jsp:include page="backstage_foot.jsp"/>
	</body>
</html>