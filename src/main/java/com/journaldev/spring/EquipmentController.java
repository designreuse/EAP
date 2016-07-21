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
import com.journaldev.spring.model.Equipment;

import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.EquipmentService;
import com.journaldev.spring.service.PersonService;
import com.journaldev.spring.service.OrganizationService;
import com.journaldev.spring.service.FileService;

@Controller
public class EquipmentController {
	
	private EquipmentService equipmentService;
	private UserService userService;
	private PersonService personService;
	private OrganizationService organizationService;
	private FileService fileService;
	
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
	@Qualifier(value="fileService")
	public void setFileService(FileService os){
		this.fileService = os;
	}
	
   @RequestMapping(value = "/show/equipment", method = RequestMethod.GET)
	   
	   public String showAnimals(Model model) {
			model.addAttribute("showEquipments", this.equipmentService.listEquipments());
			model.addAttribute("listUsers",this.userService.listUsers());
			model.addAttribute("listPersons",this.personService.listPersons());
			model.addAttribute("listFiles", this.fileService.listFiles());
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
			return "show_equipment";
   }
	
   @RequestMapping(value = "/super/equipment", method = RequestMethod.GET)
	   
	   public String listEquipments(Model model) {
			model.addAttribute("equipment", new Equipment());
			model.addAttribute("listEquipments", this.equipmentService.listEquipments());
			model.addAttribute("listUsers",this.userService.listUsers());
			model.addAttribute("listPersons",this.personService.listPersons());
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
			return "equipment";   
    }

 //特色设备列表
   @RequestMapping(value = {"/characteristic_equipment_list"}, method = RequestMethod.GET)   
   public String showCharacteristic_equipment_list(Model model) {
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
       model.addAttribute("user", this.userService.getUserByName(name));
		model.addAttribute("listCharacteristic_equipments", this.equipmentService.listCharacteristic_equipments());
		model.addAttribute("numberCharacteristic_equipments", this.equipmentService.listCharacteristic_equipments().size());
		return "show_equipments/characteristic_equipment_list";
   }

 //特色设备详情 
   @RequestMapping(value ="/show/characteristic_equipment/detail/{id}", method = RequestMethod.GET)
   public String showCharacteristic_equipment(@PathVariable("id") String id, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
       model.addAttribute("user", this.userService.getUserByName(name));
        model.addAttribute("characteristic_equipment", this.equipmentService.getEquipmentById(id));
       return "show_equipments/show_characteristic_equipment";
   }
   //常规设备列表
   @RequestMapping(value = {"/common_equipment_list"}, method = RequestMethod.GET)   
   public String showCommon_animal_list(Model model) {
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
		model.addAttribute("listCommon_equipments", this.equipmentService.listCommon_equipments());
		model.addAttribute("numberCommon_equipments", this.equipmentService.listCommon_equipments().size());
		return "show_equipments/common_equipment_list";
   }
   
 //常规设备详情 
   @RequestMapping(value ="/show/common_equipment/detail/{id}", method = RequestMethod.GET)
   public String showExperimental_animal(@PathVariable("id") String id, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
       model.addAttribute("user", this.userService.getUserByName(name));
        model.addAttribute("common_equipment", this.equipmentService.getEquipmentById(id));
      return "show_equipments/show_common_equipment";
   }
   
 //获取设备列表
 		@RequestMapping("/equipment/getEquipment")
 		@ResponseBody
 	    public List<Object[]> getEquipment_list(){			
 	    	List<Object[]> equipment_list=this.equipmentService.listEquipment_id_name();
 	        return equipment_list;
 	    }
 	    
 //设备管理列表
   @RequestMapping(value = {"/admin/equipment_resource"}, method = RequestMethod.GET)   
   public String showEquipment_list_admin(Model model) {
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
		//获取特色设备列表
		model.addAttribute("listCharacteristic_equipments", this.equipmentService.listCharacteristic_equipments());
		//获取常规设备列表
		model.addAttribute("listCommon_equipments", this.equipmentService.listCommon_equipments());
		return "admin_equipment_resource/equipment_resource_list";
   }
 //添加特色设备
   @RequestMapping(value ="/admin/add/characteristic_equipment", method = RequestMethod.GET)
   public String addCharacteristic_equipment_admin(Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        //新建一个空的公告实体类
		model.addAttribute("equipment", new Equipment());
		//单位列表
		model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
       return "admin_characteristic_equipments/add_characteristic_equipment";
   }
 //发布特色设备
   @RequestMapping(value= "/admin/save/characteristic_equipment", method = RequestMethod.POST)
   public String saveCharacteristic_equipment_admin(@ModelAttribute("equipment") Equipment equipment, Model model){
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
		equipment.setTime(df.format(new Date()));	
		//设置分类为“特色设备”
		equipment.setClassification("characteristic");	
		//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
		equipment.setId(randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2);
		//设置发布人
		equipment.setIssuer(this.userService.getUserByName(name));
		//存入数据库
		this.equipmentService.addEquipment(equipment);
        return "submit_success/add_success";
   }
 //编辑特色设备
   @RequestMapping(value ="/admin/edit/characteristic_equipment/{id}", method = RequestMethod.GET)
   public String editCharacteristic_equipment_admin(@PathVariable("id") String id, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        //获取编辑目标
        model.addAttribute("equipment", this.equipmentService.getEquipmentById(id));
		//单位列表
		model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
       return "admin_characteristic_equipments/edit_characteristic_equipment";
   }
 //更新特色设备
   @RequestMapping(value= "/admin/update/characteristic_equipment", method = RequestMethod.POST)
   public String updateCharacteristic_equipment_admin(@ModelAttribute("equipment") Equipment equipment, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        //设置分类为“特色设备”
		equipment.setClassification("characteristic");	
		this.equipmentService.updateEquipment(equipment);
        return "submit_success/edit_success";
   }
   
//删除特色设备
	@RequestMapping("/admin/remove/characteristic_equipment/{id}")
    public String removeCharacteristic_equipment_admin(@PathVariable("id") String id){			
        this.equipmentService.removeEquipment(id);
        return "submit_success/remove_success";
 	    }	

 //添加常规设备
   @RequestMapping(value ="/admin/add/common_equipment", method = RequestMethod.GET)
   public String addCommon_equipment_admin(Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        //新建一个空的公告实体类
		model.addAttribute("equipment", new Equipment());
		//单位列表
		model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
       return "admin_common_equipments/add_common_equipment";
   }
 //发布常规设备
   @RequestMapping(value= "/admin/save/common_equipment", method = RequestMethod.POST)
   public String saveCommon_equipment_admin(@ModelAttribute("equipment") Equipment equipment, Model model){
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
		equipment.setTime(df.format(new Date()));	
		//设置分类为“常规设备”
		equipment.setClassification("common");	
		//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
		equipment.setId(randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2);
		//设置发布人
		equipment.setIssuer(this.userService.getUserByName(name));
		//存入数据库
		this.equipmentService.addEquipment(equipment);
        return "submit_success/add_success";
   }
 //编辑常规设备
   @RequestMapping(value ="/admin/edit/common_equipment/{id}", method = RequestMethod.GET)
   public String editCommon_equipment_admin(@PathVariable("id") String id, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        //获取编辑目标
        model.addAttribute("equipment", this.equipmentService.getEquipmentById(id));
		//单位列表
		model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
       return "admin_common_equipments/edit_common_equipment";
   }
 //更新常规设备
   @RequestMapping(value= "/admin/update/common_equipment", method = RequestMethod.POST)
   public String updateCommon_equipment_admin(@ModelAttribute("equipment") Equipment equipment, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        //设置分类为“常规设备”
		equipment.setClassification("common");	
		this.equipmentService.updateEquipment(equipment);
        return "submit_success/edit_success";
   }
   
//删除常规设备
	@RequestMapping("/admin/remove/common_equipment/{id}")
    public String removeCommon_equipment_admin(@PathVariable("id") String id){			
        this.equipmentService.removeEquipment(id);
        return "submit_success/remove_success";
 	    }
   
  	//For add and update Equipment both
	@RequestMapping(value= "/super/equipment/add", method = RequestMethod.POST)
	public String addEquipment(@ModelAttribute("equipment") Equipment p){
		
		if(p.getId() == null){
			Random rand = new Random();
			int randNum1 = rand.nextInt(10000);
			int randNum2 = rand.nextInt(10000);
			String randStr1=Integer.toHexString(randNum1);
			String randStr2=Integer.toHexString(randNum2);
			p.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
			this.equipmentService.addEquipment(p);
		}else{
			//existing Equipment, call update
			this.equipmentService.updateEquipment(p);
		}
		
		return "redirect:/super/equipment";
		
	}
	
	@RequestMapping("/super/equipment/remove/{id}")
    public String removeEquipment(@PathVariable("id") String id){
		
        this.equipmentService.removeEquipment(id);
        return "redirect:/super/equipment";
    }
 
    @RequestMapping("/super/equipment/edit/{id}")
    public String editEquipment(@PathVariable("id") String id, Model model){
        model.addAttribute("equipment", this.equipmentService.getEquipmentById(id));
        model.addAttribute("listEquipments", this.equipmentService.listEquipments());
		model.addAttribute("listUsers",this.userService.listUsers());
		model.addAttribute("listPersons",this.personService.listPersons());
		model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
        return "equipment";
    }    	
//    @RequestMapping("/show/equipment/detail/{id}")
//    public String detailAnimal(@PathVariable("id") String id, Model model){
//        model.addAttribute("equipment", this.equipmentService.getEquipmentById(id));
//        model.addAttribute("listEquipments", this.equipmentService.listEquipments());
//		model.addAttribute("listUsers",this.userService.listUsers());
//		model.addAttribute("listPersons",this.personService.listPersons());
//		model.addAttribute("listFiles", this.fileService.listFiles());
//		model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
//        return "show_equipment_detail";
//    }
}
