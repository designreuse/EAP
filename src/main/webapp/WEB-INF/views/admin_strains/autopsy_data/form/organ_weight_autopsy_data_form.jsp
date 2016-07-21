<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 我的CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/wts_edit_strain_detail_style.css" />	
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
	<p></p>
		<form:input id="autopsy_classification" path="autopsy_classification" readonly="true" type="hidden" value="organ_weight_data"/>
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
				脏器重量：
		</strong>
			<div class="second-embed">
				<label for="heart">心（<font class="second-embed-unit">mg</font>）：</label>
			    <form:input class="form-control" placeholder="请输入心" path="heart" />
			    <div class="dotted-line-nocolor"></div>
				<label for="lung">肺（<font class="second-embed-unit">mg</font>）：</label>
			    <form:input class="form-control" placeholder="请输入肺" path="lung" />
			    <div class="dotted-line-nocolor"></div>
				<label for="liver">肝（<font class="second-embed-unit">mg</font>）：</label>
			    <form:input class="form-control" placeholder="请输入肝" path="liver" />
			    <div class="dotted-line-nocolor"></div>
				<label for="spleen">脾（<font class="second-embed-unit">mg</font>）：</label>
			    <form:input class="form-control" placeholder="请输入脾" path="spleen" />
			    <div class="dotted-line-nocolor"></div>
				<label for="kidney">肾（<font class="second-embed-unit">mg</font>）：</label>
			    <form:input class="form-control" placeholder="请输入肾" path="kidney" />
			    <div class="dotted-line-nocolor"></div>
				<label for="brain">脑（<font class="second-embed-unit">mg</font>）：</label>
			    <form:input class="form-control" placeholder="请输入脑" path="brain" />
			    <div class="dotted-line-nocolor"></div>
				<label for="thyroid">甲状腺（<font class="second-embed-unit">mg</font>）：</label>
			    <form:input class="form-control" placeholder="请输入甲状腺" path="thyroid" />
			    <div class="dotted-line-nocolor"></div>
				<label for="renicapsule">肾上腺（<font class="second-embed-unit">mg</font>）：</label>
			    <form:input class="form-control" placeholder="请输入肾上腺" path="renicapsule" />
			    <div class="dotted-line-nocolor"></div>
				<label for="oarium">卵巢（<font class="second-embed-unit">mg</font>）：</label>
			    <form:input class="form-control" placeholder="请输入卵巢" path="oarium" />
			    <div class="dotted-line-nocolor"></div>
				<label for="testicle">睾丸（<font class="second-embed-unit">mg</font>）：</label>
			    <form:input class="form-control" placeholder="请输入睾丸" path="testicle" />
			    <div class="dotted-line-nocolor"></div>
				<label for="thymus_gland">胸腺（<font class="second-embed-unit">mg</font>）：</label>
			    <form:input class="form-control" placeholder="请输入胸腺" path="thymus_gland" />
			    <div class="dotted-line-nocolor"></div>
				<label for="bursa_of_fabricius">法氏囊（<font class="second-embed-unit">mg</font>）：</label>
			    <form:input class="form-control" placeholder="请输入法氏囊" path="bursa_of_fabricius" />
			    <div class="dotted-line-nocolor"></div>
			</div>	
	<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	java.util.Date currentTime = new java.util.Date();
	String str_date1 = formatter.format(currentTime); 
	%>
	<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>
	<p></p>
	<!-- 不可改动，隐藏-->
		<form:input path="id" readonly="true" type="hidden"/>