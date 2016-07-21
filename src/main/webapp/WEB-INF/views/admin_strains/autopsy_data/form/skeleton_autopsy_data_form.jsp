<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 我的CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/wts_edit_strain_detail_style.css" />	
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
	<p></p>
		<form:input id="autopsy_classification" path="autopsy_classification" readonly="true" type="hidden" value="skeleton_data"/>
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
				骨骼：
		</strong>
			<div class="second-embed">
				<label for="totality_skeleton">骨骼总数：</label>
			    <form:input class="form-control" placeholder="请输入骨骼总数" path="totality_skeleton" />
			    <div class="dotted-line-nocolor"></div>
				<label for="skull">头骨：</label>
			    <form:input class="form-control" placeholder="请输入头骨" path="skull" />
			    <div class="dotted-line-nocolor"></div>
				<label for="cervical_vertebra">颈椎：</label>
			    <form:input class="form-control" placeholder="请输入颈椎" path="cervical_vertebra" />
			    <div class="dotted-line-nocolor"></div>
				<label for="thoracalis_vertebra">胸椎：</label>
			    <form:input class="form-control" placeholder="请输入胸椎" path="thoracalis_vertebra" />
			    <div class="dotted-line-nocolor"></div>
				<label for="lumbalis_vertebra">腰椎：</label>
			    <form:input class="form-control" placeholder="请输入腰椎" path="lumbalis_vertebra" />
			    <div class="dotted-line-nocolor"></div>
				<label for="sacrales_vertebra">骶椎：</label>
			    <form:input class="form-control" placeholder="请输入骶椎" path="sacrales_vertebra" />
			    <div class="dotted-line-nocolor"></div>
				<label for="coccygeal_vertebra">尾椎：</label>
			    <form:input class="form-control" placeholder="请输入尾椎" path="coccygeal_vertebra" />
			    <div class="dotted-line-nocolor"></div>
				<label for="bird_sternum_length">龙骨长：</label>
			    <form:input class="form-control" placeholder="请输入龙骨长" path="bird_sternum_length" />
			    <div class="dotted-line-nocolor"></div>
				<label for="pelvis_width">股盆宽（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入股盆宽" path="pelvis_width" />
			    <div class="dotted-line-nocolor"></div>
				<label for="tibia_length">胫长（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入胫长" path="tibia_length" />
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