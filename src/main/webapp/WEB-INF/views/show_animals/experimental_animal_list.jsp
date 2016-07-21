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
  <base href="<%=basePath%>">
  <title>中国科学院 | 模式与特色动物实验平台</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap-table -->
  <link rel="stylesheet" href="resources/plugins/bootstrap-table-master/css/bootstrap-table.min.css">
  <!-- 我的CSS -->
  <link rel="stylesheet" href="resources/css/wts_animal_style.css">
  
  <%
		List<String> group_s=new ArrayList<String>();
		List ps=(List)request.getAttribute("experimental_animal_strain");
		List pn=(List)request.getAttribute("count_experimental_animal");
		for(int i=0;i<ps.size();i++){
			group_s.add("'"+ps.get(i)+"'");
		}
	%>
	
	<!-- jQuery 2.1.4 -->
	<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- 我的Charts -->
	<script type="text/javascript" src="resources/js/chart-animals.js"></script>	
	
	<script type="text/javascript" >									
	$(document).ready(function () { 
			showChart(<%=pn%>, <%=group_s%>)
		});
	</script>
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
	              <h3 class="box-title">实验动物</h3>	              	            
		            <div class="box-tools pull-right">
		               <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		            </div>
	            </div>
	            <div class="box-body" >	
				  <div class="col-md-3">
					<img width="100%" src="resources/img/experimental_animal.jpg" alt="">	
					<p></p>							
					<p>【实验动物】标准的实验动物或模式动物，由稳定的品系培养而来。</p>
					<p>【特点】适合做室内实验，多应用于生物个体相关的功能、代谢、结构等研究，探索疾病的发病机制，寻找预防及治疗方法等。</p>				
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
				  <div>

					  <table
							  id="results_table"
							  class="table-color-animal"
							  data-classes="table table-hover table-condensed"
							  data-toggle="table"
							  data-url="/experimental_animal_table"
							  data-pagination="true"
							  data-side-pagination="server"
							  data-page-list="[10, 20, 30, 50, 100]"
							  data-search="true"
							  data-show-columns="true"
							  data-show-toggle="true"
							  data-toolbar="#toolbar">
						  <thead>
						  <tr>
							  <th data-field="name" data-align="left" data-sortable="true">名称</th>
							  <th data-field="species" data-align="left" data-sortable="true">物种</th>
							  <th data-field="strain" data-align="left" data-sortable="true">品系</th>
							  <th data-field="gene" data-align="left" data-sortable="true">基因</th>
							  <th data-field="time" data-align="left" data-sortable="true">发布时间</th>
						  </thead>
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