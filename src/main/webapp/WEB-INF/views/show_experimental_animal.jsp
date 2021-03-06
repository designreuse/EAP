<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currentTime = new java.util.Date();
String str_date1 = formatter.format(currentTime); 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">	
<title>中国科学院特色与模式动物信息化平台台</title>
<script type="text/javascript">
		function selectAnimal()
		{
			var name_info=$("#name_info").val();
			var species_info=$("#species_info").val();
			var strain_info=$("#strain_info").val();
			var dna_info=$("#dna_info").val();
			var phenotype_info=$("#phenotype_info").val();
			if(name_info != "" || species_info != "" || strain_info != "" || dna_info != "" || phenotype_info != "")
			{
				//alert("select/experimental_animal/na"+name_info+"/sp"+species_info+"/st"+strain_info+"/dn"+dna_info+"/ph"+phenotype_info+"/1");
				htmlobj=$.ajax({url:"select/experimental_animal/na"+name_info+"/sp"+species_info+"/st"+strain_info+"/dn"+dna_info+"/ph"+phenotype_info+"/1",async:false});
				$("#experimental_animal_list_conclusion").html(htmlobj.responseText);
				
			}
			else
			{
				location.reload();
			}
  		}
		function changePage(name_info,species_info,strain_info,dna_info,phenotype_info,page)
		{
			htmlobj=$.ajax({url:"select/experimental_animal/na"+name_info+"/sp"+species_info+"/st"+strain_info+"/dn"+dna_info+"/ph"+phenotype_info+"/"+page,async:false});
			$("#experimental_animal_list_conclusion").html(htmlobj.responseText);	
  		}
		function show_description(id)
		{
		  var obj=document.getElementById(id);
		  obj.style.display="block";
		}
		function hide_description(id)
		{
		  var obj=document.getElementById(id);
		  if(obj.style.display=="block")
		    obj.style.display="none";
		}

</script>
</head>
<body>
<jsp:include page="head.jsp"/>
<div id="content">
		<div class="inner">
			<div class="container_12">
				<div class="wrapper">
					<div class="block">
						<div class="grid_seletanimal">
							<h2>检索条件</h2>
									<div class="testimonial-block-little">									
										<form>
										<table class="animallist-black">
											<tr>	
												<td colspan="2" style="color:#60aff6">								
													名称:<input id="name_info" type="text" />		
												</td>	
											</tr>
											<tr>	
												<td colspan="2" style="color:#60aff6">								
													<br/>物种:<input id="species_info" type="text" />		
												</td>	
											</tr>
											<tr>	
												<td colspan="2" style="color:#60aff6">								
													<br/>品系:<input id="strain_info" type="text" />		
												</td>	
											</tr>
											<tr>	
												<td colspan="2" style="color:#60aff6">								
													<br/>基因:<input id="dna_info" type="text" />		
												</td>	
											</tr>
											<tr>	
												<td colspan="2" style="color:#60aff6">								
													<br/>表型:<input id="phenotype_info" type="text" />		
												</td>	
											</tr>
											<tr>
												<td width="100px">										
													<br/><input type="reset" class="button" value="<spring:message text="清空"/>" />									
												</td>
												<td width="100px">										
													<br/><input type="button" class="button" onclick="javascript:selectAnimal()"value="<spring:message text="检索"/>" />									
												</td>
											</tr>
										</table>
										</form>
									</div>
							</div>
						<div class="grid_animallist">
							<h2>实验动物列表</h2>
								<div class="testimonial-block-little">
								<div id="experimental_animal_list_conclusion">
									<table class="animallist-black">
										<tr>
											<td style="color:#60aff6;font-size:16px">										
												名称											
											</td>
											<td style="text-align:lift;color:#60aff6;font-size:16px">
												物种
											</td>
											<td style="text-align:lift;color:#60aff6;font-size:16px">
												品系
											</td>
											<td style="text-align:lift;color:#60aff6;font-size:16px">
												基因
											</td>
											<td style="text-align:right;color:#60aff6;font-size:16px">
												发布时间
											</td>
										</tr>
										<tr><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td></tr>
										
										<c:forEach items="${showExperimental_animals}" var="experimental_animal">									
												<tr>
													<td>
														<a href="show/experimental_animal/detail/${experimental_animal.id}" target="_blank">&nbsp;												
														${experimental_animal.name}												
														</a>
													</td>		
													<c:if test="${fn:length(experimental_animal.strain_id.species_id.name) < 12}">
														<td style="text-align:lift">
														${experimental_animal.strain_id.species_id.name}												
													</c:if>	
													<c:if test="${fn:length(experimental_animal.strain_id.species_id.name) >= 12}">
														<td onmouseover="show_description('${experimental_animal.id}_species');" onmouseout="hide_description('${experimental_animal.id}_species');" style="text-align:lift">
														${fn:substring(experimental_animal.strain_id.species_id.name, 0, 10)}...
													</c:if>	
													<div id="${experimental_animal.id}_species" class="description">${experimental_animal.strain_id.species_id.name}</div>		
													</td>		
													<c:if test="${fn:length(experimental_animal.strain_id.name) < 12}">
														<td style="text-align:lift">
														${experimental_animal.strain_id.name}												
													</c:if>	
													<c:if test="${fn:length(experimental_animal.strain_id.name) >= 12}">
														<td onmouseover="show_description('${experimental_animal.id}_strain');" onmouseout="hide_description('${experimental_animal.id}_strain');" style="text-align:lift">
														${fn:substring(experimental_animal.strain_id.name, 0, 10)}...
													</c:if>	
													<div id="${experimental_animal.id}_strain" class="description">${experimental_animal.strain_id.name}</div>		
													</td>
													<c:if test="${fn:length(experimental_animal.dna_name) < 12}">
														<td style="text-align:lift">
														${experimental_animal.dna_name}												
													</c:if>	
													<c:if test="${fn:length(experimental_animal.dna_name) >= 12}">
														<td onmouseover="show_description('${experimental_animal.id}_dna');" onmouseout="hide_description('${experimental_animal.id}_dna');" style="text-align:lift">
														${fn:substring(experimental_animal.dna_name, 0, 10)}...
													</c:if>	
													<div id="${experimental_animal.id}_dna" class="description">${experimental_animal.dna_name}</div>		
													</td>
													<td style="text-align:right">${experimental_animal.time}</td>
												</tr>
													<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td></tr>
										</c:forEach>
									</table>
									<br/>
									<div align="center" style="color:#60aff6;font-size:80%">		
									<c:if test="${numberExperimental_animals > 15}">								
										<c:forEach var="i" begin="1" end="${numberExperimental_animals/15+0.934}">											
											<c:if test="${page_now == i}">					
												<input type="button" class="page_box-on" value="<spring:message text="${i}"/>" />
											</c:if>														
											<c:if test="${page_now != i}">					
												<input type="button" class="page_box" onclick="javascript:changePage('${name_info_now}','${species_info_now}','${strain_info_now}','${dna_info_now}','${phenotype_info_now}','${i}')" value="<spring:message text="${i}"/>" />
											</c:if>													
										</c:forEach>
									</c:if>
										<div>共${numberExperimental_animals}条数据</div>
									</div>	
										
								</div>
								</div>
							
					</div>	
				</div>
			</div>	
		</div>	
	</div>	
</div>
<jsp:include page="foot.jsp"/>
</body>
</html>
