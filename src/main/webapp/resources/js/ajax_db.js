function change_face_image(user_id){
					htmlobj=$.ajax({url:"edit_face_image/"+user_id,async:false});
					$("#face_image").html(htmlobj.responseText);
		}
//获取全部权限id、pid和name列表
function getPower_add(select_id){
	$.ajax({
        url: 'admin/getPower',
        type: 'get',
        cache: false,
        dataType:"json",
        success: function (data) {
        	for (var i=0;i<data.length;i++)
			{
				if(data[i][1]==0){
					$("<option value='"+data[i][0]+"'>一级菜单：【"+data[i][2]+"】</option>").appendTo("#"+select_id)					
			        }
			}           
			for (var i=0;i<data.length;i++)
			{
				if(data[i][1]==0){
					$("<optgroup label='"+data[i][2]+"' >").appendTo("#"+select_id);
			           for (var j=0;j<data.length;j++)
			           {
			        	   if(data[j][1]==data[i][0]){
			        	   $("<option value='"+data[j][0]+"'>二级菜单："+data[j][2]+"</option>").appendTo("#"+select_id)
			        	   }
			           }
			         $("</optgroup>").appendTo("#"+select_id);
			        }
			}           		
        },
        error: function () {
        	 alert("获取列表失败!"); 
        }
    });
}
//获取全部角色id和name列表
function getRole_add(select_id){
	$.ajax({
        url: 'admin/getRole',
        type: 'get',
        cache: false,
        dataType:"json",
        success: function (data) {
			for (var i=0;i<data.length;i++)
			{
				$("<option value='"+data[i][0]+"'>"+data[i][1]+"</option>").appendTo("#"+select_id)
			}           		
        },
        error: function () {
        	 alert("获取列表失败!"); 
        }
    });
}
//获取全部角色id和name列表
function getRole_edit(select_id,select_name){
    $.ajax({
        url: 'amdin/getRole',
        type: 'get',
        cache: false,
        dataType:"json",
        success: function (data) {
			for (var i=0;i<data.length;i++)
			{
				if(data[i][0] != select_name)
				{
					$("<option value='"+data[i][0]+"'>"+data[i][1]+"</option>").appendTo("#"+select_id)
				}
			}           		
        },
        error: function () {
       	 alert("获取列表失败!"); 
        }
    });
}
//获取全部实验id和title列表
function getExperiment_add(select_id){
	$.ajax({
        url: 'experiment/getExperiment',
        type: 'get',
        cache: false,
        dataType:"json",
        success: function (data) {
			for (var i=0;i<data.length;i++)
			{
				$("<option value='"+data[i][0]+"'>"+data[i][1]+"</option>").appendTo("#"+select_id)
			}           		
        },
        error: function () {
        	 alert("获取实验列表失败!"); 
        }
    });
}
//获取全部实验id和title列表
function getExperiment_edit(select_id,select_name){
    $.ajax({
        url: 'experiment/getExperiment',
        type: 'get',
        cache: false,
        dataType:"json",
        success: function (data) {
			for (var i=0;i<data.length;i++)
			{
				if(data[i][0] != select_name)
				{
					$("<option value='"+data[i][0]+"'>"+data[i][1]+"</option>").appendTo("#"+select_id)
				}
			}           		
        },
        error: function () {
       	 alert("获取实验列表失败!"); 
        }
    });
}


//获取全部设备id和name列表
function getEquipment_add(select_id){
	$.ajax({
        url: 'equipment/getEquipment',
        type: 'get',
        cache: false,
        dataType:"json",
        success: function (data) {
			for (var i=0;i<data.length;i++)
			{
				$("<option value='"+data[i][0]+"'>"+data[i][1]+"</option>").appendTo("#"+select_id)
			}           		
        },
        error: function () {
        	 alert("获取设备列表失败!"); 
        }
    });
}
//编辑时获取设备id和name列表
function getEquipment_edit(select_id,select_name){
    $.ajax({
        url: 'equipment/getEquipment',
        type: 'get',
        cache: false,
        dataType:"json",
        success: function (data) {
			for (var i=0;i<data.length;i++)
			{
				if(data[i][0] != select_name)
				{
					$("<option value='"+data[i][0]+"'>"+data[i][1]+"</option>").appendTo("#"+select_id)
				}
			}           		
        },
        error: function () {
       	 alert("获取设备列表失败!"); 
        }
    });
}

//获取全部物种id和name列表
function getSpecies_add(select_id){
	$.ajax({
      url: 'species/getSpecies',
      type: 'get',
      cache: false,
      dataType:"json",
      success: function (data) {
			for (var i=0;i<data.length;i++)
			{
				$("<option value='"+data[i][0]+"'>"+data[i][1]+"</option>").appendTo("#"+select_id)
			}           		
      },
      error: function () {
      	 alert("获取物种列表失败!"); 
      }
  });
}
//编辑时获取物种id和name列表
function getSpecies_edit(select_id,select_name){
    $.ajax({
        url: 'species/getSpecies',
        type: 'get',
        cache: false,
        dataType:"json",
        success: function (data) {
			for (var i=0;i<data.length;i++)
			{
				if(data[i][0] != select_name)
				{
					$("<option value='"+data[i][0]+"'>"+data[i][1]+"</option>").appendTo("#"+select_id)
				}
			}           		
        },
        error: function () {
       	 alert("获取物种列表失败!"); 
        }
    });
}
//获取全部品系id和name列表
function getStrain_add(select_id){
	$.ajax({
        url: 'strain/getStrain',
        type: 'get',
        cache: false,
        dataType:"json",
        success: function (data) {
			for (var i=0;i<data.length;i++)
			{
				$("<option value='"+data[i][0]+"'>"+data[i][1]+"</option>").appendTo("#"+select_id)
			}           		
        },
        error: function () {
        	 alert("获取物种列表失败!"); 
        }
    });
}

//编辑时获取品系id和name列表
function getStrain_edit(select_id,select_name){
    $.ajax({
        url: 'strain/getStrain',
        type: 'get',
        cache: false,
        dataType:"json",
        success: function (data) {
			for (var i=0;i<data.length;i++)
			{
				if(data[i][0] != select_name)
				{
					$("<option value='"+data[i][0]+"'>"+data[i][1]+"</option>").appendTo("#"+select_id)
				}
			}           		
        },
        error: function () {
       	 alert("获取列表失败!"); 
        }
    });
}

//获取全部人id和name列表
function getPerson_add(select_id){
	$.ajax({
      url: 'person/getPerson',
      type: 'get',
      cache: false,
      dataType:"json",
      success: function (data) {
			for (var i=0;i<data.length;i++)
			{
				$("<option value='"+data[i][0]+"'>"+data[i][1]+"</option>").appendTo("#"+select_id)
			}           		
      },
      error: function () {
      	 alert("获取物种列表失败!"); 
      }
  });
}

//编辑时获取人id和name列表
function getPerson_edit(select_id,select_name){
  $.ajax({
      url: 'person/getPerson',
      type: 'get',
      cache: false,
      dataType:"json",
      success: function (data) {
			for (var i=0;i<data.length;i++)
			{
				if(data[i][0] != select_name)
				{
					$("<option value='"+data[i][0]+"'>"+data[i][1]+"</option>").appendTo("#"+select_id)
				}
			}           		
      },
      error: function () {
     	 alert("获取列表失败!"); 
      }
  });
}