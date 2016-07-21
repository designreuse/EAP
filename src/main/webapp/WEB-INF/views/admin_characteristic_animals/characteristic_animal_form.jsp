<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
<div class="form-group">
	<label class="col-sm-2 control-label">实验动物名称：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入特色动物名称（业界内常用称呼，不必拉丁学名）" path="name" />
		</div>
	<label class="col-sm-2 control-label">物种：</label>
	<div class="col-sm-10">
		<form:select id="species_select" path="species_id.id" class="form-control select2"  style="width: 100%;" readonly="true" >
           	<c:if test="${!empty characteristic_animal.species_id.id}">
				<option selected="selected" value="${characteristic_animal.species_id.id}">${characteristic_animal.species_id.name}</option>
			</c:if>		
  		</form:select>
 	</div>
		
    <c:if test="${!empty characteristic_animal.species_id.id}">	
    	<script>getSpecies_edit('species_select','${characteristic_animal.species_id.id}');</script>
    </c:if>
    <c:if test="${empty characteristic_animal.species_id.id}">	
    	<script>getSpecies_add('species_select');</script>
    </c:if>
		
		
		
	<label class="col-sm-2 control-label">培养方式：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入培养方式" path="preparation" />
		</div>
	<label class="col-sm-2 control-label">养殖地：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入养殖地" path="save_place" />
		</div>
	<label class="col-sm-2 control-label">储存信息：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入储存信息" path="save_info" />
		</div>
	<label class="col-sm-2 control-label">储存量：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入储存量" path="quantity" />
		</div>
	<label class="col-sm-2 control-label">备注：</label>
		<div class="col-sm-10">
			<form:textarea path="note" /><script type="text/javascript">CKEDITOR.replace('note');</script>
		</div>
	
	<label class="col-sm-2 control-label">联系人：</label>
		<div class="col-sm-10">
			<form:select id="person_select" path="contact_id.id" class="form-control select2" style="width: 100%;" >	
				<c:if test="${!empty characteristic_animal.contact_id.id}">	
					<option selected="selected" value="${characteristic_animal.contact_id.id}">${characteristic_animal.contact_id.name}</option>
				</c:if>	
			</form:select>
		</div>
	<c:if test="${!empty characteristic_animal.contact_id.id}">	
    	<script>getPerson_edit('person_select','${characteristic_animal.contact_id.id}');</script>
    </c:if>
    <c:if test="${empty characteristic_animal.contact_id.id}">	
    	<script>getPerson_add('person_select');</script>
    </c:if>
	
	<c:if test="${user.authority eq 'SUPER'}">
		<label class="col-sm-2 control-label">归属单位：</label>
		<div class="col-sm-10">
			<form:select path="organization.id" class="form-control select2" style="width: 100%;" >
	            	<c:if test="${!empty characteristic_animal.organization.id}">
							<option selected="selected" value="${characteristic_animal.organization.id}">${characteristic_animal.organization.name}</option>				
						<c:forEach items="${listOrganizations}" var="organization">
							<c:if test="${organization.id ne characteristic_animal.organization.id}">
								<option value="${organization.id}">${organization.name}</option>
							</c:if>
						</c:forEach>	
					</c:if>
	            	<c:if test="${empty characteristic_animal.organization.id}">
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
			<form:input path="issuer_id.id" readonly="true" />
			<form:input path="time" readonly="true" />
		</div>
</div>