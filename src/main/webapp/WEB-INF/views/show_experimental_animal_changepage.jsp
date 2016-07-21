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
											<td style="color:#60aff6;font-size:16px">										
												动物名称											
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
										<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td><td><hr style="height:3px;border:none;border-top:3px solid #555555;" /></td></tr>
										
										<c:forEach items="${showExperimental_animals}" var="experimental_animal">									
												<tr>
													<td>
														<a href="show/experimental_animal/detail/${experimental_animal.id}" target="_blank">&nbsp;												
														${experimental_animal.name}												
														</a>
													</td>													
													<td style="text-align:lift">${experimental_animal.strain_id.species_id.name}</td>
													<td style="text-align:lift">${experimental_animal.strain_id.name}</td>
													<td style="text-align:lift">${experimental_animal.dna_name}</td>
													<td style="text-align:right">${experimental_animal.time}</td>
												</tr>
													<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td></tr>
										</c:forEach>
									</table>
									<br/>
									<div align="center" style="color:#60aff6;font-size:80%">	
										<% int i=0;%>								
										<c:forEach var="i" begin="1" end="${numberExperimental_animals/15+0.934}">
											<% i=i+1; %>								
											<a href="show/experimental_animal/${i}" class="button2">${i}</a>														
										</c:forEach>
										<div>共<%= i %>页|${numberExperimental_animals}条数据</div>
									</div>	
										
								</div>
						</div>							
</body>
</html>
