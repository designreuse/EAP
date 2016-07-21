<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
<div class="form-group">
	<label class="col-sm-2 control-label">用户名：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入用户名" path="name" />
		</div>
	<label class="col-sm-2 control-label">用户昵称：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入用户昵称" path="username" />
		</div>	
	<label class="col-sm-2 control-label">用户密码：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入用户密码" path="password" />
		</div>		
	<label class="col-sm-2 control-label">用户组：</label>
	<div class="col-sm-10">
		<form:select path="authority" class="form-control select2"  style="width: 100%;" >
			<option value="ADMIN">管理员组</option>
			<option value="SUPER">超级管理员组</option>
  		</form:select>
 	</div>
	<label class="col-sm-2 control-label">角色：</label>
	<div class="col-sm-10">
		<form:select id="role_select" path="role.id" class="form-control select2"  style="width: 100%;" >
           	<c:if test="${!empty role.id}">
				<option selected="selected" value="${user.role.id}">${user.role.name}</option>
			</c:if>		
  		</form:select>
 	</div>    	
    <c:if test="${!empty experiment.equipment.id}">	
    	<script>getRole_edit('role_select','${user.role.id}');</script>
    </c:if>
    <c:if test="${empty experiment.equipment.id}">	
    	<script>getRole_add('role_select');</script>
    </c:if>
	<label class="col-sm-2 control-label">可用性：</label>
	<div class="col-sm-10">
		<form:select path="enable" class="form-control select2"  style="width: 100%;" >
			<option value="1">激活</option>
			<option value="0">锁定</option>
  		</form:select>
 	</div>
	<label class="col-sm-2 control-label">主要完成单位：</label>
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
	<label class="col-sm-2 control-label">电话：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入电话" path="phone" />
		</div>
	<label class="col-sm-2 control-label">email：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入email" path="email" />
		</div>
	<label class="col-sm-2 control-label">备注：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入权限备注" path="remarks" />
		</div>
<!-- 不可改动，隐藏 -->
	 	<div style="display:none">
	 		<form:input path="id" readonly="true" />
		</div>
</div>