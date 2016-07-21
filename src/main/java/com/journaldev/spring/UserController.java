package com.journaldev.spring;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;

import org.apache.commons.io.FileUtils;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.journaldev.spring.model.User;
import com.journaldev.spring.model.Experimental_animal;
import com.journaldev.spring.model.Files;
import com.journaldev.spring.model.Power;
import com.journaldev.spring.model.Strain;
import com.journaldev.spring.service.OrganizationService;
import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.MessageService;
import com.journaldev.spring.service.FileService;

@Controller
public class UserController {
	
	private UserService userService;
	private OrganizationService organizationService;
	private MessageService messageService;
	private FileService fileService;
	private final static Map<String,Files> filelist = new HashMap<String,Files>(); 
	
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService ps){
		this.userService = ps;
	}
	@Autowired(required=true)
	@Qualifier(value="organizationService")
	public void setOrganizationService(OrganizationService os){
		this.organizationService = os;
	}
	@Autowired(required=true)
	@Qualifier(value="messageService")
	public void setMessageService(MessageService ms){
		this.messageService = ms;
	}
	@Autowired(required=true)
	@Qualifier(value="fileService")
	public void setFileService(FileService os){
		this.fileService = os;
	}
	
   //登陆成功跳转中间页
   @RequestMapping(value = "/login_success", method = RequestMethod.GET)
   		public String Loginsuccess(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	   	//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类
		User user=this.userService.getUserByName(name);		
		response.setCharacterEncoding("UTF=8");
	    response.setContentType("text/html;charset=UTF-8");
	    //使用request对象的getSession()获取session，如果session不存在则创建一个
	    HttpSession session = request.getSession();
	    //将数据存储到session中
	    session.setAttribute("user", user);
	    //System.out.println("==========");
	    //获得session中保留的信息
	    //String uuuu = session.getAttribute("user").toString();
	    //User aaa=(User) session.getAttribute("user");
	    //String aaaa=aaa.getName();
	    //System.out.println(aaaa);
	    //System.out.println("==========");
	   	return "login/login_success";   
    }
   //修改用户个人资料-超级管理员
   @RequestMapping("/super/edit/admin/info/{id}")
   public String editUserInfo(@PathVariable("id") String id, Model model){
	   model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
       model.addAttribute("user", this.userService.getUserById(id));
       return "backstage_super/edit_admininfo";
   }
   //更新用户个人资料-超级管理员
   @RequestMapping(value = "/super/update/admin/info/{id}", method = RequestMethod.POST) 
   public String updateUserInfo(@PathVariable("id") String id,@ModelAttribute("user") User user){
	   user.setPassword(this.userService.getUserById(id).getPassword());
	   user.setAuthority(this.userService.getUserById(id).getAuthority());
	   user.setEnable(this.userService.getUserById(id).getEnable());
	   this.userService.updateUser(user);
       return "backstage_super/update_success";
   }
   //编辑用户头像
   @RequestMapping(value = "/edit_face_image/{id}")
   public String edit_face_image(@PathVariable("id") String id, Model model) {
	   model.addAttribute("user", this.userService.getUserById(id));
       model.addAttribute("file", new Files());
       if(this.userService.getUserById(id).getAuthority().equals("SUPER")){
    	   return "backstage_super/edit_adminimage";
       }
       if(this.userService.getUserById(id).getAuthority().equals("ADMIN")){
    	   return "backstage_admin/edit_adminimage";
       }
       if(this.userService.getUserById(id).getAuthority().equals("USER")){
    	   return "admin/edit_adminimage";
       }
       else{
    	   return "error";
       }   
   }	
   //更新用户头像
   @RequestMapping(value="/face_image/update/{user_id}", method=RequestMethod.POST)  
   public String addImage(Files file, @RequestParam MultipartFile[] myfiles, HttpServletRequest request, @PathVariable("user_id") String user_id, Model model, User user) throws IOException{  
       for(MultipartFile myfile : myfiles){  
           if(myfile.isEmpty()){  
               System.out.println("文件未上传");  
           }else{  
               System.out.println("文件长度: " + myfile.getSize());  
               System.out.println("文件类型: " + myfile.getContentType());  
               System.out.println("文件名称: " + myfile.getName());  
               System.out.println("文件原名: " + myfile.getOriginalFilename());  
               System.out.println("========================================");  
               String realPath="";
               Random rand = new Random();
   			int randNum1 = rand.nextInt(10000);
   			int randNum2 = rand.nextInt(10000);
   			String randStr1=Integer.toHexString(randNum1);
   			String randStr2=Integer.toHexString(randNum2);
   			String file_id=randStr1+java.util.UUID.randomUUID().toString()+randStr2;
   			file.setId(file_id); 
               	realPath = request.getSession().getServletContext().getRealPath("/resources/files/images");   
                   FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, myfile.getOriginalFilename()));  
               	   file.setType(myfile.getContentType());
                   file.setUrl("resources/files/images/");
                   file.setName(myfile.getOriginalFilename());
                   long filesize=myfile.getSize();
                   filesize=(filesize/1024);
                   file.setSize(Long.toString(filesize));
                   Date nowdate = new Date();
                   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
                   String filetime=sdf.format(nowdate);
                   file.setTime(filetime);   
                   this.fileService.addFile(file);
   	    		   this.userService.updateUserphoto(user_id,file_id);
   	    		   filelist.put(file.getName(), file); 

   	    	       if(this.userService.getUserById(user_id).getAuthority().equals("SUPER")){
   	    	    	   return "redirect:/super/index";
   	    	       }
   	    	       if(this.userService.getUserById(user_id).getAuthority().equals("ADMIN")){
   	    	    	   return "redirect:/admin/index";
   	    	       }
   	    	       if(this.userService.getUserById(user_id).getAuthority().equals("USER")){
   	    	    	   return "redirect:/admin/index";
   	    	       }
   	    	       else{
   	    	    	   return "error";
   	    	       }  
           }  
       }
       	if(this.userService.getUserById(user_id).getAuthority().equals("SUPER")){
	    	   return "redirect:/super/index";
	    }
	    if(this.userService.getUserById(user_id).getAuthority().equals("ADMIN")){
	    	   return "redirect:/admin/index";
	    }
	    if(this.userService.getUserById(user_id).getAuthority().equals("USER")){
	    	   return "redirect:/admin/index";
	    }
	    else{
	    	   return "error";
	    }        
   }  
   //修改用户个人资料-管理员
   @RequestMapping("/admin/edit/admin/info/{id}")
   public String editUserInfo_admin(@PathVariable("id") String id, Model model){
	   model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
       model.addAttribute("user", this.userService.getUserById(id));
       return "backstage_admin/edit_admininfo";
   }
   //更新用户个人资料-管理员
   @RequestMapping(value = "/admin/update/admin/info/{id}", method = RequestMethod.POST) 
   public String updateUserInfo_admin(@PathVariable("id") String id,@ModelAttribute("user") User user){
	   user.setPassword(this.userService.getUserById(id).getPassword());
	   user.setAuthority(this.userService.getUserById(id).getAuthority());
	   user.setEnable(this.userService.getUserById(id).getEnable());
	   this.userService.updateUser(user);
       return "backstage_admin/update_success";
   }   
   

   
   //用户管理列表
     @RequestMapping(value = {"/admin/user_list"}, method = RequestMethod.GET)   
     public String userUser_list(Model model) {
  		//获取当前登录的用户账号
  		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
  		//以当前登录的用户账号查询用户实体类，并返回Model
          model.addAttribute("user_login", this.userService.getUserByName(name));
  		model.addAttribute("listUsers", this.userService.listUsers());
  		return "admin_users/user_list";
     }
   //添加用户
     @RequestMapping(value ="/super/add/user", method = RequestMethod.GET)
     public String addUser_admin(Model model){
  		//获取当前登录的用户账号
  		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
  		//以当前登录的用户账号查询用户实体类，并返回Model
          model.addAttribute("user", this.userService.getUserByName(name));
          //新建一个空的用户实体类
  		model.addAttribute("user", new User());
 	   model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
         return "admin_users/add_user";
     }
   //发布用户
     @RequestMapping(value= "/super/save/user", method = RequestMethod.POST)
     public String saveUser_admin(@ModelAttribute("user") User user, Model model){
  		//获取当前登录的用户账号
  		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
  		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        Random rand = new Random();
		int randNum1 = rand.nextInt(1000);
		int randNum2 = rand.nextInt(1000);
		String randStr1=Integer.toHexString(randNum1);
		String randStr2=Integer.toHexString(randNum2);
		//设置发布时间为服务器日期时间并规范
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		user.setRegister_time(df.format(new Date()));	
		//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
		user.setId(randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2);
          //存入数据库
  		this.userService.addUser(user);
          return "submit_success/add_success";
     }
   //编辑用户
     @RequestMapping(value ="/super/edit/user/{id}", method = RequestMethod.GET)
     public String editUser_admin(@PathVariable("id") String id, Model model){
  		//获取当前登录的用户账号
  		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
  		//以当前登录的用户账号查询用户实体类，并返回Model
          model.addAttribute("user", this.userService.getUserByName(name));
   	   model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
          //获取编辑目标
          model.addAttribute("user", this.userService.getUserById(id));
         return "admin_users/edit_user";
     }
   //更新用户
     @RequestMapping(value= "/super/update/user", method = RequestMethod.POST)
     public String updateUser_admin(@ModelAttribute("user") User user, Model model){
  		//获取当前登录的用户账号
  		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
  		//以当前登录的用户账号查询用户实体类，并返回Model
          model.addAttribute("user", this.userService.getUserByName(name));
  		this.userService.updateUser(user);
          return "submit_success/edit_success";
     }
     
  //删除用户
  	@RequestMapping("/super/remove/user/{id}")
      public String removeUser_admin(@PathVariable("id") String id){			
          this.userService.removeUser(id);
          return "submit_success/remove_success";
      }
   
   
   @RequestMapping(value = "/user", method = RequestMethod.GET)
	   
	   public String listUsers(Model model) {
			model.addAttribute("user", new User());
			model.addAttribute("listUsers", this.userService.listUsers());
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
			return "user";   
    }
   @RequestMapping("/user_register")
	public String createSUser(Model model){
	   model.addAttribute("user", new User());
		model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
       return "add_admin";
   }
   @RequestMapping(value= "/user_register/add", method = RequestMethod.POST)
	public String adduser(@ModelAttribute("user") User p){
		Random rand = new Random();
		int randNum1 = rand.nextInt(10000);
		int randNum2 = rand.nextInt(10000);
		String randStr1=Integer.toHexString(randNum1);
		String randStr2=Integer.toHexString(randNum2);
		p.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
		p.setEnable("1");
		p.setAuthority("USER");
		this.userService.addUser(p);
		return "redirect:/welcome";
	}

   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public ModelAndView login(
   @RequestParam(value = "error", required = false) String error,
   @RequestParam(value = "logout", required = false) String logout) {

       ModelAndView model = new ModelAndView();
       if (error != null) {
           model.addObject("error", "用户名密码错误");
       }

       if (logout != null) {
           model.addObject("msg", "您已成功注销");
       }
       model.setViewName("login/login");

       return model;

   }
			
	//For add and update user both
	@RequestMapping(value= "/super/add", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User p){
		
		if(p.getId() == null){
			Random rand = new Random();
			int randNum1 = rand.nextInt(10000);
			int randNum2 = rand.nextInt(10000);
			String randStr1=Integer.toHexString(randNum1);
			String randStr2=Integer.toHexString(randNum2);
			p.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
			this.userService.addUser(p);
		}else{
			//existing user, call update
			this.userService.updateUser(p);
		}
		
		return "redirect:/user";
		
	}
	
	@RequestMapping("/super/remove/{id}")
    public String removeUser(@PathVariable("id") String id){
		
        this.userService.removeUser(id);
        return "redirect:/user";
    }
 
    @RequestMapping("/super/edit/{id}")
    public String editUser(@PathVariable("id") String id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));
        model.addAttribute("listUsers", this.userService.listUsers());
        model.addAttribute("listOrganizations", this.organizationService.listOrganizations());
        return "user";
    }
    
	@RequestMapping("/admin/index/{id}/{name}")
    public String user_index(@PathVariable("id") String id,@PathVariable("name") String name, Model model){
        model.addAttribute("user", this.userService.getUserById(id));
        if(this.userService.getUserById(id).getName().equals(name))
        {
        	if(this.userService.getUserById(id).getAuthority().equals("USER"))
        	{
        		model.addAttribute("inbox_noread", this.messageService.inbox(id, 2).size());
        		model.addAttribute("inbox", this.messageService.inbox(id, 1).size());
        		return "index_admin";
        	}        	
        	else
        	{
        		return "error";
        	}
        }
        else{
        	return "error";
        }
    }	
	@RequestMapping("/admin/index_backstage/{id}/{name}")
    public String admin_index(@PathVariable("id") String id,@PathVariable("name") String name, Model model){
        model.addAttribute("user", this.userService.getUserById(id));
        
        if(this.userService.getUserById(id).getName().equals(name))
        {
        	if(this.userService.getUserById(id).getAuthority().equals("ADMIN"))
        	{
        		model.addAttribute("inbox_noread", this.messageService.inbox(id, 2).size());
        		model.addAttribute("inbox", this.messageService.inbox(id, 1).size());
        		return "index_backstage_admin";
        	}
        	else
        	{
        		return "error";
        	}
        }
        else{
        	return "error";
        }
    }
	@RequestMapping(value = "/edit_admininfo/{id}/{name}")
	   public String edit_admininfo(@PathVariable("id") String id,@PathVariable("name") String name, Model model) {
		   model.addAttribute("user", this.userService.getUserById(id));   
		   model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
		   model.addAttribute("inbox_noread", this.messageService.inbox(id, 2).size());
		   model.addAttribute("inbox", this.messageService.inbox(id, 1).size());
	       if(this.userService.getUserById(id).getName().equals(name))
	       {       
	    	   if(this.userService.getUserById(id).getAuthority().equals("USER"))
	    	   {
	    		   return "edit_admininfo_admin";
	    	   }
	    	   else if(this.userService.getUserById(id).getAuthority().equals("ADMIN"))
	    	   {
	    		   return "edit_admininfo_admin";
	    	   }
	    	   else
	    	   {
	    		   return "error";
	    	   }
	       }
	       else
	       {
	       		return "error";
	       }
	   }		
	
//	@RequestMapping(value = "/update_face_image/{id}/{name}", method = RequestMethod.POST)
//	   public String update_face_image(@PathVariable("id") String id,@PathVariable("name") String name, @ModelAttribute("user") User p) {
//		   
//	       if(this.userService.getUserById(id).getName().equals(name))
//	       {       
//	    	   if(this.userService.getUserById(id).getAuthority().equals("USER"))
//	    	   {
//	    		   p.setPassword(this.userService.getUserById(id).getPassword());
//	    		   p.setAuthority(this.userService.getUserById(id).getAuthority());
//	    		   p.setEnable(this.userService.getUserById(id).getEnable());
//	    		   this.userService.updateUser(p);
//	    		   return "redirect:/admin/index/"+p.getId()+"/"+p.getName();
//	    	   }
//	    	   if(this.userService.getUserById(id).getAuthority().equals("ADMIN"))
//	    	   {
//	    		   p.setPassword(this.userService.getUserById(id).getPassword());
//	    		   p.setAuthority(this.userService.getUserById(id).getAuthority());
//	    		   p.setEnable(this.userService.getUserById(id).getEnable());
//	    		   this.userService.updateUser(p);
//	    		   return "redirect:/admin/index_backstage/"+p.getId()+"/"+p.getName();
//	    	   }
//	    	   else
//	    	   {
//	    		   return "error";
//	    	   }
//	       }
//	       else
//	       {
//	       		return "error";
//	       }
//	   }	    	
	@RequestMapping(value = "/update_admininfo/{id}/{name}", method = RequestMethod.POST)
	   public String update_admininfo(@PathVariable("id") String id,@PathVariable("name") String name, @ModelAttribute("user") User p) {
		   
	       if(this.userService.getUserById(id).getName().equals(name))
	       {       
	    	   if(this.userService.getUserById(id).getAuthority().equals("USER"))
	    	   {
	    		   p.setPassword(this.userService.getUserById(id).getPassword());
	    		   p.setAuthority(this.userService.getUserById(id).getAuthority());
	    		   p.setEnable(this.userService.getUserById(id).getEnable());
	    		   this.userService.updateUser(p);
	    		   return "redirect:/admin/index/"+p.getId()+"/"+p.getName();
	    	   }
	    	   else if(this.userService.getUserById(id).getAuthority().equals("ADMIN"))
	    	   {
	    		   p.setPassword(this.userService.getUserById(id).getPassword());
	    		   p.setAuthority(this.userService.getUserById(id).getAuthority());
	    		   p.setEnable(this.userService.getUserById(id).getEnable());
	    		   this.userService.updateUser(p);
	    		   return "redirect:/admin/index_backstage/"+p.getId()+"/"+p.getName();
	    	   }
	    	   else
	    	   {
	    		   return "error";
	    	   }
	       }
	       else
	       {
	       		return "error";
	       }
	   }	
	
}
