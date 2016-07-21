package com.journaldev.spring;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.ModelAndView;

import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.AnnouncementService;
import com.journaldev.spring.service.TechnologyService;
import com.journaldev.spring.service.Characteristic_animalService;
import com.journaldev.spring.service.Experimental_animalService;
import com.journaldev.spring.service.EquipmentService;
import com.journaldev.spring.service.SpeciesService;
import com.journaldev.spring.service.OrganizationService;
import com.journaldev.spring.service.StrainService;


@Controller
public class MainController {
	
	private AnnouncementService announcementService;
	private UserService userService;
	private Experimental_animalService experimental_animalService;
	private Characteristic_animalService characteristic_animalService;
	private TechnologyService technologyService;
	private EquipmentService equipmentService;
	private SpeciesService speciesService;
	private OrganizationService organizationService;
	private StrainService strainService;

	
	@Autowired(required=true)
	@Qualifier(value="announcementService")
	public void setAnnouncementService(AnnouncementService ans){
		this.announcementService = ans;
	}	
	@Autowired(required=true)
	@Qualifier(value="technologyService")
	public void setTechnologyService(TechnologyService tes){
		this.technologyService = tes;
	}
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService as){
		this.userService = as;
	}

	@Autowired(required=true)
	@Qualifier(value="experimental_animalService")
	public void setExperimental_animalService(Experimental_animalService experimental_animal){
		this.experimental_animalService = experimental_animal;
	}
	
	@Autowired(required=true)
	@Qualifier(value="equipmentService")
	public void setEquipmentService(EquipmentService equipment){
		this.equipmentService = equipment;
	}
	
	@Autowired(required=true)
	@Qualifier(value="characteristic_animalService")
	public void setCharacteristic_animalService(Characteristic_animalService characteristic_animal){
		this.characteristic_animalService = characteristic_animal;
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
	@Autowired(required=true)
	@Qualifier(value="strainService")
	public void setStrainService(StrainService strain){
		this.strainService = strain;
	}
	
	//主页---------------------
	@RequestMapping(value = { "/","/index","/new"}, method = RequestMethod.GET)
    public String newindex(Model model) {
		//查询最近的5条公告记录
		model.addAttribute("paginationAnnouncements", this.announcementService.paginationAnnouncements());
		//查询最近的5条教育培训记录
		model.addAttribute("paginationTrainings", this.announcementService.paginationTrainings());
		//查询最近的5条技术服务记录
		model.addAttribute("showTechnologys", this.technologyService.showTop6Technologys());
		//实验动物数量
		model.addAttribute("countExperimental_animals", this.experimental_animalService.countExperimental_animal());
		//特色动物数量
		model.addAttribute("countCharacteristic_animals", this.characteristic_animalService.countCharacteristic_animal());
		//特色设备数量
		model.addAttribute("countCharacteristic_equipments", this.equipmentService.countCharacteristic_equipments());
		//常规设备数量
		model.addAttribute("countCommon_equipments", this.equipmentService.countCommon_equipments());
		//获取当前登录的用户名
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//根据当前登录用户的用户名获取用户实体类
        model.addAttribute("user", this.userService.getUserByName(name));
        return "home";
    }
	//平台介绍---------------------
	@RequestMapping(value = { "/abstract_text"}, method = RequestMethod.GET)
    public String abstract_text(Model model) {
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
		return "show_others/abstract_text";
    }

	//关于我们---------------------
	@RequestMapping(value = { "/about_us"}, method = RequestMethod.GET)
    public String about_us(Model model) {
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
		return "show_others/about_us";
    }
	
//	//动物资源
//	@RequestMapping(value = {"/animal_resource"}, method = RequestMethod.GET)
//	public String showAnimal_resource(Model model) {
//		//获取当前登录的用户账号
//		String name = SecurityContextHolder.getContext().getAuthentication().getName();
//		//以当前登录的用户账号查询用户实体类，并返回Model
//        model.addAttribute("user", this.userService.getUserByName(name));
//		return "show_animals/animal_resource";
//	}
	//动物资源管理列表
	@RequestMapping(value = {"/admin/animal_resource"}, method = RequestMethod.GET)   
	public String userAnimal_resource_list(Model model) {
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
		model.addAttribute("listSpeciess", this.speciesService.listSpeciess());
		model.addAttribute("listStrains", this.strainService.listStrains());
		model.addAttribute("listExperimental_animals", this.experimental_animalService.listExperimental_animals());
		model.addAttribute("listCharacteristic_animals", this.characteristic_animalService.listCharacteristic_animals());
		return "admin_animal_resource/animal_resource_list";
	}
	//设备资源
	@RequestMapping(value = {"/equipment_resource"}, method = RequestMethod.GET)   
	public String showEquipment_resource(Model model) {
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
		return "show_equipments/equipment_resource";
	}
	@RequestMapping(value = { "/old" }, method = RequestMethod.GET)
    public String welcome(Model model) {
		model.addAttribute("paginationAnnouncements", this.announcementService.paginationAnnouncements());
		model.addAttribute("listUsers",this.userService.listUsers());
		model.addAttribute("numberExperimental_animals", this.experimental_animalService.listExperimental_animals().size());
		model.addAttribute("numberCharacteristic_animals", this.characteristic_animalService.listCharacteristic_animals().size());
        return "index";
    }
	
	@RequestMapping(value = { "/animal_resources" }, method = RequestMethod.GET)
    public String animal_resources(Model model) {
		model.addAttribute("count_experimental_animal", this.experimental_animalService.count_experimental_animal());
		model.addAttribute("experimental_animal_strain", this.experimental_animalService.experimental_animal_strain());
        return "animal_resources";
    }
	
	@RequestMapping(value = { "/developing" }, method = RequestMethod.GET)
    public String developing(Model model) {
        return "developing";
    }
	
	@RequestMapping(value = { "/display_image" }, method = RequestMethod.GET)
    public String test(Model model) {
        return "display_image";
    }

	@RequestMapping(value = { "/random_image" }, method = RequestMethod.GET)
    public String random_image() {
        return "login/random_image";
    }

	@RequestMapping(value = { "/login_validate" })
    public String validate() {
        return "validate";
    }
}
