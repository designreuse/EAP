﻿<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="callout callout-gray">
	<c:if test="${fn:contains(user.authority_id.technology, 'A')}">
		<div class="btn btn-social btn-success" onclick="add_characteristic_equipment_layer()">
			<i class="fa fa-plus"></i>添加特色设备
		</div>					
	</c:if>	
	<c:if test="${empty user.authority_id.characteristic_equipment}">
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
				     <th data-sortable="true">特色设备名称</th>
				     <th data-sortable="true">归属单位</th>
				     <th data-sortable="true">发布人</th>
				     <th data-sortable="true">发布时间</th>
				     <th data-sortable="true">操作</th>
   			</tr>
		</thead>
		<tbody>
			<c:forEach items="${listCharacteristic_equipments}" var="characteristic_equipment">									
				<tr>
					<c:if test="${user.authority eq 'SUPER'}">
						<td><input type="checkbox" name="checkbox" id="sel_${characteristic_equipment.id}" /></td>
					</c:if>
					<td>
			      		<div class="herf_font_animal_name">
						<a href="show/characteristic_equipment/detail/${characteristic_equipment.id}" target="_blank">												
						${characteristic_equipment.name}											
						</a>
					</td>		
					<td>${characteristic_equipment.organization.name}</td>
					<td>${characteristic_equipment.issuer.name}</td>
					<td>${fn:substring(characteristic_equipment.time, 0, fn:length(characteristic_equipment.time)-2)}</td>
					<td>
						<c:if test="${user.authority eq 'ADMIN' && characteristic_equipment.organization.id eq user.organization.id}">
							<c:if test="${fn:contains(user.authority_id.characteristic_equipment, 'E')}">
								<div class="btn btn-xs btn-social btn-warning" onclick="edit_characteristic_equipment_layer('${characteristic_equipment.id}')" >
									<i class="fa fa-edit"></i>编辑
								</div>
							</c:if>
							<c:if test="${fn:contains(user.authority_id.characteristic_equipment, 'D')}">
								<div class="btn btn-xs btn-social btn-danger" onclick="remove_characteristic_equipment_layer('${characteristic_equipment.id}')">
								     <i class="fa fa-bitbucket"></i>删除
								</div>
							</c:if>									
							<c:if test="${!fn:contains(user.authority_id.characteristic_equipment, 'E')&&!fn:contains(user.authority_id.characteristic_equipment, 'D')}">
								<div class="btn btn-xs bg-navy" >
								     无操作权限
								</div>
							</c:if>									
						</c:if>									
						<c:if test="${user.authority eq 'ADMIN' && characteristic_equipment.organization.id ne user.organization.id}">
							<div class="btn btn-xs bg-navy" >
								     无操作权限
							</div>								
						</c:if>									
						<c:if test="${user.authority eq 'SUPER'}">
							<div class="btn btn-xs btn-social btn-warning" onclick="edit_characteristic_equipment_layer('${characteristic_equipment.id}')" >
								<i class="fa fa-edit"></i>编辑
							</div>
							<div class="btn btn-xs btn-social btn-danger" onclick="remove_characteristic_equipment_layer('${characteristic_equipment.id}')">
								<i class="fa fa-bitbucket"></i>删除
							</div>							
						</c:if>	
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
	              
	              