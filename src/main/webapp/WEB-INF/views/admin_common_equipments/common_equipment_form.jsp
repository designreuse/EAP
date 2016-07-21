<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
<div class="form-group">
	<label class="col-sm-2 control-label">设备名称：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入设备标准名称" path="name" />
		</div>
	
	<label class="col-sm-2 control-label">型号：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入型号" path="version" />
		</div>
	
	<label class="col-sm-2 control-label">联系人：</label>
		<div class="col-sm-10">
			<form:select id="person_select" path="contact.id" class="form-control select2" style="width: 100%;" >	
				<c:if test="${!empty common_equipment.contact.id}">	
					<option selected="selected" value="${common_equipment.contact.id}">${common_equipment.contact.name}</option>
				</c:if>	
			</form:select>
		</div>
	<c:if test="${!empty common_equipment.contact.id}">	
    	<script>getPerson_edit('person_select','${common_equipment.contact.id}');</script>
    </c:if>
    <c:if test="${empty common_equipment.contact.id}">	
    	<script>getPerson_add('person_select');</script>
    </c:if>
	
	<label class="col-sm-2 control-label">简介：</label>
		<div class="col-sm-10">
			<form:textarea path="note" /><script type="text/javascript">CKEDITOR.replace('note');</script>
		</div>
	<c:if test="${user.authority eq 'SUPER'}">
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
	
<!-- 不可改动，隐藏 -->
	 	<div style="display:none">
	 		<form:input path="id" readonly="true" />
			<form:input path="issuer.id" readonly="true" />
			<form:input path="time" readonly="true" />
		</div>
</div>