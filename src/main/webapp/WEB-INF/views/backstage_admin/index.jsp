<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!--
这是主框架.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>中国科学院 | 模式与特色动物实验平台</title>
  <base href="<%=basePath%>">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"> 
  <!-- Bootstrap-table -->
  <link rel="stylesheet" href="resources/plugins/bootstrap-table-master/css/bootstrap-table.min.css">
  <!-- 我的CSS -->
  <link rel="stylesheet" href="resources/css/wts_animal_style.css">
  <link rel="stylesheet" type="text/css" href="resources/css/wts_text_detail_style.css" />	
</head>
<body>
<div class="wrapper">

  <!-- Main Header -->
	<jsp:include page="../shell_frame/shell_frame_head_backstage.jsp"/>
  <!-- Main Sidebar -->
	<jsp:include page="../shell_frame/shell_frame_sidebar_backstage.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    
 <section class="content-header">
    	<div class="row">    	
	      <div class="col-md-12">
	          <div class="box box-info frame-mini">
	            <div class="box-header with-border">
	              <h3 class="box-title">管理员个人中心</h3>
	            </div>
	            <div class="box-body" >
      				<div class="main_window">
						<div class="faceplate" >
							<div class="embed">										
	      						<div class="callout callout-gray">
	      							<div class="row">
										<c:if test="${!empty user.photo_id.id}">											
				  							<div class="col-md-3">
												<div id="face_image"><figure><img src="${user.photo_id.url}${user.photo_id.name}" alt="" width="90%" height="90%"></figure></div>
											</div>
										</c:if>	
										<div class="col-md-9">
											<p></p>		
											<li>
												<strong>用户组：</strong>${user.organization.name}管理员	
												<div class="dotted-line"></div>										
											</li>						
											<li>
												<strong>账号：</strong>${user.name}											
											</li>
												<div class="dotted-line"></div>
											<li>
												<strong>用户名：</strong>${user.username}								
											</li>
												<div class="dotted-line"></div>
											<li>
												<strong>单位：</strong>${user.organization.name}	
												<div class="dotted-line"></div>				
											</li>
											<li>
												<strong>Email：</strong>${user.email}	
												<div class="dotted-line"></div>				
											</li>
											<li>
												<strong>注册日期：</strong>${user.register_time}	
												<div class="dotted-line"></div>				
											</li>
											<li>
												<strong>上次登录时间：</strong>${user.last_login}	
												<div class="dotted-line"></div>				
											</li>
											<li>
												<strong>手机：</strong>${user.phone}	
												<div class="dotted-line"></div>				
											</li>
										</div>	
									</div>		
									<p></p>					
									<li>
										<strong>备注：</strong>${user.remarks}			
									</li>
									<li>
										<strong> </strong>
										<button class="btn btn-xs btn-social btn-success" onclick="change_face_image('${user.id}')">
											<i class="fa fa-edit"></i>修改头像
										</button>	
										<button class="btn btn-xs btn-social btn-warning" onclick="edit_user_layer('${user.id}','${user.authority}')">
											<i class="fa fa-edit"></i>修改个人资料
										</button>		
									</li>
								</div>
								<div class="callout callout-gray">	
									<li>
										<strong>权限详情：</strong>			
									</li>
									<div>
										<table  
											 class="table-color-animal"
									         data-toggle="table"
									         data-search="true"
									         data-show-toggle="true"
									         data-toolbar="#toolbar">
									      	<thead>
									          <tr>
									            <th data-sortable="true">模块域</th>
									            <th data-sortable="true">管理域</th>
									            <th data-sortable="true">拥有权限</th>
									          </tr>
									      	</thead>
									      	<tbody>
									      		<tr>	
													<td>动态公告模块</td>		
													<td>公告通知管理</td>
													<td>
														<c:if test="${fn:contains(user.authority_id.announcement, 'A')}">
															<div class="btn btn-xs btn-social btn-success" onclick="add_announcement_layer()">
											                	<i class="fa fa-plus"></i>添加
											            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.announcement, 'E')}">
															<a href="admin/announcement_list">
																<div class="btn btn-xs btn-social btn-warning" >
											                		<i class="fa fa-edit"></i>编辑
											            		</div>
											            	</a>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.announcement, 'D')}">
															<a href="admin/announcement_list">
																<div class="btn btn-xs btn-social btn-danger" >
										                			<i class="fa fa-bitbucket"></i>删除
										             			</div>
										             		</a>
										            	</c:if>
													</td>
												</tr>
												<tr>	
													<td>动态公告模块</td>		
													<td>特色实验管理</td>
													<td>
														<c:if test="${fn:contains(user.authority_id.experiment, 'A')}">
															<div class="btn btn-xs btn-social btn-success">
											                	<i class="fa fa-plus"></i>添加
											            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.experiment, 'E')}">
														<div class="btn btn-xs btn-social btn-warning" >
										                	<i class="fa fa-edit"></i>编辑
										            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.experiment, 'D')}">
														<div class="btn btn-xs btn-social btn-danger" >
										                	<i class="fa fa-bitbucket"></i>删除
										             	</div>
										            	</c:if>
													</td>
												</tr>
												<tr>	
													<td>动态公告模块</td>		
													<td>科研成果管理</td>
													<td>
														<c:if test="${fn:contains(user.authority_id.achievement, 'A')}">
															<div class="btn btn-xs btn-social btn-success">
											                	<i class="fa fa-plus"></i>添加
											            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.achievement, 'E')}">
														<div class="btn btn-xs btn-social btn-warning" >
										                	<i class="fa fa-edit"></i>编辑
										            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.achievement, 'D')}">
														<div class="btn btn-xs btn-social btn-danger" >
										                	<i class="fa fa-bitbucket"></i>删除
										             	</div>
										            	</c:if>
													</td>
												</tr>
												<tr>	
													<td>动态公告模块</td>		
													<td>法律法规管理</td>
													<td>
														<c:if test="${fn:contains(user.authority_id.law, 'A')}">
															<div class="btn btn-xs btn-social btn-success">
											                	<i class="fa fa-plus"></i>添加
											            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.law, 'E')}">
														<div class="btn btn-xs btn-social btn-warning" >
										                	<i class="fa fa-edit"></i>编辑
										            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.law, 'D')}">
														<div class="btn btn-xs btn-social btn-danger" >
										                	<i class="fa fa-bitbucket"></i>删除
										             	</div>
										            	</c:if>
													</td>
												</tr>
												<tr>	
													<td>平台资源模块</td>		
													<td>实验动物管理</td>
													<td>
														<c:if test="${fn:contains(user.authority_id.experimental_animal, 'A')}">
															<div class="btn btn-xs btn-social btn-success">
											                	<i class="fa fa-plus"></i>添加
											            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.experimental_animal, 'E')}">
														<div class="btn btn-xs btn-social btn-warning" >
										                	<i class="fa fa-edit"></i>编辑
										            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.experimental_animal, 'D')}">
														<div class="btn btn-xs btn-social btn-danger" >
										                	<i class="fa fa-bitbucket"></i>删除
										             	</div>
										            	</c:if>
													</td>
												</tr>
												<tr>	
													<td>平台资源模块</td>		
													<td>特色动物管理</td>
													<td>
														<c:if test="${fn:contains(user.authority_id.characteristic_animal, 'A')}">
															<div class="btn btn-xs btn-social btn-success">
											                	<i class="fa fa-plus"></i>添加
											            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.characteristic_animal, 'E')}">
														<div class="btn btn-xs btn-social btn-warning" >
										                	<i class="fa fa-edit"></i>编辑
										            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.characteristic_animal, 'D')}">
														<div class="btn btn-xs btn-social btn-danger" >
										                	<i class="fa fa-bitbucket"></i>删除
										             	</div>
										            	</c:if>
													</td>
												</tr>
												<tr>	
													<td>平台资源模块</td>		
													<td>物种管理</td>
													<td>
														<c:if test="${fn:contains(user.authority_id.species, 'A')}">
															<div class="btn btn-xs btn-social btn-success">
											                	<i class="fa fa-plus"></i>添加
											            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.species, 'E')}">
														<div class="btn btn-xs btn-social btn-warning" >
										                	<i class="fa fa-edit"></i>编辑
										            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.species, 'D')}">
														<div class="btn btn-xs btn-social btn-danger" >
										                	<i class="fa fa-bitbucket"></i>删除
										             	</div>
										            	</c:if>
													</td>
												</tr>
												<tr>	
													<td>平台资源模块</td>		
													<td>品系管理</td>
													<td>
														<c:if test="${fn:contains(user.authority_id.strain, 'A')}">
															<div class="btn btn-xs btn-social btn-success">
											                	<i class="fa fa-plus"></i>添加
											            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.strain, 'E')}">
														<div class="btn btn-xs btn-social btn-warning" >
										                	<i class="fa fa-edit"></i>编辑
										            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.strain, 'D')}">
														<div class="btn btn-xs btn-social btn-danger" >
										                	<i class="fa fa-bitbucket"></i>删除
										             	</div>
										            	</c:if>
													</td>
												</tr>
												<tr>	
													<td>平台资源模块</td>		
													<td>特色设备管理</td>
													<td>
														<c:if test="${fn:contains(user.authority_id.characteristic_equipment, 'A')}">
															<div class="btn btn-xs btn-social btn-success">
											                	<i class="fa fa-plus"></i>添加
											            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.characteristic_equipment, 'E')}">
														<div class="btn btn-xs btn-social btn-warning" >
										                	<i class="fa fa-edit"></i>编辑
										            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.characteristic_equipment, 'D')}">
														<div class="btn btn-xs btn-social btn-danger" >
										                	<i class="fa fa-bitbucket"></i>删除
										             	</div>
										            	</c:if>
													</td>
												</tr>
												<tr>	
													<td>平台资源模块</td>		
													<td>常规设备管理</td>
													<td>
														<c:if test="${fn:contains(user.authority_id.common_equipment, 'A')}">
															<div class="btn btn-xs btn-social btn-success">
											                	<i class="fa fa-plus"></i>添加
											            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.common_equipment, 'E')}">
														<div class="btn btn-xs btn-social btn-warning" >
										                	<i class="fa fa-edit"></i>编辑
										            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.common_equipment, 'D')}">
														<div class="btn btn-xs btn-social btn-danger" >
										                	<i class="fa fa-bitbucket"></i>删除
										             	</div>
										            	</c:if>
													</td>
												</tr>
												<tr>	
													<td>平台服务模块</td>		
													<td>技术服务管理</td>
													<td>
														<c:if test="${fn:contains(user.authority_id.technology, 'A')}">
															<div class="btn btn-xs btn-social btn-success">
											                	<i class="fa fa-plus"></i>添加
											            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.technology, 'E')}">
														<div class="btn btn-xs btn-social btn-warning" >
										                	<i class="fa fa-edit"></i>编辑
										            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.technology, 'D')}">
														<div class="btn btn-xs btn-social btn-danger" >
										                	<i class="fa fa-bitbucket"></i>删除
										             	</div>
										            	</c:if>
													</td>
												</tr>
												<tr>	
													<td>平台服务模块</td>		
													<td>教育培训管理</td>
													<td>
														<c:if test="${fn:contains(user.authority_id.training, 'A')}">
															<div class="btn btn-xs btn-social btn-success">
											                	<i class="fa fa-plus"></i>添加
											            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.training, 'E')}">
														<div class="btn btn-xs btn-social btn-warning" >
										                	<i class="fa fa-edit"></i>编辑
										            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.training, 'D')}">
														<div class="btn btn-xs btn-social btn-danger" >
										                	<i class="fa fa-bitbucket"></i>删除
										             	</div>
										            	</c:if>
													</td>
												</tr>
												<tr>	
													<td>其他模块</td>		
													<td>用户管理</td>
													<td>
														<c:if test="${fn:contains(user.authority_id.user_admin, 'A')}">
															<div class="btn btn-xs btn-social btn-success">
											                	<i class="fa fa-plus"></i>添加
											            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.user_admin, 'E')}">
														<div class="btn btn-xs btn-social btn-warning" >
										                	<i class="fa fa-edit"></i>编辑
										            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.user_admin, 'D')}">
														<div class="btn btn-xs btn-social btn-danger" >
										                	<i class="fa fa-bitbucket"></i>删除
										             	</div>
										            	</c:if>
													</td>
												</tr>
												<tr>	
													<td>其他模块</td>		
													<td>权限管理</td>
													<td>
														<c:if test="${fn:contains(user.authority_id.authority_admin, 'A')}">
															<div class="btn btn-xs btn-social btn-success">
											                	<i class="fa fa-plus"></i>添加
											            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.authority_admin, 'E')}">
														<div class="btn btn-xs btn-social btn-warning" >
										                	<i class="fa fa-edit"></i>编辑
										            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.authority_admin, 'D')}">
														<div class="btn btn-xs btn-social btn-danger" >
										                	<i class="fa fa-bitbucket"></i>删除
										             	</div>
										            	</c:if>
													</td>
												</tr>
												<tr>	
													<td>其他模块</td>		
													<td>文件管理</td>
													<td>
														<c:if test="${fn:contains(user.authority_id.file_admin, 'A')}">
															<div class="btn btn-xs btn-social btn-success">
											                	<i class="fa fa-plus"></i>添加
											            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.file_admin, 'E')}">
														<div class="btn btn-xs btn-social btn-warning" >
										                	<i class="fa fa-edit"></i>编辑
										            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.file_admin, 'D')}">
														<div class="btn btn-xs btn-social btn-danger" >
										                	<i class="fa fa-bitbucket"></i>删除
										             	</div>
										            	</c:if>
													</td>
												</tr>
												<tr>	
													<td>其他模块</td>		
													<td>通知管理</td>
													<td>
														<c:if test="${fn:contains(user.authority_id.message, 'A')}">
															<div class="btn btn-xs btn-social btn-success">
											                	<i class="fa fa-plus"></i>添加
											            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.message, 'E')}">
														<div class="btn btn-xs btn-social btn-warning" >
										                	<i class="fa fa-edit"></i>编辑
										            	</div>
										            	</c:if>
										            	<c:if test="${fn:contains(user.authority_id.message, 'D')}">
														<div class="btn btn-xs btn-social btn-danger" >
										                	<i class="fa fa-bitbucket"></i>删除
										             	</div>
										            	</c:if>
													</td>
												</tr>
									      	</tbody>
								      	</table>
						             </div>		
								</div>
							</div>      					
						</div>
					</div>
	          	</div>
	          </div>
		  </div>		
    </section>    
  </div>
  <!-- /.content-wrapper -->


  <!-- Main Footer -->
	<jsp:include page="../shell_frame/shell_frame_footer_backstage.jsp"/>


</div>
<!-- ./wrapper -->
<!-- Responsive tables -->
<script type="text/javascript" src="resources/plugins/bootstrap-table-master/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="resources/plugins/bootstrap-table-master/js/bootstrap-table-zh-CN.js"></script>
<!-- Layer -->
<script type="text/javascript" src="resources/plugins/layer/layer.js"></script>
<script type="text/javascript" src="resources/js/layer_db.js"></script>	
<script type="text/javascript" src="resources/js/ajax_db.js"></script>	
</body>
</html>