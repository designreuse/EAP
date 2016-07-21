<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    %>
<html xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <base href="<%=basePath%>">
  <title>中国科学院 | 模式与特色动物实验平台</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="resources/plugins/bootstrap-3.3.5/css/bootstrap.css">
  <!-- Font Awesome -->  
  <link rel="stylesheet" href="http://apps.bdimg.com/libs/fontawesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap-glyphicons/1.0/css/bootstrap-glyphicons.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="resources/plugins/select2/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/plugins/AdminLTE/css/AdminLTE.css">  
  <!-- 我自己的CSS -->
  <link rel="stylesheet" href="resources/css/wts_home_style.css">
  <link rel="stylesheet" href="resources/plugins/AdminLTE/css/skins/skin-cas.css">
</head>
<body>
	<div class="content">  								
		<div class="col-md-12">
			<div class="callout callout-gray">
				<c:if test="${!empty strain.name}">
					<li>
						<strong>品系名：</strong>${strain.name}		
					</li>
				</c:if>	
				<c:if test="${!empty strain.cultivation_year}">
					<li>
						<strong>培育年份：</strong>${strain.cultivation_year}		
					</li>
				</c:if>		
				<c:if test="${!empty strain.introduce_year}">
					<li>
						<strong>引入时间：</strong>${strain.introduce_year}											
					</li>
				</c:if>		
				<c:if test="${!empty strain.cultivationer}">
					<li>
						<strong>培育机构或人：</strong>${strain.cultivationer}											
					</li>
				</c:if>	
				<c:if test="${!empty strain.hereditary_feature}">
					<li>
						<strong>遗传特征：</strong>${strain.hereditary_feature}											
					</li>
				</c:if>	
				<c:if test="${!empty strain.microbiological_grade}">
					<li>
						<strong>微生物学等级：</strong>${strain.microbiological_grade}											
					</li>
				</c:if>
				<c:if test="${!empty strain.germplasm_resources}">
					<li>
						<strong>种质来源：</strong>${strain.germplasm_resources}											
					</li>
				</c:if>								
		   </div>
       </div>		    
	   <div class="col-md-12">	          
          <div class="box box-info  frame-mini">
            <div class="box-header with-border">
              <h3 class="box-title">${strain.name}的详细数据</h3>
            </div>
            <div class="box-body">
	            <div class="box-body table-responsive no-padding">
					<div class="col-md-12">
		          <!-- Custom Tabs -->
		          <div class="nav-tabs-custom">
		            <ul class="nav nav-tabs">
		              <li class="active"><a href="#tab_1" data-toggle="tab">遗传数据</a></li>
		              <li><a href="#tab_2" data-toggle="tab">生理数据</a></li>
		              <li><a href="#tab_3" data-toggle="tab">生化数据</a></li>
		              <li><a href="#tab_4" data-toggle="tab">解剖数据</a></li>
		            </ul>
		            <div class="tab-content">
		              <div class="tab-pane active" id="tab_1">
			                <%@ include file="genetic_data_details_form.jsp"%> 
		              </div>
		              <div class="tab-pane" id="tab_2">
			                <%@ include file="physiological_data_details_form.jsp"%> 
		              </div>
		              <div class="tab-pane" id="tab_3">
		               		 <%@ include file="biochemical_data_details_form.jsp"%>
		              </div>
		              <div class="tab-pane" id="tab_4">
		               		 <%@ include file="autopsy_data_details_form.jsp"%>
		              </div>
		            </div>
		          </div>
		        </div>
	            </div>
	            </div>
          </div>
       </div>		
	</div>   

<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="resources/plugins/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="resources/plugins/AdminLTE/js/app.js"></script>
<!-- Responsive tables -->
<script type="text/javascript" src="resources/plugins/Responsive-tables/js/rwd-table.js"></script>
<!-- bootstrap-formhelpers -->
<script src="resources/plugins/bootstrap-formhelper-2.3.0/js/bootstrap-formhelpers.js"></script>
<!-- Select2 -->
<script src="resources/plugins/select2/select2.full.min.js"></script>
<!-- Layer -->
<script type="text/javascript" src="resources/plugins/layer/layer.js"></script>
<script type="text/javascript" src="resources/js/layer_db.js"></script>	
	<!-- Page script -->
<script>
$(function () {
  $(".select2").select2();
	});
</script>
</body>
</html>