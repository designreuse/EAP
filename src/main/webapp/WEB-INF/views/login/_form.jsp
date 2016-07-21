<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

		<script type="text/javascript" src="resources/js/jquery-2.1.4.js"> </script>
	<p></p>
	 <!-- 用户名 -->
	<div class="form-group">
		<label class="col-sm-2 control-label">用户名：</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" placeholder="请输入用户名" name="username" >
		</div>
		<label class="col-sm-2 control-label">密码：</label>
		<div class="col-sm-10">
			<input type="password" class="form-control" placeholder="请输入密码" name="password" >
		</div>
		<label class="col-sm-2 control-label">验证码：</label>
		<div class="col-sm-10">
			<input type="text" id="authcode" class="form-control" placeholder="请输入验证码，区分大小写" name="authcode" >
		</div>
		<label class="col-sm-2 control-label"><a href="javascript:loadimage();" style="color:#000">点击刷新验证码:</a></label>
            <div class="col-sm-10">
            	<span width="150" valign="middle" align="center"><img alt="code..." name="randimage" id="randimage" src="random_image" width="120" height="40" border="1" align="absmiddle">
				</span>
            </div>
		<script language="javascript">
			function loadimage(){
				document.getElementById("randimage").src="random_image?"+Math.random();
			}
		</script> 
		
			<a href="javascript:loadrandfont();" style="color:#000">取验证码,调试用</a>
		<script language="javascript">
			function loadrandfont(){
					$("#authcode").val("${rand_font}");
			}
		</script> 
		
 	</div>
	

