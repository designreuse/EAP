<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 我的CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/wts_edit_strain_detail_style.css" />	
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
	<p></p>
		<form:input id="autopsy_classification" path="autopsy_classification" readonly="true" type="hidden" value="body_measurement_data"/>
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
				体尺：
		</strong>
			<div class="second-embed">
				<label for="body_height">体高（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入体高" path="body_height" />
			    <div class="dotted-line-nocolor"></div>
				<label for="body_length">体长（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入体长" path="body_length" />
			    <div class="dotted-line-nocolor"></div>
				<label for="tail_length">尾长（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入尾长" path="tail_length" />
			    <div class="dotted-line-nocolor"></div>
				<label for="length_body_proportion">尾／体比：</label>
			    <form:input class="form-control" placeholder="请输入尾长" path="length_body_proportion" />
			    <div class="dotted-line-nocolor"></div>
				<label for="body_inclined_length">体斜长（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入体斜长" path="body_inclined_length" />
			    <div class="dotted-line-nocolor"></div>
				<label for="ear_length">耳长（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入耳长" path="ear_length" />
			    <div class="dotted-line-nocolor"></div>
				<label for="ear_width">耳宽（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入耳宽" path="ear_width" />
			    <div class="dotted-line-nocolor"></div>
				<label for="chest_width">胸宽（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入胸宽" path="chest_width" />
			    <div class="dotted-line-nocolor"></div>
				<label for="chest_depth">胸深（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入胸深" path="chest_depth" />
			    <div class="dotted-line-nocolor"></div>
				<label for="stem_length">躯干长（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入躯干长" path="stem_length" />
			    <div class="dotted-line-nocolor"></div>
				<label for="fore_limb_length">前肢长（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入前肢长" path="fore_limb_length" />
			    <div class="dotted-line-nocolor"></div>
				<label for="posterior_limb_length">后肢长（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入后肢长" path="posterior_limb_length" />
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