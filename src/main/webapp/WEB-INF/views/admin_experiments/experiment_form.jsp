<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
<div class="form-group">
	<label class="col-sm-2 control-label">特色实验标题：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入实验标题" path="title" />
		</div>
	<label class="col-sm-2 control-label">主要参与人员：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入主要参与人员" path="team" />
		</div>
	<c:if test="${user.authority eq 'SUPER'}">
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
	</c:if>
	<c:if test="${user.authority eq 'ADMIN'}">
		<label class="col-sm-2 control-label">主要完成单位：</label>
		<div class="col-sm-10">
			<form:select path="organization.id" class="form-control select2" readonly="true" >
	            	<c:if test="${!empty user.organization.name}">
						<option selected="selected" value="${user.organization.id}">${user.organization.name}</option>
					</c:if>
	  		</form:select>
  		</div>
	</c:if>	
	
	<label class="col-sm-2 control-label">主要使用特色设备：</label>
	<div class="col-sm-10">
		<form:select id="equipment_select" path="equipment.id" class="form-control select2"  style="width: 100%;" >
           	<c:if test="${!empty experiment.equipment.id}">
				<option selected="selected" value="${experiment.equipment.id}">${experiment.equipment.name}</option>
			</c:if>		
  		</form:select>
 	</div>
    	
    <c:if test="${!empty experiment.equipment.id}">	
    	<script>getEquipment_edit('equipment_select','${experiment.equipment.id}');</script>
    </c:if>
    <c:if test="${empty experiment.equipment.id}">	
    	<script>getEquipment_add('equipment_select');</script>
    </c:if>
	
	
	<label class="col-sm-2 control-label">主要实验内容：</label>
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