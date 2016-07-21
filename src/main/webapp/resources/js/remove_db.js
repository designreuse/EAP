//登录弹出框
function login_layer(){
	var form_width="400px";
	var form_height="450px";
	  if($(window).width()<=400){
	    form_width="100%"
	  	form_height="100%"
	   }
	    layer.open({
	      type: 2,//page层
	      title: '用户登录',//标题
	      moveType: 1, //拖拽风格，0是默认，1是传统拖动
	      shadeClose: true,
	      shift: 0, //0-6的动画形式，-1不开启
	      scrollbar: false,
	      shade: 0.6,//遮罩透明度
	      area: [form_width, form_height],
	      content: 'login', //iframe的url
	    });
	}

//编辑用户信息弹出框
function edit_user_layer(user_id){
	var form_width="400px";
	var form_height="550px";
	  if($(window).width()<=400){
	    form_width="100%"
	  	form_height="100%"
	   }
	    layer.open({
	      type: 2,
	      title: '编辑用户信息',
	      moveType: 1, 
	      shadeClose: true,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: [form_width, form_height],
	      content: 'super/edit/user/info/'+user_id, 
	    });
	}
//添加公告通知弹出框
function add_announcement_layer(){	
	  
	    layer.open({
	      type: 2,
	      title: '添加公告通知',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/announcement', 
	    });
	}