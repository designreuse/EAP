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
function edit_user_layer(user_id,authority){
	var form_width="400px";
	var form_height="550px";
	  if($(window).width()<=400){
	    form_width="100%"
	  	form_height="100%"
	   }
	  if(authority == "SUPER"){
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
	  if(authority == "ADMIN"){
		    layer.open({
		      type: 2,
		      title: '编辑用户信息',
		      moveType: 1, 
		      shadeClose: true,
		      shift: 0, 
		      scrollbar: false,
		      shade: 0.6,
		      area: [form_width, form_height],
		      content: 'admin/edit/user/info/'+user_id, 
		    });
		  }
	  if(authority == "USER"){
		    layer.open({
		      type: 2,
		      title: '编辑用户信息',
		      moveType: 1, 
		      shadeClose: true,
		      shift: 0, 
		      scrollbar: false,
		      shade: 0.6,
		      area: [form_width, form_height],
		      content: 'user/edit/user/info/'+user_id, 
		    });
		  }
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
//编辑公告通知弹出框
function edit_announcement_layer(id){		  
	    layer.open({
	      type: 2,
	      title: '编辑公告通知',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/announcement/'+id, 
	    });
	}
//删除单条公告通知提示弹出框
function remove_announcement_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
            url: 'admin/remove/announcement/'+id,
            cache: false,
            success: function () {
        		location.reload();
            	layer.msg('删除成功');	
            },
            error: function () {
            }
        });
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}
//添加教育培训弹出框
function add_training_layer(){	
	    layer.open({
	      type: 2,
	      title: '添加教育培训',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/training', 
	    });
	}
//编辑教育培训弹出框
function edit_training_layer(id){		  
	    layer.open({
	      type: 2,
	      title: '编辑教育培训',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/training/'+id, 
	    });
	}
//删除单条教育培训提示弹出框
function remove_training_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
            url: 'admin/remove/training/'+id,
            cache: false,
            success: function () {
        		location.reload();
            	layer.msg('删除成功');	
            },
            error: function () {
            }
        });
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}
//添加法律法规弹出框
function add_law_layer(){	
	    layer.open({
	      type: 2,
	      title: '添加法律法规',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/law', 
	    });
	}
//编辑法律法规弹出框
function edit_law_layer(id){		  
	    layer.open({
	      type: 2,
	      title: '编辑法律法规',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/law/'+id, 
	    });
	}
//删除单条法律法规提示弹出框
function remove_law_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
            url: 'admin/remove/law/'+id,
            cache: false,
            success: function () {
        		location.reload();
            	layer.msg('删除成功');	
            },
            error: function () {
            }
        });
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}
//添加技术服务弹出框
function add_technology_layer(){	
	    layer.open({
	      type: 2,
	      title: '添加技术服务',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/technology', 
	    });
	}
//编辑技术服务弹出框
function edit_technology_layer(id){		  
	    layer.open({
	      type: 2,
	      title: '编辑技术服务',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/technology/'+id, 
	    });
	}
//删除单条技术服务提示弹出框
function remove_technology_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
            url: 'admin/remove/technology/'+id,
            cache: false,
            success: function () {
        		location.reload();
            	layer.msg('删除成功');	
            },
            error: function () {
            }
        });
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}
//添加物种弹出框
function add_species_layer(){	
	    layer.open({
	      type: 2,
	      title: '添加物种',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/species', 
	    });
	}
//编辑物种弹出框
function edit_species_layer(id){		  
	    layer.open({
	      type: 2,
	      title: '编辑物种',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/species/'+id, 
	    });
	}
//删除单条物种提示弹出框
function remove_species_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
            url: 'admin/remove/species/'+id,
            cache: false,
            success: function () {
        		location.reload();
            	layer.msg('删除成功');	
            },
            error: function () {
            }
        });
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}
//添加品系弹出框
function add_strain_layer(){	
	    layer.open({
	      type: 2,
	      title: '添加品系',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/strain', 
	    });
	}
//编辑品系弹出框
function edit_strain_layer(id){		  
	    layer.open({
	      type: 2,
	      title: '编辑品系',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/strain/'+id, 
	    });
	}
//删除单条品系提示弹出框
function remove_strain_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
            url: 'admin/remove/strain/'+id,
            cache: false,
            success: function () {
        		location.reload();
            	layer.msg('删除成功');	
            },
            error: function () {
            }
        });
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}

//添加遗传数据弹出框
function add_genetic_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加遗传数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/genetic_data/'+strain_id, 
	    });
	}
//编辑遗传数据弹出框
function edit_genetic_data_layer(strain_id,id){		
	    layer.open({
	      type: 2,
	      title: '编辑遗传数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/genetic_data/'+strain_id+'/'+id, 
	    });
	}
//删除单条遗传数据提示弹出框
function remove_genetic_data_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
          url: 'admin/remove/genetic_data/'+id,
          cache: false,
          success: function () {
      		location.reload();
          	layer.msg('删除成功');	
          },
          error: function () {
          }
      });
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}

//添加血液生理数据弹出框
function add_blood_physiological_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加血液生理数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/blood_physiological_data/'+strain_id, 
	    });
	}
//添加生殖生理数据弹出框
function add_reproduction_physiological_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加生殖生理数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/reproduction_physiological_data/'+strain_id, 
	    });
	}
//添加生长发育生理数据弹出框
function add_grow_physiological_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加生长发育生理数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/grow_physiological_data/'+strain_id, 
	    });
	}
//添加呼吸生理数据弹出框
function add_breathe_physiological_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加呼吸生理数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/breathe_physiological_data/'+strain_id, 
	    });
	}
//添加体温生理数据弹出框
function add_temperature_physiological_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加体温生理数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/temperature_physiological_data/'+strain_id, 
	    });
	}
//添加消化生理数据弹出框
function add_digestive_physiological_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加消化生理数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/digestive_physiological_data/'+strain_id, 
	    });
	}
//添加免疫生理数据弹出框
function add_immune_physiological_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加免疫生理数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/immune_physiological_data/'+strain_id, 
	    });
	}
//添加心血管生理数据弹出框
function add_cardiovascular_physiological_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加心血管生理数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/cardiovascular_physiological_data/'+strain_id, 
	    });
	}
//编辑生理数据弹出框
function edit_physiological_data_layer(strain_id,id){		
	    layer.open({
	      type: 2,
	      title: '编辑生理数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/physiological_data/'+strain_id+'/'+id, 
	    });
	}
//删除单条生理数据提示弹出框
function remove_physiological_data_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
        url: 'admin/remove/physiological_data/'+id,
        cache: false,
        success: function () {
    		location.reload();
        	layer.msg('删除成功');	
        },
        error: function () {
        }
    });
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}
//添加血液生化数据弹出框
function add_blood_biochemical_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加血液生化数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/blood_biochemical_data/'+strain_id, 
	    });
	}
//添加尿生化数据弹出框
function add_urine_biochemical_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加尿生化数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/urine_biochemical_data/'+strain_id, 
	    });
	}
//编辑生化数据弹出框
function edit_biochemical_data_layer(strain_id,id){		
	    layer.open({
	      type: 2,
	      title: '编辑生化数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/biochemical_data/'+strain_id+'/'+id, 
	    });
	}
//删除单条生化数据提示弹出框
function remove_biochemical_data_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
        url: 'admin/remove/biochemical_data/'+id,
        cache: false,
        success: function () {
    		location.reload();
        	layer.msg('删除成功');	
        },
        error: function () {
        }
    });
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}
//添加体尺解剖数据弹出框
function add_body_measurement_autopsy_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加体尺解剖数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/body_measurement_autopsy_data/'+strain_id, 
	    });
	}
//添加骨骼解剖数据弹出框
function add_skeleton_autopsy_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加骨骼解剖数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/skeleton_autopsy_data/'+strain_id, 
	    });
	}
//添加脏器重量解剖数据弹出框
function add_organ_weight_autopsy_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加脏器重量解剖数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/organ_weight_autopsy_data/'+strain_id, 
	    });
	}
//添加肠道长度解剖数据弹出框
function add_intestinal_length_autopsy_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加肠道长度解剖数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/intestinal_length_autopsy_data/'+strain_id, 
	    });
	}
//添加乳头解剖数据弹出框
function add_nipple_autopsy_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加乳头解剖数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/nipple_autopsy_data/'+strain_id, 
	    });
	}
//添加齿式解剖数据弹出框
function add_dental_formula_autopsy_data_layer(strain_id){	
	    layer.open({
	      type: 2,
	      title: '添加齿式解剖数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/dental_formula_autopsy_data/'+strain_id, 
	    });
	}
//编辑解剖数据弹出框
function edit_autopsy_data_layer(strain_id,id){		
	    layer.open({
	      type: 2,
	      title: '编辑解剖数据',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/autopsy_data/'+strain_id+'/'+id, 
	    });
	}
//删除单条解剖数据提示弹出框
function remove_autopsy_data_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
        url: 'admin/remove/autopsy_data/'+id,
        cache: false,
        success: function () {
    		location.reload();
        	layer.msg('删除成功');	
        },
        error: function () {
        }
    });
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}
//添加实验动物弹出框
function add_experimental_animal_layer(){	
	    layer.open({
	      type: 2,
	      title: '添加实验动物',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/experimental_animal', 
	    });
	}
//编辑实验动物弹出框
function edit_experimental_animal_layer(experimental_animal_id){		
	    layer.open({
	      type: 2,
	      title: '编辑实验动物',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/experimental_animal/'+experimental_animal_id, 
	    });
	}
//删除单条实验动物提示弹出框
function remove_experimental_animal_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
        url: 'admin/remove/experimental_animal/'+id,
        cache: false,
        success: function () {
    		location.reload();
        	layer.msg('删除成功');	
        },
        error: function () {
        }
    });
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}
//添加特色动物弹出框
function add_characteristic_animal_layer(){	
	    layer.open({
	      type: 2,
	      title: '添加特色动物',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/characteristic_animal', 
	    });
	}
//编辑特色动物弹出框
function edit_characteristic_animal_layer(id){		  
	    layer.open({
	      type: 2,
	      title: '编辑特色动物',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/characteristic_animal/'+id, 
	    });
	}
//删除单条特色动物提示弹出框
function remove_characteristic_animal_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
            url: 'admin/remove/characteristic_animal/'+id,
            cache: false,
            success: function () {
        		location.reload();
            	layer.msg('删除成功');	
            },
            error: function () {
            }
        });
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}
//添加特色实验弹出框
function add_experiment_layer(){	
	    layer.open({
	      type: 2,
	      title: '添加特色实验',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/experiment', 
	    });
	}
//编辑特色实验弹出框
function edit_experiment_layer(id){		  
	    layer.open({
	      type: 2,
	      title: '编辑特色实验',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/experiment/'+id, 
	    });
	}
//删除单条特色实验提示弹出框
function remove_experiment_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
            url: 'admin/remove/experiment/'+id,
            cache: false,
            success: function () {
        		location.reload();
            	layer.msg('删除成功');	
            },
            error: function () {
            }
        });
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}

//添加科研成果弹出框
function add_achievement_layer(){	
	    layer.open({
	      type: 2,
	      title: '添加科研成果',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/achievement', 
	    });
	}
//编辑科研成果弹出框
function edit_achievement_layer(id){		  
	    layer.open({
	      type: 2,
	      title: '编辑科研成果',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/achievement/'+id, 
	    });
	}
//删除单条科研成果提示弹出框
function remove_achievement_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
          url: 'admin/remove/achievement/'+id,
          cache: false,
          success: function () {
      		location.reload();
          	layer.msg('删除成功');	
          },
          error: function () {
          }
      });
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}

//添加特色设备弹出框
function add_characteristic_equipment_layer(){	
	    layer.open({
	      type: 2,
	      title: '添加特色设备',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/characteristic_equipment', 
	    });
	}
//编辑特色设备弹出框
function edit_characteristic_equipment_layer(id){		  
	    layer.open({
	      type: 2,
	      title: '编辑特色设备',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/characteristic_equipment/'+id, 
	    });
	}
//删除单条特色设备提示弹出框
function remove_characteristic_equipment_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
        url: 'admin/remove/characteristic_equipment/'+id,
        cache: false,
        success: function () {
    		location.reload();
        	layer.msg('删除成功');	
        },
        error: function () {
        }
    });
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}

//添加常规设备弹出框
function add_common_equipment_layer(){	
	    layer.open({
	      type: 2,
	      title: '添加常规设备',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/common_equipment', 
	    });
	}
//编辑常规设备弹出框
function edit_common_equipment_layer(id){		  
	    layer.open({
	      type: 2,
	      title: '编辑常规设备',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/common_equipment/'+id, 
	    });
	}
//删除单条常规设备提示弹出框
function remove_common_equipment_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
      url: 'admin/remove/common_equipment/'+id,
      cache: false,
      success: function () {
  		location.reload();
      	layer.msg('删除成功');	
      },
      error: function () {
      }
  });
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}

//添加单位机构弹出框
function add_organization_layer(){	
	    layer.open({
	      type: 2,
	      title: '添加单位机构',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'super/add/organization', 
	    });
	}
//编辑单位机构弹出框
function edit_organization_layer(id){		  
	    layer.open({
	      type: 2,
	      title: '编辑单位机构',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'super/edit/organization/'+id, 
	    });
	}
//删除单条单位机构提示弹出框
function remove_organization_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
    url: 'super/remove/organization/'+id,
    cache: false,
    success: function () {
		location.reload();
    	layer.msg('删除成功');	
    },
    error: function () {
    }
});
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}

//添加联系人弹出框
function add_person_layer(){	
	    layer.open({
	      type: 2,
	      title: '添加联系人',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/add/person', 
	    });
	}
//编辑联系人弹出框
function edit_person_layer(id){		  
	    layer.open({
	      type: 2,
	      title: '编辑联系人',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'admin/edit/person/'+id, 
	    });
	}
//删除单条联系人提示弹出框
function remove_person_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
  url: 'admin/remove/person/'+id,
  cache: false,
  success: function () {
		location.reload();
  	layer.msg('删除成功');	
  },
  error: function () {
  }
});
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}

//添加角色弹出框
function add_role_layer(){	
	    layer.open({
	      type: 2,
	      title: '添加角色',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'super/add/role', 
	    });
	}
//编辑角色弹出框
function edit_role_layer(id){		  
	    layer.open({
	      type: 2,
	      title: '编辑角色',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'super/edit/role/'+id, 
	    });
	}
//删除单条角色提示弹出框
function remove_role_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
url: 'super/remove/role/'+id,
cache: false,
success: function () {
		location.reload();
	layer.msg('删除成功');	
},
error: function () {
}
});
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}

//添加权限弹出框
function add_power_layer(){	
	    layer.open({
	      type: 2,
	      title: '添加权限',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'super/add/power', 
	    });
	}
//编辑权限弹出框
function edit_power_layer(id){		  
	    layer.open({
	      type: 2,
	      title: '编辑权限',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'super/edit/power/'+id, 
	    });
	}
//删除单条权限提示弹出框
function remove_power_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
url: 'super/remove/power/'+id,
cache: false,
success: function () {
		location.reload();
	layer.msg('删除成功');	
},
error: function () {
}
});
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}


//添加用户弹出框
function add_user_layer(){	
	    layer.open({
	      type: 2,
	      title: '添加用户',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'super/add/user', 
	    });
	}
//编辑用户弹出框
function edit_user_layer(id){		  
	    layer.open({
	      type: 2,
	      title: '编辑用户',
	      shadeClose: true,
	      move: false,
	      shift: 0, 
	      scrollbar: false,
	      shade: 0.6,
	      area: ['100%', '100%'],
	      content: 'super/edit/user/'+id, 
	    });
	}
//删除单条用户提示弹出框
function remove_user_layer(id){	
	layer.confirm('您确定要删除该条记录吗？', {
	    btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
url: 'super/remove/user/'+id,
cache: false,
success: function () {
		location.reload();
	layer.msg('删除成功');	
},
error: function () {
}
});
	    layer.msg('删除成功');
	}, function(){
		layer.msg('已取消操作');
	});
}

//设置制定角色的权限
function set_power(check_id){	
	edit_power_tree_layer(check_id);
}
//权限设置弹出页
function edit_power_tree_layer(id){
	var form_width="100%";
    var height="100";
	  if($(window).width()>=770){
	    form_width="200px"
          height = $(window).height();
	   }  
    layer.open({
      type: 2,
      title: '编辑权限',
      shadeClose: true,
      move: false,
      shift: 0, 
      scrollbar: false,
      shade: 0.6,
      area:[form_width,'80%'],
      content: 'admin/power/tree/'+id, 
    });
	}