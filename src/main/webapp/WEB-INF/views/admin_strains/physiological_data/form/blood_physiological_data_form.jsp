<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 我的CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/wts_edit_strain_detail_style.css" />	
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
	<p></p>
		<form:input id="physiological_classification" path="physiological_classification" readonly="true" type="hidden" value="blood_physiological_data"/>
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
				<label for="blood_volume">血量：</label>
			    <form:input class="form-control" placeholder="请输入血量" path="blood_volume" />
			    <div class="dotted-line-nocolor"></div>
				<label for="plasma_volume">血浆量：</label>
			    <form:input class="form-control" placeholder="请输入血浆量" path="plasma_volume" />
			    <div class="dotted-line-nocolor"></div>
				<label >红细胞：</label>												
					<div class="third-embed">
						<label for="rbc">计数（<font>×10<span style="vertical-align:super; font-size:80%">6</span>/μL</font>）：</label>
					    <form:input class="form-control" placeholder="请输入计数" path="rbc" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="mcv">体积（<font class="third-embed-unit">fL</font>）：</label>
					    <form:input class="form-control" placeholder="请输入体积" path="mcv" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="mct">平均厚度（<font class="third-embed-unit">μm</font>）：</label>
					    <form:input class="form-control" placeholder="请输入平均厚度" path="mct" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="rdw">分布宽度（<font class="third-embed-unit">%CV</font>）：</label>
					    <form:input class="form-control" placeholder="请输入分布宽度" path="rdw" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="hb">血红蛋白（<font class="third-embed-unit">g/L</font>）：</label>
					    <form:input class="form-control" placeholder="请输入血红蛋白" path="hb" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="hct">压积（<font class="third-embed-unit">%</font>）：</label>
					    <form:input class="form-control" placeholder="请输入压积" path="hct" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="mch">血红蛋白含量（<font class="third-embed-unit">pG</font>）：</label>
					    <form:input class="form-control" placeholder="请输入血红蛋白含量" path="mch" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="mchc">血红蛋白浓度（<font class="third-embed-unit">g/L</font>）：</label>
					    <form:input class="form-control" placeholder="请输入血红蛋白浓度" path="mchc" />														    
					    <div class="dotted-line-nocolor"></div>
					</div>
				<label >白细胞：</label>												
					<div class="third-embed">
						<label for="wbc">计数（<font class="third-embed-unit">×10<span style="vertical-align:super; font-size:80%">3</span>/μL</font>）：</label>
					    <form:input class="form-control" placeholder="请输入计数" path="wbc" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="w_ne">嗜中性白细胞（<font class="third-embed-unit">%</font>）：</label>
					    <form:input class="form-control" placeholder="请输入嗜中性白细胞" path="w_ne" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="eo">嗜酸性白细胞（<font class="third-embed-unit">%</font>）：</label>
					    <form:input class="form-control" placeholder="请输入嗜酸性白细胞" path="eo" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="ba">嗜硷性白细胞（<font class="third-embed-unit">%</font>）：</label>
					    <form:input class="form-control" placeholder="请输入嗜酸性白细胞" path="ba" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="ly">淋巴细胞（<font class="third-embed-unit">%</font>）：</label>
					    <form:input class="form-control" placeholder="请输入淋巴细胞" path="ly" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="mo">单核细胞（<font class="third-embed-unit">%</font>）：</label>
					    <form:input class="form-control" placeholder="请输入单核细胞" path="mo" />														    
					    <div class="dotted-line-nocolor"></div>
					</div>
				<label >血小板：</label>												
					<div class="third-embed">
						<label for="plt">计数（<font class="third-embed-unit">×10<span style="vertical-align:super; font-size:80%">3</span>/μL</font>）：</label>
					    <form:input class="form-control" placeholder="请输入计数" path="plt" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="mpv">平均容积（<font class="third-embed-unit">fL</font>）：</label>
					    <form:input class="form-control" placeholder="请输入平均容积" path="mpv" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="pdw">分布宽度（<font class="third-embed-unit">%</font>）：</label>
					    <form:input class="form-control" placeholder="请输入平均容积" path="pdw" />														    
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