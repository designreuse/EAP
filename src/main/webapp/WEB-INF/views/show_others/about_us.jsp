<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currentTime = new java.util.Date();
String str_date1 = formatter.format(currentTime); 
%>
<!DOCTYPE html>
<!--
这是主框架.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <base href="<%=basePath%>">
  <title>中国科学院 | 模式与特色动物实验平台</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap-table -->
  <link rel="stylesheet" href="resources/plugins/bootstrap-table-master/css/bootstrap-table.min.css">
  <!-- 我的CSS -->
  <link rel="stylesheet" href="resources/css/wts_animal_style.css">
  <link rel="stylesheet" type="text/css" href="resources/css/wts_text_detail_style.css" />	
</head>
<body>
<div class="wrapper">
  <!-- Main Header -->
	<jsp:include page="../shell_frame/shell_frame_head.jsp"/>
  <!-- Main Sidebar -->
	<jsp:include page="../shell_frame/shell_frame_sidebar-4-2.jsp"/>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
    	<div class="row">    	
	      <div class="col-md-12">
	          <div class="box box-info frame-mini">
	            <div class="box-header with-border">
	              <h3 class="box-title">平台介绍</h3>
	            </div>
	            <div class="box-body" >
      			<div class="main_window">
					<div class="faceplate" >
						<div class="embed">										
	      					<div class="row col-md-12">
	      					<h3 class="text-center">动物生态与保护生物学院重点实验室 — 生物多样性信息学研究组简介</h3>	
							  <div class="callout callout-gray">							  
								<strong>研究方向</strong>
								<div class="line"></div><p></p>
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生物多样性信息学，主要研究生物多样性信息采集、整理、存储、处理和共享过程中的关键技术和手段，探讨生物多样性评价的方法并开发评价工具，研究制订生物多样性数据规范和标准，规划、设计并实施生物多样性信息数据库系统建设。
								</p>								
				              </div>	
				              <div class="callout callout-gray">							  
								<strong>研究成果</strong>
								<div class="line"></div><p></p>
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.中国生物物种名录(Catalogue of Life, China)：自2008年开始，中国科学院每年向全球发布《中国生物物种名录》年度名录。其目的是收集所有在中国分布的生物物种的名录数据，为全球使用者免费提供。该名录包含了物种的拉丁名、同物异名、中文名、别名、分布区、分类系统及其相关文献。每个物种的信息都由分类学家重新审定。2014版年度名录包含了79792个物种及种下单元的名录信息，其中，动物界31637个，细菌界469个，色素界1954个，真菌界1620个，植物界41562个，原生动物界1745个，病毒805个。
								</p>		
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 生物分类树工具(TTT, http://ttt.biodinfo.org)：是一个基于网络的分类学系统维护和分析工具。它支持分类学家和分类学数据集成者建立、管理、分析比较、共享各种树状的生物分类系统数据。为了进行科学的比较，确定了三个基本关系，即本级名称关系、高阶元关系和低阶元关系。定义了两个指数，节点指数和结构指数。为了简练直观地表达比较结果，设计了可视化用户界面，用不同的符号和颜色表示不同的比较结果。为了方便使用，与TTT配合建立的分类树仓库已经收集了生物多样性领域全球重要组织，如GBIF、NCBI、EOL、CoL等，建立的45个分类学系统树。
								</p>			
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. 俾斯比核心(Bisby Core)：是一个关于生物分类系统和分类单元信息的数据标准，它依据生物分类学数据特征设计，可用于分类学系统和分类单元数据的描述、存储和传输。它吸收了现有的一些数据标准，如达尔文核心等的有用成分，并根据需要设计了一些新的组成和元素。它支持多分类系统和多语言环境，强调科学审核和权威性文献支持。它由六个部分组成，分别是分类树、分类单元、分类单元属性、检索表、参考文献和专家等。有几组元素分别描述分类树和语言相关的属性。
								</p>		
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. 中国动物主题数据库(http://www.zoology.csdb.cn/)：包含了22个中国动物学研究的子数据库及其信息服务平台，如中国动物志、中国动物图谱、鸟类、蜜蜂、内陆水体鱼类、两栖和爬行类、直翅目昆虫、云南蝴蝶、昆虫模式标本、濒危和保护动物、动物名称等数据库。使用者可以通过关键词搜索、分类系统浏览或地图地点选择等方式查询中国动物物种的数据。
								</p>		
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5. 网络生命大百科中国节点(EOL-China，http://www.eolchina.org)：网络生命大百科（Encyclopedia of Life，http://www.eol.org，简称EOL）是一个完全开放和共享性的生物多样性信息系统，是史无前例的科学研究群体和公众共同合作的网络信息共享平台，其目标是为所有人提供完全免费获取的有关世界生物有机体的知识。中国科学院生物多样性委员会作为EOL的合作伙伴，以“门户+分站”的方式建设了EOL-China站点，采取镜像策略将核心数据和网站部署在中国科学院动物研究所网络节点中，并以镜像为基础，进行相关的汉语翻译、功能开发等工作，为中国地区提供特色、迅速、稳定的生物学信息服务。
								</p>		
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6. 数字昆虫实验室(VLDI，http://www.vldi.org/)：由中国科学院动物研究所和中国农业大学植保技术创新实验室联合建设，旨在推动计算机技术在昆虫分类学中应用。目前VLDI集数据收集、方法服务共享、信息资源共享为一体，为昆虫学家、图像技术人员、人工智能研究人员、植物保护科技工作者提供数据和技术服务。实验室网页于2011年启动，已经共享了200余幅精心处理过的昆虫图像以及相关研究资料。目前网站的内容有：经过规范化处理后的昆虫图像图像集1套；经典昆虫图像处理方法若干，含网页接口和网络服务接口；本研究组相关文献和资料下载；暂未公开的昆虫、虫害图像若干套。
								</p>						
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7. 蝴蝶图像在线鉴定系统(BIS，http://bes.biodinfo.org/Pages/ByImage/imgButterfly1.aspx：利用基于内容的图像检索技术框架实现对蝴蝶标本图像的鉴定，这个框架使得系统容易通过对数据的追加而提高系统的性能，因此能够更好、更充分的利用获取的各种蝴蝶图像数据。目前BIS收集了中国12科1200多种蝴蝶的4000多幅标本图像，并以这些图像为模板图像数据，使用了另外有来源的200余幅图像进行科级识别测试。在已有的数据基础上测试中，种属覆盖较全的凤蝶科图像正确匹配率可以达到84%。
								</p>		
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8. 昆虫目级阶元标本图像自动鉴定系统(http://bes.biodinfo.org/Pages/ByImage/imgCommonOrder1.aspx)：这项研究的科学假设是，可以用计算机图像识别的方式，仅从昆虫的外观就可以快速地识别出它属于哪个目、哪个科和哪个属。我们的这项实验是利用昆虫标本图像为素材，尝试将标本自动分类到目。根据昆虫的分类学特性，定义了7个图像特征参数，分别是躯干与虫体面积比、躯干宽长比、躯干上部长度参数、整体宽与长宽和比、躯干上部与躯干面积比、体型参数和色彩参数。选择使用人工神经网络和支持向量机作为模式识别的方法。在9个目的昆虫标本图像测试中，使用人工神经网络方法识别的平均准确率均在81%以上，而使用支持向量机方法识别的准确率均在91%以上。
								</p>		
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9. 基于互联网的跨平台多模型物种分布地预测系统(mMWeb，http://mmweb.animal.net.cn)：是一个开源免费的，基于浏览器的，集成18个常用的生态位模型的在线物种分布地预测平台。用户可通过该平台，应用多个不同的生态位模型，或同一模型的不同参数，对同一组数据进行分析和建模，比较模型的预测结果，并从中选择合适的模型及参数进行物种分布地预测工作。该平台是一个多任务并行系统，运行在一台超级计算机上，并通过一个特定的应用程序接口运行利用不同语言（C，Java，R等）编写的模型算法。
								</p>		
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10. 物种潜在分布地预测系统V2.0(PSDS 2.0)：根据对生物分布地预测模型和软件发展现状的分析和总结，本研究提出并实现一个基于GIS且具有多个代表性模型的生物分布地预测系统(PSDS 2.0)。PSDS 2.0系统继承了1.0的环境包络和聚类包络模型, 进一步引入了限制因子包络、马氏距离、支持向量机等新模型, 并针对本领域中模型比较与选择的难点增加了迭代交叉验证的多模型选择功能。系统还实现了灵活定制和评估伪负样本的功能, 通过用只需要正样本的Ⅰ类模型预测的结果对随机产生的伪负样本进行评估, 减小其落入适宜地区的概率, 进一步提高需要正负样本的Ⅱ类模型的准确率。GIS功能在PSDS 2.0中也得到加强, 被应用于数据准备及结果分析等重要环节。
								</p>		
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;11. 物种数据采集系统(SDCP)：是一个基于网络的动物物种数据管理系统，支持分类学专家和数据管理者录入、审核、维护和共享分类学数据。分类学系统树为系统的基本数据，连接着物种及各个分类阶元的相关信息，如命名、文献、生物学描述、分布、图像和多媒体、同物异名、别名等。允许多名专家共同管理一个分类树上的不同部分，或同一个分类树由多人分别录入和审核。结果可以导出为俾斯比核心标准的数据文件，供其它系统共享数据。
								</p>		
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12. 生物学生僻汉字服务系统(http://chinese.biodinfo.org)：针对一些中文生物学典籍中出现的生僻汉字在计算机中无法显示和发音的问题，研究组开发了生物学生僻汉字服务系统，通过造字、生成编码、发布等过程，使这些生僻汉字得以在计算机常见系统中显示出来；同时为生物学中某些汉字在特殊情况下的特殊发音提供相关的检索、发音服务。
								</p>		
				              </div>	
				              <div class="callout callout-gray">							  
								<strong>联系方式</strong>
								<div class="line"></div><p></p>
								<p>中国科学院动物研究所</p>		
								<p>地址：北京市朝阳区北辰西路1号院5号</p>	
								<p>电话：010-64807129</p>	
								<p>传真：010-64807099 </p>	
								<p>Email：ji@ioz.ac.cn</p>							
				              </div>
							</div>
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

<!-- Responsive tables -->
<script type="text/javascript" src="resources/plugins/bootstrap-table-master/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="resources/plugins/bootstrap-table-master/js/bootstrap-table-zh-CN.js"></script>
<!-- Echarts -->
<script type="text/javascript" src="resources/js/echarts-all.js"></script>
<!-- 我的js -->
<script type="text/javascript" src="resources/js/javascript.js"></script>   
</body>
</html>