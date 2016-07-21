<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 我的CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/wts_edit_strain_detail_style.css" />	
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
	<p></p>
		<form:input id="physiological_classification" path="physiological_classification" readonly="true" type="hidden" value="cardiovascular_physiological_data"/>
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
				心血管生理参数：
		</strong>
			<div class="second-embed">
				<label >血压：</label>												
					<div class="third-embed">
						<label for="systolic_pressure">收缩压（<font class="third-embed-unit">mmHg</font>）：</label>
					    <form:input class="form-control" placeholder="请输入收缩压" path="systolic_pressure" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="diastolic_pressure">舒张压（<font class="third-embed-unit">mmHg</font>）：</label>
					    <form:input class="form-control" placeholder="请输入舒张压" path="diastolic_pressure" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="heart_rate">心率（<font class="second-embed-unit">次/m</font>）：</label>
					    <form:input class="form-control" placeholder="请输入心率" path="heart_rate" />														    
					    <div class="dotted-line-nocolor"></div>
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