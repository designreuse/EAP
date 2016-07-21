<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<div class="form-group">
	<label class="col-sm-1 control-label">公告标题：</label>
		<div class="col-sm-11">
			<form:input class="form-control" placeholder="请输入公告标题" path="title" />
		</div>
	<c:if test="${user.authority eq 'SUPER'}">
		<label class="col-sm-1 control-label">归属单位：</label>
		<div class="col-sm-11">
			<form:select path="organization.id" class="form-control select2" >
	            	<c:if test="${!empty user.organization.name}">
						<option value="${user.organization.id}">${user.organization.name}</option>
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
		<label class="col-sm-1 control-label">归属单位：</label>
		<div class="col-sm-11">
			<form:select path="organization.id" class="form-control select2" readonly="true" >
	            	<c:if test="${!empty user.organization.name}">
						<option value="${user.organization.id}">${user.organization.name}</option>
					</c:if>
	  		</form:select>
  		</div>
	</c:if>	
	<label class="col-sm-1 control-label">公告正文：</label>
		<div class="col-sm-11">
			<form:textarea class="form-control" path="note" style="resize:none; width:100%; height:300px;" />			
			<script type="text/javascript">CKEDITOR.replace('note');</script>
		</div>
<!-- 不可改动，隐藏 -->
	 	<div style="display:none">
	 		<form:input path="id" readonly="true" />
			<form:input path="classification" readonly="true" />
			<form:input path="issuer.id" readonly="true" />
			<form:input path="time" readonly="true" />
		</div>
</div>