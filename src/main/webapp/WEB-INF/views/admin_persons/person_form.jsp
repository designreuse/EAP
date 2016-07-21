<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<div class="form-group">
	<label class="col-sm-2 control-label">联系人名称：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入联系人名称" path="name" />
		</div>
	<label class="col-sm-2 control-label">归属单位：</label>
		<div class="col-sm-10">
			<form:select path="organization.id" class="form-control select2" style="width: 100%;" >
	            	<c:if test="${!empty common_equipment.organization.id}">
							<option selected="selected" value="${common_equipment.organization.id}">${common_equipment.organization.name}</option>				
						<c:forEach items="${listOrganizations}" var="organization">
							<c:if test="${organization.id ne common_equipment.organization.id}">
								<option value="${organization.id}">${organization.name}</option>
							</c:if>
						</c:forEach>	
					</c:if>
	            	<c:if test="${empty common_equipment.organization.id}">
							<option selected="selected" value="${user.organization.id}">${user.organization.name}</option>				
						<c:forEach items="${listOrganizations}" var="organization">
							<c:if test="${organization.id ne user.organization.id}">
								<option value="${organization.id}">${organization.name}</option>
							</c:if>
						</c:forEach>
					</c:if>
	  		</form:select>
  		</div>
	<label class="col-sm-2 control-label">研究方向：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入研究方向" path="major" />
		</div>
	<label class="col-sm-2 control-label">联系电话：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入联系电话" path="telephone" />
		</div>
	<label class="col-sm-2 control-label">联系邮箱：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入联系邮箱" path="email" />
		</div>
	<label class="col-sm-2 control-label">备注：</label>
		<div class="col-sm-10">
			<form:textarea class="form-control" path="note" style="resize:none; width:100%; height:300px;" />			
			<script type="text/javascript">CKEDITOR.replace('note');</script>
		</div>
<!-- 不可改动，隐藏 -->
	 	<div style="display:none">
	 		<form:input path="id" readonly="true" />
		</div>
</div>