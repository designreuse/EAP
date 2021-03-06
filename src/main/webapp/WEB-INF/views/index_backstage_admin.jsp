
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
        <script type="text/javascript">
		$(document).ready(function(){
			$("#edit_image").click(function(){
					htmlobj=$.ajax({url:"edit_userinfo/${admin.id}/${admin.name}",async:false});
					$("#user_info").html(htmlobj.responseText);
					});
			$("#face_image").click(function(){
					htmlobj=$.ajax({url:"edit_face_image/${admin.id}/${admin.name}",async:false});
					$("#face_img").html(htmlobj.responseText);
					});
		});
		</script>  
      </head>
      <body>  
		<jsp:include page="backstage_head.jsp"/> 
		<div id="content">
		<div class="inner">
		<p></p><p></p><p></p><p></p><p></p><p></p>
		<div class="container_12">	
      	<div class="picture-frame-gray">
    			<div class="title_name">
        			账户：${admin.name}
      			</div>
      				<div class="main_window">
      					<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      						<li id="user_info">
      								<font class="title_name_little">
      									欢迎您：${admin.username} 
      									<a href="javascript:void(0);">
      										<img id="edit_image" src="resources/images/edit_image.png" width="18px" hight="18px" />
      											<span id="edit_font" style="display:none; font-size:70%">修改个人资料</span>
      									</a>
      								</font>
      								<div class="faceplate" >
										<div class="embed">
										<table>
											<tr>
												<td id="face_img" width="160px">
													<a href="javascript:void(0);">
													<c:if test="${!empty admin.photo_id.id}">
														<figure class="img-indent"><img  id="face_image" src="${admin.photo_id.url}${admin.photo_id.name}" width="160px" alt="修改头像" ></figure>
													</c:if>	
													<c:if test="${empty admin.photo_id.id}">
														<figure class="img-indent"><img id="face_image" src="resources/images/admin_image.jpg" alt="" ></figure>
													</c:if>
      													<span id="edit_face_font" style="display:none;">修改头像</span>
      												</a>
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
													<c:if test="${!empty admin.last_login}">
														<strong>上次登录时间：</strong>${admin.last_login}
														<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
													</c:if>
													<c:if test="${!empty admin.organization.name}">
														<strong>所属机构：</strong>${admin.organization.name}
														<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
													</c:if>
													<c:if test="${!empty admin.remarks}">
														<strong>简介：</strong>${admin.remarks}
														<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
													</c:if>
													<div  id="contacts" class="contacts">
														<c:if test="${!empty admin.organization.address}">
															<font class="f-deepblue">联系地址：</font>${admin.organization.address}
															<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
														</c:if>
														<c:if test="${!empty admin.phone}">
															<font class="f-deepblue">联系电话：</font>${admin.phone}
															<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
														</c:if>
														<c:if test="${!empty admin.email}">
															<font class="f-deepblue">email：</font>${admin.email}
															<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
														</c:if>
													</div>
													<a id="contacts_more" class="contacts_more" href="javascript:void(0);">+&nbsp;&nbsp;联系方式</a>
													<a id="contacts_less" class="contacts_less" href="javascript:void(0);">-&nbsp;&nbsp;收起</a>		
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
									
								</li>  
						<div class="line"></div>
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
      					 <ul> 
      							<!-- ====================================================以下为第二层信息【管理功能】=============================================================== -->    																
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
														<a href="admin/species/1">物种管理</a><br/>
														<a href="admin/strain/1">品系管理</a><br/>
													</td>
													<td><img src="resources/images/vertical.png" /></td>
													<td>
														<figure class="img-indent"><a href="animal_resources"><img src="resources/images/icon-02-02.jpg" onmouseout="this.src='resources/images/icon-02-02.jpg'" onmouseover="this.src='resources/images/icon-02-02-on.jpg'"></a></figure>
														动物资源管理<br/>
														<a href="admin/experimental_animal/${admin.organization.id}/1">实验动物管理</a><br/>
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
															<a href="animal_resources">用户管理</a><br/>
															<a href="admin/file/1">文件管理</a><br/>
														</div>
													</td>
												</tr>
												</table>
										</div>
									</li>  
      								<!-- ====================================================以上为第二层信息【管理功能】=============================================================== -->  
      								</ul>  
								
									<p><div class="text-right" style=" text-align:right;">注销</div></p>
								
						</div>
			</div>
		</div>
		</div>
		</div>
		
<jsp:include page="backstage_foot.jsp"/>
	</body>
</html>