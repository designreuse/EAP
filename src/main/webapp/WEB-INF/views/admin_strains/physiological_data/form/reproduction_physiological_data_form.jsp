<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 我的CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/wts_edit_strain_detail_style.css" />	
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
	<p></p>
		<form:input id="physiological_classification" path="physiological_classification" readonly="true" type="hidden" value="reproduction_physiological_data"/>
		<form:input path="strain_id.id" value="${strain.id}" readonly="true" type="hidden"/>	
		<div class="callout callout-gray" >		
			<strong>
					测定组数据：
			</strong>
			<div class="second-embed">
				<label for="age">年龄：</label>
			    <form:input class="form-control" placeholder="请输入年龄" path="age" />
			    <div class="dotted-line-nocolor"></div>
				<label for="sex">性别：</label>
			    <form:input class="form-control" placeholder="请输入性别" path="sex" />
				<label for="number">测定数量：</label>
			    <form:input class="form-control" placeholder="请输入测定数量" path="number" />
		    </div>
							</div>
		<strong>
				生殖生理参数：
		</strong>
			<div class="second-embed">
				<label >性成熟：</label>												
					<div class="third-embed">
						<label for="first_estrus">初次发情（<font class="third-embed-unit">d</font>）：</label>
					    <form:input class="form-control" placeholder="请输入初次发情" path="first_estrus" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="estrus">发情期（<font class="third-embed-unit">h</font>）：</label>
					    <form:input class="form-control" placeholder="请输入发情期" path="estrus" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="estrus_period">发情周期（<font class="third-embed-unit">d</font>）：</label>
					    <form:input class="form-control" placeholder="请输入发情周期" path="estrus_period" />														    
					    <div class="dotted-line-nocolor"></div>
					 </div>  					    
						<label for="estrus_season">发情季节：</label>
					    <form:input class="form-control" placeholder="请输入发情季节" path="estrus_season" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="body_maturation">体成熟（<font class="third-embed-unit">d</font>）：</label>
					    <form:input class="form-control" placeholder="请输入体成熟" path="body_maturation" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="gestation_period">妊娠期（<font class="third-embed-unit">d</font>）：</label>
					    <form:input class="form-control" placeholder="请输入妊娠期" path="gestation_period" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="suckling_period">哺乳期（<font class="third-embed-unit">d</font>）：</label>
					    <form:input class="form-control" placeholder="请输入哺乳期" path="suckling_period" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="production_index">生产指数：</label>
					    <form:input class="form-control" placeholder="请输入生产指数" path="production_index" />														    
					    <div class="dotted-line-nocolor"></div>
					
				<label >精子：</label>												
					<div class="third-embed">
						<label for="sperm_concentration">计数（<font class="third-embed-unit">×10<span style="vertical-align:super; font-size:80%">6</span>/mL</font>）：</label>
					    <form:input class="form-control" placeholder="请输入计数" path="sperm_concentration" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="sperm_survival_time">存活时间（<font class="third-embed-unit">d</font>）：</label>
					    <form:input class="form-control" placeholder="请输入存活时间" path="sperm_survival_time" />														    
					    <div class="dotted-line-nocolor"></div>
					</div>
				<label >卵子：</label>												
					<div class="third-embed">
						<label for="ovum_size">大小：</label>
					    <form:input class="form-control" placeholder="请输入大小" path="ovum_size" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="ovum_number">数量：</label>
					    <form:input class="form-control" placeholder="请输入数量" path="ovum_number" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="ovulation_period">排卵时间（<font class="third-embed-unit">h</font>）：</label>
					    <form:input class="form-control" placeholder="请输入排卵时间" path="ovulation_period" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="fertilization_ability">受精能力（<font class="third-embed-unit">h</font>）：</label>
					    <form:input class="form-control" placeholder="请输入受精能力" path="fertilization_ability" />														    
					    <div class="dotted-line-nocolor"></div>
					</div>
				<label>产蛋性能：</label>												
					<div class="third-embed">
						<label for="lay_eggs_age">开产日龄（<font class="third-embed-unit">d</font>）：</label>
					    <form:input class="form-control" placeholder="请输入开产日龄" path="lay_eggs_age" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="lay_eggs_weight">开产体重（<font class="third-embed-unit">kg</font>）：</label>
					    <form:input class="form-control" placeholder="请输入开产体重" path="lay_eggs_weight" />														    
					    <div class="dotted-line-nocolor"></div>
					</div>
				<label>蛋的品质：</label>												
					<div class="third-embed">
						<label for="egg_weight">蛋重（<font class="third-embed-unit">g</font>）：</label>
					    <form:input class="form-control" placeholder="请输入蛋重" path="egg_weight" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="shell_thickness">蛋壳厚度（<font class="third-embed-unit">kg</font>）：</label>
					    <form:input class="form-control" placeholder="请输入蛋壳厚度" path="shell_thickness" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="egg_type_index">蛋型指数（<font class="third-embed-unit">kg</font>）：</label>
					    <form:input class="form-control" placeholder="请输入蛋型指数" path="egg_type_index" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="haugh_unit">哈氏单位（<font class="third-embed-unit">kg</font>）：</label>
					    <form:input class="form-control" placeholder="请输入哈氏单位" path="haugh_unit" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="egg_relative_density">蛋相对密度（<font class="third-embed-unit">kg</font>）：</label>
					    <form:input class="form-control" placeholder="请输入蛋相对密度" path="egg_relative_density" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="egg_yolk_ratio">蛋黄比色级别（<font class="third-embed-unit">kg</font>）：</label>
					    <form:input class="form-control" placeholder="请输入蛋黄比色级别" path="egg_yolk_ratio" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="fertilization_rate">受精率（<font class="third-embed-unit">kg</font>）：</label>
					    <form:input class="form-control" placeholder="请输入受精率" path="fertilization_rate" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="hatchability_of_fertile_eggs">受精蛋孵化率（<font class="third-embed-unit">kg</font>）：</label>
					    <form:input class="form-control" placeholder="请输入受精蛋孵化率" path="hatchability_of_fertile_eggs" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="shell_color">蛋壳颜色（<font class="third-embed-unit">kg</font>）：</label>
					    <form:input class="form-control" placeholder="请输入蛋壳颜色" path="shell_color" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="brood_stage">孵化期（<font class="third-embed-unit">kg</font>）：</label>
					    <form:input class="form-control" placeholder="请输入孵化期" path="brood_stage" />														    
					    <div class="dotted-line-nocolor"></div>
					</div>
					
				</div>
				</div>
		</div>				
	<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	java.util.Date currentTime = new java.util.Date();
	String str_date1 = formatter.format(currentTime); 
	%>
	<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>
	<p></p>
</div>
	<!-- 不可改动，隐藏-->
	<div style="display:none">
		<form:input path="id" readonly="true" />
</div>