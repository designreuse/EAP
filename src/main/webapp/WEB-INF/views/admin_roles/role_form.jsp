<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<div class="form-group">
	<label class="col-sm-2 control-label">角色名称：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入角色名称" path="name" />
		</div>
	<label class="col-sm-2 control-label">角色标识：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入角色标识" path="remark" />
		</div>
<!-- 不可改动，隐藏 -->
	 	<div style="display:none">
	 		<form:input path="id" readonly="true" />
		</div>
</div>