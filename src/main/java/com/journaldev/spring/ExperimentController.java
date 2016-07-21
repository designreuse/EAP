package com.journaldev.spring;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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

import com.journaldev.spring.model.Collection;
import com.journaldev.spring.model.Experiment;
import com.journaldev.spring.model.Message;
import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.EquipmentService;
import com.journaldev.spring.service.ExperimentService;
import com.journaldev.spring.service.PersonService;
import com.journaldev.spring.service.OrganizationService;
import com.journaldev.spring.service.CollectionService;

@Controller
public class ExperimentController {
	
	private EquipmentService equipmentService;
	private UserService userService;
	private PersonService personService;
	private OrganizationService organizationService;
	private ExperimentService experimentService;
	private CollectionService collectionService;
	
	@Autowired(required=true)
	@Qualifier(value="equipmentService")
	public void setEquipmentService(EquipmentService ans){
		this.equipmentService = ans;
	}
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService as){
		this.userService = as;
	}
	@Autowired(required=true)
	@Qualifier(value="personService")
	public void setPersonService(PersonService ps){
		this.personService = ps;
	}	
	@Autowired(required=true)
	@Qualifier(value="organizationService")
	public void setOrganizationService(OrganizationService ps){
		this.organizationService = ps;
	}
	@Autowired(required=true)
	@Qualifier(value="experimentService")
	public void setExperimentService(ExperimentService ps){
		this.experimentService = ps;
	}
	@Autowired(required=true)
	@Qualifier(value="collectionService")
	public void setCollectionService(CollectionService collection){
		this.collectionService = collection;
	}
	//实验列表
	   @RequestMapping(value = {"/experiment_list"}, method = RequestMethod.GET)   
	   public String showExperiment_list(Model model) {
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			model.addAttribute("listExperiments", this.experimentService.listExperiments());
			return "show_experiments/experiment_list";
	   }
	   
	 //实验详情 
	   @RequestMapping(value ="/show/experiment/detail/{id}", method = RequestMethod.GET)
	   public String showExperiment_animal(@PathVariable("id") String id, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	       model.addAttribute("experiment", this.experimentService.getExperimentById(id));
	       return "show_experiments/show_experiment";
	   }	
	   
	 //实验管理列表
	   @RequestMapping(value = {"/admin/experiment_list"}, method = RequestMethod.GET)   
	   public String showExperiment_list_admin(Model model) {
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			model.addAttribute("listExperiments", this.experimentService.listExperiments());
			return "admin_experiments/experiment_list";
	   }
	 //添加实验
	   @RequestMapping(value ="/admin/add/experiment", method = RequestMethod.GET)
	   public String addExperiment_admin(Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        //新建一个空的公告实体类
			model.addAttribute("experiment", new Experiment());
			//单位列表
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
	       return "admin_experiments/add_experiment";
	   }
	 //发布实验
	   @RequestMapping(value= "/admin/save/experiment", method = RequestMethod.POST)
	   public String saveExperiment_admin(@ModelAttribute("experiment") Experiment experiment, Model model){
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
			//experiment.setTime(df.format(new Date()).toString());	
			experiment.setTime(df.format(new Date()));				
			//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
			experiment.setId(randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2);
			//设置发布人
			experiment.setIssuer(this.userService.getUserByName(name));
			//存入数据库
			this.experimentService.addExperiment(experiment);
	        return "submit_success/add_success";
	   }
	 //编辑实验
	   @RequestMapping(value ="/admin/edit/experiment/{id}", method = RequestMethod.GET)
	   public String editExperiment_admin(@PathVariable("id") String id, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        //获取编辑目标
	        model.addAttribute("experiment", this.experimentService.getExperimentById(id));
			//单位列表
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
	       return "admin_experiments/edit_experiment";
	   }
	 //更新实验
	   @RequestMapping(value= "/admin/update/experiment", method = RequestMethod.POST)
	   public String updateExperiment_admin(@ModelAttribute("experiment") Experiment experiment, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			this.experimentService.updateExperiment(experiment);
	        return "submit_success/edit_success";
	   }
	   
	//删除实验
		@RequestMapping("/admin/remove/experiment/{id}")
	    public String removeExperiment_admin(@PathVariable("id") String id){			
	        this.experimentService.removeExperiment(id);
	        return "submit_success/remove_success";
	    }
		   
	 //获取实验列表
	 		@RequestMapping("/experiment/getExperiment")
	 		@ResponseBody
	 	    public List<Object[]> getExperiment_list(){			
	 	    	List<Object[]> experiment_list=this.experimentService.listExperiment_id_title();
	 	        return experiment_list;
	 	    }
		
   @RequestMapping(value = "/show/experiment", method = RequestMethod.GET)
	   
	   public String showExperiments(Model model) {
			model.addAttribute("experiment", new Experiment());
			model.addAttribute("showExperiments", this.experimentService.listExperiments());
			model.addAttribute("listUsers",this.userService.listUsers());
			return "show_experiment";
   }
	
   @RequestMapping(value = "/super/experiment", method = RequestMethod.GET)
	   
	   public String listExperiments(Model model) {
			model.addAttribute("experiment", new Experiment());
			model.addAttribute("listEquipments", this.equipmentService.listEquipments());
			model.addAttribute("listUsers",this.userService.listUsers());
			model.addAttribute("listPersons",this.personService.listPersons());
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
			model.addAttribute("listExperiments",this.experimentService.listExperiments());
			return "experiment";   
    }

  	//For add and update experiment both
	@RequestMapping(value= "/super/experiment/add", method = RequestMethod.POST)
	public String addExperiment(@ModelAttribute("experiment") Experiment p){
		
		if(p.getId() == null){
			Random rand = new Random();
			int randNum1 = rand.nextInt(10000);
			int randNum2 = rand.nextInt(10000);
			String randStr1=Integer.toHexString(randNum1);
			String randStr2=Integer.toHexString(randNum2);
			p.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
			this.experimentService.addExperiment(p);
		}else{
			//existing experiment, call update
			this.experimentService.updateExperiment(p);
		}
		
		return "redirect:/super/experiment";
		
	}
	
	@RequestMapping("/super/experiment/remove/{id}")
    public String removeExperiment(@PathVariable("id") String id){
		
        this.experimentService.removeExperiment(id);
        return "redirect:/super/experiment";
    }
 
    @RequestMapping("/super/experiment/edit/{id}")
    public String editExperiment(@PathVariable("id") String id, Model model){
        model.addAttribute("experiment", this.experimentService.getExperimentById(id));
        model.addAttribute("listEquipments", this.equipmentService.listEquipments());
		model.addAttribute("listUsers",this.userService.listUsers());
		model.addAttribute("listPersons",this.personService.listPersons());
		model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
		model.addAttribute("listExperiments",this.experimentService.listExperiments());
        return "experiment";
    }
    	
    @RequestMapping("/show/experiment/detail/{id}")
    public String detailExperiment(@PathVariable("id") String id, Model model){
        model.addAttribute("experiment", this.experimentService.getExperimentById(id));
		model.addAttribute("listUsers",this.userService.listUsers());
		model.addAttribute("collection", new Collection());
        return "show_experiment_detail";
    }
}
