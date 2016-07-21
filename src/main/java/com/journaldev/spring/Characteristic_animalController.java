package com.journaldev.spring;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.journaldev.spring.model.Collection;
import com.journaldev.spring.model.Experimental_animal;
import com.journaldev.spring.service.CollectionService;
import com.journaldev.spring.model.Characteristic_animal;
import com.journaldev.spring.service.Characteristic_animalService;
import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.PersonService;
import com.journaldev.spring.service.FileService;
import com.journaldev.spring.service.OrganizationService;

@Controller
public class Characteristic_animalController {
	
	private Characteristic_animalService characteristic_animalService;
	private UserService userService;	
	private CollectionService collectionService;
	private PersonService personService;
	private FileService fileService;	
	private OrganizationService organizationService;
	
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService as){
		this.userService = as;
	}
	@Autowired(required=true)
	@Qualifier(value="characteristic_animalService")
	public void setCharacteristic_animalService(Characteristic_animalService characteristic_animal){
		this.characteristic_animalService = characteristic_animal;
	}
	@Autowired(required=true)
	@Qualifier(value="collectionService")
	public void setCollectionService(CollectionService collection){
		this.collectionService = collection;
	}

	@Autowired(required=true)
	@Qualifier(value="personService")
	public void setPersonService(PersonService personService){
		this.personService = personService;
	}
	
	@Autowired(required=true)
	@Qualifier(value="fileService")
	public void setFileService(FileService fileService){
		this.fileService = fileService;
	}

	@Autowired(required=true)
	@Qualifier(value="organizationService")
	public void setOrganizationService(OrganizationService organization){
		this.organizationService = organization;
	}
	
	//特色动物列表
	   @RequestMapping(value = {"/characteristic_animal_list"}, method = RequestMethod.GET)   
	   public String showCharacteristic_animal_list(Model model) {
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			model.addAttribute("listCharacteristic_animals", this.characteristic_animalService.listCharacteristic_animals());
			return "show_animals/characteristic_animal_list";
	   }
	   
	 //特色动物详情 
	   @RequestMapping(value ="/show/characteristic_animal/detail/{id}", method = RequestMethod.GET)
	   public String showCharacteristic_animal(@PathVariable("id") String id, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        model.addAttribute("characteristic_animal", this.characteristic_animalService.getCharacteristic_animalById(id));
			model.addAttribute("collection", new Collection());
	       return "show_animals/show_characteristic_animal";
	   }
	
	 //添加特色动物
	   @RequestMapping("/admin/add/characteristic_animal")
	   public String addCharacteristic_animal_admin(Model model){
		   //获取当前登录的用户账号
		   String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		   //以当前登录的用户账号查询用户实体类，并返回Model
	       model.addAttribute("user", this.userService.getUserByName(name));
	       //新建一个空的实体类
		   model.addAttribute("characteristic_animal", new Characteristic_animal());
	       model.addAttribute("listFiles", this.fileService.listFiles());
	       model.addAttribute("listPersons", this.personService.listPersons());
	       //单位列表
	       model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
	       return "admin_characteristic_animals/add_characteristic_animal";
	   }
	   
	 //发布特色动物
		@RequestMapping(value= "/admin/save/characteristic_animal", method = RequestMethod.POST)
		public String saveCharacteristic_animal_admin(@ModelAttribute("characteristic_animal") Characteristic_animal characteristic_animal, Model model){//获取当前登录的用户账号
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 		
			Random rand = new Random();
			int randNum1 = rand.nextInt(1000);
			int randNum2 = rand.nextInt(1000);
			String randStr1=Integer.toHexString(randNum1);
			String randStr2=Integer.toHexString(randNum2);
			//设置发布时间为服务器日期时间并规范
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			characteristic_animal.setTime(df.format(new Date()));	
			//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
			String characteristic_animal_id=randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2;
			characteristic_animal.setId(characteristic_animal_id);
			//设置发布人
			characteristic_animal.setIssuer_id(this.userService.getUserByName(name));
			//存入数据库
			this.characteristic_animalService.addCharacteristic_animal(characteristic_animal);
			return "submit_success/add_success";
		}
		//编辑特色动物
	    @RequestMapping("/admin/edit/characteristic_animal/{id}")
	    public String editCharacteristic_animal_admin(@PathVariable("id") String id, Model model){
	 	   //获取当前登录的用户账号
	 	   String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
	 	   //以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        model.addAttribute("characteristic_animal", this.characteristic_animalService.getCharacteristic_animalById(id));
	        model.addAttribute("listFiles", this.fileService.listFiles());
	        model.addAttribute("listPersons", this.personService.listPersons());
	        //单位列表
	        model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
	        return "admin_characteristic_animals/edit_characteristic_animal";
	    }

		//更新特色动物
		@RequestMapping(value= "/admin/updata/characteristic_animal", method = RequestMethod.POST)
		public String updatePhysiological_data(@ModelAttribute("characteristic_animal") Characteristic_animal characteristic_animal, Model model){
			this.characteristic_animalService.updateCharacteristic_animal(characteristic_animal);
			return "submit_success/edit_success";
		}
		//删除特色动物
		@RequestMapping("/admin/remove/characteristic_animal/{id}")
	    public String removeCharacteristic_animal(@PathVariable("id") String id){		
	        this.characteristic_animalService.removeCharacteristic_animal(id);
			return "submit_success/edit_success";
	    }
	   
   @RequestMapping(value = "/show/characteristic_animal/{page}", method = RequestMethod.GET)
	   
	   public String showCharacteristic_animals(@PathVariable("page") int page, Model model) {
			model.addAttribute("characteristic_animal", new Characteristic_animal());
			model.addAttribute("showCharacteristic_animals", this.characteristic_animalService.paginationCharacteristic_animals((page-1)*15,15));
			model.addAttribute("numberCharacteristic_animals", this.characteristic_animalService.listCharacteristic_animals().size());
			return "show_characteristic_animal";
   }
	
   @RequestMapping(value = "/super/characteristic_animal", method = RequestMethod.GET)
	   
	   public String listCharacteristic_animals(Model model) {
			model.addAttribute("characteristic_animal", new Characteristic_animal());
	        model.addAttribute("listCharacteristic_animals", this.characteristic_animalService.listCharacteristic_animals());
			return "characteristic_animal";   
    }


	@RequestMapping(value= "/super/characteristic_animal/add", method = RequestMethod.POST)
	public String addCharacteristic_animal(@ModelAttribute("characteristic_animal") Characteristic_animal p){
		
		if(p.getId() == null){
			Random rand = new Random();
			int randNum1 = rand.nextInt(10000);
			int randNum2 = rand.nextInt(10000);
			String randStr1=Integer.toHexString(randNum1);
			String randStr2=Integer.toHexString(randNum2);
			p.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
			this.characteristic_animalService.addCharacteristic_animal(p);
		}else{
			this.characteristic_animalService.updateCharacteristic_animal(p);
		}
		
		return "redirect:/super/characteristic_animal";
		
	}
	
	@RequestMapping("/super/characteristic_animal/remove/{id}")
    public String removeCharacteristic_animal_old(@PathVariable("id") String id){
		
        this.characteristic_animalService.removeCharacteristic_animal(id);
        return "redirect:/super/characteristic_animal";
    }
 
    @RequestMapping("/super/characteristic_animal/edit/{id}")
    public String editCharacteristic_animal(@PathVariable("id") String id, Model model){
        model.addAttribute("characteristic_animal", this.characteristic_animalService.getCharacteristic_animalById(id));
        model.addAttribute("listCharacteristic_animals", this.characteristic_animalService.listCharacteristic_animals());
        return "characteristic_animal";
    }
    
//    @RequestMapping("/show/characteristic_animal/detail/{id}")
//    public String detailCharacteristic_animal(@PathVariable("id") String id, Model model){
//        model.addAttribute("characteristic_animal", this.characteristic_animalService.getCharacteristic_animalById(id));
//        model.addAttribute("listCharacteristic_animals", this.characteristic_animalService.listCharacteristic_animals());
//        return "show_characteristic_animal_detail";
//    }
    
}
