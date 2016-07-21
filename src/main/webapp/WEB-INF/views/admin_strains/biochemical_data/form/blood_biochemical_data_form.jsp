<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 我的CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/wts_edit_strain_detail_style.css" />	
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>
	<p></p>
		<form:input id="biochemical_classification" path="biochemical_classification" readonly="true" type="hidden" value="blood_biochemical_data"/>
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
				<label for="blood_ph">血液pH</label>
			    <form:input class="form-control" placeholder="请输入血液pH" path="blood_ph" />
			    <div class="dotted-line-nocolor"></div>
				<label >血电解质：</label>												
					<div class="third-embed">
						<label for="blood_na">Na<span style="vertical-align:super; font-size:80%">+</span>（<font class="third-embed-unit">mmol/L</font>）：</label>
					    <form:input class="form-control" placeholder="请输入Na" path="blood_na" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="blood_k">K<span style="vertical-align:super; font-size:80%">+</span>（<font class="third-embed-unit">mmol/L</font>）：</label>
					    <form:input class="form-control" placeholder="请输入K" path="blood_k" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="blood_ca">Ca<span style="vertical-align:super; font-size:80%">2+</span>（<font class="third-embed-unit">mmol/L</font>）：</label>
					    <form:input class="form-control" placeholder="请输入Ca" path="blood_ca" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="blood_mg">Mg<span style="vertical-align:super; font-size:80%">2+</span>（<font class="third-embed-unit">mmol/L</font>）：</label>
					    <form:input class="form-control" placeholder="请输入Mg" path="blood_mg" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="blood_cl">Cl<span style="vertical-align:super; font-size:80%">-</span>（<font class="third-embed-unit">mmol/L</font>）：</label>
					    <form:input class="form-control" placeholder="请输入Cl" path="blood_cl" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="blood_p">P<span style="vertical-align:super; font-size:80%">+</span>（<font class="third-embed-unit">mmol/L</font>）：</label>
					    <form:input class="form-control" placeholder="请输入P" path="blood_p" />														    
					    <div class="dotted-line-nocolor"></div>
						<label for="blood_fe">Fe<span style="vertical-align:super; font-size:80%">2+</span>（<font class="third-embed-unit">mmol/L</font>）：</label>
					    <form:input class="form-control" placeholder="请输入Fe" path="blood_fe" />															    
					    <div class="dotted-line-nocolor"></div>
					</div>
				<label for="ast">谷草转氨酶（<font class="second-embed-unit">U/L</font>）</label>
			    <form:input class="form-control" placeholder="请输入谷草转氨酶" path="ast" />
			    <div class="dotted-line-nocolor"></div>
				<label for="alt">谷丙转氨酶（<font class="second-embed-unit">U/L</font>）</label>
			    <form:input class="form-control" placeholder="请输入谷丙转氨酶" path="alt" />
			    <div class="dotted-line-nocolor"></div>
				<label for="alp">碱性磷酸酶（<font class="second-embed-unit">U/L</font>）</label>
			    <form:input class="form-control" placeholder="请输入碱性磷酸酶" path="alp" />
			    <div class="dotted-line-nocolor"></div>
				<label for="ldh">乳酸脱氢酶（<font class="second-embed-unit">U/L</font>）</label>
			    <form:input class="form-control" placeholder="请输入乳酸脱氢酶" path="ldh" />
			    <div class="dotted-line-nocolor"></div>
				<label for="cre">肌苷（<font class="second-embed-unit">mmol/L</font>）</label>
			    <form:input class="form-control" placeholder="请输入肌苷" path="cre" />
			    <div class="dotted-line-nocolor"></div>
				<label for="bun">尿素氮（<font class="second-embed-unit">mmol/L</font>）</label>
			    <form:input class="form-control" placeholder="请输入尿素氮" path="bun" />
			    <div class="dotted-line-nocolor"></div>
				<label for="tch">总胆固醇（<font class="second-embed-unit">mmol/L</font>）</label>
			    <form:input class="form-control" placeholder="请输入总胆固醇" path="tch" />
			    <div class="dotted-line-nocolor"></div>
				<label for="tp">血清总蛋白（<font class="second-embed-unit">g/L</font>）</label>
			    <form:input class="form-control" placeholder="请输入血清总蛋白" path="tp" />
			    <div class="dotted-line-nocolor"></div>
				<label for="alb">白蛋白（<font class="second-embed-unit">g/L</font>）</label>
			    <form:input class="form-control" placeholder="请输入白蛋白" path="alb" />
			    <div class="dotted-line-nocolor"></div>
				<label for="tg">甘油三脂（<font class="second-embed-unit">mmol/L</font>）</label>
			    <form:input class="form-control" placeholder="请输入甘油三脂" path="tg" />
			    <div class="dotted-line-nocolor"></div>
				<label for="glu">血糖（<font class="second-embed-unit">mmol/L</font>）</label>
			    <form:input class="form-control" placeholder="请输入血糖" path="glu" />
			    <div class="dotted-line-nocolor"></div>
				<label for="progesterone">孕酮（<font class="second-embed-unit">ng/L</font>）</label>
			    <form:input class="form-control" placeholder="请输入孕酮" path="progesterone" />
			    <div class="dotted-line-nocolor"></div>
				<label for="total_bilirubin">总胆红素（<font class="second-embed-unit">μmol/L</font>）</label>
			    <form:input class="form-control" placeholder="请输入总胆红素" path="total_bilirubin" />
			    <div class="dotted-line-nocolor"></div>
				<label for="c_hdl">高密度脂蛋白胆固醇（<font class="second-embed-unit">mmol/L</font>）</label>
			    <form:input class="form-control" placeholder="请输入高密度脂蛋白胆固醇" path="c_hdl" />
			    <div class="dotted-line-nocolor"></div>
				<label for="c_ldl">低密度脂蛋白胆固醇（<font class="second-embed-unit">mmol/L</font>）</label>
			    <form:input class="form-control" placeholder="请输入低密度脂蛋白胆固醇" path="c_ldl" />
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