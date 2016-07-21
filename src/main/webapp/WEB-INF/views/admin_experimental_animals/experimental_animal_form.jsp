<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
<div class="form-group">
	<label class="col-sm-2 control-label">实验动物名称：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入实验动物名称（业界内常用称呼，不必拉丁学名）" path="name" />
		</div>
	<label class="col-sm-2 control-label">品系：</label>
		<div class="col-sm-10">
			<form:select id="strain_select" path="strain_id.id" class="form-control select2" style="width: 100%;" >			
				<c:if test="${!empty experimental_animal.strain_id.id}">
					<option selected="selected" value="${experimental_animal.strain_id.id}">${experimental_animal.strain_id.name}</option>
				</c:if>	
			</form:select>	
		</div>
		
	<c:if test="${!empty experimental_animal.strain_id.id}">	
    	<script>getStrain_edit('strain_select','${experimental_animal.strain_id.id}');</script>
    </c:if>
    <c:if test="${empty experimental_animal.strain_id.id}">	
    	<script>
    		getStrain_add('strain_select');
		</script>
    </c:if>
		
		
		
	<label class="col-sm-2 control-label">基因名：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入基因名" path="dna_name" />
		</div>
	<label class="col-sm-2 control-label">表型描述：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入表型描述" path="phenotype" />
		</div>
	<label class="col-sm-2 control-label">主要用途：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入主要用途" path="application" />
		</div>
	<label class="col-sm-2 control-label">制备方式：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入制备方式" path="preparation" />
		</div>
	<label class="col-sm-2 control-label">参考文献：</label>
		<div class="col-sm-10">
			<form:textarea path="preparation_ref" /><script type="text/javascript">CKEDITOR.replace('preparation_ref');</script>
		</div>
	<label class="col-sm-2 control-label">动物模型来源：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入动物模型来源" path="origin" />
		</div>
	<label class="col-sm-2 control-label">储存信息：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入储存信息" path="save_info" />
		</div>
	<label class="col-sm-2 control-label">联系人：</label>
		<div class="col-sm-10">
			<form:select id="person_select" path="contact_id.id" class="form-control select2" style="width: 100%;" >	
				<c:if test="${!empty experimental_animal.contact_id.id}">	
					<option selected="selected" value="${experimental_animal.contact_id.id}">${experimental_animal.contact_id.name}</option>
				</c:if>	
			</form:select>
		</div>
	<c:if test="${!empty experimental_animal.contact_id.id}">	
    	<script>getPerson_edit('person_select','${experimental_animal.contact_id.id}');</script>
    </c:if>
    <c:if test="${empty experimental_animal.contact_id.id}">	
    	<script>getPerson_add('person_select');</script>
    </c:if>
	<label class="col-sm-2 control-label">储存量：</label>
		<div class="col-sm-10">
			<form:input class="form-control" placeholder="请输入储存量" path="quantity" />
		</div>
	<label class="col-sm-2 control-label">备注：</label>
		<div class="col-sm-10">
			<form:textarea path="note" /><script type="text/javascript">CKEDITOR.replace('note');</script>
		</div>
	<c:if test="${user.authority eq 'SUPER'}">
		<label class="col-sm-2 control-label">归属单位：</label>
		<div class="col-sm-10">
			<form:select path="organization.id" class="form-control select2" style="width: 100%;" >
	            	<c:if test="${!empty experimental_animal.organization.id}">
							<option selected="selected" value="${experimental_animal.organization.id}">${experimental_animal.organization.name}</option>				
						<c:forEach items="${listOrganizations}" var="organization">
							<c:if test="${organization.id ne experimental_animal.organization.id}">
								<option value="${organization.id}">${organization.name}</option>
							</c:if>
						</c:forEach>	
					</c:if>
	            	<c:if test="${empty experimental_animal.organization.id}">
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