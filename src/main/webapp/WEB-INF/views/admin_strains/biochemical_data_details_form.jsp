<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<div class="dotted-line-nocolor"></div>
	<strong>血液生化参数：</strong>
	<div class="btn btn-social btn-xs btn-success" onclick="add_blood_biochemical_data_layer('${strain.id}')" >
		<i class="fa fa-plus"></i>添加血液生化参数
	</div>
	<p></p>
		<c:forEach items="${strain.biochemical_data}" var="biochemical_data">
			<c:if test="${biochemical_data.biochemical_classification eq 'blood_biochemical_data'}">
				<div id="biochemical${biochemical_data.id}" class="physiological_data-select">【测定组】年龄:${biochemical_data.age} &nbsp;|&nbsp;性别:${biochemical_data.sex} &nbsp;|&nbsp;测定数量:${biochemical_data.number}</div>  
		    		<div id="text_biochemical${biochemical_data.id}" class="physiological_data">
						<div class="dotted-line-nocolor"></div>
						<c:if test="${!empty biochemical_data.blood_ph}">
							<font class="second-embed">血液pH：</font>${biochemical_data.blood_ph}<div class="dotted-line-nocolor"></div>
						</c:if>
						
						<c:if test="${!empty biochemical_data.blood_na||!empty biochemical_data.blood_k||!empty biochemical_data.blood_ca||!empty biochemical_data.blood_mg||!empty biochemical_data.blood_cl||!empty biochemical_data.blood_p||!empty biochemical_data.blood_fe}">
							<font class="second-embed">血电解质：</font><div class="dotted-line-nocolor"></div>
						</c:if>
							<c:if test="${!empty biochemical_data.blood_na}">
								<font class="third-embed">Na<span style="vertical-align:super; font-size:80%">+</span>：</font>${biochemical_data.blood_na}<font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
							</c:if>
							<c:if test="${!empty biochemical_data.blood_k}">
								<font class="third-embed">K<span style="vertical-align:super; font-size:80%">+</span>：</font>${biochemical_data.blood_k}<font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
							</c:if>
							<c:if test="${!empty biochemical_data.blood_ca}">
								<font class="third-embed">Ca<span style="vertical-align:super; font-size:80%">2+</span>：</font>${biochemical_data.blood_ca}<font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
							</c:if>
							<c:if test="${!empty biochemical_data.blood_mg}">
								<font class="third-embed">Mg<span style="vertical-align:super; font-size:80%">2+</span>：</font>${biochemical_data.blood_mg}<font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
							</c:if>
							<c:if test="${!empty biochemical_data.blood_cl}">
								<font class="third-embed">Cl<span style="vertical-align:super; font-size:80%">-</span>：</font>${biochemical_data.blood_cl}<font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
							</c:if>
							<c:if test="${!empty biochemical_data.blood_p}">
								<font class="third-embed">P<span style="vertical-align:super; font-size:80%">+</span>：</font>${biochemical_data.blood_p}<font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
							</c:if>
							<c:if test="${!empty biochemical_data.blood_fe}">
								<font class="third-embed">Fe<span style="vertical-align:super; font-size:80%">2+</span>：</font>${biochemical_data.blood_fe}<font class="third-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
							</c:if>
						<c:if test="${!empty biochemical_data.ast}">
							<font class="second-embed">谷草转氨酶：</font>${biochemical_data.ast}<font class="second-embed-unit">U/L</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty biochemical_data.alt}">
							<font class="second-embed">谷丙转氨酶：</font>${biochemical_data.alt}<font class="second-embed-unit">U/L</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty biochemical_data.alp}">
							<font class="second-embed">碱性磷酸酶：</font>${biochemical_data.alp}<font class="second-embed-unit">U/L</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty biochemical_data.ldh}">
							<font class="second-embed">乳酸脱氢酶：</font>${biochemical_data.ldh}<font class="second-embed-unit">U/L</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty biochemical_data.cre}">
							<font class="second-embed">肌苷：</font>${biochemical_data.cre}<font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty biochemical_data.bun}">
							<font class="second-embed">尿素氮：</font>${biochemical_data.bun}<font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty biochemical_data.tch}">
							<font class="second-embed">总胆固醇：</font>${biochemical_data.tch}<font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty biochemical_data.tp}">
							<font class="second-embed">血清总蛋白：</font>${biochemical_data.tp}<font class="second-embed-unit">g/L</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty biochemical_data.alb}">
							<font class="second-embed">白蛋白：</font>${biochemical_data.alb}<font class="second-embed-unit">g/L</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty biochemical_data.tg}">
							<font class="second-embed">甘油三脂：</font>${biochemical_data.tg}<font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty biochemical_data.glu}">
							<font class="second-embed">血糖：</font>${biochemical_data.glu}<font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty biochemical_data.progesterone}">
							<font class="second-embed">孕酮：</font>${biochemical_data.progesterone}<font class="second-embed-unit">ng/mL</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty biochemical_data.total_bilirubin}">
							<font class="second-embed">总胆红素：</font>${biochemical_data.total_bilirubin}<font class="second-embed-unit">μmol/L</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty biochemical_data.c_hdl}">
							<font class="second-embed">高密度脂蛋白胆固醇：</font>${biochemical_data.c_hdl}<font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty biochemical_data.c_ldl}">
							<font class="second-embed">低密度脂蛋白胆固醇：</font>${biochemical_data.c_ldl}<font class="second-embed-unit">mmol/L</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<div class="btn btn-social btn-xs btn-warning" onclick="edit_biochemical_data_layer('${strain.id}','${biochemical_data.id}')" >
							<i class="fa fa-edit"></i>编辑该血液生化参数
						</div>
						<div class="btn btn-social btn-xs btn-danger" onclick="remove_biochemical_data_layer('${biochemical_data.id}')" >
							<i class="fa fa-edit"></i>删除该血液生化参数
						</div>
							<br/><div class="dotted-line"></div>
						</div>
					<p></p>	
					</c:if>
		</c:forEach>	
		<p></p><strong>尿生化参数：</strong>
		<div class="btn btn-social btn-xs btn-success" onclick="add_urine_biochemical_data_layer('${strain.id}')" >
			<i class="fa fa-plus"></i>添加尿生化参数
		</div>
		<p></p>
		<c:forEach items="${strain.biochemical_data}" var="biochemical_data">
			<c:if test="${biochemical_data.biochemical_classification eq 'urine_biochemical_data'}">
			<div id="biochemical${biochemical_data.id}" class="physiological_data-select">【测定组】年龄:${biochemical_data.age} &nbsp;|&nbsp;性别:${biochemical_data.sex} &nbsp;|&nbsp;测定数量:${biochemical_data.number}</div>  
				<div id="text_biochemical${biochemical_data.id}" class="physiological_data">
				<div class="dotted-line-nocolor"></div>
				<c:if test="${!empty biochemical_data.urine_ph}">
					<font class="second-embed">尿液pH：</font>${biochemical_data.urine_ph}<div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty biochemical_data.up}">
					<font class="second-embed">尿蛋白：</font>${biochemical_data.up}<font class="second-embed-unit">ng/mL</font><div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty biochemical_data.ua}">
					<font class="second-embed">尿酸：</font>${biochemical_data.ua}<font class="second-embed-unit">ng/mL</font><div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty biochemical_data.urine_na||!empty biochemical_data.urine_k||!empty biochemical_data.urine_ca||!empty biochemical_data.urine_mg||!empty biochemical_data.urine_cl}">
					<font class="second-embed">尿电解质：</font><div class="dotted-line-nocolor"></div>
				</c:if>
					<c:if test="${!empty biochemical_data.urine_na}">
						<font class="third-embed">Na<span style="vertical-align:super; font-size:80%">+</span>：</font>${biochemical_data.urine_na}<font class="third-embed-unit">mg/dL</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty biochemical_data.urine_k}">
						<font class="third-embed">K<span style="vertical-align:super; font-size:80%">+</span>：</font>${biochemical_data.urine_k}<font class="third-embed-unit">mg/dL</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty biochemical_data.urine_ca}">
						<font class="third-embed">Ca<span style="vertical-align:super; font-size:80%">2+</span>：</font>${biochemical_data.urine_ca}<font class="third-embed-unit">mg/dL</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty biochemical_data.urine_mg}">
						<font class="third-embed">Mg<span style="vertical-align:super; font-size:80%">2+</span>：</font>${biochemical_data.urine_mg}<font class="third-embed-unit">mg/dL</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty biochemical_data.urine_cl}">
						<font class="third-embed">Cl<span style="vertical-align:super; font-size:80%">-</span>：</font>${biochemical_data.urine_cl}<font class="third-embed-unit">mg/dL</font><div class="dotted-line-nocolor"></div>
					</c:if>
				<c:if test="${!empty biochemical_data.specific_weight}">
					<font class="second-embed">比重：</font>${biochemical_data.specific_weight}<div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty biochemical_data.upd}">
					<font class="second-embed">尿量：</font>${biochemical_data.upd}<font class="second-embed-unit">ml/g/天</font><div class="dotted-line-nocolor"></div>
				</c:if>	
				<div class="btn btn-social btn-xs btn-warning" onclick="edit_biochemical_data_layer('${strain.id}','${biochemical_data.id}')" >
					<i class="fa fa-edit"></i>编辑该尿生化参数
				</div>
				<div class="btn btn-social btn-xs btn-danger" onclick="remove_biochemical_data_layer('${biochemical_data.id}')" >
					<i class="fa fa-edit"></i>删除该尿生化参数
				</div>								
				<br/><div class="dotted-line"></div>
				<p></p>	
			</div>
		</c:if>
</c:forEach>	
		
