<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<div class="form-group">
	<label class="col-sm-2 control-label">技术服务标题：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入技术服务标题" path="title" />
		</div>
	<label class="col-sm-2 control-label">主要服务内容：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入主要服务内容（100字以内）" path="abstract_text" />
		</div>
	<label class="col-sm-2 control-label">品系/类型：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入涉及的品系或类型" path="target" />
		</div>
	<label class="col-sm-2 control-label">预定期限：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入预定期限" path="cycle" />
		</div>
	<label class="col-sm-2 control-label">市场价格：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入市场价格（单位自定）" path="price_public" />
		</div>
	<label class="col-sm-2 control-label">所内价格：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入所内价格（单位自定）" path="price_private" />
		</div>
	<c:if test="${user.authority eq 'SUPER'}">
		<label class="col-sm-2 control-label">提供单位：</label>
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
		<label class="col-sm-2 control-label">提供单位：</label>
		<div class="col-sm-10">
			<form:select path="organization.id" class="form-control select2"  style="width: 100%;" readonly="true" >
	            	<c:if test="${!empty user.organization.name}">
						<option selected="selected" value="${user.organization.id}">${user.organization.name}</option>
					</c:if>
	  		</form:select>
  		</div>
	</c:if>		
	<label class="col-sm-2 control-label">联系人：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入联系人及方式" path="contact" />
		</div>
	<label class="col-sm-2 control-label">技术详情：</label>
		<div class="col-sm-10">
			<form:textarea class="form-control" path="note" style="resize:none; width:100%; height:300px;" />			
			<script type="text/javascript">CKEDITOR.replace('note');</script>
		</div>
<!-- 不可改动，隐藏 -->
	 	<div style="display:none">
	 		<form:input path="id" readonly="true" />
			<form:input path="issuer.id" readonly="true" />
			<form:input path="time" readonly="true" />
		</div>
</div>