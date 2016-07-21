package com.journaldev.spring;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.journaldev.spring.model.Species;
import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.SpeciesService;
import com.journaldev.spring.service.OrganizationService;

@Controller
public class SpeciesController {
	
	private SpeciesService speciesService;
	private UserService userService;
	private OrganizationService organizationService;
	
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService as){
		this.userService = as;
	}	
	@Autowired(required=true)
	@Qualifier(value="speciesService")
	public void setSpeciesService(SpeciesService species){
		this.speciesService = species;
	}
	@Autowired(required=true)
	@Qualifier(value="organizationService")
	public void setOrganizationService(OrganizationService organization){
		this.organizationService = organization;
	}
	
	
	 //物种详情 
    @RequestMapping("/show/species/detail/{id}")
    public String showStrain(@PathVariable("id") String id, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        model.addAttribute("species", this.speciesService.getSpeciesById(id));
        return "show_animals/show_species";
    }	
	 //添加物种
	   @RequestMapping(value ="/admin/add/species", method = RequestMethod.GET)
	   public String addSpecies_admin(Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        //新建一个空的公告实体类
			model.addAttribute("species", new Species());
			//单位列表
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
	       return "admin_speciess/add_species";
	   }
	 //发布物种
	   @RequestMapping(value= "/admin/save/species", method = RequestMethod.POST)
	   public String saveSpecies_admin(@ModelAttribute("species") Species species, Model model){
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
			//species.setTime(df.format(new Date()).toString());	
			species.setTime(df.format(new Date()));	
			//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
			species.setId(randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2);
			//设置发布人
			species.setIssuer(this.userService.getUserByName(name));
			//存入数据库
			this.speciesService.addSpecies(species);
	        return "submit_success/add_success";
	   }
	 //编辑物种
	   @RequestMapping(value ="/admin/edit/species/{id}", method = RequestMethod.GET)
	   public String editSpecies_admin(@PathVariable("id") String id, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        //获取编辑目标
	        model.addAttribute("species", this.speciesService.getSpeciesById(id));
			//单位列表
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
	       return "admin_speciess/edit_species";
	   }
	 //更新物种
	   @RequestMapping(value= "/admin/update/species", method = RequestMethod.POST)
	   public String updateSpecies_admin(@ModelAttribute("species") Species species, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			this.speciesService.updateSpecies(species);
	        return "submit_success/edit_success";
	   }
	   
	//删除物种
		@RequestMapping("/admin/remove/species/{id}")
	    public String removeSpecies_admin(@PathVariable("id") String id){			
	        this.speciesService.removeSpecies(id);
	        return "submit_success/remove_success";
	    }
		   
	//获取物种列表
		@RequestMapping("/species/getSpecies")
		@ResponseBody
	    public List<Object[]> getSpecies_list(){			
	    	List<Object[]> species_list=this.speciesService.listSpecies_id_name();
	        return species_list;
	    }
	
   @RequestMapping(value = "/show/species/{page}", method = RequestMethod.GET)
	   
	   public String showSpeciess(@PathVariable("page") int page, Model model) {
			model.addAttribute("species", new Species());
			model.addAttribute("showSpeciess", this.speciesService.paginationSpeciess((page-1)*15,15));
			model.addAttribute("numberSpeciess", this.speciesService.listSpeciess().size());
			return "show_species";
   }
	
    //===========================================================================================
    @RequestMapping(value = "/super/species/{page}", method = RequestMethod.GET)
	   
	   public String listSpeciess(@PathVariable("page") int page, Model model){
			model.addAttribute("species", new Species());
	        model.addAttribute("listSpeciess", this.speciesService.listSpeciess());
			model.addAttribute("showSpeciess", this.speciesService.paginationSpeciess((page-1)*15,15));
			model.addAttribute("numberSpeciess", this.speciesService.listSpeciess().size());
			return "species";   
    }

    @RequestMapping(value= "/super/species/add", method = RequestMethod.POST)
	public String addSpecies(@ModelAttribute("species") Species p, Model model){
		Random rand = new Random();
		int randNum1 = rand.nextInt(10000);
		int randNum2 = rand.nextInt(10000);
		String randStr1=Integer.toHexString(randNum1);
		String randStr2=Integer.toHexString(randNum2);
		p.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
		this.speciesService.addSpecies(p);
     model.addAttribute("listSpeciess", this.speciesService.listSpeciess());
		return "redirect:/super/species/1";
	}
	
	@RequestMapping(value= "/super/species/update/{id}", method = RequestMethod.POST)
	public String updateSpecies(@PathVariable("id") @ModelAttribute("species") String id, Species p, Model model){
     model.addAttribute("species", this.speciesService.getSpeciesById(id));
		this.speciesService.updateSpecies(p);
		//return "update_species";
		return "redirect:/super/species/1";
	}
	@RequestMapping("/super/species/remove/{id}")
	public String removeSpecies(@PathVariable("id") String id){
	this.speciesService.removeSpecies(id);
     return "redirect:/super/species/1";
 }

 @RequestMapping("/super/species/edit/{id}")
 public String editSpecies(@PathVariable("id") String id, Model model){
     model.addAttribute("species", this.speciesService.getSpeciesById(id));
     model.addAttribute("listSpeciess", this.speciesService.listSpeciess());
     model.addAttribute("listSpeciess", this.speciesService.listSpeciess());
     return "update_species";
 }

 @RequestMapping("/super/species/create")
 public String createSpecies(Model model){
		model.addAttribute("species", new Species());
     model.addAttribute("listSpeciess", this.speciesService.listSpeciess());
     model.addAttribute("listSpeciess", this.speciesService.listSpeciess());
     return "add_species";
 }
    
}
