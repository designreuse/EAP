<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
<div class="form-group">
	<label class="col-sm-2 control-label">品系名称：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入品系名称（业界内常用称呼，不必拉丁学名）" path="name" />
		</div>
	
	
	<label class="col-sm-2 control-label">物种：</label>
	<div class="col-sm-10">
		<form:select id="species_select" path="species_id.id" class="form-control select2"  style="width: 100%;" readonly="true" >
           	<c:if test="${!empty strain.species_id.id}">
				<option selected="selected" value="${strain.species_id.id}">${strain.species_id.name}</option>
			</c:if>		
  		</form:select>
 	</div>
    	
    <c:if test="${!empty strain.species_id.id}">	
    	<script>getSpecies_edit('species_select','${strain.species_id.id}');</script>
    </c:if>
    <c:if test="${empty strain.species_id.id}">	
    	<script>getSpecies_add('species_select');</script>
    </c:if>
		
	<label class="col-sm-2 control-label">培育年份：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入培育年份" path="cultivation_year" />
		</div>
	<label class="col-sm-2 control-label">引入时间：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入引入时间" path="introduce_year" />
		</div>
	<label class="col-sm-2 control-label">培育机构或人：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入培育机构或人" path="cultivationer" />
		</div>
	<label class="col-sm-2 control-label">遗传特征：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入遗传特征" path="hereditary_feature" />
		</div>
	<label class="col-sm-2 control-label">微生物学等级：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入微生物学等级" path="microbiological_grade" />
		</div>
	<label class="col-sm-2 control-label">种质来源：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入种质来源" path="germplasm_resources" />
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
	
<!-- 不可改动，隐藏 -->
	 	<div style="display:none">
	 		<form:input path="id" readonly="true" />
			<form:input path="issuer.id" readonly="true" />
			<form:input path="time" readonly="true" />
		</div>
</div>