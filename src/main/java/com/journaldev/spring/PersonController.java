package com.journaldev.spring;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.journaldev.spring.model.Organization;
import com.journaldev.spring.model.Person;
import com.journaldev.spring.service.OrganizationService;
import com.journaldev.spring.service.PersonService;
import com.journaldev.spring.service.UserService;

@Controller
public class PersonController {
	
	private PersonService personService;
	private OrganizationService organizationService;
	private UserService userService;
	
	@Autowired(required=true)
	@Qualifier(value="personService")
	public void setPersonService(PersonService ps){
		this.personService = ps;
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
   @RequestMapping(value = "/super/person", method = RequestMethod.GET)
	   
	   public String listPersons(Model model) {
			model.addAttribute("person", new Person());
			model.addAttribute("listPersons", this.personService.listPersons());
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
			return "person";   
    }


   
	//获取人列表
		@RequestMapping("/person/getPerson")
		@ResponseBody
	    public List<Object[]> getPerson_list(){			
	    	List<Object[]> person_list=this.personService.listPerson_id_name();
	        return person_list;
	    }
	    	    
  //联系人管理列表
    @RequestMapping(value = {"/admin/person_list"}, method = RequestMethod.GET)   
    public String userPerson_list(Model model) {
 		//获取当前登录的用户账号
 		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
 		//以当前登录的用户账号查询用户实体类，并返回Model
         model.addAttribute("user", this.userService.getUserByName(name));
 		model.addAttribute("listPersons", this.personService.listPersons());
 		return "admin_persons/person_list";
    }
  //添加联系人
    @RequestMapping(value ="/admin/add/person", method = RequestMethod.GET)
    public String addPerson_admin(Model model){
 		//获取当前登录的用户账号
 		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
 		//以当前登录的用户账号查询用户实体类，并返回Model
         model.addAttribute("user", this.userService.getUserByName(name));
         //新建一个空的联系人实体类
 		model.addAttribute("person", new Person());
		//单位列表
		model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
        return "admin_persons/add_person";
    }
  //发布联系人
    @RequestMapping(value= "/admin/save/person", method = RequestMethod.POST)
    public String savePerson_admin(@ModelAttribute("person") Person person, Model model){
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
 		//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
 		person.setId(randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2);
 		//存入数据库
 		this.personService.addPerson(person);
         return "submit_success/add_success";
    }
  //编辑联系人
    @RequestMapping(value ="/admin/edit/person/{id}", method = RequestMethod.GET)
    public String editPerson_admin(@PathVariable("id") String id, Model model){
 		//获取当前登录的用户账号
 		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
 		//以当前登录的用户账号查询用户实体类，并返回Model
         model.addAttribute("user", this.userService.getUserByName(name));
         //获取编辑目标
         model.addAttribute("person", this.personService.getPersonById(id));
 		//单位列表
 		model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
        return "admin_persons/edit_person";
    }
  //更新联系人
    @RequestMapping(value= "/admin/update/person", method = RequestMethod.POST)
    public String updatePerson_admin(@ModelAttribute("person") Person person, Model model){
 		//获取当前登录的用户账号
 		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
 		//以当前登录的用户账号查询用户实体类，并返回Model
         model.addAttribute("user", this.userService.getUserByName(name));
 		this.personService.updatePerson(person);
         return "submit_success/edit_success";
    }
    
 //删除联系人
 	@RequestMapping("/admin/remove/person/{id}")
     public String removePerson_admin(@PathVariable("id") String id){			
         this.personService.removePerson(id);
         return "submit_success/remove_success";
     }
    
	//For add and update Person both
	@RequestMapping(value= "/super/person/add", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("person") Person p){
		
		if(p.getId() == null){
			Random rand = new Random();
			int randNum1 = rand.nextInt(10000);
			int randNum2 = rand.nextInt(10000);
			String randStr1=Integer.toHexString(randNum1);
			String randStr2=Integer.toHexString(randNum2);
			p.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
			this.personService.addPerson(p);
		}else{
			//existing Person, call update
			this.personService.updatePerson(p);
		}
		
		return "redirect:/super/person";
		
	}
	
	@RequestMapping("/super/person/remove/{id}")
    public String removePerson(@PathVariable("id") String id){
		
        this.personService.removePerson(id);
        return "redirect:/super/person";
    }
 
    @RequestMapping("/super/person/edit/{id}")
    public String editPerson(@PathVariable("id") String id, Model model){
        model.addAttribute("person", this.personService.getPersonById(id));
        model.addAttribute("listPersons", this.personService.listPersons());
        model.addAttribute("listOrganizations", this.organizationService.listOrganizations());
        return "person";
    }
    	
}
