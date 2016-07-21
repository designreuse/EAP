
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
		<script type="text/javascript" src="resources/js/jquery-2.1.4.js"> </script>
        <link rel="stylesheet" type="text/css" href="resources/css/new_style.css" />
        <script type="text/javascript" src="resources/js/javascript.js"></script>                    
        	<title>实验动物详情</title>       
      </head>
      <body>  
		<jsp:include page="head.jsp"/> 
		<div id="content">
		<div class="inner">
		<p></p><p></p><p></p><p></p><p></p><p></p>
		<div class="container_12">	
      	<div class="picture-frame-gray">
           
    			<div class="title_name">
        			${experimental_animal.name}  
        		<c:if test="${pageContext.request.userPrincipal.name != null}">
        		<% int collection_on=0;%>
        			<c:forEach items="${list_sydw}" var="sydw">
        				<c:if test="${sydw.collection_id eq experimental_animal.id}">        				
        					<c:if test="${sydw.user_id.name eq pageContext.request.userPrincipal.name}">
        						<% collection_on=1;%>        						
        						<c:forEach items="${listAdmins}" var="admin"> 
        							<c:if test="${admin.name eq pageContext.request.userPrincipal.name}"> 
									<a href="<c:url value='/collection/${sydw.id}/remove/${experimental_animal.id}/sydw' />" >
										<input type="image" style="float:left;width:22px;background-color:#DFDFDF;border:solid 0px #DFDFDF;" id="edit_collection_img" alt="收藏" src="resources/images/star_on.png" onclick="document.formName.submit();" style="width:22px;" /> 
									</a>
									<span id="edit_collection" style="display:none; font-size:70%">
        								<font style="font-size:80%;">已收藏，点击取消收藏</font>
        							</span>
        							</c:if>
        						</c:forEach>	
        					</c:if>
        				</c:if>
        			</c:forEach>
        		<% 
        			if(collection_on==0)
        			{
        				%> 
        				<c:forEach items="${listAdmins}" var="admin"> 
        					<c:if test="${admin.name eq pageContext.request.userPrincipal.name}"> 
        					<c:url var="addAction" value="/collection/${experimental_animal.id}/add/sydw" ></c:url>
							<form:form action="${addAction}" commandName="collection" style="float:left;">
								<form:input path="user_id.id" value="${admin.id}" type="hidden"/>
        						<form:input path="classification" value="sydw" type="hidden"/>
								<form:input path="collection_id" value="${experimental_animal.id}" type="hidden"/>
								<form:input path="time" value="<%=str_date1%>" readonly="true" type="hidden"/>
								<input type="image" id="edit_collection_img" alt="收藏" src="resources/images/star_off.png" onclick="document.formName.submit();" style="width:22px;background-color:#DFDFDF;border:solid 0px #DFDFDF;" /> 
							</form:form>
							<span id="edit_collection" style="display:none; font-size:70%">
        						<font style="font-size:80%;">未收藏，点击添加收藏</font>
        					</span>
        					</c:if>
        				</c:forEach>
        				<%
        			}
				%>
        		</c:if>      	
        		
        		
 
        		
        		
        				
      			</div>
      				<div class="main_window">
      					<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      						 						
      							<li>
      								<font class="title_name_little">
      									实验动物名称：${experimental_animal.name}
      								</font>
      								<div class="faceplate" >
										<div class="embed">
											<c:if test="${!empty experimental_animal.photo_id.id}">
												<figure class="img-indent"><img src="${experimental_animal.photo_id.url}${experimental_animal.photo_id.name}" alt="" width="120px" height="120px"></figure>
											</c:if>	
											<strong>类型：</strong>实验动物
											<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											<c:if test="${!empty experimental_animal.strain_id.species_id.name}">
												<strong>物种：</strong>												
												<a href="show/species/detail/${experimental_animal.strain_id.species_id.id}" target="_blank">&nbsp;												
													${experimental_animal.strain_id.species_id.name}												
												</a>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											</c:if>		
											<c:if test="${!empty experimental_animal.strain_id.name}">
												<strong>品系：</strong>												
												<a href="show/strain/detail/${experimental_animal.strain_id.id}" target="_blank">&nbsp;												
													${experimental_animal.strain_id.name}												
												</a>
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />
											</c:if>		
											<c:if test="${!empty experimental_animal.dna_name}">
												<strong>基因名：</strong>${experimental_animal.dna_name}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty experimental_animal.phenotype}">
												<br/><br/><br/><br/><strong>表型描述：</strong>${experimental_animal.phenotype}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty experimental_animal.application}">
												<strong>主要用途：</strong>${experimental_animal.application}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty experimental_animal.preparation}">
												<strong>制备方式：</strong>${experimental_animal.preparation}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											
										
											<div  id="preparation_ref" class="preparation_ref">												
													<c:if test="${!empty experimental_animal.contact_id.name}">
														<font class="f-deepblue">参考文献：</font>
														${experimental_animal.preparation_ref}														
													</c:if>		
											</div>												
											<a id="preparation_ref_more" class="preparation_ref_more" href="javascript:void(0);">+&nbsp;&nbsp;参考文献</a>
											<a id="preparation_ref_less" class="preparation_ref_less" href="javascript:void(0);"><br/>-&nbsp;&nbsp;收起</a>			
											<p></p>
											
											<c:if test="${!empty experimental_animal.origin}">
												<strong>动物模型来源：</strong>${experimental_animal.origin}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty experimental_animal.save_info}">
												<strong>储存信息：</strong>${experimental_animal.save_info}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											
											<div  id="contacts" class="contacts">											
													<c:if test="${!empty experimental_animal.contact_id.name}">
														<font class="f-deepblue">联系人：</font>${experimental_animal.contact_id.name}
														<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
													</c:if>
													<c:if test="${!empty experimental_animal.contact_id.organization.address}">
														<font class="f-deepblue">联系地址：</font>${experimental_animal.contact_id.organization.address}
														<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
													</c:if>
													<c:if test="${!empty experimental_animal.contact_id.organization.name}">
														<font class="f-deepblue">联系单位：</font>${experimental_animal.contact_id.organization.name}
														<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
													</c:if>
													<c:if test="${!empty experimental_animal.contact_id.telephone}">
														<font class="f-deepblue">联系电话：</font>${experimental_animal.contact_id.telephone}
														<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
													</c:if>
													<c:if test="${!empty experimental_animal.contact_id.email}">
														<font class="f-deepblue">邮箱：</font>${experimental_animal.contact_id.email}
														<hr style="height:5px;border:none;border-top:0px dashed #c0c0c0;" />
													</c:if>		
											</div>
											<a id="contacts_more" class="contacts_more" href="javascript:void(0);">+&nbsp;&nbsp;联系方式</a>
											<a id="contacts_less" class="contacts_less" href="javascript:void(0);">-&nbsp;&nbsp;收起</a>									
											<p></p>
											<c:if test="${!empty experimental_animal.quantity}">
												<strong>储存量：</strong>${experimental_animal.quantity}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty experimental_animal.note}">
												<strong>备注：</strong>${experimental_animal.note}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>									
										</div>
									</div>
								</li>  
						<div class="line"></div>
      					<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 
      					     	<ul> 
      							<!-- ====================================================以下为第二层信息【相关实验】=============================================================== -->    																
      								<li class="line">
      									<div id="second_level_menu_title-01" class="second_leve_menu">
      										<a href="javascript:void(0);">
      										<img id="second_level_menu_image-01" src="resources/images/plus.png">
      											<span>相关实验</span>
      										</a>
      									</div>
      									<div id="second_level_menu-01" class="second_level_text">
											<p></p>
											<c:if test="${!empty experimental_animal.origin}">
												<strong>相关实验：</strong>${experimental_animal.origin}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty experimental_animal.save_info}">
												<strong>相关实验：</strong>${experimental_animal.save_info}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
										</div>
									</li>  
      								<!-- ====================================================以上为第二层信息【相关实验】=============================================================== -->  
      								<!-- ====================================================以下为第二层信息【可提供的相关供技术服务】=============================================================== -->    																
      								<li class="line">
      									<div id="second_level_menu_title-02" class="second_leve_menu">
      										<a href="javascript:void(0);">
      										<img id="second_level_menu_image-02" src="resources/images/plus.png">
      											<span>可提供的相关供技术服务</span>
      										</a>
      									</div>
      									<div id="second_level_menu-02" class="second_level_text">
											<p></p>
											<c:if test="${!empty experimental_animal.origin}">
												<strong>可提供的相关供技术服务：</strong>${experimental_animal.origin}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
											<c:if test="${!empty experimental_animal.save_info}">
												<strong>可提供的相关供技术服务：</strong>${experimental_animal.save_info}
												<hr style="height:5px;border:none;border-top:1px dashed #c0c0c0;" />	
											</c:if>
										</div>
									</li>  
      								<!-- ====================================================以上为第二层信息【可提供的相关供技术服务】=============================================================== -->  
      								</ul>	
								<c:if test="${!empty experimental_animal.time}">
									<p><div class="text-right" style=" text-align:right;">发布时间：${experimental_animal.time}&nbsp;</div></p>
								</c:if>	
						</div>
			</div>
		</div>
		</div>
		</div>
		
<jsp:include page="foot.jsp"/>
	</body>
</html>