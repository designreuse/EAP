<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<jsp:include page="../shell_frame/shell_frame_head_backstage.jsp"/>
  <!-- Main Sidebar -->
	<jsp:include page="../shell_frame/shell_frame_sidebar_backstage.jsp"/>

<!-- 加载Z-tree -->
	<link rel="stylesheet" href="resources/plugins/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="resources/plugins/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="resources/plugins/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
	

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->    
    
    <section class="content-header">
    	<div class="row">
    	<div class="col-md-3">    
	          <!-- TABLE: 角色管理  -->
	          <div class="box box-info">
	            <div class="box-header with-border">
	              <h3 class="box-title"><span class="fa fa-edit">权限结构</span></h3>
	            </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	            <div class="">                         
		              <div id="treeDemo" class="ztree"></div>
	            </div>
	           
	              <!-- /.table-responsive -->
	            </div>
	            <!-- /.box-body -->
	          </div>
          </div>
    	
    	    	
	      <div class="col-md-9">
	          <div class="box box-info frame-mini">
	            <div class="box-header with-border">
	              <h3 class="box-title">权限列表</h3>
	            </div>
	            <div class="box-body">
				  <div class="callout callout-gray">
	              	<c:if test="${user.authority eq 'SUPER'}">
						<div class="btn btn-social btn-success" onclick="add_power_layer()">
							<i class="fa fa-plus"></i>添加权限
						</div>					
						<div class="btn btn-social btn-warning" onclick="edit_power_select()" >
							<i class="fa fa-edit"></i>编辑权限
						</div>
						<div class="btn btn-social btn-danger" onclick="remove_power_select()" >
							<i class="fa fa-bitbucket"></i>删除权限
						</div>				
					</c:if>	
					<c:if test="${user.authority ne 'SUPER'}">
						<div class="btn bg-navy" >
							无操作权限
						</div>				
					</c:if>	
				</div>
	            <div>
					<table  
						 class="table-color-animal"
				         data-toggle="table"
				         data-pagination="true"
				         data-search="true"
				         data-sort-order="desc"
				         data-show-toggle="true"
				         data-show-columns="true"
				         data-click-to-select="true"
				         data-toolbar="#toolbar">
				      	<thead>
				          <tr>
							<c:if test="${user.authority eq 'SUPER'}">
				            	<th><i class="fa fa-edit"></i></th>
				            </c:if>
				            <th data-sortable="true">权限名称</th>
				            <th data-sortable="true">权限标识</th>
				            <th data-sortable="true">上级权限</th>
				            <th data-sortable="true">权限等级</th>
				            <th data-sortable="true">限制URL</th>
				            <th data-sortable="true">备注</th>
				            <th data-sortable="true">操作</th>
				          </tr>
				      	</thead>
				      	<tbody>
				      	<c:forEach items="${listPowers}" var="power">									
							<tr>
								<c:if test="${user.authority eq 'SUPER'}">
									<td><input type="checkbox" name="checkbox" id="sel_${power.id}" /></td>
								</c:if>
								<td>${power.name}</td>
								<td>${power.remark}</td>
								<td>${power.pid}</td>
								<td>${power.level}</td>
								<td>${power.url}</td>
								<td>${power.note}</td>
								<td>					
								<c:if test="${user.authority eq 'SUPER'}">
									<div class="btn btn-xs btn-social btn-warning" onclick="edit_power_layer('${power.id}')" >
										<i class="fa fa-edit"></i>编辑
									</div>
									<div class="btn btn-xs btn-social btn-danger" onclick="remove_power_layer('${power.id}')">
										<i class="fa fa-bitbucket"></i>删除
									</div>							
								</c:if>	
								</td>
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
	<jsp:include page="../shell_frame/shell_frame_footer_backstage.jsp"/>


  
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
<!-- Layer -->
<script type="text/javascript" src="resources/plugins/layer/layer.js"></script>
<script type="text/javascript" src="resources/js/layer_db.js"></script>	

<script type="text/javascript">	
        $.ajax({
            url: 'admin/getPower',
            data: {},
            type: 'get',
            cache: false,
            dataType:"json",
            success: function (data) {
            	var resclist=new Array();
				for (var i=0;i<data.length;i++)
				{
					resc=new Object();
					resc.id=data[i][0];
					resc.pId=data[i][1];
					resc.name=data[i][2];
					resc.open=data[i].open;
					resclist[i]=resc;
				}    
				var zNodes = new Array();
				zNodes = resclist;

				var setting = {
						data: {
							simpleData: {
								enable: true
							}
						}
					};
				var code;
				$(document).ready(function(){
					$.fn.zTree.init($("#treeDemo"), setting, zNodes);
				});
            },
            error: function () {
				alert("获取权限结构列表失败");
            }
        });		

		
		
			

    	</script>


<script>
//选择编辑
function edit_power_select(){
	var number=0;
	var check_id="";
	$("input:checkbox[id^='sel']:checked").each(function(i){
		number=number+1;
		check_id=$(this).attr('id');
		check_id=check_id.substring(4);
      });
	if(number==0){
		alert("请选择数据");
	}
	else if(number>1){
		alert("您选择了"+number+"条数据，只能选择1条数据进行编辑");
	}
	else{
		edit_power_layer(check_id);
	}
}
//批量删除
function remove_power_select(){
	var number=0;
	var id_array=new Array();
	var check_id="";
	$("input:checkbox[id^='sel']:checked").each(function(i){
		number=number+1;		
      });
	
	if(number==0)
		{alert("请选择数据");}
	else {
		var msg = "您确定要删除这"+number+"条记录吗？"; 
		if (confirm(msg)==true){ 
			$("input:checkbox[id^='sel']:checked").each(function(i){	
				check_id=$(this).attr('id');
				check_id=check_id.substring(4);		
				 $.ajax({
			            url: 'admin/remove/power/'+check_id,
			            cache: false,
			            success: function () {			        		
			        		location.reload();	
			            	layer.msg('已批量删除'+number+'数据');
			            },
			            error: function () {
			            }
			        });
				
		      });
			
		}else{ 
			layer.msg('已取消操作');
		return false; 
		} 
	}
}
</script>	
</body>
</html>