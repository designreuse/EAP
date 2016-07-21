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
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">  
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
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/plugins/AdminLTE/css/AdminLTE.css">  
  <!-- 我自己的CSS -->
  <link rel="stylesheet" href="resources/css/wts_home_style.css">
  <link rel="stylesheet" href="resources/plugins/AdminLTE/css/skins/skin-cas.css">
  <style type="text/css">
  .ml10 {
    margin-left: 10px;
	}
  </style>
</head>
<body>
<div class="wrapper">
	
	<!-- jQuery 2.1.4 -->
	<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script src="resources/plugins/bootstrap-3.3.5/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="resources/plugins/AdminLTE/js/app.js"></script>
	<!-- 加载Z-tree -->
	<link rel="stylesheet" href="resources/plugins/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="resources/plugins/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="resources/plugins/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
	<SCRIPT type="text/javascript">
		var setting = {
			view: {
				selectedMulti: false
			},
			async: {
				enable: true,
				url:"admin/role/getRole_power/${role.id}",
				type: "get",
				dataFilter: filter
			},
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onAsyncError: onAsyncError,
				onAsyncSuccess: onAsyncSuccess
			}
		};

		function filter(treeId, parentNode, childNodes) {
			if (!childNodes) return null;
			for (var i=0, l=childNodes.length; i<l; i++) {
				childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
			}
			return childNodes;
		}
		function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
			alert("加载错误");
		}
		function onAsyncSuccess(event, treeId, treeNode, msg) {
			//alert("加载成功");
		}
		
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting);
		});
		
		  function count_c(){
	            var treeObj=$.fn.zTree.getZTreeObj("treeDemo"),
	            nodes=treeObj.getCheckedNodes(true),
	            v="";
	            for(var i=0;i<nodes.length;i++){
	            v+="【"+nodes[i].id + "|"+nodes[i].name + "】";
	            }
	            alert("你当前选取了"+v+"这些权限");
			}
		  function updata_resc(){
				 $.ajax({
			            url: 'admin/power/remove/tree/${role.id}',
			            data: {},
			            cache: false,
			            success: function () {
			            	var treeObj=$.fn.zTree.getZTreeObj("treeDemo"),
				            nodes=treeObj.getCheckedNodes(true);
				            for(var i=0;i<nodes.length;i++){
								 $.ajax({
							            url: 'admin/power/update/tree/${role.id}',
							            data: "u_resc_id="+nodes[i].id,
							            cache: false,
							            success: function () {
							            },
							            error: function () {
							            }
							        });
				            }
				            alert("修改完毕");
				            window.location.href="admin/edit_success"; 
			            },
			            error: function () {
				            alert("更新失败");
			            }
			        });
			}
	</SCRIPT>
	
   
              <div class="">   
              		<input readonly type="text" id="u_role_id" name="role.id"  value="${role.id}" style="display:none" />
              </div>
	           
              <div class="">                         
	              <div id="treeDemo" class="ztree"></div>
	              <a id="updata_resc" class="btn btn-xs btn-warning pull-right" onclick="updata_resc()" >更新</a>
              </div>
</html>