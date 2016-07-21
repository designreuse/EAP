<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 我的CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/wts_edit_strain_detail_style.css" />	
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
	<p></p>
		<form:input id="autopsy_classification" path="autopsy_classification" readonly="true" type="hidden" value="intestinal_length_data"/>
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
				肠道长度：
		</strong>
			<div class="second-embed">
				<label for="small_intestine">小肠（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入小肠" path="small_intestine" />
			    <div class="dotted-line-nocolor"></div>
				<label for="caecum">盲肠（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入盲肠" path="caecum" />
			    <div class="dotted-line-nocolor"></div>
				<label for="large_intesting">结肠（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入结肠" path="large_intesting" />
			    <div class="dotted-line-nocolor"></div>
				<label for="rectum">直肠（<font class="second-embed-unit">cm</font>）：</label>
			    <form:input class="form-control" placeholder="请输入直肠" path="rectum" />
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