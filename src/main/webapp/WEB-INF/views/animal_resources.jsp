<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="gb2312"><link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic' rel='stylesheet' type='text/css'>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="resources/css/grid.css" type="text/css" media="screen">
<link rel="stylesheet" href="resources/css/camera.css" type="text/css" media="screen">
<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen">
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/jquery-migrate-1.1.1.js"></script>
<script type="text/javascript" src="resources/js/camera.js"></script>
<script type="text/javascript" src="resources/js/jquery.easing.1.3.js"></script>
<%
	List<String> group_s=new ArrayList<String>();
	List ps=(List)request.getAttribute("experimental_animal_strain");
	List pn=(List)request.getAttribute("count_experimental_animal");
	for(int i=0;i<ps.size();i++){
		group_s.add("'"+ps.get(i)+"'");
	}
%>
<script type="text/javascript" src="resources/js/chart1.js"></script>	
<script type="text/javascript" >									
$(document).ready(function () { 
		showChart(<%=pn%>, <%=group_s%>)
	});
</script>
  <!--[if lt IE 8]><div style='text-align:center'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/img/upgrade.jpg"border="0"alt=""/></a></div><![endif]-->
  	<!--[if lt IE 9]>
	   	<script src="resources/js/html5shiv.js"></script>
	   	<link rel="stylesheet" href="resources/css/ie.css" type="text/css" media="screen">
	   	<link href='http://fonts.googleapis.com/css?family=Lato:300italic' rel='stylesheet' type='text/css'>
	   	<link href='http://fonts.googleapis.com/css?family=Lato:300' rel='stylesheet' type='text/css'>
	   	<link href='http://fonts.googleapis.com/css?family=Lato:400' rel='stylesheet' type='text/css'>
	   	<link href='http://fonts.googleapis.com/css?family=Lato:700' rel='stylesheet' type='text/css'>
    <![endif]-->
</head>

<body>
<jsp:include page="head.jsp"/>
	<div id="content">
		<div class="inner">
			<div class="container_12">
				<div class="wrapper">
						<h2 class="h-pad1">实验动物资源</h2>
						<ul class="wrapper works">
							<li class="grid_4">
								<figure><img src="resources/images/resource01.jpg" alt=""></figure>
								<p><a href="show/experimental_animal/1" class="link">实验动物</a></p>
								标准的实验动物或模式动物，由稳定的品系培养而来。<br/>
								<p><a href="show/experimental_animal/1" class="button">查看详情</a></p>
								<br/>【特点】适合做室内实验，多应用于生物个体相关的功能、代谢、结构等研究，探索疾病的发病机制，寻找预防及治疗方法等。
							</li>						
							<li class="grid_chart1">
								<div id="chart1" style="width:100%;height:450px;"></div><br/>
							</li>	
						</ul>	
						<hr style="height:1px;border:none;border-top:1px solid #555555;" />
						<ul class="wrapper works">
						<h2 class="h-pad1">特色动物资源</h2>					
							<li class="grid_4">							
								<figure><img src="resources/images/resource02.jpg" alt=""></figure>
								<p><a href="show/characteristic_animal/1" class="link">特色动物</a></p>
								特色动物，无固定品系，为特定品种在原生环境和野外饲养。<br/>
								<p><a href="show/characteristic_animal/1" class="button">查看详情</a></p>
								<br/>【特点】野外养殖，生存能力强，适合做特定的动物生态学实验。
							</li>						
						</ul>
				</div>
			</div>			
		</div>
	</div>
<script type="text/javascript" src="resources/js/echarts-all.js"></script>
<jsp:include page="foot.jsp"/>
</body>
</html>
