package com.journaldev.spring;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.journaldev.spring.model.Role;
import com.journaldev.spring.model.Role_power;
import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.PowerService;
import com.journaldev.spring.service.RoleService;

@Controller
public class RoleController {
	
	private RoleService roleService;
	private UserService userService;
	private PowerService powerService;
	
	@Autowired(required=true)
	@Qualifier(value="powerService")
	public void setPowerService(PowerService os){
		this.powerService = os;
	}	
	@Autowired(required=true)
	@Qualifier(value="roleService")
	public void setRoleService(RoleService os){
		this.roleService = os;
	}
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService as){
		this.userService = as;
	}
	 
   @RequestMapping(value = "/super/role", method = RequestMethod.GET)
   
   public String listRoles(Model model) {
		model.addAttribute("role", new Role());
		model.addAttribute("listRoles", this.roleService.listRoles());
		return "role";
}
  
 //角色管理列表
   @RequestMapping(value = {"/admin/role_list"}, method = RequestMethod.GET)   
   public String userRole_list(Model model) {
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
		model.addAttribute("listRoles", this.roleService.listRoles());
		return "admin_roles/role_list";
   }
 //添加角色
   @RequestMapping(value ="/super/add/role", method = RequestMethod.GET)
   public String addRole_admin(Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        //新建一个空的角色实体类
		model.addAttribute("role", new Role());
       return "admin_roles/add_role";
   }
 //发布角色
   @RequestMapping(value= "/super/save/role", method = RequestMethod.POST)
   public String saveRole_admin(@ModelAttribute("role") Role role, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        Random rand = new Random();
		int randNum1 = rand.nextInt(1000);
		int randNum2 = rand.nextInt(1000);
		String randStr1=Integer.toHexString(randNum1);
		String randStr2=Integer.toHexString(randNum2);		
		//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
		role.setId(randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2);
		//存入数据库
		this.roleService.addRole(role);
        return "submit_success/add_success";
   }
 //编辑角色
   @RequestMapping(value ="/super/edit/role/{id}", method = RequestMethod.GET)
   public String editRole_admin(@PathVariable("id") String id, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        //获取编辑目标
        model.addAttribute("role", this.roleService.getRoleById(id));
       return "admin_roles/edit_role";
   }
 //更新角色
   @RequestMapping(value= "/super/update/role", method = RequestMethod.POST)
   public String updateRole_admin(@ModelAttribute("role") Role role, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
		this.roleService.updateRole(role);
        return "submit_success/edit_success";
   }
   
//删除角色
	@RequestMapping("/super/remove/role/{id}")
    public String removeRole_admin(@PathVariable("id") String id){			
        this.roleService.removeRole(id);
        return "submit_success/remove_success";
    }

 //获取权限id和name列表
	@RequestMapping("/admin/getRole")
	@ResponseBody
    public List<Object[]> getRole_list(){			
    	List<Object[]> role_list=this.roleService.listRole_id_name();
        return role_list;
    }
    
  //构建z-tree格式  
    public class List_power_for_js{
		private int id;
		private int pId;
		private String name;
		private boolean open;
		private boolean checked;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getPId() {
			return pId;
		}
		public void setPId(int pId) {
			this.pId = pId;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public boolean isOpen() {
			return open;
		}
		public void setOpen(boolean open) {
			this.open = open;
		}
		public boolean isChecked() {
			return checked;
		}
		public void setChecked(boolean checked) {
			this.checked = checked;
		}
	}
    
  //获取某角色的权限的z-tree格式列表
   	@RequestMapping("/admin/role/getRole_power/{id}")
   	@ResponseBody
    public JSON getRole_power(@PathVariable("id") String id, Model model){	
    	   	//获取当前登录的用户账号
   			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
   			//以当前登录的用户账号查询用户实体类，并返回Model
   			model.addAttribute("user", this.userService.getUserByName(name));
            //获取目标 
            Role role =this.roleService.getRoleById(id);            
            List<Object[]> all_power_list=this.powerService.listPower_ztree();            
            Set<Role_power> role_power_list=role.getRole_power();   
    		List<List_power_for_js> list_power_for_js = new ArrayList();
    		for(int i=0;i<all_power_list.size();i++){
            	List_power_for_js power_for_js=new List_power_for_js();
            	power_for_js.setId((int) all_power_list.get(i)[0]);
            	power_for_js.setName(all_power_list.get(i)[2].toString());
            	power_for_js.setPId((int) all_power_list.get(i)[1]);
            	power_for_js.setOpen(true);
            	power_for_js.getId();
            	for (Role_power power : role_power_list) {  
    				if(power_for_js.getId()==power.getPower().getId())
    				{
    					power_for_js.setChecked(true);					
    				}
    			}			
    			list_power_for_js.add(power_for_js);
          } 
    		String jsonString = JSON.toJSONString(list_power_for_js);      		
           return (JSON) JSON.toJSON(list_power_for_js);
       }    

    //显示某角色的权限树
      @RequestMapping(value ="/admin/power/tree/{id}", method = RequestMethod.GET)
      public String adminRole_power_tree(@PathVariable("id") String id, Model model){
   		//获取当前登录的用户账号
   		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
   		//以当前登录的用户账号查询用户实体类，并返回Model
           model.addAttribute("user", this.userService.getUserByName(name));
           //获取编辑目标
           model.addAttribute("role", this.roleService.getRoleById(id));           
          return "admin_powers/tree_for_role";
      }

      //删除某角色的权限树
        @RequestMapping(value ="/admin/power/remove/tree/{id}", method = RequestMethod.GET)
        public String removeRole_power_tree(@PathVariable("id") String id, Model model){
     		//获取当前登录的用户账号
     		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
     		//以当前登录的用户账号查询用户实体类，并返回Model
             model.addAttribute("user", this.userService.getUserByName(name));
             //获取目标角色 
             //Role role =this.roleService.getRoleById(id);
             //获取目标角色权限集合    
             //Set<Role_power> role_power_list=role.getRole_power();
             //删除目标角色权限集合
             this.powerService.removeRole_power(id);
            return "admin_powers/tree_for_role";
        }

        //更新某角色的权限树
          @RequestMapping(value ="/admin/power/update/tree/{id}", method = RequestMethod.GET)
          public String updateRole_power_tree(@PathVariable("id") String id, Model model,HttpServletRequest request){
       		//获取当前登录的用户账号
       		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
       		//以当前登录的用户账号查询用户实体类，并返回Model
               model.addAttribute("user", this.userService.getUserByName(name));
               //获取目标角色 
               Role role =this.roleService.getRoleById(id);

             //建立新的role_resc列表
               String role_power_id="";
               String power_id_str=request.getParameter("u_resc_id");
               int power_id=Integer.parseInt(power_id_str);
               Random rand = new Random();
	       		int randNum1 = rand.nextInt(1000);
	       		int randNum2 = rand.nextInt(1000);
	       		String randStr1=Integer.toHexString(randNum1);
	       		String randStr2=Integer.toHexString(randNum2);		
	       		//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
	       		role_power_id=randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2;               
               this.powerService.updateRole_power(role_power_id,id,power_id);
   	        return "submit_success/edit_success";
          }
    
    
	//For add and update role both
	@RequestMapping(value= "/super/role/add", method = RequestMethod.POST)
	public String addRole(@ModelAttribute("role") Role o){
		System.out.println(o.getName());
		if(o.getId() == null){
			Random rand = new Random();
			int randNum1 = rand.nextInt(10000);
			int randNum2 = rand.nextInt(10000);
			String randStr1=Integer.toHexString(randNum1);
			String randStr2=Integer.toHexString(randNum2);
			o.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
			this.roleService.addRole(o);
		}else{
			this.roleService.updateRole(o);
		}
		
		return "redirect:/super/role";
		
	}
	
	@RequestMapping("/super/role/remove/{id}")
    public String removemRole(@PathVariable("id") String id){
		
        this.roleService.removeRole(id);
        return "redirect:/super/role";
    }
 
    @RequestMapping("/super/role/edit/{id}")
    public String editrole(@PathVariable("id") String id, Model model){
        model.addAttribute("role", this.roleService.getRoleById(id));
        model.addAttribute("listRoles", this.roleService.listRoles());
        return "role";
    }
}
