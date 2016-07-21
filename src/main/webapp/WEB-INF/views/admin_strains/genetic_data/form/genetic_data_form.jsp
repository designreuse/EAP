<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 我的CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/wts_edit_strain_detail_style.css" />	
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
<form:input path="strain_id.id" value="${strain.id}" readonly="true" type="hidden"/>		
	<strong>
		细胞遗传标记：
	</strong>
	<div class="second-embed">
		<label for="chromosome_number">染色体数：</label>
	    <form:input class="form-control" placeholder="请输入染色体数" path="chromosome_number" />
	    <div class="dotted-line-nocolor"></div>
		<label for="standard_karyotype_id">染色体标准核型：</label>
		<form:input class="form-control" placeholder="请输入染色体标准核型" path="standard_karyotype_id" />
	    <div class="dotted-line-nocolor"></div>
		<label for="chromosome_c_image_id">染色体C带：</label>
		<form:input class="form-control" placeholder="请输入染色体C带：" path="chromosome_c_image_id" />
	    <div class="dotted-line-nocolor"></div>
		<label for="chromosome_g_image_id">染色体G带：</label>
		<form:input class="form-control" placeholder="请输入染色体G带：" path="chromosome_g_image_id" />
	    <div class="dotted-line-nocolor"></div>
    </div>
	
	<label for="biochemical_gene_markers"><strong>生化基因标记：</strong></label>
	<form:input class="form-control" placeholder="请输入生化基因标记" path="biochemical_gene_markers" />
	    <div class="dotted-line-nocolor"></div>
	<label for="histocompatibility_gene"><strong>组织相容性基因：</strong></label>
	<form:input class="form-control" placeholder="请输入组织相容性基因" path="histocompatibility_gene" />
	    <div class="dotted-line-nocolor"></div>
	<label for="frame_type"><strong>肋骨类型：</strong></label>
	<form:input class="form-control" placeholder="请输入肋骨类型" path="frame_type" />
	    <div class="dotted-line-nocolor"></div>
	<label for="coat_color_gene"><strong>毛色或羽色基因：</strong></label>
	<form:input class="form-control" placeholder="请输入毛色或羽色基因" path="coat_color_gene" />
	    <div class="dotted-line-nocolor"></div>
	<label for="blood_group_gene"><strong>血型基因：</strong></label>
	<form:input class="form-control" placeholder="请输入血型基因" path="blood_group_gene" />
	    <div class="dotted-line-nocolor"></div>
	<label for="mandibular_characteristics"><strong>下颌骨特征：</strong></label>
	<form:input class="form-control" placeholder="请输入下颌骨特征" path="mandibular_characteristics" />
	    <div class="dotted-line-nocolor"></div>
	<label for="microsatellite"><strong>微卫星DNA：</strong></label>
	<form:input class="form-control" placeholder="请输入微卫星DNA" path="microsatellite" />
	    <div class="dotted-line-nocolor"></div>
	
	<strong>
		动物系列分类:
	</strong>
	<script>
	//tab选择联动radio的
	function change_radio(c)
	{
		$("input[name='animal_classification'][value='"+c+"']").prop("checked",true);
	}
	</script>
	<div class="nav-tabs-custom">
       <ul class="nav nav-tabs">  
			<c:if test="${genetic_data.animal_classification eq 'tra'}">         
				<li class="active"><a onclick="change_radio('tra')" href="#tab1" id="tra_a" data-toggle="tab"><label><form:radiobutton path="animal_classification" value="tra" id="tra_r" tab="tab1" checked="checked" />转基因动物</label></a></li>
         		<li><a onclick="change_radio('tar')" href="#tab2" id="tar_a" data-toggle="tab"><label><form:radiobutton path="animal_classification" value="tar" id="tar_r" tab="tab2"/>基因定位突变动物</label></a></li>
         		<li><a onclick="change_radio('oth')" href="#tab3" id="oth_a" data-toggle="tab"><label><form:radiobutton path="animal_classification" value="oth" id="oth_r" tab="tab3"/>其他突变动物</label></a></li>
       		</c:if>
			<c:if test="${genetic_data.animal_classification eq 'tar'}">         
				<li><a onclick="change_radio('tra')" href="#tab1" id="tra_a" data-toggle="tab"><label><form:radiobutton path="animal_classification" value="tra" id="tra_r" tab="tab1" checked="checked" />转基因动物</label></a></li>
         		<li class="active"><a onclick="change_radio('tar')" href="#tab2" id="tar_a" data-toggle="tab"><label><form:radiobutton path="animal_classification" value="tar" id="tar_r" tab="tab2"/>基因定位突变动物</label></a></li>
         		<li><a onclick="change_radio('oth')" href="#tab3" id="oth_a" data-toggle="tab"><label><form:radiobutton path="animal_classification" value="oth" id="oth_r" tab="tab3"/>其他突变动物</label></a></li>
       		</c:if> 
			<c:if test="${genetic_data.animal_classification eq 'oth'}">         
				<li><a onclick="change_radio('tra')" href="#tab1" id="tra_a" data-toggle="tab"><label><form:radiobutton path="animal_classification" value="tra" id="tra_r" tab="tab1" checked="checked" />转基因动物</label></a></li>
         		<li><a onclick="change_radio('tar')" href="#tab2" id="tar_a" data-toggle="tab"><label><form:radiobutton path="animal_classification" value="tar" id="tar_r" tab="tab2"/>基因定位突变动物</label></a></li>
         		<li class="active"><a onclick="change_radio('oth')" href="#tab3" id="oth_a" data-toggle="tab"><label><form:radiobutton path="animal_classification" value="oth" id="oth_r" tab="tab3"/>其他突变动物</label></a></li>
       		</c:if>       		 
			<c:if test="${empty genetic_data.animal_classification}">         
				<li class="active"><a onclick="change_radio('tra')" href="#tab1" id="tra_a" data-toggle="tab"><label><form:radiobutton path="animal_classification" value="tra" id="tra_r" tab="tab1" checked="checked" />转基因动物</label></a></li>
         		<li><a onclick="change_radio('tar')" href="#tab2" id="tar_a" data-toggle="tab"><label><form:radiobutton path="animal_classification" value="tar" id="tar_r" tab="tab2"/>基因定位突变动物</label></a></li>
         		<li><a onclick="change_radio('oth')" href="#tab3" id="oth_a" data-toggle="tab"><label><form:radiobutton path="animal_classification" value="oth" id="oth_r" tab="tab3"/>其他突变动物</label></a></li>
       		</c:if> 
      </ul>
       <div class="tab-content">
         <div class="tab-pane" id="tab1">
			<div class="second-embed">
				<label for="tra_name">命名：</label>
			    <form:input class="form-control" placeholder="请输入命名" path="tra_name" />
			    <div class="dotted-line-nocolor"></div>
				<label for="tra_background">背景品系：</label>
				<form:input class="form-control" placeholder="请输入背景品系" path="tra_background" />
			    <div class="dotted-line-nocolor"></div>
				<label for="tra_insert_transgene_name">插入转基因名称：</label>
				<form:input class="form-control" placeholder="请输入插入转基因名称" path="tra_insert_transgene_name" />
			    <div class="dotted-line-nocolor"></div>
				<label for="tra_insertion_site">插入位点：</label>
				<form:input class="form-control" placeholder="请输入插入位点" path="tra_insertion_site" />
			    <div class="dotted-line-nocolor"></div>
				<label for="tra_copy_number">拷贝数：</label>
				<form:input class="form-control" placeholder="请输入拷贝数" path="tra_copy_number" />
			    <div class="dotted-line-nocolor"></div>
				<label for="tra_abnormal_phenotype">异常表型：</label>
				<form:input class="form-control" placeholder="请输入异常表型" path="tra_abnormal_phenotype" />
			    <div class="dotted-line-nocolor"></div>
				<label for="tra_references">参考文献：</label>
				<form:input class="form-control" placeholder="请输入参考文献" path="tra_references" />
			    <div class="dotted-line-nocolor"></div>
		    </div>
         </div>
         <div class="tab-pane" id="tab2">
			<div class="second-embed">
				<label for="tar_name">命名：</label>
			    <form:input class="form-control" placeholder="请输入命名" path="tar_name" />
			    <div class="dotted-line-nocolor"></div>
				<label for="tar_background">背景品系：</label>
				<form:input class="form-control" placeholder="请输入背景品系" path="tar_background" />
			    <div class="dotted-line-nocolor"></div>
				<label for="tar_insert_transgene_name">插入转基因名称：</label>
				<form:input class="form-control" placeholder="请输入插入转基因名称" path="tar_insert_transgene_name" />
			    <div class="dotted-line-nocolor"></div>
				<label for="tar_eliminating_gene_name">被剔出基因名：</label>
				<form:input class="form-control" placeholder="请输入被剔出基因名" path="tar_eliminating_gene_name" />
			    <div class="dotted-line-nocolor"></div>
				<label for="tar_abnormal_phenotype">异常表型：</label>
				<form:input class="form-control" placeholder="请输入异常表型" path="tar_abnormal_phenotype" />
			    <div class="dotted-line-nocolor"></div>
				<label for="tar_references">参考文献：</label>
				<form:input class="form-control" placeholder="请输入参考文献" path="tar_references" />
			    <div class="dotted-line-nocolor"></div>
		    </div>
         </div>
         <div class="tab-pane" id="tab3">
			<div class="second-embed">
				<label for="oth_name">命名：</label>
			    <form:input class="form-control" placeholder="请输入命名" path="oth_name" />
			    <div class="dotted-line-nocolor"></div>
				<label for="oth_background">背景品系：</label>
				<form:input class="form-control" placeholder="请输入背景品系" path="oth_background" />
			    <div class="dotted-line-nocolor"></div>
				<label for="oth_mutant_gene">突变基因：</label>
				<form:input class="form-control" placeholder="请输入突变基因" path="oth_mutant_gene" />
			    <div class="dotted-line-nocolor"></div>
				<label for="oth_mutant_site">突变位点：</label>
				<form:input class="form-control" placeholder="请输入突变位点" path="oth_mutant_site" />
			    <div class="dotted-line-nocolor"></div>
				<label for="oth_abnormal_phenotype">异常表型：</label>
				<form:input class="form-control" placeholder="请输入异常表型" path="oth_abnormal_phenotype" />
			    <div class="dotted-line-nocolor"></div>
				<label for="oth_references">参考文献：</label>
				<form:input class="form-control" placeholder="请输入参考文献" path="oth_references" />
			    <div class="dotted-line-nocolor"></div>
		    </div>
         </div>
       </div>
     </div>
<!-- 不可改动，隐藏-->
  
	<c:if test="${genetic_data.animal_classification eq 'tra'}">         
		<script>$("#tab1").addClass("active");</script>
    </c:if>
  
	<c:if test="${genetic_data.animal_classification eq 'tar'}">         
		<script>$("#tab2").addClass("active");</script>
    </c:if>
  
	<c:if test="${genetic_data.animal_classification eq 'oth'}">         
		<script>$("#tab3").addClass("active");</script>
    </c:if>
	<c:if test="${empty genetic_data.animal_classification}">        
		<script>$("#tab1").addClass("active");</script>
	</c:if>
	 	<div style="display:none">
	 		<form:input path="id" readonly="true" />
		</div>