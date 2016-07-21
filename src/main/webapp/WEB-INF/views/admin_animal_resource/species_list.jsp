<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="callout callout-gray">
	<c:if test="${fn:contains(user.authority_id.species, 'A')}">
		<div class="btn btn-social btn-success" onclick="add_species_layer()">
			<i class="fa fa-plus"></i>添加物种
		</div>					
	</c:if>	
	<c:if test="${user.authority eq 'SUPER'}">
		<div class="btn btn-social btn-warning" onclick="edit_species_select()" >
			<i class="fa fa-edit"></i>编辑物种
		</div>
		<div class="btn btn-social btn-danger" onclick="remove_species_select()" >
			<i class="fa fa-bitbucket"></i>删除物种
		</div>				
	</c:if>	
	<c:if test="${empty user.authority_id.species}">
		<div class="btn bg-navy" >
			无操作权限
		</div>				
	</c:if>	
</div>
<div>
	<table  
		class="table-color-animal"
		data-toggle="table"
	    data-pagination="true"
	    data-search="true"
	    data-sort-order="desc"
	    data-show-toggle="true"
	    data-show-columns="true"
	    data-click-to-select="true"
	    data-toolbar="#toolbar">
		<thead>
   			<tr>
				<c:if test="${user.authority eq 'SUPER'}">
   					<th><i class="fa fa-edit"></i></th>
   				</c:if>
				     <th data-sortable="true">物种名称</th>
				     <th data-sortable="true">归属单位</th>
				     <th data-sortable="true">发布人</th>
				     <th data-sortable="true">发布时间</th>
				     <th data-sortable="true">操作</th>
   			</tr>
		</thead>
		<tbody>
			<c:forEach items="${listSpeciess}" var="species">									
				<tr>
					<c:if test="${user.authority eq 'SUPER'}">
						<td><input type="checkbox" name="checkbox" id="sel_${species.id}" /></td>
					</c:if>
					<td>
			      		<div class="herf_font_animal_name">
						<a href="show/species/detail/${species.id}" target="_blank">												
						${species.name}											
						</a>
					</td>		
					<td>${species.organization.name}</td>
					<td>${species.issuer.name}</td>
					<td>${fn:substring(species.time, 0, fn:length(species.time)-2)}</td>
					<td>
						<c:if test="${user.authority eq 'ADMIN' && species.organization.id eq user.organization.id}">
							<c:if test="${fn:contains(user.authority_id.species, 'E')}">
								<div class="btn btn-xs btn-social btn-warning" onclick="edit_species_layer('${species.id}')" >
									<i class="fa fa-edit"></i>编辑
								</div>
							</c:if>
							<c:if test="${fn:contains(user.authority_id.species, 'D')}">
								<div class="btn btn-xs btn-social btn-danger" onclick="remove_species_layer('${species.id}')">
								     <i class="fa fa-bitbucket"></i>删除
								</div>
							</c:if>									
							<c:if test="${!fn:contains(user.authority_id.species, 'E')&&!fn:contains(user.authority_id.species, 'D')}">
								<div class="btn btn-xs bg-navy" >
								     无操作权限
								</div>
							</c:if>									
						</c:if>									
						<c:if test="${user.authority eq 'ADMIN' && species.organization.id ne user.organization.id}">
							<div class="btn btn-xs bg-navy" >
								     无操作权限
							</div>								
						</c:if>									
						<c:if test="${user.authority eq 'SUPER'}">
							<div class="btn btn-xs btn-social btn-warning" onclick="edit_species_layer('${species.id}')" >
								<i class="fa fa-edit"></i>编辑
							</div>
							<div class="btn btn-xs btn-social btn-danger" onclick="remove_species_layer('${species.id}')">
								<i class="fa fa-bitbucket"></i>删除
							</div>							
						</c:if>	
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script>
//选择编辑
function edit_species_select(){
	var number=0;
	var check_id="";
	$("input:checkbox[id^='sel']:checked").each(function(i){
		number=number+1;
		check_id=$(this).attr('id');
		check_id=check_id.substring(4);
      });
	if(number==0){
		alert("请选择数据");
	}
	else if(number>1){
		alert("您选择了"+number+"条数据，只能选择1条数据进行编辑");
	}
	else{
		edit_species_layer(check_id);
	}
}
//批量删除
function remove_species_select(){
	var number=0;
	var id_array=new Array();
	var check_id="";
	$("input:checkbox[id^='sel']:checked").each(function(i){
		number=number+1;		
      });
	
	if(number==0)
		{alert("请选择数据");}
	else {
		var msg = "您确定要删除这"+number+"条记录吗？"; 
		if (confirm(msg)==true){ 
			$("input:checkbox[id^='sel']:checked").each(function(i){	
				check_id=$(this).attr('id');
				check_id=check_id.substring(4);		
				 $.ajax({
			            url: 'admin/remove/species/'+check_id,
			            cache: false,
			            success: function () {			        		
			        		location.reload();	
			            	layer.msg('已批量删除'+number+'数据');
			            },
			            error: function () {
			            }
			        });
				
		      });
			
		}else{ 
			layer.msg('已取消操作');
		return false; 
		} 
	}
}
</script>	         
	              