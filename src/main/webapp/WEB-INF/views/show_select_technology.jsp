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
								
								<div class="testimonial-block-little">
								<div id="experimental_animal_list_conclusion">
									<table class="animallist-black">
										<tr>
											<td style="color:#60aff6;font-size:14px">										
												服务名称											
											</td>
											<td style="text-align:lift;color:#60aff6;font-size:14px">
												品系/类型
											</td>
											<td style="text-align:lift;color:#60aff6;font-size:14px">
												主要内容
											</td>
											<td style="text-align:lift;color:#60aff6;font-size:14px">
												预定周期
											</td>
											<td style="text-align:lift;color:#60aff6;font-size:14px">
												价格
											</td>
											<td style="text-align:right;color:#60aff6;font-size:14px">
												发布日期
											</td>
										</tr>
										<tr><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td></tr>
										
										<c:forEach items="${showTechnologys}" var="technology">									
												<tr>
													<td>
														<a href="show/technology/detail/${technology.id}" target="_blank">&nbsp;												
														${technology.title}												
														</a>
													</td>		
													<c:if test="${fn:length(technology.target) < 7}">
														<td style="text-align:lift">
														${technology.target}												
													</c:if>	
													<c:if test="${fn:length(technology.target) >= 7}">
														<td onmouseover="show_description('${technology.id}_species');" onmouseout="hide_description('${technology.id}_species');" style="text-align:lift">
														${fn:substring(technology.target, 0, 3)}...
													</c:if>	
													<div id="${technology.id}_species" class="description">${technology.target}</div>		
													</td>		
													<c:if test="${fn:length(technology.abstract_text) < 10}">
														<td style="text-align:lift">
														${technology.abstract_text}												
													</c:if>	
													<c:if test="${fn:length(technology.abstract_text) >= 10}">
														<td onmouseover="show_description('${technology.id}_abstract_text');" onmouseout="hide_description('${technology.id}_abstract_text');" style="text-align:lift">
														${fn:substring(technology.abstract_text, 0, 6)}...
													</c:if>	
													<div id="${technology.id}_abstract_text" class="description">${technology.abstract_text}</div>		
													</td>
													<c:if test="${fn:length(technology.cycle) < 12}">
														<td style="text-align:lift">
														${technology.cycle}												
													</c:if>	
													<c:if test="${fn:length(experimental_animal.cycle) >= 10}">
													<td onmouseover="show_description('${technology.id}_cycle');" onmouseout="hide_description('${technology.id}_cycle');" style="text-align:lift">
														${fn:substring(technology.cycle, 0, 6)}...
													</c:if>	
													<div id="${technology.id}_cycle" class="description">${technology.cycle}</div>		
													</td>
													<c:if test="${fn:length(technology.price_public) < 10}">
														<td style="text-align:lift">
														${technology.price_public}												
													</c:if>	
													<c:if test="${fn:length(experimental_animal.price_public) >= 10}">
													<td onmouseover="show_description('${technology.id}_price');" onmouseout="hide_description('${technology.id}_price');" style="text-align:lift">
														${fn:substring(technology.price_public, 0, 6)}...
													</c:if>	
													<div id="${technology.id}_price" class="description">${technology.price_public}</div>		
													</td>
													<td style="text-align:right">${technology.time}</td>
												</tr>
													<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td></tr>
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
												<input type="button" class="page_box" onclick="javascript:changePage('${title_info_now}','${species_info_now}','${abstract_info_now}','${cycle_info_now}','${i}')" value="<spring:message text="${i}"/>" />
											</c:if>													
										</c:forEach>
									</c:if>
										<div>共${numberTechnologys}条数据</div>
									</div>	
										
								</div>
						</div>							
</body>
</html>
