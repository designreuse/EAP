<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<div class="dotted-line-nocolor"></div>
	<strong>体尺解剖参数：</strong>
	<div class="btn btn-social btn-xs btn-success" onclick="add_body_measurement_autopsy_data_layer('${strain.id}')" >
		<i class="fa fa-plus"></i>添加体尺解剖参数
	</div>
	<p></p>
		<c:forEach items="${strain.autopsy_data}" var="autopsy_data">
			<c:if test="${autopsy_data.autopsy_classification eq 'body_measurement_data'}">
				<div id="autopsy${autopsy_data.id}" class="physiological_data-select">【测定组】年龄:${autopsy_data.age} &nbsp;|&nbsp;性别:${autopsy_data.sex} &nbsp;|&nbsp;测定数量:${autopsy_data.number}</div>  
					<div id="text_autopsy${autopsy_data.id}" class="physiological_data">
						<div class="dotted-line-nocolor"></div>
						<c:if test="${!empty autopsy_data.body_height}">
							<font class="second-embed">体高：</font>${autopsy_data.body_height}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty autopsy_data.body_length}">
							<font class="second-embed">体长：</font>${autopsy_data.body_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty autopsy_data.tail_length}">
							<font class="second-embed">尾长：</font>${autopsy_data.tail_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty autopsy_data.length_body_proportion}">
							<font class="second-embed">尾／体比：</font>${autopsy_data.length_body_proportion}<div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty autopsy_data.body_inclined_length}">
							<font class="second-embed">体斜长：</font>${autopsy_data.body_inclined_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty autopsy_data.ear_length}">
							<font class="second-embed">耳长：</font>${autopsy_data.ear_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty autopsy_data.ear_width}">
							<font class="second-embed">耳宽：</font>${autopsy_data.ear_width}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty autopsy_data.chest_width}">
							<font class="second-embed">胸宽：</font>${autopsy_data.chest_width}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty autopsy_data.chest_depth}">
							<font class="second-embed">胸深：</font>${autopsy_data.chest_depth}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty autopsy_data.stem_length}">
							<font class="second-embed">躯干长：</font>${autopsy_data.stem_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty autopsy_data.fore_limb_length}">
							<font class="second-embed">前肢长：</font>${autopsy_data.fore_limb_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty autopsy_data.posterior_limb_length}">
							<font class="second-embed">后肢长：</font>${autopsy_data.posterior_limb_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<div class="btn btn-social btn-xs btn-warning" onclick="edit_autopsy_data_layer('${strain.id}','${autopsy_data.id}')" >
							<i class="fa fa-edit"></i>编辑该体尺解剖参数
						</div>
						<div class="btn btn-social btn-xs btn-danger" onclick="remove_autopsy_data_layer('${autopsy_data.id}')" >
							<i class="fa fa-edit"></i>删除该体尺解剖参数
						</div>
							<br/><div class="dotted-line"></div>
					</div>
					<p></p>	
			</c:if>
		</c:forEach>	
		<p></p><strong>骨骼解剖参数：</strong>
		<div class="btn btn-social btn-xs btn-success" onclick="add_skeleton_autopsy_data_layer('${strain.id}')" >
			<i class="fa fa-plus"></i>添加骨骼解剖参数
		</div>
		<p></p>
		<c:forEach items="${strain.autopsy_data}" var="autopsy_data">
			<c:if test="${autopsy_data.autopsy_classification eq 'skeleton_data'}">
				<div id="autopsy${autopsy_data.id}" class="physiological_data-select">【测定组】年龄:${autopsy_data.age} &nbsp;|&nbsp;性别:${autopsy_data.sex} &nbsp;|&nbsp;测定数量:${autopsy_data.number}</div>  
				<div id="text_autopsy${autopsy_data.id}" class="physiological_data">
					<div class="dotted-line-nocolor"></div>
					<c:if test="${!empty autopsy_data.totality_skeleton}">
						<font class="second-embed">骨骼总数：</font>${autopsy_data.totality_skeleton}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.skull}">
						<font class="second-embed">头骨：</font>${autopsy_data.skull}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.cervical_vertebra}">
						<font class="second-embed">颈椎：</font>${autopsy_data.cervical_vertebra}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.thoracalis_vertebra}">
						<font class="second-embed">胸椎：</font>${autopsy_data.thoracalis_vertebra}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.lumbalis_vertebra}">
						<font class="second-embed">腰椎：</font>${autopsy_data.lumbalis_vertebra}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.sacrales_vertebra}">
						<font class="second-embed">骶椎：</font>${autopsy_data.sacrales_vertebra}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.coccygeal_vertebra}">
						<font class="second-embed">尾椎：</font>${autopsy_data.coccygeal_vertebra}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.bird_sternum_length}">
						<font class="second-embed">龙骨长：</font>${autopsy_data.bird_sternum_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.pelvis_width}">
						<font class="second-embed">股盆宽：</font>${autopsy_data.pelvis_width}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.tibia_length}">
						<font class="second-embed">胫长：</font>${autopsy_data.tibia_length}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<div class="btn btn-social btn-xs btn-warning" onclick="edit_autopsy_data_layer('${strain.id}','${autopsy_data.id}')" >
						<i class="fa fa-edit"></i>编辑该骨骼解剖参数
					</div>
					<div class="btn btn-social btn-xs btn-danger" onclick="remove_autopsy_data_layer('${autopsy_data.id}')" >
						<i class="fa fa-edit"></i>删除该骨骼解剖参数
					</div>								
					<br/><div class="dotted-line"></div>
				</div>
				<p></p>	
			</c:if>
		</c:forEach>		
		<p></p><strong>脏器重量参数：</strong>
		<div class="btn btn-social btn-xs btn-success" onclick="add_organ_weight_autopsy_data_layer('${strain.id}')" >
			<i class="fa fa-plus"></i>添加脏器重量参数
		</div>
		<p></p>
		<c:forEach items="${strain.autopsy_data}" var="autopsy_data">
			<c:if test="${autopsy_data.autopsy_classification eq 'organ_weight_data'}">
				<div id="autopsy${autopsy_data.id}" class="physiological_data-select">【测定组】年龄:${autopsy_data.age} &nbsp;|&nbsp;性别:${autopsy_data.sex} &nbsp;|&nbsp;测定数量:${autopsy_data.number}</div>  
					<div id="text_autopsy${autopsy_data.id}" class="physiological_data">
					<div class="dotted-line-nocolor"></div>
					<c:if test="${!empty autopsy_data.heart}">
						<font class="second-embed">心：</font>${autopsy_data.heart}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.lung}">
						<font class="second-embed">肺：</font>${autopsy_data.lung}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.liver}">
						<font class="second-embed">肝：</font>${autopsy_data.liver}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.spleen}">
						<font class="second-embed">脾：</font>${autopsy_data.spleen}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.kidney}">
						<font class="second-embed">肾：</font>${autopsy_data.kidney}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.brain}">
						<font class="second-embed">脑：</font>${autopsy_data.brain}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.thyroid}">
						<font class="second-embed">甲状腺：</font>${autopsy_data.thyroid}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.renicapsule}">
						<font class="second-embed">肾上腺：</font>${autopsy_data.renicapsule}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.oarium}">
						<font class="second-embed">卵巢：</font>${autopsy_data.oarium}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.testicle}">
						<font class="second-embed">睾丸：</font>${autopsy_data.testicle}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.thymus_gland}">
						<font class="second-embed">胸腺：</font>${autopsy_data.thymus_gland}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.bursa_of_fabricius}">
						<font class="second-embed">法氏囊：</font>${autopsy_data.bursa_of_fabricius}<font class="second-embed-unit">mg</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<div class="btn btn-social btn-xs btn-warning" onclick="edit_autopsy_data_layer('${strain.id}','${autopsy_data.id}')" >
						<i class="fa fa-edit"></i>编辑该脏器重量参数
					</div>
					<div class="btn btn-social btn-xs btn-danger" onclick="remove_autopsy_data_layer('${autopsy_data.id}')" >
						<i class="fa fa-edit"></i>删除该脏器重量参数
					</div>								
					<br/><div class="dotted-line"></div>
				</div>
				<p></p>	
			</c:if>
		</c:forEach>			
		<p></p><strong>肠道长度参数：</strong>
		<div class="btn btn-social btn-xs btn-success" onclick="add_intestinal_length_autopsy_data_layer('${strain.id}')" >
			<i class="fa fa-plus"></i>添加肠道长度参数
		</div>
		<p></p>
		<c:forEach items="${strain.autopsy_data}" var="autopsy_data">
			<c:if test="${autopsy_data.autopsy_classification eq 'intestinal_length_data'}">
				<div id="autopsy${autopsy_data.id}" class="physiological_data-select">【测定组】年龄:${autopsy_data.age} &nbsp;|&nbsp;性别:${autopsy_data.sex} &nbsp;|&nbsp;测定数量:${autopsy_data.number}</div>  
					<div id="text_autopsy${autopsy_data.id}" class="physiological_data">
					<div class="dotted-line-nocolor"></div>
					<c:if test="${!empty autopsy_data.small_intestine}">
						<font class="second-embed">小肠：</font>${autopsy_data.small_intestine}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.caecum}">
						<font class="second-embed">盲肠：</font>${autopsy_data.caecum}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.large_intesting}">
						<font class="second-embed">结肠：</font>${autopsy_data.large_intesting}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.rectum}">
						<font class="second-embed">直肠：</font>${autopsy_data.rectum}<font class="second-embed-unit">cm</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<div class="btn btn-social btn-xs btn-warning" onclick="edit_autopsy_data_layer('${strain.id}','${autopsy_data.id}')" >
						<i class="fa fa-edit"></i>编辑该肠道长度参数
					</div>
					<div class="btn btn-social btn-xs btn-danger" onclick="remove_autopsy_data_layer('${autopsy_data.id}')" >
						<i class="fa fa-edit"></i>删除该肠道长度参数
					</div>								
					<br/><div class="dotted-line"></div>
				</div>
				<p></p>	
			</c:if>
		</c:forEach>				
		<p></p><strong>乳头参数：</strong>
		<div class="btn btn-social btn-xs btn-success" onclick="add_nipple_autopsy_data_layer('${strain.id}')" >
			<i class="fa fa-plus"></i>添加乳头参数
		</div>
		<p></p>
		<c:forEach items="${strain.autopsy_data}" var="autopsy_data">
			<c:if test="${autopsy_data.autopsy_classification eq 'nipple_data'}">
				<div id="autopsy${autopsy_data.id}" class="physiological_data-select">【测定组】年龄:${autopsy_data.age} &nbsp;|&nbsp;性别:${autopsy_data.sex} &nbsp;|&nbsp;测定数量:${autopsy_data.number}</div>  
							<div id="text_autopsy${autopsy_data.id}" class="physiological_data">
					<div class="dotted-line-nocolor"></div>
					<c:if test="${!empty autopsy_data.nipple}">
						<font class="second-embed">乳头：</font>${autopsy_data.nipple}<font class="second-embed-unit">个</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<div class="btn btn-social btn-xs btn-warning" onclick="edit_autopsy_data_layer('${strain.id}','${autopsy_data.id}')" >
						<i class="fa fa-edit"></i>编辑该乳头参数
					</div>
					<div class="btn btn-social btn-xs btn-danger" onclick="remove_autopsy_data_layer('${autopsy_data.id}')" >
						<i class="fa fa-edit"></i>删除该乳头参数
					</div>								
					<br/><div class="dotted-line"></div>
				</div>
				<p></p>	
			</c:if>
		</c:forEach>					
		<p></p><strong>齿式参数：</strong>
		<div class="btn btn-social btn-xs btn-success" onclick="add_dental_formula_autopsy_data_layer('${strain.id}')" >
			<i class="fa fa-plus"></i>添加齿式参数
		</div>
		<p></p>
		<c:forEach items="${strain.autopsy_data}" var="autopsy_data">
			<c:if test="${autopsy_data.autopsy_classification eq 'dental_formula_data'}">
				<div id="autopsy${autopsy_data.id}" class="physiological_data-select">【测定组】年龄:${autopsy_data.age} &nbsp;|&nbsp;性别:${autopsy_data.sex} &nbsp;|&nbsp;测定数量:${autopsy_data.number}</div>  
					<div id="text_autopsy${autopsy_data.id}" class="physiological_data">
					<div class="dotted-line-nocolor"></div>
					<c:if test="${!empty autopsy_data.milk_tooth}">
						<font class="second-embed">乳齿：</font>${autopsy_data.milk_tooth}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty autopsy_data.permanent_tooth}">
						<font class="second-embed">恒齿：</font>${autopsy_data.permanent_tooth}<div class="dotted-line-nocolor"></div>
					</c:if>
					<div class="btn btn-social btn-xs btn-warning" onclick="edit_autopsy_data_layer('${strain.id}','${autopsy_data.id}')" >
						<i class="fa fa-edit"></i>编辑该齿式参数
					</div>
					<div class="btn btn-social btn-xs btn-danger" onclick="remove_autopsy_data_layer('${autopsy_data.id}')" >
						<i class="fa fa-edit"></i>删除该齿式参数
					</div>								
					<br/><div class="dotted-line"></div>
				</div>
				<p></p>	
			</c:if>
		</c:forEach>	
		
