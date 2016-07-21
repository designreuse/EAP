<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 我的CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/wts_edit_strain_detail_style.css" />	
<link rel="stylesheet" href="resources/css/wts_animal_style.css">
<link rel="stylesheet" type="text/css" href="resources/css/wts_text_detail_style.css" />	
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- jQuery 2.1.4 -->
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 我的js -->
<script type="text/javascript" src="resources/js/javascript.js"></script>   
<!-- 我的Ajax库 -->
<script src="resources/js/ajax_db.js"></script>	
	<div class="dotted-line-nocolor"></div>
	<strong>血液生理参数：</strong>
	<div class="btn btn-social btn-xs btn-success" onclick="add_blood_physiological_data_layer('${strain.id}')" >
		<i class="fa fa-plus"></i>添加血液生理参数
	</div>
	<p></p>
		<c:forEach items="${strain.physiological_data}" var="physiological_data">
			<c:if test="${physiological_data.physiological_classification eq 'blood_physiological_data'}">
			<div id="physiological${physiological_data.id}" class="physiological_data-select">【测定组】年龄:${physiological_data.age} &nbsp;|&nbsp;性别:${physiological_data.sex} &nbsp;|&nbsp;测定数量:${physiological_data.number}</div>  
							<div id="text_physiological${physiological_data.id}" class="physiological_data">
					<div class="dotted-line-nocolor"></div>
					<c:if test="${!empty physiological_data.blood_volume}">
						<font class="second-embed">血量：</font>${physiological_data.blood_volume}<font class="second-embed-unit">ml</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.plasma_volume}">
						<font class="second-embed">血浆量：</font>${physiological_data.plasma_volume}<font class="second-embed-unit">ml</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.rbc||!empty physiological_data.mcv||!empty physiological_data.mct||!empty physiological_data.rdw||!empty physiological_data.hb||!empty physiological_data.hct||!empty physiological_data.mch||!empty physiological_data.mchc}">
						<font class="second-embed">红细胞：</font><div class="dotted-line-nocolor"></div>
					</c:if>
						<c:if test="${!empty physiological_data.rbc}">
							<font class="third-embed">计数：</font>${physiological_data.rbc}<font class="third-embed-unit">×10<span style="vertical-align:super; font-size:80%">6</span>/μL</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.mcv}">
							<font class="third-embed">体积：</font>${physiological_data.mcv}<font class="third-embed-unit">fL</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.mct}">
							<font class="third-embed">平均厚度：</font>${physiological_data.mct}<font class="third-embed-unit">μm</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.rdw}">
							<font class="third-embed">分布宽度：</font>${physiological_data.rdw}<font class="third-embed-unit">%CV</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.hb}">
							<font class="third-embed">血红蛋白：</font>${physiological_data.hb}<font class="third-embed-unit">g/L</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.hct}">
							<font class="third-embed">压积：</font>${physiological_data.hct}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.mch}">
							<font class="third-embed">血红蛋白含量：</font>${physiological_data.mch}<font class="third-embed-unit">pG</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.mchc}">
							<font class="third-embed">血红蛋白浓度：</font>${physiological_data.mchc}<font class="third-embed-unit">g/L</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.wbc||!empty physiological_data.w_ne||!empty physiological_data.eo||!empty physiological_data.ba||!empty physiological_data.ly||!empty physiological_data.mo}">
							<font class="second-embed">白细胞：</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.wbc}">
							<font class="third-embed">计数：</font>${physiological_data.wbc}<font class="third-embed-unit">×10<span style="vertical-align:super; font-size:80%">3</span>/μL</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.w_ne}">
							<font class="third-embed">嗜中性白细胞：</font>${physiological_data.w_ne}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.eo}">
							<font class="third-embed">嗜酸性白细胞：</font>${physiological_data.eo}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.ba}">
							<font class="third-embed">嗜硷性白细胞：</font>${physiological_data.ba}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.ly}">
							<font class="third-embed">淋巴细胞：</font>${physiological_data.ly}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.mo}">
							<font class="third-embed">单核细胞：</font>${physiological_data.mo}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.plt||!empty physiological_data.mpv||!empty physiological_data.pdw}">
							<font class="second-embed">血小板：</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.plt}">
							<font class="third-embed">计数：</font>${physiological_data.plt}<font class="third-embed-unit">×10<span style="vertical-align:super; font-size:80%">3</span>/μL</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.mpv}">
							<font class="third-embed">平均容积：</font>${physiological_data.mpv}<font class="third-embed-unit">fL</font><div class="dotted-line-nocolor"></div>
						</c:if>
						<c:if test="${!empty physiological_data.pdw}">
							<font class="third-embed">分布宽度：</font>${physiological_data.pdw}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
						</c:if>	
						<div class="btn btn-social btn-xs btn-warning" onclick="edit_physiological_data_layer('${strain.id}','${physiological_data.id}')" >
							<i class="fa fa-edit"></i>编辑该血液生理参数
						</div>
						<div class="btn btn-social btn-xs btn-danger" onclick="remove_physiological_data_layer('${physiological_data.id}')" >
							<i class="fa fa-edit"></i>删除该血液生理参数
						</div>
						<br/><div class="dotted-line"></div>
					</div>
					<p></p>	
				</c:if>			
		</c:forEach>	
		<p></p><strong>生殖生理参数：</strong>
		<div class="btn btn-social btn-xs btn-success" onclick="add_reproduction_physiological_data_layer('${strain.id}')" >
			<i class="fa fa-plus"></i>添加生殖生理参数
		</div>
		<p></p>
		<c:forEach items="${strain.physiological_data}" var="physiological_data">
			<c:if test="${physiological_data.physiological_classification eq 'reproduction_physiological_data'}">
			<div id="physiological${physiological_data.id}" class="physiological_data-select">【测定组】年龄:${physiological_data.age} &nbsp;|&nbsp;性别:${physiological_data.sex} &nbsp;|&nbsp;测定数量:${physiological_data.number}</div>  
						<div id="text_physiological${physiological_data.id}" class="physiological_data">
				<div class="dotted-line-nocolor"></div>
				
				<c:if test="${!empty physiological_data.estrus_period||!empty physiological_data.first_estrus||!empty physiological_data.estrus}">
					<font class="second-embed">性成熟：</font><div class="dotted-line-nocolor"></div>
				</c:if>
					<c:if test="${!empty physiological_data.first_estrus}">
						<font class="third-embed">初次发情：</font>${physiological_data.first_estrus}<font class="third-embed-unit">d</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.estrus}">
						<font class="third-embed">发情期：</font>${physiological_data.estrus}<font class="third-embed-unit">h</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.estrus_period}">
						<font class="third-embed">发情周期：</font>${physiological_data.estrus_period}<font class="third-embed-unit">d</font><div class="dotted-line-nocolor"></div>
					</c:if>
				<c:if test="${!empty physiological_data.estrus_season}">
					<font class="second-embed">发情季节：</font>${physiological_data.estrus_season}<div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty physiological_data.body_maturation}">
					<font class="second-embed">体成熟：</font>${physiological_data.body_maturation}<font class="second-embed-unit">d</font><div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty physiological_data.gestation_period}">
					<font class="second-embed">妊娠期：</font>${physiological_data.gestation_period}<font class="second-embed-unit">d</font><div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty physiological_data.suckling_period}">
					<font class="second-embed">哺乳期：</font>${physiological_data.suckling_period}<font class="second-embed-unit">d</font><div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty physiological_data.production_index}">
					<font class="second-embed">生产指数：</font>${physiological_data.production_index}<div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty physiological_data.sperm_concentration||!empty physiological_data.sperm_survival_time}">
					<font class="second-embed">精子：</font><div class="dotted-line-nocolor"></div>
				</c:if>
					<c:if test="${!empty physiological_data.sperm_concentration}">
						<font class="third-embed">计数：</font>${physiological_data.sperm_concentration}<font class="third-embed-unit">×10<span style="vertical-align:super; font-size:80%">6</span>/mL</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.sperm_survival_time}">
						<font class="third-embed">存活时间：</font>${physiological_data.sperm_survival_time}<font class="third-embed-unit">d</font><div class="dotted-line-nocolor"></div>
					</c:if>
				<c:if test="${!empty physiological_data.ovum_size||!empty physiological_data.ovum_number||!empty physiological_data.ovulation_period||!empty physiological_data.fertilization_ability}">
					<font class="second-embed">卵子：</font><div class="dotted-line-nocolor"></div>
				</c:if>
					<c:if test="${!empty physiological_data.ovum_size}">
						<font class="third-embed">大小：</font>${physiological_data.ovum_size}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.ovum_number}">
						<font class="third-embed">数量：</font>${physiological_data.ovum_number}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.ovulation_period}">
						<font class="third-embed">排卵时间：</font>${physiological_data.ovulation_period}<font class="third-embed-unit">h</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.fertilization_ability}">
						<font class="third-embed">受精能力：</font>${physiological_data.fertilization_ability}<font class="third-embed-unit">h</font><div class="dotted-line-nocolor"></div>
					</c:if>
				<c:if test="${!empty physiological_data.lay_eggs_age||!empty physiological_data.lay_eggs_weight}">
					<font class="second-embed">产蛋性能：</font><div class="dotted-line-nocolor"></div>
				</c:if>
					<c:if test="${!empty physiological_data.lay_eggs_age}">
						<font class="third-embed">开产日龄：</font>${physiological_data.lay_eggs_age}<font class="third-embed-unit">d</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.lay_eggs_weight}">
						<font class="third-embed">开产体重：</font>${physiological_data.lay_eggs_weight}<font class="third-embed-unit">kg</font><div class="dotted-line-nocolor"></div>
					</c:if>
				<c:if test="${!empty physiological_data.egg_weight||!empty physiological_data.shell_thickness||!empty physiological_data.egg_type_index||!empty physiological_data.haugh_unit||!empty physiological_data.egg_relative_density||!empty physiological_data.egg_yolk_ratio||!empty physiological_data.fertilization_rate||!empty physiological_data.hatchability_of_fertile_eggs||!empty physiological_data.shell_color||!empty physiological_data.brood_stage}">
					<font class="second-embed">蛋的品质：</font><div class="dotted-line-nocolor"></div>
				</c:if>
					<c:if test="${!empty physiological_data.egg_weight}">
						<font class="third-embed">蛋重：</font>${physiological_data.egg_weight}<font class="third-embed-unit">g</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.shell_thickness}">
						<font class="third-embed">蛋壳厚度：</font>${physiological_data.shell_thickness}<font class="third-embed-unit">nm</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.egg_type_index}">
						<font class="third-embed">蛋型指数：</font>${physiological_data.egg_type_index}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.haugh_unit}">
						<font class="third-embed">哈氏单位：</font>${physiological_data.haugh_unit}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.egg_relative_density}">
						<font class="third-embed">蛋相对密度：</font>${physiological_data.egg_relative_density}<font class="third-embed-unit">级</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.egg_yolk_ratio}">
						<font class="third-embed">蛋黄比色级别：</font>${physiological_data.egg_yolk_ratio}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.fertilization_rate}">
						<font class="third-embed">受精率：</font>${physiological_data.fertilization_rate}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.hatchability_of_fertile_eggs}">
						<font class="third-embed">受精蛋孵化率：</font>${physiological_data.hatchability_of_fertile_eggs}<font class="third-embed-unit">%</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.shell_color}">
						<font class="third-embed">蛋壳颜色：</font>${physiological_data.shell_color}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.brood_stage}">
						<font class="third-embed">孵化期：</font>${physiological_data.brood_stage}<font class="third-embed-unit">d</font><div class="dotted-line-nocolor"></div>
					</c:if>		
					<div class="btn btn-social btn-xs btn-warning" onclick="edit_physiological_data_layer('${strain.id}','${physiological_data.id}')" >
						<i class="fa fa-edit"></i>编辑该生殖生理参数
					</div>
					<div class="btn btn-social btn-xs btn-danger" onclick="remove_physiological_data_layer('${physiological_data.id}')" >
						<i class="fa fa-edit"></i>删除该生殖生理参数
					</div>	
					<br/><div class="dotted-line"></div>
				</div>	
				<p></p>	
			</c:if>	
		</c:forEach>	
		<p></p><strong>生长发育生理参数：</strong>		
		<div class="btn btn-social btn-xs btn-success" onclick="add_grow_physiological_data_layer('${strain.id}')" >
			<i class="fa fa-plus"></i>添加生长发育生理参数
		</div>
		<p></p>
		<c:forEach items="${strain.physiological_data}" var="physiological_data">
			<c:if test="${physiological_data.physiological_classification eq 'grow_physiological_data'}">
			<div id="physiological${physiological_data.id}" class="physiological_data-select">【测定组】年龄:${physiological_data.age} &nbsp;|&nbsp;性别:${physiological_data.sex} &nbsp;|&nbsp;测定数量:${physiological_data.number}</div>  
						<div id="text_physiological${physiological_data.id}" class="physiological_data">
				<div class="dotted-line-nocolor"></div>
				<c:if test="${!empty physiological_data.birth_weight}">
					<font class="second-embed">初生体重：</font>${physiological_data.birth_weight}<font class="second-embed-unit">g</font><div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty physiological_data.weaning_weight}">
					<font class="second-embed">断奶体重：</font>${physiological_data.weaning_weight}<font class="second-embed-unit">g</font><div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty physiological_data.adult_weight}">
					<font class="second-embed">成年体重：</font>${physiological_data.adult_weight}<font class="second-embed-unit">g</font><div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty physiological_data.growth_curve_url}">
					<font class="second-embed">生长曲线：</font>${physiological_data.growth_curve_url}<div class="dotted-line-nocolor"></div>
				</c:if>
				<div class="btn btn-social btn-xs btn-warning" onclick="edit_physiological_data_layer('${strain.id}','${physiological_data.id}')" >
					<i class="fa fa-edit"></i>编辑该生长发育生理参数
				</div>
				<div class="btn btn-social btn-xs btn-danger" onclick="remove_physiological_data_layer('${physiological_data.id}')" >
					<i class="fa fa-edit"></i>删除该生长发育生理参数
				</div>	
				<br/><div class="dotted-line"></div>
				</div>
				<p></p>		
			</c:if>		
		</c:forEach>	
		<p></p><strong>呼吸生理参数：</strong>		
		<div class="btn btn-social btn-xs btn-success" onclick="add_breathe_physiological_data_layer('${strain.id}')" >
			<i class="fa fa-plus"></i>添加呼吸生理参数
		</div>
		<p></p>
		<c:forEach items="${strain.physiological_data}" var="physiological_data">
			<c:if test="${physiological_data.physiological_classification eq 'breathe_physiological_data'}">
			<div id="physiological${physiological_data.id}" class="physiological_data-select">【测定组】年龄:${physiological_data.age} &nbsp;|&nbsp;性别:${physiological_data.sex} &nbsp;|&nbsp;测定数量:${physiological_data.number}</div>  
						<div id="text_physiological${physiological_data.id}" class="physiological_data">
				<div class="dotted-line-nocolor"></div>
				<c:if test="${!empty physiological_data.breathing_rate}">
					<font class="second-embed">呼吸频率：</font>${physiological_data.breathing_rate}<font class="second-embed-unit">次/m</font><div class="dotted-line-nocolor"></div>
				</c:if>
				<div class="btn btn-social btn-xs btn-warning" onclick="edit_physiological_data_layer('${strain.id}','${physiological_data.id}')" >
					<i class="fa fa-edit"></i>编辑该呼吸生理参数
				</div>
				<div class="btn btn-social btn-xs btn-danger" onclick="remove_physiological_data_layer('${physiological_data.id}')" >
					<i class="fa fa-edit"></i>删除该呼吸生理参数
				</div>
				<br/><div class="dotted-line"></div>
				</div>	
				<p></p>	
			</c:if>		
		</c:forEach>	
		<p></p><strong>体温参数：</strong>		
		<div class="btn btn-social btn-xs btn-success" onclick="add_temperature_physiological_data_layer('${strain.id}')" >
			<i class="fa fa-plus"></i>添加体温生理参数
		</div>
		<p></p>
		<c:forEach items="${strain.physiological_data}" var="physiological_data">
			<c:if test="${physiological_data.physiological_classification eq 'temperature_physiological_data'}">
			<div id="physiological${physiological_data.id}" class="physiological_data-select">【测定组】年龄:${physiological_data.age} &nbsp;|&nbsp;性别:${physiological_data.sex} &nbsp;|&nbsp;测定数量:${physiological_data.number}</div>  
						<div id="text_physiological${physiological_data.id}" class="physiological_data">
				<div class="dotted-line-nocolor"></div>
				<c:if test="${!empty physiological_data.temperature}">
					<font class="second-embed">体温：</font>${physiological_data.temperature}<font class="second-embed-unit">℃</font><div class="dotted-line-nocolor"></div>
				</c:if>
				<div class="btn btn-social btn-xs btn-warning" onclick="edit_physiological_data_layer('${strain.id}','${physiological_data.id}')" >
					<i class="fa fa-edit"></i>编辑该体温生理参数
				</div>
				<div class="btn btn-social btn-xs btn-danger" onclick="remove_physiological_data_layer('${physiological_data.id}')" >
					<i class="fa fa-edit"></i>删除该体温生理参数
				</div>
				<br/><div class="dotted-line"></div>
			</div>	
			<p></p>	
			</c:if>		
		</c:forEach>	
		<p></p><strong>消化生理参数：</strong>				
		<div class="btn btn-social btn-xs btn-success" onclick="add_digestive_physiological_data_layer('${strain.id}')" >
			<i class="fa fa-plus"></i>添加消化生理参数
		</div>
		<p></p>
		<c:forEach items="${strain.physiological_data}" var="physiological_data">
			<c:if test="${physiological_data.physiological_classification eq 'digestive_physiological_data'}">
			<div id="physiological${physiological_data.id}" class="physiological_data-select">【测定组】年龄:${physiological_data.age} &nbsp;|&nbsp;性别:${physiological_data.sex} &nbsp;|&nbsp;测定数量:${physiological_data.number}</div>  
						<div id="text_physiological${physiological_data.id}" class="physiological_data">
				<div class="dotted-line-nocolor"></div>
				<c:if test="${!empty physiological_data.digestive_index}">
					<font class="second-embed">消化能力：</font>${physiological_data.digestive_index}<div class="dotted-line-nocolor"></div>
				</c:if>
				<div class="btn btn-social btn-xs btn-warning" onclick="edit_physiological_data_layer('${strain.id}','${physiological_data.id}')" >
					<i class="fa fa-edit"></i>编辑该消化生理参数
				</div>
				<div class="btn btn-social btn-xs btn-danger" onclick="remove_physiological_data_layer('${physiological_data.id}')" >
					<i class="fa fa-edit"></i>删除该消化生理参数
				</div>
				<br/><div class="dotted-line"></div>
			</div>	
			<p></p>	
			</c:if>	
		</c:forEach>	
		<p></p><strong>免疫生理参数：</strong>				
		<div class="btn btn-social btn-xs btn-success" onclick="add_immune_physiological_data_layer('${strain.id}')" >
			<i class="fa fa-plus"></i>添加免疫生理参数
		</div>
		<p></p>
		<c:forEach items="${strain.physiological_data}" var="physiological_data">
			<c:if test="${physiological_data.physiological_classification eq 'immune_physiological_data'}">
			<div id="physiological${physiological_data.id}" class="physiological_data-select">【测定组】年龄:${physiological_data.age} &nbsp;|&nbsp;性别:${physiological_data.sex} &nbsp;|&nbsp;测定数量:${physiological_data.number}</div>  
						<div id="text_physiological${physiological_data.id}" class="physiological_data">
				<div class="dotted-line-nocolor"></div>
				<c:if test="${!empty physiological_data.igg||!empty physiological_data.igm||!empty physiological_data.igd||!empty physiological_data.iga||!empty physiological_data.ige}">
					<font class="second-embed">免疫球蛋白：</font><div class="dotted-line-nocolor"></div>
				</c:if>
					<c:if test="${!empty physiological_data.igg}">
						<font class="third-embed">IgG：</font>${physiological_data.igg}<font class="third-embed-unit">mg/dl</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.igm}">
						<font class="third-embed">IgM：</font>${physiological_data.igm}<font class="third-embed-unit">mg/dl</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.igd}">
						<font class="third-embed">IgD：</font>${physiological_data.igd}<font class="third-embed-unit">mg/dl</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.iga}">
						<font class="third-embed">IgA：</font>${physiological_data.iga}<font class="third-embed-unit">mg/dl</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.ige}">
						<font class="third-embed">IgE：</font>${physiological_data.ige}<font class="third-embed-unit">mg/dl</font><div class="dotted-line-nocolor"></div>
					</c:if>
				<c:if test="${!empty physiological_data.t_cell||!empty physiological_data.b_cell}">
					<font class="second-embed">免疫活性细胞表型：</font><div class="dotted-line-nocolor"></div>
				</c:if>
					<c:if test="${!empty physiological_data.t_cell}">
						<font class="third-embed">T细胞：</font>${physiological_data.t_cell}<div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.b_cell}">
						<font class="third-embed">B细胞：</font>${physiological_data.b_cell}<div class="dotted-line-nocolor"></div>
					</c:if>
				<c:if test="${!empty physiological_data.digestive_index}">
					<font class="second-embed">消化能力：</font>${physiological_data.digestive_index}<div class="dotted-line-nocolor"></div>
				</c:if>
				<div class="btn btn-social btn-xs btn-warning" onclick="edit_physiological_data_layer('${strain.id}','${physiological_data.id}')" >
					<i class="fa fa-edit"></i>编辑该免疫生理参数
				</div>
				<div class="btn btn-social btn-xs btn-danger" onclick="remove_physiological_data_layer('${physiological_data.id}')" >
					<i class="fa fa-edit"></i>删除该免疫生理参数
				</div>
				<br/><div class="dotted-line"></div>
				</div>
				<p></p>	
			</c:if>
		</c:forEach>	
		<p></p><strong>心血管生理参数：</strong>				
		<div class="btn btn-social btn-xs btn-success" onclick="add_cardiovascular_physiological_data_layer('${strain.id}')" >
			<i class="fa fa-plus"></i>添加心血管生理参数
		</div>
		<p></p>
		<c:forEach items="${strain.physiological_data}" var="physiological_data">
			<c:if test="${physiological_data.physiological_classification eq 'cardiovascular_physiological_data'}">
			<div id="physiological${physiological_data.id}" class="physiological_data-select">【测定组】年龄:${physiological_data.age} &nbsp;|&nbsp;性别:${physiological_data.sex} &nbsp;|&nbsp;测定数量:${physiological_data.number}</div>  
						<div id="text_physiological${physiological_data.id}" class="physiological_data">
				<div class="dotted-line-nocolor"></div>
				<c:if test="${!empty physiological_data.systolic_pressure||!empty physiological_data.diastolic_pressure}">
					<font class="second-embed">血压：</font><div class="dotted-line-nocolor"></div>
				</c:if>
					<c:if test="${!empty physiological_data.systolic_pressure}">
						<font class="third-embed">收缩压：</font>${physiological_data.systolic_pressure}<font class="third-embed-unit">mmHg</font><div class="dotted-line-nocolor"></div>
					</c:if>
					<c:if test="${!empty physiological_data.diastolic_pressure}">
						<font class="third-embed">舒张压：</font>${physiological_data.diastolic_pressure}<font class="third-embed-unit">mmHg</font><div class="dotted-line-nocolor"></div>
					</c:if>
				<c:if test="${!empty physiological_data.heart_rate}">
					<font class="second-embed">心率：</font>${physiological_data.heart_rate}<font class="second-embed-unit">次/m</font><div class="dotted-line-nocolor"></div>
				</c:if>
				<c:if test="${!empty physiological_data.electrocardiogram_url}">
					<font class="second-embed">心电图：</font>${physiological_data.electrocardiogram_url}<div class="dotted-line-nocolor"></div>
				</c:if>
				<br/>
				<div class="btn btn-social btn-xs btn-warning" onclick="edit_physiological_data_layer('${strain.id}','${physiological_data.id}')" >
					<i class="fa fa-edit"></i>编辑该心血管生理参数
				</div>
				<div class="btn btn-social btn-xs btn-danger" onclick="remove_physiological_data_layer('${physiological_data.id}')" >
					<i class="fa fa-edit"></i>删除该心血管生理参数
				</div>
				</div>
				<p></p>	
			</c:if>
		</c:forEach>
