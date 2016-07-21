<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<div class="form-group">
	<label class="col-sm-2 control-label">物种名称：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入物种名称（业界内常用称呼，不必拉丁学名）" path="name" />
		</div>
	<label class="col-sm-2 control-label">门：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入该物种所属的门（中文）" path="phylum_ch" />
			<form:input class="form-control" placeholder="请输入该物种所属的门（拉丁）" path="phylum_en" />
		</div>
	<label class="col-sm-2 control-label">纲：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入该物种所属的纲（中文）" path="class_ch" />
			<form:input class="form-control" placeholder="请输入该物种所属的纲（拉丁）" path="class_en" />
		</div>
	<label class="col-sm-2 control-label">目：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入该物种所属的目（中文）" path="order_ch" />
			<form:input class="form-control" placeholder="请输入该物种所属的目（拉丁）" path="order_en" />
		</div>
	<label class="col-sm-2 control-label">科：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入该物种所属的科（中文）" path="family_ch" />
			<form:input class="form-control" placeholder="请输入该物种所属的科（拉丁）" path="family_en" />
		</div>
	<label class="col-sm-2 control-label">属：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入该物种所属的科（中文）" path="genus_ch" />
			<form:input class="form-control" placeholder="请输入该物种所属的科（拉丁）" path="genus_en" />
		</div>
	<label class="col-sm-2 control-label">种：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入该物种所属的种（中文）" path="species_ch" />
			<form:input class="form-control" placeholder="请输入该物种所属的种（拉丁）" path="species_en" />
		</div>
	
	<c:if test="${user.authority eq 'SUPER'}">
		<label class="col-sm-2 control-label">归属单位：</label>
		<div class="col-sm-10">
			<form:select path="organization.id" class="form-control select2" style="width: 100%;" >
	            	<c:if test="${!empty user.organization.name}">
						<option selected="selected" value="${user.organization.id}">${user.organization.name}</option>
					</c:if>					
						<c:forEach items="${listOrganizations}" var="organization">
							<c:if test="${organization.id ne user.organization.id}">
								<option value="${organization.id}">${organization.name}</option>
							</c:if>
						</c:forEach>	
	  		</form:select>
  		</div>
	</c:if>
	<c:if test="${user.authority eq 'ADMIN'}">
		<label class="col-sm-2 control-label">归属单位：</label>
		<div class="col-sm-10">
			<form:select path="organization.id" class="form-control select2"  style="width: 100%;" readonly="true" >
	            	<c:if test="${!empty user.organization.name}">
						<option selected="selected" value="${user.organization.id}">${user.organization.name}</option>
					</c:if>
	  		</form:select>
  		</div>
	</c:if>		
	<label class="col-sm-2 control-label">备注：</label>
		<div class="col-sm-10">
			<form:textarea class="form-control" path="note" style="resize:none; width:100%; height:100px;" />	
		</div>
	
<!-- 不可改动，隐藏 -->
	 	<div style="display:none">
	 		<form:input path="id" readonly="true" />
			<form:input path="issuer.id" readonly="true" />
			<form:input path="time" readonly="true" />
		</div>
</div>