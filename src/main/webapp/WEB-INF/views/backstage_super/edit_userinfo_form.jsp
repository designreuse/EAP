<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<p></p>
	 <!-- 可改动信息 -->
	<div class="form-group">
		<label class="col-sm-2 control-label">用户名：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入用户名" path="username" />
		</div>
		
		<label class="col-sm-2 control-label">单位名称 </label>
        <div class="col-sm-10">
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
    	 	
		<label class="col-sm-2 control-label">Email：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入Email" path="email" />
		</div>
		<label class="col-sm-2 control-label">手机：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入手机号码" path="phone" />
		</div>
		<label class="col-sm-2 control-label">备注：</label>
		<div class="col-sm-10">
			<form:textarea class="form-control" path="remarks" style="resize:none; width:100%; height:100px;" />
		</div>
		
		
	 <!-- 不可改动，隐藏 -->
	 	<div style="display:none">
			<form:input path="authority_id.id" readonly="true" />
		</div>
 	</div>
	

