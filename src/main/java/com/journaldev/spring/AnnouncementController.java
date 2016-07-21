package com.journaldev.spring;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.journaldev.spring.model.Announcement;
import com.journaldev.spring.model.Collection;
import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.AnnouncementService;
import com.journaldev.spring.service.OrganizationService;

@Controller
public class AnnouncementController {
	
	private AnnouncementService announcementService;
	private UserService userService;
	private OrganizationService organizationService;
	
	@Autowired(required=true)
	@Qualifier(value="announcementService")
	public void setAnnouncementService(AnnouncementService ans){
		this.announcementService = ans;
	}
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService as){
		this.userService = as;
	}
	@Autowired(required=true)
	@Qualifier(value="organizationService")
	public void setOrganizationService(OrganizationService os){
		this.organizationService = os;
	}
	//公告列表
	   @RequestMapping(value = {"/announcement_list"}, method = RequestMethod.GET)   
	   public String showAnnouncement_list(Model model) {
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			model.addAttribute("listAnnouncements", this.announcementService.listAllAnnouncements());
			return "show_announcements/announcement_list";
	   }
	   
	 //公告详情 
	   @RequestMapping(value ="/show/announcement/detail/{id}", method = RequestMethod.GET)
	   public String showAnnouncement(@PathVariable("id") String id, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        model.addAttribute("announcement", this.announcementService.getAnnouncementById(id));
	       return "show_announcements/show_announcement";
	   }	
	 //公告通知管理列表
	   @RequestMapping(value = {"/admin/announcement_list"}, method = RequestMethod.GET)   
	   public String showAnnouncement_list_admin(Model model) {
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			model.addAttribute("listAnnouncements", this.announcementService.listAllAnnouncements());
			return "admin_announcements/announcement_list";
	   }
	 //添加公告
	   @RequestMapping(value ="/admin/add/announcement", method = RequestMethod.GET)
	   public String addAnnouncement_admin(Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        //新建一个空的公告实体类
			model.addAttribute("announcement", new Announcement());
			//单位列表
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
	       return "admin_announcements/add_announcement";
	   }
	 //发布公告
	   @RequestMapping(value= "/admin/save/announcement", method = RequestMethod.POST)
	   public String saveAnnouncement_admin(@ModelAttribute("announcement") Announcement announcement, Model model){
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
			//announcement.setTime(df.format(new Date()).toString());	
			announcement.setTime(df.format(new Date()));	
			//设置分类为“平台公告”
			announcement.setClassification("平台公告");	
			//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
			announcement.setId(randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2);
			//设置发布人
			announcement.setIssuer(this.userService.getUserByName(name));
			//存入数据库
			this.announcementService.addAnnouncement(announcement);
	        return "admin_announcements/add_success";
	   }
	 //编辑公告
	   @RequestMapping(value ="/admin/edit/announcement/{id}", method = RequestMethod.GET)
	   public String editAnnouncement_admin(@PathVariable("id") String id, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        //获取编辑目标
	        model.addAttribute("announcement", this.announcementService.getAnnouncementById(id));
			//单位列表
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
	       return "admin_announcements/edit_announcement";
	   }
	 //更新公告
	   @RequestMapping(value= "/admin/update/announcement", method = RequestMethod.POST)
	   public String updateAnnouncement_admin(@ModelAttribute("announcement") Announcement announcement, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			this.announcementService.updateAnnouncement(announcement);
	        return "admin_announcements/edit_success";
	   }
	   
	//删除公告
		@RequestMapping("/admin/remove/announcement/{id}")
	    public String removeAnnouncement_admin(@PathVariable("id") String id){			
	        this.announcementService.removeAnnouncement(id);
	        return "admin_announcements/remove_success";
	    }
	 //教育培训列表
	   @RequestMapping(value = {"/training_list"}, method = RequestMethod.GET)   
	   public String showTraining_list(Model model) {
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			model.addAttribute("listTrainings", this.announcementService.listAllTrainings());
			return "show_trainings/training_list";
	   }	   
	 //教育培训详情 
	   @RequestMapping(value ="/show/training/detail/{id}", method = RequestMethod.GET)
	   public String showTraining(@PathVariable("id") String id, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        model.addAttribute("announcement", this.announcementService.getAnnouncementById(id));
	        return "show_trainings/show_training";
	   }	
	 //教育培训管理列表
	   @RequestMapping(value = {"/admin/training_list"}, method = RequestMethod.GET)   
	   public String showTraining_list_admin(Model model) {
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			model.addAttribute("listTrainings", this.announcementService.listAllTrainings());
			return "admin_trainings/training_list";
	   }
	 //添加教育培训
	   @RequestMapping(value ="/admin/add/training", method = RequestMethod.GET)
	   public String addTraining_admin(Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        //新建一个空的公告实体类
			model.addAttribute("training", new Announcement());
			//单位列表
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
	       return "admin_trainings/add_training";
	   }
	 //发布教育培训
	   @RequestMapping(value= "/admin/save/training", method = RequestMethod.POST)
	   public String saveTraining_admin(@ModelAttribute("training") Announcement training, Model model){
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
			//training.setTime(df.format(new Date()).toString());	
			training.setTime(df.format(new Date()));	
			//设置分类为“教育培训”
			training.setClassification("教育培训");	
			//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
			training.setId(randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2);
			//设置发布人
			training.setIssuer(this.userService.getUserByName(name));
			//存入数据库
			this.announcementService.addAnnouncement(training);
	        return "admin_trainings/add_success";
	   }
	 //编辑教育培训
	   @RequestMapping(value ="/admin/edit/training/{id}", method = RequestMethod.GET)
	   public String editTraining_admin(@PathVariable("id") String id, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        //获取编辑目标
	        model.addAttribute("training", this.announcementService.getAnnouncementById(id));
			//单位列表
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
	       return "admin_trainings/edit_training";
	   }
	 //更新教育培训
	   @RequestMapping(value= "/admin/update/training", method = RequestMethod.POST)
	   public String updateTraining_admin(@ModelAttribute("training") Announcement training, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			this.announcementService.updateAnnouncement(training);
	        return "admin_trainings/edit_success";
	   }
	   
	//删除教育培训
		@RequestMapping("/admin/remove/training/{id}")
	    public String removeTraining_admin(@PathVariable("id") String id){			
	        this.announcementService.removeAnnouncement(id);
	        return "admin_trainings/remove_success";
	    }   
	 //法律法规列表
	   @RequestMapping(value = {"/law_list"}, method = RequestMethod.GET)   
	   public String showLaw_list(Model model) {
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			model.addAttribute("listLaws", this.announcementService.listAllLaws());
			return "show_laws/law_list";
	   }	  
	 //法律法规详情 
	   @RequestMapping(value ="/show/law/detail/{id}", method = RequestMethod.GET)
	   public String showLaw(@PathVariable("id") String id, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        model.addAttribute("law", this.announcementService.getAnnouncementById(id));
	        return "show_laws/show_law";
	   }	
	 //法律法规管理列表
	   @RequestMapping(value = {"/admin/law_list"}, method = RequestMethod.GET)   
	   public String showLaw_list_admin(Model model) {
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			model.addAttribute("listLaws", this.announcementService.listAllLaws());
			return "admin_laws/law_list";
	   }
	 //添加法律法规
	   @RequestMapping(value ="/admin/add/law", method = RequestMethod.GET)
	   public String addLaw_admin(Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        //新建一个空的公告实体类
			model.addAttribute("law", new Announcement());
			//单位列表
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
	       return "admin_laws/add_law";
	   }
	 //发布法律法规
	   @RequestMapping(value= "/admin/save/law", method = RequestMethod.POST)
	   public String saveLaw_admin(@ModelAttribute("law") Announcement law, Model model){
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
			law.setTime(df.format(new Date()));	
			//设置分类为“法律法规”
			law.setClassification("法律法规");	
			//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
			law.setId(randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2);
			//设置发布人
			law.setIssuer(this.userService.getUserByName(name));
			//存入数据库
			this.announcementService.addAnnouncement(law);
	        return "admin_laws/add_success";
	   }
	 //编辑法律法规
	   @RequestMapping(value ="/admin/edit/law/{id}", method = RequestMethod.GET)
	   public String editLaw_admin(@PathVariable("id") String id, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        //获取编辑目标
	        model.addAttribute("law", this.announcementService.getAnnouncementById(id));
			//单位列表
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
	       return "admin_laws/edit_law";
	   }
	 //更新法律法规
	   @RequestMapping(value= "/admin/update/law", method = RequestMethod.POST)
	   public String updateLaw_admin(@ModelAttribute("law") Announcement law, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			this.announcementService.updateAnnouncement(law);
	        return "admin_laws/edit_success";
	   }
	   
	//删除法律法规
		@RequestMapping("/admin/remove/law/{id}")
	    public String removeLaw_admin(@PathVariable("id") String id){			
	        this.announcementService.removeAnnouncement(id);
	        return "admin_laws/remove_success";
	    }
	   
	   
   @RequestMapping(value = "/show/announcement/{page}", method = RequestMethod.GET)
	   
	   public String showAnnouncements(@PathVariable("page") int page, Model model) {
			model.addAttribute("announcement", new Announcement());
			model.addAttribute("showAnnouncements", this.announcementService.listAnnouncements((page-1)*15,15));
			model.addAttribute("numberAnnouncements", this.announcementService.listAllAnnouncements().size());
			model.addAttribute("paginationAnnouncements", this.announcementService.paginationAnnouncements());
			model.addAttribute("listUsers",this.userService.listUsers());
			return "show_announcement";
   }

   
   @RequestMapping(value = "/show/training/{page}", method = RequestMethod.GET)
   
   public String showTrainings(@PathVariable("page") int page, Model model) {
		model.addAttribute("announcement", new Announcement());
		model.addAttribute("showTrainings", this.announcementService.listTrainings((page-1)*10,10));
		model.addAttribute("listUsers",this.userService.listUsers());
		return "show_training";
}
     
   @RequestMapping(value = "/show/popularization/{page}", method = RequestMethod.GET)
   
   public String showPopularizations(@PathVariable("page") int page, Model model) {
		model.addAttribute("announcement", new Announcement());
		model.addAttribute("showPopularizations", this.announcementService.listPopularizations((page-1)*10,10));
		model.addAttribute("listUsers",this.userService.listUsers());
		return "show_popularization";
}
   
   @RequestMapping(value = "/show/law/{page}", method = RequestMethod.GET)
   
   public String showLaws(@PathVariable("page") int page, Model model) {
		model.addAttribute("announcement", new Announcement());
		model.addAttribute("showLaws", this.announcementService.listLaws((page-1)*10,10));
		model.addAttribute("listUsers",this.userService.listUsers());
		return "show_law";
}
   @RequestMapping(value = "/show/stipulating/{page}", method = RequestMethod.GET)
   
   public String showStipulatings(@PathVariable("page") int page, Model model) {
		model.addAttribute("announcement", new Announcement());
		model.addAttribute("showStipulatings", this.announcementService.listStipulatings((page-1)*10,10));
		model.addAttribute("listUsers",this.userService.listUsers());
		return "show_stipulating";
}
   @RequestMapping(value = "/show/training", method = RequestMethod.GET)
   
   public String showTrainings(Model model) {
	   	int page=0;
		model.addAttribute("announcement", new Announcement());
		model.addAttribute("showTrainings", this.announcementService.listAnnouncements(page,page+10));
		model.addAttribute("listUsers",this.userService.listUsers());
		return "show_training";
}
   @RequestMapping(value = "/show/popularization", method = RequestMethod.GET)
   
   public String showPopularizations(Model model) {
	   	int page=0;
		model.addAttribute("announcement", new Announcement());
		model.addAttribute("showPopularizations", this.announcementService.listAnnouncements(page,page+10));
		model.addAttribute("listUsers",this.userService.listUsers());
		return "show_popularization";
}
   
   @RequestMapping(value = "/super/announcement", method = RequestMethod.GET)
	   
	   public String listAnnouncements(Model model) {
	   	
	   	System.out.println( java.util.UUID.randomUUID());
			model.addAttribute("announcement", new Announcement());
			model.addAttribute("listAllRecords", this.announcementService.listAllRecords());
			model.addAttribute("listUsers",this.userService.listUsers());
			return "announcement";   
    }


  	//For add and update Announcement both
	@RequestMapping(value= "/super/announcement/add", method = RequestMethod.POST)
	public String addAnnouncement(@ModelAttribute("announcement") Announcement p){
		
		if(p.getId() == null){
			Random rand = new Random();
			int randNum1 = rand.nextInt(10000);
			int randNum2 = rand.nextInt(10000);
			String randStr1=Integer.toHexString(randNum1);
			String randStr2=Integer.toHexString(randNum2);
			p.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
			this.announcementService.addAnnouncement(p);
		}else{
			//existing Announcement, call update
			this.announcementService.updateAnnouncement(p);
		}
		
		return "redirect:/super/announcement";
		
	}
	
	@RequestMapping("/super/announcement/remove/{id}")
    public String removeAnnouncement(@PathVariable("id") String id){
		
        this.announcementService.removeAnnouncement(id);
        return "redirect:/super/announcement";
    }
 
    @RequestMapping("/super/announcement/edit/{id}")
    public String editAnnouncement(@PathVariable("id") String id, Model model){
	   	int page=0;
        model.addAttribute("announcement", this.announcementService.getAnnouncementById(id));
        model.addAttribute("listAllAnnouncements", this.announcementService.listAllAnnouncements());
		model.addAttribute("listUsers",this.userService.listUsers());
        return "announcement";
    }
//    @RequestMapping("/show/announcement/detail/{id}")
//    public String detailAnnouncement(@PathVariable("id") String id, Model model){
//        model.addAttribute("announcement", this.announcementService.getAnnouncementById(id));
//		model.addAttribute("listUsers",this.userService.listUsers());
//        return "show_announcement_detail";
//    }
    	
}
