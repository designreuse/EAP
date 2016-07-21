<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 我的CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/wts_edit_strain_detail_style.css" />	
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>		
	<c:forEach items="${strain.genetic_data}" var="genetic_data">
		<strong>
			细胞遗传标记：
		</strong>
		<div class="dotted-line-nocolor"></div>
			<c:if test="${!empty genetic_data.chromosome_number}">
				<font class="second-embed">染色体数：</font>${genetic_data.chromosome_number}<div class="dotted-line-nocolor"></div>
			</c:if>
			<c:if test="${!empty genetic_data.standard_karyotype_id}">
				<font class="second-embed">染色体标准核型：</font>${genetic_data.standard_karyotype_id}<div class="dotted-line-nocolor"></div>	
			</c:if>
			<c:if test="${!empty genetic_data.chromosome_c_image_id}">
				<font class="second-embed">染色体C带:</font>${genetic_data.chromosome_c_image_id}<div class="dotted-line-nocolor"></div>
			</c:if>
			<c:if test="${!empty genetic_data.chromosome_g_image_id}">	
				<font class="second-embed">染色体G带:</font>${genetic_data.chromosome_g_image_id}<div class="dotted-line-nocolor"></div>
			</c:if>
		<br/><div class="dotted-line"></div>
		<c:if test="${!empty genetic_data.biochemical_gene_markers}">	
			<strong>生化基因标记：</strong>${genetic_data.biochemical_gene_markers}
			<div class="dotted-line"></div>
		</c:if>
		<c:if test="${!empty genetic_data.histocompatibility_gene}">	
			<strong>组织相容性基因：</strong>${genetic_data.histocompatibility_gene}															
			<div class="dotted-line"></div>
		</c:if>
		<c:if test="${!empty genetic_data.frame_type}">	
			<strong>肋骨类型：</strong>${genetic_data.frame_type}
			<div class="dotted-line"></div>
		</c:if>
		<c:if test="${!empty genetic_data.coat_color_gene}">	
			<strong>毛色或羽色基因：</strong>${genetic_data.coat_color_gene}
			<div class="dotted-line"></div>
		</c:if>
		<c:if test="${!empty genetic_data.blood_group_gene}">	
			<strong>血型基因：</strong>${genetic_data.blood_group_gene}
			<div class="dotted-line"></div>
		</c:if>
		<c:if test="${!empty genetic_data.mandibular_characteristics}">	
			<strong>下颌骨特征：</strong>${genetic_data.mandibular_characteristics}
			<div class="dotted-line"></div>
		</c:if>
		<c:if test="${!empty genetic_data.microsatellite}">	
			<strong>微卫星DNA：</strong>${genetic_data.microsatellite}
			<div class="dotted-line"></div>
		</c:if>
		<c:if test="${genetic_data.animal_classification eq 'tra'}">
		<c:if test="${(!empty genetic_data.tra_name)||(!empty genetic_data.tra_background)||(!empty genetic_data.tra_insert_transgene_name)||(!empty genetic_data.tra_insertion_site)||(!empty genetic_data.tra_copy_number)||(!empty genetic_data.tra_abnormal_phenotype)||(!empty genetic_data.tra_references)}">	
			<strong>
				转基因动物:
			</strong>
			<div class="dotted-line-nocolor"></div>
				<c:if test="${!empty genetic_data.tra_name}">
					<font class="second-embed">命名：</font>${genetic_data.tra_name}<div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty genetic_data.tra_background}">
					<font class="second-embed">背景品系：</font>${genetic_data.tra_background}<div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty genetic_data.tra_insert_transgene_name}">
					<font class="second-embed">插入转基因名称：</font>${genetic_data.tra_insert_transgene_name}<div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty genetic_data.tra_insertion_site}">
					<font class="second-embed">插入位点：</font>${genetic_data.tra_insertion_site}<div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty genetic_data.tra_copy_number}">
					<font class="second-embed">拷贝数：</font>${genetic_data.tra_copy_number}<div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty genetic_data.tra_abnormal_phenotype}">
					<font class="second-embed">异常表型：</font>${genetic_data.tra_abnormal_phenotype}<div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty genetic_data.tra_references}">
					<font class="second-embed">参考文献：</font>${genetic_data.tra_references}<div class="dotted-line-nocolor"></div>
				</c:if>
		</c:if>
		</c:if>
		<c:if test="${genetic_data.animal_classification eq 'tar'}">
		<c:if test="${(!empty genetic_data.tar_name)||(!empty genetic_data.tar_background)||(!empty genetic_data.tar_insert_transgene_name)||(!empty genetic_data.tar_eliminating_gene_name)||(!empty genetic_data.tar_abnormal_phenotype)||(!empty genetic_data.tar_references)}">	
			<strong>
				基因定位突变:
			</strong>
			<div class="dotted-line-nocolor"></div>
				<c:if test="${!empty genetic_data.tar_name}">
					<font class="second-embed">命名：</font>${genetic_data.tar_name}<div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty genetic_data.tar_background}">
					<font class="second-embed">背景品系：</font>${genetic_data.tar_background}<div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty genetic_data.tar_insert_transgene_name}">
					<font class="second-embed">插入基因名：</font>${genetic_data.tar_insert_transgene_name}<div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty genetic_data.tar_eliminating_gene_name}">
					<font class="second-embed">被剔出基因名：</font>${genetic_data.tar_eliminating_gene_name}<div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty genetic_data.tar_abnormal_phenotype}">
					<font class="second-embed">异常表型：</font>${genetic_data.tar_abnormal_phenotype}<div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty genetic_data.tar_references}">
					<font class="second-embed">参考文献：</font>${genetic_data.tar_references}<div class="dotted-line-nocolor"></div>
				</c:if>
		</c:if>
		</c:if>
		<c:if test="${genetic_data.animal_classification eq 'oth'}">
			<c:if test="${(!empty genetic_data.oth_name)||(!empty genetic_data.oth_background)||(!empty genetic_data.oth_mutant_gene)||(!empty genetic_data.oth_mutant_site)||(!empty genetic_data.oth_abnormal_phenotype)||(!empty genetic_data.oth_references)}">	
				<strong>
					其他突变动物:
				</strong>
				<div class="dotted-line-nocolor"></div>
					<c:if test="${!empty genetic_data.oth_name}">
						<font class="second-embed">命名：</font>${genetic_data.oth_name}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty genetic_data.oth_background}">
						<font class="second-embed">背景品系：</font>${genetic_data.oth_background}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty genetic_data.oth_mutant_gene}">
						<font class="second-embed">突变基因：</font>${genetic_data.oth_mutant_gene}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty genetic_data.oth_mutant_site}">
						<font class="second-embed">突变位点：</font>${genetic_data.oth_mutant_site}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty genetic_data.oth_abnormal_phenotype}">
						<font class="second-embed">异常表型：</font>${genetic_data.oth_abnormal_phenotype}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty genetic_data.oth_references}">
						<font class="second-embed">参考文献：</font>${genetic_data.oth_references}<div class="dotted-line-nocolor"></div>
					</c:if>
			</c:if>
		</c:if>
	<c:if test="${!empty strain.genetic_data}">
		<p></p>
		<div class="btn btn-social btn-warning" onclick="edit_genetic_data_layer('${strain.id}','${genetic_data.id}')" >
			<i class="fa fa-edit"></i>编辑遗传数据
		</div>
	</c:if>
	</c:forEach>											
	<c:if test="${empty strain.genetic_data}">		
		<div class="btn btn-social btn-success" onclick="add_genetic_data_layer('${strain.id}')">
			<i class="fa fa-plus"></i>添加遗传数据
		</div>
	</c:if>
	