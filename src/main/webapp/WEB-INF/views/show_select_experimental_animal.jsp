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

</head>
<body>

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
					
</body>
</html>
