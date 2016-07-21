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
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"> 
</head>
<body>
<div class="wrapper">

  <!-- Main Header -->
	<jsp:include page="shell_frame/shell_frame_head.jsp"/>
  <!-- Main Sidebar -->
	<jsp:include page="shell_frame/shell_frame_sidebar.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="threedframe">
		<div class="display_image">
			<iframe src="display_image" frameBorder="0" width="100%" scrolling="no" height="360"></iframe>
		</div>	
    </section>
    <section class="content">
    	<div class="row">
	      <div class="col-md-4">
	          <div class="box box-info frame-mini">
	            <div class="box-header with-border">
	              <h3 class="box-title">动物资源</h3>
	              <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body">
		          <div class="small-box bg-gray">
		            <div class="inner">
		              <h3>${countExperimental_animals}<sup style="font-size: 20px">种</sup></h3>
		              <p><b class="title_name"> 实验动物</b>资源信息库,包含了各种品系下属的各类实验动物信息数据及其主要生物学特性数据。</p>
		            </div>
		            <div class="icon_img">
		              <i class="fa fa-paw"></i>
		            </div>
		            <a href="experimental_animal_list" class="small-box-footer-cas">
		             	 查看全部 <i class="fa fa-arrow-circle-right"></i>
		            </a>
		          </div> 
		          <div class="small-box bg-gray">
		            <div class="inner">
		              <h3>${countCharacteristic_animals}<sup style="font-size: 20px">种</sup></h3>
		              <p><b class="title_name"> 特色动物</b>资源信息库,包含了各类试验用动物的信息数据及其主要生态学数据。</p>
		            </div>
		            <div class="icon_img">
		              <i class="fa fa-paw"></i>
		            </div>
		            <a href="characteristic_animal_list" class="small-box-footer-cas">
		             	 查看全部 <i class="fa fa-arrow-circle-right"></i>
		            </a>
		          </div>
	            </div>
	          </div>
	          <div class="box box-info  frame-mini">
	            <div class="box-header with-border">
	              <h3 class="box-title">设备资源</h3>
	              <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body">	            
	            <div class="small-box bg-gray">
		            <div class="inner">
		              <h3>${countCharacteristic_equipments}<sup style="font-size: 20px">种</sup></h3>
		              <p><b class="title_name"> 特色设备</b>资源信息库,包含了平台成员所储存或自制的贵重实验设备和特殊设备。</p>
		            </div>
		            <div class="icon_img">
		              <i class="fa fa-flask"></i>
		            </div>
		            <a href="characteristic_equipment_list" class="small-box-footer-cas">
		             	 查看全部 <i class="fa fa-arrow-circle-right"></i>
		            </a>
		          </div> 
		          <div class="small-box bg-gray">
		            <div class="inner">
		              <h3>${countCommon_equipments}<sup style="font-size: 20px">种</sup></h3>
		              <p><b class="title_name"> 常规设备</b>资源信息库,包含了动物实验所需的常规设备资料和参数。</p>
		            </div>
		            <div class="icon_img">
		              <i class="fa fa-flask"></i>
		            </div>
		            <a href="common_equipment_list" class="small-box-footer-cas">
		             	 查看全部 <i class="fa fa-arrow-circle-right"></i>
		            </a>
		          </div>
	            </div>
	          </div>
	       </div>       
	       <div class="col-md-4">	          
	          <div class="box box-info  frame-mini">
	            <div class="box-header with-border">
	              <h3 class="box-title">平台服务</h3>
	              <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body">
		            	<div class="small-box bg-gray">
				            <div class="inner">
				              <h3>${countCharacteristic_equipments}<sup style="font-size: 20px">种</sup></h3>
		              			<p><b class="title_name"> 技术服务</b></p>
		              			<p>包含了平台成员所提供的各类技术服务。</p>
								<table class="table table-hover table-color-cas">									
				                	<tbody>
				                	<c:if test="${!empty showTechnologys}">
										<c:forEach items="${showTechnologys}" var="technologys">
											<tr>
								              <td>
								                <li class="herf_font_announcement">
													<a href="show/technology/detail/${technologys.id}" target="_blank">
														<c:if test="${fn:length(technologys.title) < 15}">
															${technologys.title}												
														</c:if>	
														<c:if test="${fn:length(technologys.title) >= 15}">
															${fn:substring(technologys.title, 0, 15)}...
														</c:if>	
													</a>
												</li>
								              </td>
								               <td>
								               <li>${fn:substring(technologys.time, 0, fn:length(technologys.time)-11)}</li>
								               </td>
								             </tr>
										</c:forEach>
									</c:if>							
					           </tbody>
				         	</table>		         
							</div>
				            <div class="icon_img">
				              <i class="fa fa-thumbs-up"></i>
				            </div>
				            <a href="technology_list" class="small-box-footer-cas">
				             	 查看全部 <i class="fa fa-arrow-circle-right"></i>
				            </a>
				    </div>          
		            <div class="small-box bg-gray">
				            <div class="inner">
				              <h3>${countCharacteristic_equipments}<sup style="font-size: 20px">种</sup></h3>
		              			<p><b class="title_name"> 教育培训</b></p>
		              			<p>包含了平台成员组织的各类相关教育培训信息。</p>
								<table class="table table-hover table-color-cas">
					                <tbody>
					                	<c:if test="${!empty paginationTrainings}">
											<c:forEach items="${paginationTrainings}" var="training">
												<tr>
									              <td>
									                <li class="herf_font_announcement">
														<a href="show/training/detail/${training.id}" target="_blank">
															<c:if test="${fn:length(training.title) < 15}">
																${training.title}												
															</c:if>	
															<c:if test="${fn:length(training.title) >= 15}">
																${fn:substring(training.title, 0, 15)}...
															</c:if>	
														</a>
													</li>
									              </td>
									               <td>
									                 <li>${fn:substring(training.time, 0, fn:length(training.time)-11)}</li>
									               </td>
									             </tr>
											</c:forEach>
										</c:if>							
						           </tbody>
					              </table>		  
				         	</table>		         
							</div>
				            <div class="icon_img">
				              <i class="fa fa-mortar-board"></i>
				            </div>
				            <a href="training_list" class="small-box-footer-cas">
				             	 查看全部 <i class="fa fa-arrow-circle-right"></i>
				            </a>
				     	</div>  
	            </div>
	          </div>
	       </div>       
	       <div class="col-md-4">	          
	          <div class="box box-info  frame-mini">
	            <div class="box-header with-border">
	              <h3 class="box-title">系统公告</h3>
	              <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body">
		            <div class="small-box bg-gray">
				            <div class="inner">
		              			<p><b class="title_name"> 系统公告</b></p>
									<table class="table table-hover table-color-cas">
						                <tbody>
						                	<c:if test="${!empty paginationAnnouncements}">
												<c:forEach items="${paginationAnnouncements}" var="announcement">
													<c:if test="${announcement.classification eq '平台公告'}">
														<tr>
										                  <td>
										                    <li class="herf_font_announcement">
																<a href="show/announcement/detail/${announcement.id}" target="_blank">
																	<c:if test="${fn:length(announcement.title) < 15}">
																		${announcement.title}												
																	</c:if>	
																	<c:if test="${fn:length(announcement.title) >= 15}">
																		${fn:substring(announcement.title, 0, 15)}...
																	</c:if>	
																</a>
															</li>
										                  </td>
										                  <td>
										                    <li>${fn:substring(announcement.time, 0, fn:length(announcement.time)-11)}</li>
										                  </td>
										                </tr>	
													</c:if>
												</c:forEach>
											</c:if>							
							           </tbody>
					              </table>		  
				         	</table>		         
							</div>
				            <div class="icon_img">
				              <i class="fa fa-calendar-o"></i>
				            </div>
				            <a href="announcement_list" class="small-box-footer-cas">
				             	 查看全部 <i class="fa fa-arrow-circle-right"></i>
				            </a>
				     	</div>  
	            </div>
	          </div>
	       </div>
		</div>
		
    </section>
    <!-- Main content -->
    <section class="content">


    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


  <!-- Main Footer -->
	<jsp:include page="shell_frame/shell_frame_footer.jsp"/>


  
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


</body>
</html>