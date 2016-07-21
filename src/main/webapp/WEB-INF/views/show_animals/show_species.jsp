
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
	  <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <base href="<%=basePath%>">
	  <title>中国科学院 | 模式与特色动物实验平台</title>
	  <!-- Tell the browser to be responsive to screen width -->
	  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	  <!-- 我的CSS -->
	  <link rel="stylesheet" href="resources/css/wts_animal_style.css">
	  <link rel="stylesheet" type="text/css" href="resources/css/wts_text_detail_style.css" />	
	</head>
      <body>
<div class="wrapper">
  <!-- Main Header -->
	<jsp:include page="../shell_frame/shell_frame_head.jsp"/>
  <!-- Main Sidebar -->
	<jsp:include page="../shell_frame/shell_frame_sidebar-2-1.jsp"/>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
		 <section class="content-header">
    	<div class="row">    	
	      <div class="col-md-12">
	          <div class="box box-info frame-mini">
	            <div class="box-header with-border">
	              <h3 class="box-title">物种详情</h3>
	            </div>
	            <div class="box-body" >					    
    			<h3 class="text-center">
        			<c:if test="${!empty species.species_ch}">
							${species.species_ch}
					</c:if>
					<c:if test="${!empty species.species_en}">
							（${species.species_en}）
					</c:if>         		
        		</h3>
      			<div class="main_window">
<!-- ====================================================以下为第一层信息【基本信息】=============================================================== -->    																
      				<div class="faceplate" >
						<div class="embed">										
	      					<div class="row col-md-12">
	      						<div class="callout callout-gray">
	      						<c:if test="${(!empty species.phylum_ch)||(!empty species.phylum_en)}">
									<li><strong>门：</strong>
								</c:if>
									<c:if test="${!empty species.phylum_ch}">
										${species.phylum_ch}
									</c:if>
									<c:if test="${!empty species.phylum_en}">
										（${species.phylum_en}）
									</c:if>
								<c:if test="${(!empty species.phylum_ch)||(!empty species.phylum_en)}">
									</li>
									<div class="dotted-line"></div>
								</c:if>
								<c:if test="${(!empty species.class_ch)||(!empty species.class_en)}">
									<li><strong>纲：</strong>
								</c:if>
									<c:if test="${!empty species.class_ch}">
										${species.class_ch}
									</c:if>
									<c:if test="${!empty species.class_en}">
										（${species.class_en}）
									</c:if>
								<c:if test="${(!empty species.class_ch)||(!empty species.class_en)}">
									</li>
									<div class="dotted-line"></div>
								</c:if>
								<c:if test="${(!empty species.order_ch)||(!empty species.order_en)}">
									<li><strong>目：</strong>
								</c:if>
									<c:if test="${!empty species.order_ch}">
										${species.order_ch}
									</c:if>
									<c:if test="${!empty species.order_en}">
										（${species.order_en}）
									</c:if>
								<c:if test="${(!empty species.order_ch)||(!empty species.order_en)}">
									</li>
									<div class="dotted-line"></div>
								</c:if>
								<c:if test="${(!empty species.family_ch)||(!empty species.family_en)}">
									<li><strong>科：</strong>
								</c:if>
									<c:if test="${!empty species.family_ch}">
										${species.family_ch}
									</c:if>
									<c:if test="${!empty species.family_en}">
										（${species.family_en}）
									</c:if>
								<c:if test="${(!empty species.family_ch)||(!empty species.family_en)}">
									</li>
									<div class="dotted-line"></div>
								</c:if>
								<c:if test="${(!empty species.genus_ch)||(!empty species.genus_en)}">
									<li><strong>科：</strong>
								</c:if>
									<c:if test="${!empty species.genus_ch}">
										${species.genus_ch}
									</c:if>
									<c:if test="${!empty species.genus_en}">
										（${species.genus_en}）
									</c:if>
								<c:if test="${(!empty species.genus_ch)||(!empty species.genus_en)}">
									</li>
									<div class="dotted-line"></div>
								</c:if>
								<c:if test="${(!empty species.species_ch)||(!empty species.species_en)}">
									<li><strong>种：</strong>
								</c:if>
									<c:if test="${!empty species.species_ch}">
										${species.species_ch}
									</c:if>
									<c:if test="${!empty species.species_en}">
										（${species.species_en}）
									</c:if>
								<c:if test="${(!empty species.species_ch)||(!empty species.species_en)}">
									</li>
									<div class="dotted-line"></div>
								</c:if>
								<c:if test="${!empty species.note}">
									<li><strong>简介：</strong>${species.note}</li>
									<div class="dotted-line"></div>
								</c:if>
	      						<div  id="preparation_ref" class="preparation_ref">												
									<p></p><font class="f-deepblue">参考文献：</font>
									这里是参考文献		
								</div>												
								<a id="preparation_ref_more" class="preparation_ref_more" href="javascript:void(0);">+&nbsp;&nbsp;参考文献</a>
								<a id="preparation_ref_less" class="preparation_ref_less" href="javascript:void(0);"><br/>-&nbsp;&nbsp;收起</a>			
							</div>
							</div>								
	      				</div>
					</div>
					
<!-- ====================================================以上为第一层信息【基本信息】=============================================================== --> 

 						
        						<div class="row col-md-12">
								<c:if test="${!empty species.time}">
									<p><div class="text-right" style=" text-align:right;">发布时间：${species.time}&nbsp;</div></p>
								</c:if>	
								</div>
						</div>
				</div>
	          </div>
	      </div>
		</div>		
    </section>    
    
    <!-- Main content -->
    <section class="content">

      <!-- Your Page Content Here -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


  <!-- Main Footer -->
	<jsp:include page="../shell_frame/shell_frame_footer.jsp"/>


  
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- 我的js -->
<script type="text/javascript" src="resources/js/javascript.js"></script>   
</body>
</html>