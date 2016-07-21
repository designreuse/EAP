<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
<div class="form-group">
	<label class="col-sm-2 control-label">权限名称：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入权限名称" path="name" />
		</div>
	<label class="col-sm-2 control-label">权限标识：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入权限标识" path="remark" />
		</div>	
	
	<label class="col-sm-2 control-label">上级权限：</label>
	<div class="col-sm-10">
		<form:select id="pid_select" path="pid" class="form-control select2"  style="width: 100%;" >		
			<option value="0">无上级</option>
		    <c:if test="${power.pid == 0}">	
		    	<script>
				   	$(document).ready(function(){
				   		getPower_add('pid_select');
					});
		    	</script>
		    </c:if>
		    <c:if test="${power.pid > 0}">	
		    	<option value="${power.pid}" selected="selected">${power.pid}</option>
		    	<script>
				   	$(document).ready(function(){
				   		getPower_add('pid_select');
					});
		    	</script>
		    </c:if>
  		</form:select>
 	</div>
    
	<label class="col-sm-2 control-label">限制URL：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入限制URL" path="url" />
		</div>
	<label class="col-sm-2 control-label">权限备注：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入权限备注" path="note" />
		</div>
<!-- 不可改动，隐藏 -->
	 	<div style="display:none">
	 		<form:input path="id" readonly="true" />
		</div>
</div>