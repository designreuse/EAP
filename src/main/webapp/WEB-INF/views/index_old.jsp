<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>中国科学院模式特色动物实验平台</title>
</head>
<body>
<jsp:include page="head.jsp"/>
	<div id="content">
		
		<div id="slider">
			<div class="container_12">
				<div class="grid_12">
				<div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
		      <div data-src="resources/images/slide1.jpg">
		          <div class="camera_caption fadeIn">
		              <h2>特色实验</h2>
		              	 中国首个国产“人工心脏”项目研制取得新突破。研发团队将继续优化血泵性能、丰富血泵类型、降低生产成本，早日使国际先进水平的心室辅助装置以低廉的价格应用于医疗临床。
		              	<p><a href="#" class="button">阅读详情</a></p>
		          </div>
		      </div>
		      <div data-src="resources/images/slide2.jpg">
		          <div class="camera_caption fadeIn">
		              <h2>动物定制</h2>
		              	真核生物的RNA分子上可发生100多种修饰，其中腺嘌呤第6位氮原子上的甲基化修饰 (N6-methyladenosine, m6A) 是高等生物mRNA上含量最为丰富的修饰。m6A修饰参与调控mRNA的剪接、运输、稳定性和翻译效率等。
		              	<p><a href="#" class="button">阅读详情</a></p>
		          </div>
		      </div>
		      <div data-src="resources/images/slide3.jpg">
		          <div class="camera_caption fadeIn">
		              <h2>科研成果</h2>
		              	周琪课题组合作发现m6A修饰形成的分子机制和m6A在促进细胞重编程中的新功能。Tong Chen et al, 2015. m6A RNA Methylation Is Regulated by MicroRNAs and Promotes Reprogramming to Pluripotency. Cell Stem Cell.
		              	<p><a href="#" class="button">阅读详情</a></p>
		          </div>
		      </div>
		     </div>
		    </div>
	  	</div>
		</div>
		<div class="inner">
			<div class="container_12">
				<div class="wrapper">
					<div class="block">
						<div class="grid_7">
							<div class="grid-inner">
							<h2>平台资源</h2>
								<div class="wrapper">
									<figure class="img-indent"><a href="animal_resources"><img src="resources/images/index_animal1.jpg" onmouseout="this.src='resources/images/index_animal1.jpg'" onmouseover="this.src='resources/images/index_animal2.jpg'"></a></figure>
									动物资源信息库,包含了各种类型的动物信息数据及其主要生物学特性数据。<br/>
									当前含有：<br/>
									<% 
									int exp_a=0; 
									int ach_a=0;
									int oth_a=0;									
									%>
									<c:if test="${!empty showAnimals}">		
										<c:forEach items="${showAnimals}" var="animal">		
											<c:if test="${animal.classification eq '实验动物'}">									
											<% exp_a=exp_a+1; %>											
											</c:if>		
											<c:if test="${animal.classification eq '特色动物'}">									
											<% ach_a=ach_a+1; %>											
											</c:if>								
										</c:forEach>
									</c:if>
									<a href="show/experimental_animal/1">实验动物资源（${numberExperimental_animals}种）、</a><br/>									
									<a href="show/characteristic_animal/1">特色动物资源（${numberCharacteristic_animals}种）。</a>
								</div>
								<p></p>
								<div class="wrapper">
									<figure class="img-indent"><a href="show/equipment"><img src="resources/images/index_equipment1.jpg" onmouseout="this.src='resources/images/index_equipment1.jpg'" onmouseover="this.src='resources/images/index_equipment2.jpg'"></a></figure>
									本平的设备资源是13个组成单位所储存的设备资源信息库。<br/>当前含有：<br/>特色设备资源（30种）、<br/>常规设备资源（12种）. 									
								</div>
								<p></p>
							</div>
						</div>
						
						<div class="grid_5">
									<h2>平台公告</h2>
									<div class="picture-frame-announcementlist">
									<table class="announcementlist">
										<c:if test="${!empty paginationAnnouncements}">
										<c:forEach items="${paginationAnnouncements}" var="announcement">
										<c:if test="${announcement.classification eq '平台公告'}">
											<tr><td>•<a href="show/announcement/detail/${announcement.id}" target="_blank">&nbsp;
												<c:if test="${fn:length(announcement.title) < 21}">
												${announcement.title}												
												</c:if>	
												<c:if test="${fn:length(announcement.title) > 21}">
												${fn:substring(announcement.title, 0, 21)}...
												</c:if>	
												</a>&nbsp;&nbsp;&nbsp;</td><td>${announcement.time}</td></tr>
													<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td></tr>
										</c:if>
										</c:forEach>
										</c:if>									
										<tr><td></td><td><a href="show/announcement/1">>更多${date}</a></td></tr>
									</table>
									</div>
						</div>
						
						<div class="grid_7">
							<div class="grid-inner">
							<h2>平台服务</h2>
								<div class="wrapper">
									<figure class="img-indent"><a href="show/technology"><img src="resources/images/index_technicall1.jpg" onmouseout="this.src='resources/images/index_technicall1.jpg'" onmouseover="this.src='resources/images/index_technicall2.jpg'"></a></figure>
									技术支持。<br/>
									当前含有：<br/>
									
									<%=oth_a%>种服务项目. 
								</div>
								<p></p>
								<div class="wrapper">
									<figure class="img-indent"><a href="show/detection"><img src="resources/images/index_inspection1.jpg" onmouseout="this.src='resources/images/index_inspection1.jpg'" onmouseover="this.src='resources/images/index_inspection2.jpg'"></a></figure>
									检测服务。<br/>
									当前含有：<br/>
									
									<%=oth_a%>种服务项目. 
								</div>
								<p></p>
								<div class="wrapper">
									<figure class="img-indent"><a href="show/entrust"><img src="resources/images/index_entrust1.jpg" onmouseout="this.src='resources/images/index_entrust1.jpg'" onmouseover="this.src='resources/images/index_entrust2.jpg'"></a></figure>
									委托实验。<br/>
									当前含有：<br/>
									
									<%=oth_a%>试验委托. 
								</div>
								<p></p>
							</div>
						</div>
						<div class="grid_5">
									<h2>科研成果</h2>
									<div class="picture-frame-announcementlist">
									<table class="announcementlist">									
										<c:if test="${!empty showAnnouncements}">
										<c:forEach items="${showAnnouncements}" var="announcement">
										<c:if test="${announcement.classification eq '法律法规'}">
											<tr><td>•<a href="show/announcement/detail/${announcement.id}" target="_blank">&nbsp;${announcement.title}</a>&nbsp;&nbsp;&nbsp;</td><td>${announcement.time}</td></tr>
													<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td></tr>
										</c:if>
										</c:forEach>
										</c:if>									
										<tr><td></td><td><a href="show/announcement">>更多</a></td></tr>
									</table>
									</div>
						</div>
						<div class="grid_5">
									<h2>培训通知</h2>
									<div class="picture-frame-announcementlist">
									<table class="announcementlist">									
										<c:if test="${!empty showAnnouncements}">
										<c:forEach items="${showAnnouncements}" var="announcement">
										<c:if test="${announcement.classification eq '培训通知'}">
											<tr><td>•<a href="show/announcement/detail/${announcement.id}" target="_blank">&nbsp;${announcement.title}</a>&nbsp;&nbsp;&nbsp;</td><td>${announcement.time}</td></tr>
													<tr><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td><td><hr style="height:1px;border:none;border-top:1px solid #555555;" /></td></tr>
										</c:if>
										</c:forEach>
										</c:if>									
										<tr><td></td><td><a href="show/announcement">>更多</a></td></tr>
									</table>
									</div>
						</div>
					</div>
				</div>
				<div class="wrapper">
					<div class="grid_12">
						<h2 class="h-pad">相关单位</h2>
						<ul class="clients-list">
							<li><a href="http://www.cas.cn/"><img src="resources/images/client1.png" alt=""></a></li>
							<li><a href="http://www.ioz.ac.cn/"><img src="resources/images/client2.png" alt=""></a></li>
						</ul>
					</div>
				</div>
			</div>			
		</div>
	</div>


<jsp:include page="foot.jsp"/>

</body>
</html>
