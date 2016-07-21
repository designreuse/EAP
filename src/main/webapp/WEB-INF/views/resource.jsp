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
<script>
    jQuery(function(){      
      jQuery('#camera_wrap_1').camera({
        height: '317px',
        loader: false,
        pagination: false,
        thumbnails: false
      });
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
		<div class="ic">More Website Templates at <a href="#" >Website Template</a></div>
		<div class="inner">
			<div class="container_12">

				<div class="wrapper">
					<div class="grid_12">
						<h2 class="h-pad1">资源信息</h2>
						<ul class="wrapper works">
							<li class="grid_4 alpha">
								<figure><img src="resources/images/resource01.jpg" alt=""></figure>
								<p><a href="#" class="link">实验动物</a></p>
								本平台各组织成员所做的特色实验。
								<p><a href="#" class="button">查看详情</a></p>
							</li>
							<li class="grid_4">
								<figure><img src="resources/images/resource02.jpg" alt=""></figure>
								<p><a href="#" class="link">动物模型</a></p>
								本平台各组织成员所做特有的实验设备。
								<p><a href="#" class="button">查看详情</a></p>
							</li>
							<li class="grid_4 omega">
								<figure><img src="resources/images/resource03.jpg" alt=""></figure>
								<p><a href="#" class="link">设备信息</a></p>
								本平台各组织成员在研究中发现的科研成果。
								<p><a href="#" class="button">科研成果</a></p>
							</li>							
						</ul>
					</div>
				</div>
			</div>			
		</div>
	</div>
<jsp:include page="foot.jsp"/>
</body>
</html>
