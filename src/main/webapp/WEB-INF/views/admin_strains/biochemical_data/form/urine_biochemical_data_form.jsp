<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 我的CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/wts_edit_strain_detail_style.css" />	
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
	<p></p>
		<form:input id="biochemical_classification" path="biochemical_classification" readonly="true" type="hidden" value="urine_biochemical_data"/>
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
				血液生理参数：
		</strong>
			<div class="second-embed">
				<label for="urine_ph">尿液pH</label>
			    <form:input class="form-control" placeholder="请输入尿液pH" path="urine_ph" />
			    <div class="dotted-line-nocolor"></div>
				<label for="up">尿蛋白</label>
			    <form:input class="form-control" placeholder="请输入尿蛋白" path="up" />
			    <div class="dotted-line-nocolor"></div>
				<label for="ua">尿酸</label>
			    <form:input class="form-control" placeholder="请输入尿酸" path="ua" />
			    <div class="dotted-line-nocolor"></div>
				<label>尿电解质：</label>												
					<div class="third-embed">
						<label for="urine_na">Na<span style="vertical-align:super; font-size:80%">+</span>（<font class="third-embed-unit">mmol/L</font>）：</label>
					    <form:input class="form-control" placeholder="请输入Na" path="urine_na" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="urine_k">K<span style="vertical-align:super; font-size:80%">+</span>（<font class="third-embed-unit">mmol/L</font>）：</label>
					    <form:input class="form-control" placeholder="请输入K" path="urine_k" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="urine_ca">Ca<span style="vertical-align:super; font-size:80%">2+</span>（<font class="third-embed-unit">mmol/L</font>）：</label>
					    <form:input class="form-control" placeholder="请输入Ca" path="urine_ca" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="urine_mg">Mg<span style="vertical-align:super; font-size:80%">2+</span>（<font class="third-embed-unit">mmol/L</font>）：</label>
					    <form:input class="form-control" placeholder="请输入Mg" path="urine_mg" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="urine_cl">Cl<span style="vertical-align:super; font-size:80%">-</span>（<font class="third-embed-unit">mmol/L</font>）：</label>
					    <form:input class="form-control" placeholder="请输入Cl" path="urine_cl" />														    
					    <div class="dotted-line-nocolor"></div>
					</div>
				<label for="specific_weight">比重</label>
			    <form:input class="form-control" placeholder="请输入比重" path="specific_weight" />
			    <div class="dotted-line-nocolor"></div>
				<label for="upd">尿量（<font class="second-embed-unit">ml/g/天</font>）</label>
			    <form:input class="form-control" placeholder="请输入尿量" path="upd" />
			    <div class="dotted-line-nocolor"></div>
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