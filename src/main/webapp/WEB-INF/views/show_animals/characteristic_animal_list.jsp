﻿<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <base href="<%=basePath%>">
  <title>中国科学院 | 模式与特色动物实验平台</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap-table -->
  <link rel="stylesheet" href="resources/plugins/bootstrap-table-master/css/bootstrap-table.min.css">
  <!-- 我的CSS -->
  <link rel="stylesheet" href="resources/css/wts_animal_style.css">

	<!-- jQuery 2.1.4 -->
	<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	
	
</head>
<body>
<div class="wrapper">

  <!-- Main Header -->
	<jsp:include page="../shell_frame/shell_frame_head.jsp"/>
  <!-- Main Sidebar -->
	<jsp:include page="../shell_frame/shell_frame_sidebar-2-1.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
    	<div class="row">    	
	      <div class="col-md-12">
	          <div class="box box-info frame-mini">
	            <div class="box-header with-border">
	              <h3 class="box-title">特色动物</h3>	              	            
		            <div class="box-tools pull-right">
		               <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		            </div>
	            </div>
	            <div class="box-body" >	
				  <div class="col-md-3">
					<img width="100%" src="resources/img/characteristic_animal.jpg" alt="">	
					<p></p>							
					<p>【特色动物】无固定品系，为特定品种在原生环境和野外饲养。</p>
					<p>【特点】野外养殖，生存能力强，适合做特定的动物生态学实验。</p>				
	              </div>	             
				  <div class="col-md-9 callout callout-gray" id="chart1" style="height:400px;">							
					<p>统计数据加载中...</p>			
	              </div>
	            </div>
	          </div>
	      </div>
		</div>		
    </section>
    
    <section class="content">
    	<div class="row">    	
	      <div class="col-md-12">
	          <div class="box box-info frame-mini">
	            <div class="box-header with-border">
	              <h3 class="box-title">动物列表</h3>
	            </div>
	            <div class="box-body">
				  <div class="callout callout-gray">
	                <h4 class="herf_font_animal">                	
	                </h4>
	                <p>这里是检索条件</p>
	              </div>
	              
				  <div>
					<table  
						 class="table-color-animal"
				         data-toggle="table"
				         data-pagination="true"
				         data-search="true"
				         data-show-refresh="true"
				         data-sort-order="desc"
				         data-show-toggle="true"
				         data-show-columns="true"
				         data-click-to-select="true"
				         data-toolbar="#toolbar">
				      	<thead>
				          <tr>
				            <th data-field="state" data-checkbox="true"></th>
				            <th data-sortable="true">名称</th>
				            <th data-sortable="true">物种名</th>
				            <th data-sortable="true">拉丁名</th>
				            <th data-sortable="true">发布时间</th>
				          </tr>
				      	</thead>
				      	<tbody>
				      	<c:forEach items="${listCharacteristic_animals}" var="characteristic_animal">									
							<tr>
								<td></td>
								<td>
						        <div class="herf_font_animal_name">
									<a href="show/characteristic_animal/detail/${characteristic_animal.id}" target="_blank">												
										${characteristic_animal.name}												
									</a>
								</div>
								</td>		
								<td>${characteristic_animal.species_id.name}</td>	
								<td>${characteristic_animal.species_id.species_en}</td>	
								<td>${characteristic_animal.time}</td>
							</tr>
						</c:forEach>
				      	</tbody>
			      	</table>
	              </div>
	              
	              
	            </div>
	          </div>
	      </div>
		</div>		
    </section>
    <!-- Main content -->
    <section class="content">

      <!-- Your Page Content Here -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


  <!-- Main Footer -->
	<jsp:include page="../shell_frame/shell_frame_footer.jsp"/>


  
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- Responsive tables -->
<script type="text/javascript" src="resources/plugins/bootstrap-table-master/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="resources/plugins/bootstrap-table-master/js/bootstrap-table-zh-CN.js"></script>
<!-- Echarts -->
<script type="text/javascript" src="resources/js/echarts-all.js"></script>
</body>
</html>