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
import com.journaldev.spring.model.Physiological_data;
import com.journaldev.spring.service.Experimental_animalService;
import com.journaldev.spring.service.StrainService;
import com.journaldev.spring.service.PersonService;
import com.journaldev.spring.service.FileService;
import com.journaldev.spring.service.OrganizationService;
import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.CollectionService;

@Controller
public class Experimental_animalController {
	
	private Experimental_animalService experimental_animalService;
	private StrainService strainService;
	private PersonService personService;
	private FileService fileService;	
	private UserService userService;	
	private CollectionService collectionService;
	private OrganizationService organizationService;
	
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
	@Qualifier(value="strainService")
	public void setStrainService(StrainService strainService){
		this.strainService = strainService;
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
	@Qualifier(value="collectionService")
	public void setCollectionService(CollectionService collection){
		this.collectionService = collection;
	}

	@Autowired(required=true)
	@Qualifier(value="organizationService")
	public void setOrganizationService(OrganizationService organization){
		this.organizationService = organization;
	}
	
   @RequestMapping(value = "/show/experimental_animal/{page}", method = RequestMethod.GET)
	   
	   public String showExperimental_animals(@PathVariable("page") int page, Model model) {
			model.addAttribute("listUsers",this.userService.listUsers()); 
			model.addAttribute("showExperimental_animals", this.experimental_animalService.paginationExperimental_animals((page-1)*15,15));
			model.addAttribute("numberExperimental_animals", this.experimental_animalService.listExperimental_animals().size());

			model.addAttribute("page_now",page); 
			return "show_experimental_animal";
   }
   
//实验动物列表
   @RequestMapping(value = {"/experimental_animal_list","/animal_resource"}, method = RequestMethod.GET)
   public String showExperimental_animal_list(Model model) {
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
       model.addAttribute("user", this.userService.getUserByName(name));
		model.addAttribute("listExperimental_animals", this.experimental_animalService.listExperimental_animals());
		model.addAttribute("count_experimental_animal", this.experimental_animalService.count_experimental_animal());
		model.addAttribute("experimental_animal_strain", this.experimental_animalService.experimental_animal_strain());
		return "show_animals/experimental_animal_list";
   }
   
 //实验动物详情 
   @RequestMapping(value ="/show/experimental_animal/detail/{id}", method = RequestMethod.GET)
   public String showExperimental_animal(@PathVariable("id") String id, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
       model.addAttribute("user", this.userService.getUserByName(name));
       model.addAttribute("experimental_animal", this.experimental_animalService.getExperimental_animalById(id));
       model.addAttribute("list_sydw",this.collectionService.anybodycollection("sydw")); 
       model.addAttribute("collection", new Collection());
       return "show_animals/show_experimental_animal";
   }
   
 //添加实验动物
   @RequestMapping("/admin/add/experimental_animal")
   public String addExperimental_animal_admin(Model model){
	   //获取当前登录的用户账号
	   String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
	   //以当前登录的用户账号查询用户实体类，并返回Model
       model.addAttribute("user", this.userService.getUserByName(name));
       //新建一个空的实体类
	   model.addAttribute("experimental_animal", new Experimental_animal());
       model.addAttribute("listStrains", this.strainService.listStrains());
       model.addAttribute("listFiles", this.fileService.listFiles());
       model.addAttribute("listPersons", this.personService.listPersons());
       //单位列表
       model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
       return "admin_experimental_animals/add_experimental_animal";
   }
   
 //发布实验动物
	@RequestMapping(value= "/admin/save/experimental_animal", method = RequestMethod.POST)
	public String saveExperimental_animal_admin(@ModelAttribute("experimental_animal") Experimental_animal experimental_animal, Model model){//获取当前登录的用户账号
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 		
		Random rand = new Random();
		int randNum1 = rand.nextInt(1000);
		int randNum2 = rand.nextInt(1000);
		String randStr1=Integer.toHexString(randNum1);
		String randStr2=Integer.toHexString(randNum2);
		//设置发布时间为服务器日期时间并规范
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		experimental_animal.setTime(new Date());
		//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
		String experimental_animal_id=randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2;
		experimental_animal.setId(experimental_animal_id);
		//设置发布人
		experimental_animal.setIssuer_id(this.userService.getUserByName(name));
		//存入数据库
		this.experimental_animalService.addExperimental_animal(experimental_animal);
		return "submit_success/add_success";
	}
	//编辑实验动物
    @RequestMapping("/admin/edit/experimental_animal/{id}")
    public String editExperimental_animal_admin(@PathVariable("id") String id, Model model){
 	   //获取当前登录的用户账号
 	   String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
 	   //以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        model.addAttribute("experimental_animal", this.experimental_animalService.getExperimental_animalById(id));
        model.addAttribute("listStrains", this.strainService.listStrains());
        model.addAttribute("listFiles", this.fileService.listFiles());
        model.addAttribute("listPersons", this.personService.listPersons());
        //单位列表
        model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
        return "admin_experimental_animals/edit_experimental_animal";
    }

	//更新实验动物
	@RequestMapping(value= "/admin/updata/experimental_animal", method = RequestMethod.POST)
	public String updatePhysiological_data(@ModelAttribute("experimental_animal") Experimental_animal experimental_animal, Model model){
		this.experimental_animalService.updateExperimental_animal(experimental_animal);
		return "submit_success/edit_success";
	}
	//删除实验动物
	@RequestMapping("/admin/remove/experimental_animal/{id}")
    public String removeExperimental_animal(@PathVariable("id") String id){		
        this.experimental_animalService.removeExperimental_animal(id);
		return "submit_success/edit_success";
    }
   
   
   @RequestMapping(value = "/select/experimental_animal/na{name_info}/sp{species_info}/st{strain_info}/dn{dna_info}/ph{phenotype_info}/{page}", method = RequestMethod.GET)
   
   public String selectExperimental_animals(@PathVariable("page") int page,@PathVariable("name_info") String name_info,@PathVariable("species_info") String species_info,@PathVariable("strain_info") String strain_info,@PathVariable("dna_info") String dna_info,@PathVariable("phenotype_info") String phenotype_info, Model model) {
		model.addAttribute("experimental_animal", new Experimental_animal());
		model.addAttribute("listUsers",this.userService.listUsers()); 
		if(name_info.length() <= 0 && species_info.length() <= 0 && strain_info.length() <= 0 && dna_info.length() <= 0 && phenotype_info.length() <= 0 )
		{
			model.addAttribute("showExperimental_animals", this.experimental_animalService.paginationExperimental_animals((page-1)*15,15));
			model.addAttribute("numberExperimental_animals", this.experimental_animalService.listExperimental_animals().size());			
			model.addAttribute("page_now",page); 
		}
		else
		{
			model.addAttribute("showExperimental_animals", this.experimental_animalService.selectExperimental_animals((page-1)*15,15,name_info,species_info,strain_info,dna_info,phenotype_info));
			model.addAttribute("numberExperimental_animals", this.experimental_animalService.Number_selectExperimental_animals(name_info,species_info,strain_info,dna_info,phenotype_info));
			model.addAttribute("page_now",page); 
			model.addAttribute("name_info_now",name_info); 
			model.addAttribute("species_info_now",species_info); 
			model.addAttribute("strain_info_now",strain_info); 
			model.addAttribute("dna_info_now",dna_info); 
			model.addAttribute("phenotype_info_now",phenotype_info); 
		}
		return "show_select_experimental_animal";
   }
   
   @RequestMapping(value = "/super/experimental_animal/{page}", method = RequestMethod.GET)
	   
	   public String listExperimental_animals(@PathVariable("page") int page, Model model)  {
			model.addAttribute("experimental_animal", new Experimental_animal());
	        model.addAttribute("listStrains", this.strainService.listStrains());
			model.addAttribute("listUsers",this.userService.listUsers());
	        model.addAttribute("listExperimental_animals", this.experimental_animalService.listExperimental_animals());
			model.addAttribute("showExperimental_animals", this.experimental_animalService.paginationExperimental_animals((page-1)*15,15));
			model.addAttribute("numberExperimental_animals", this.experimental_animalService.listExperimental_animals().size());
			return "experimental_animal";   
    }
   @RequestMapping(value = "/admin/experimental_animal/{org_id}/{page}", method = RequestMethod.GET)
   
   public String listExperimental_animals_admin(@PathVariable("page") int page,@PathVariable("org_id") String org_id, Model model)  {

		model.addAttribute("listUsers",this.userService.listUsers()); 
		model.addAttribute("showExperimental_animals", this.experimental_animalService.paginationExperimental_animals_admin((page-1)*15,15,org_id));
		model.addAttribute("numberExperimental_animals", this.experimental_animalService.numberExperimental_animals_admin(org_id).size());
		return "experimental_animal";   
}
 @RequestMapping(value = "/select/admin/experimental_animal/na{name_info}/sp{species_info}/st{strain_info}/dn{dna_info}/ph{phenotype_info}/or{org_id}/{page}", method = RequestMethod.GET)
   
   public String selectExperimental_animals_admin(@PathVariable("org_id") String org_id, @PathVariable("page") int page,@PathVariable("name_info") String name_info,@PathVariable("species_info") String species_info,@PathVariable("strain_info") String strain_info,@PathVariable("dna_info") String dna_info,@PathVariable("phenotype_info") String phenotype_info, Model model) {
		model.addAttribute("experimental_animal", new Experimental_animal());
		model.addAttribute("listUsers",this.userService.listUsers()); 
		if(name_info.length() <= 0 && species_info.length() <= 0 && strain_info.length() <= 0 && dna_info.length() <= 0 && phenotype_info.length() <= 0 )
		{
			model.addAttribute("showExperimental_animals", this.experimental_animalService.paginationExperimental_animals_admin((page-1)*15,15,org_id));
			model.addAttribute("numberExperimental_animals", this.experimental_animalService.numberExperimental_animals_admin(org_id).size());		
			model.addAttribute("page_now",page); 
		}
		else
		{
			model.addAttribute("showExperimental_animals", this.experimental_animalService.selectExperimental_animals_admin((page-1)*15,15,name_info,species_info,strain_info,dna_info,phenotype_info,org_id));
			model.addAttribute("numberExperimental_animals", this.experimental_animalService.Number_selectExperimental_animals_admin(name_info,species_info,strain_info,dna_info,phenotype_info,org_id));
			model.addAttribute("page_now",page); 
			model.addAttribute("name_info_now",name_info); 
			model.addAttribute("species_info_now",species_info); 
			model.addAttribute("strain_info_now",strain_info); 
			model.addAttribute("dna_info_now",dna_info); 
			model.addAttribute("phenotype_info_now",phenotype_info); 
		}
		return "show_select_experimental_animal_admin";
   }
	@RequestMapping("/super/experimental_animal/remove/{id}")
    public String removeExperimental_animal_old(@PathVariable("id") String id){
		
        this.experimental_animalService.removeExperimental_animal(id);
        return "redirect:/super/experimental_animal/1";
    }
	
	@RequestMapping("/admin/experimental_animal/remove/{user_id}/{id}")
    public String removeExperimental_animal_admin_old(@PathVariable("id") String id,@PathVariable("user_id") String user_id){
		if(this.experimental_animalService.getExperimental_animalById(id).getIssuer_id().getOrganization().getId().equals(this.userService.getUserById(user_id).getOrganization().getId()))
		{
			this.experimental_animalService.removeExperimental_animal(id);
		}
		return "redirect:/admin/experimental_animal/"+this.userService.getUserById(user_id).getOrganization().getId()+"/1";
    }

    @RequestMapping(value ="/show/experimental_animal/detail/{id}/old", method = RequestMethod.GET)
    public String detailExperimental_animal_admin(@PathVariable("id") String id, Model model){
        model.addAttribute("experimental_animal", this.experimental_animalService.getExperimental_animalById(id));
		model.addAttribute("listUsers",this.userService.listUsers()); 
		model.addAttribute("list_sydw",this.collectionService.anybodycollection("sydw")); 
		model.addAttribute("collection", new Collection());
        return "show_experimental_animal_detail";
        //return "show_animals/show_experimental_animal";
		
    }
    
    @RequestMapping("/super/experimental_animal/create")
    public String createExperimental_animal(Model model){
		model.addAttribute("experimental_animal", new Experimental_animal());
        model.addAttribute("listStrains", this.strainService.listStrains());
        model.addAttribute("listUsers", this.userService.listUsers());
        model.addAttribute("listPersons", this.personService.listPersons());
        model.addAttribute("listFiles", this.fileService.listFiles());
        return "add_experimental_animal";
    }
	@RequestMapping(value= "/super/experimental_animal/add", method = RequestMethod.POST)
	public String addExperimental_animal(@ModelAttribute("experimental_animal") Experimental_animal p, Model model){
		Random rand = new Random();
		int randNum1 = rand.nextInt(10000);
		int randNum2 = rand.nextInt(10000);
		String randStr1=Integer.toHexString(randNum1);
		String randStr2=Integer.toHexString(randNum2);
		p.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
		this.experimental_animalService.addExperimental_animal(p);
		return "redirect:/super/experimental_animal/1";
	}
    @RequestMapping("/amdin/experimental_animal/create")
    public String createExperimental_animal_admin(Model model){
		model.addAttribute("experimental_animal", new Experimental_animal());
        model.addAttribute("listStrains", this.strainService.listStrains());
        model.addAttribute("listUsers", this.userService.listUsers());
        model.addAttribute("listPersons", this.personService.listPersons());
        model.addAttribute("listFiles", this.fileService.listFiles());
        return "add_experimental_animal";
    }
	@RequestMapping(value= "/admin/experimental_animal/add/{user_id}", method = RequestMethod.POST)
	public String addExperimental_animal_admin(@ModelAttribute("experimental_animal") Experimental_animal p,@PathVariable("user_id") String user_id,Model model){
		Random rand = new Random();
		int randNum1 = rand.nextInt(10000);
		int randNum2 = rand.nextInt(10000);
		String randStr1=Integer.toHexString(randNum1);
		String randStr2=Integer.toHexString(randNum2);
		p.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
		this.experimental_animalService.addExperimental_animal(p);
		return "redirect:/admin/experimental_animal/"+this.userService.getUserById(user_id).getOrganization().getId()+"/1";
	}
	@RequestMapping(value= "/super/experimental_animal/update/{id}", method = RequestMethod.POST)
	public String updateExperimental_animal(@PathVariable("id") @ModelAttribute("experimental_animal") String id, Experimental_animal p, Model model){
        model.addAttribute("experimental_animal", this.experimental_animalService.getExperimental_animalById(id));
		this.experimental_animalService.updateExperimental_animal(p);
		return "redirect:/super/experimental_animal/edit/"+id;
	}
    @RequestMapping("/super/experimental_animal/edit/{id}")
    public String editExperimental_animal(@PathVariable("id") String id, Model model){
        model.addAttribute("listUsers", this.userService.listUsers());
        model.addAttribute("experimental_animal", this.experimental_animalService.getExperimental_animalById(id));
        model.addAttribute("listStrains", this.strainService.listStrains());
        model.addAttribute("listPersons", this.personService.listPersons());
        model.addAttribute("listFiles", this.fileService.listFiles());
        return "update_experimental_animal";
    }
	@RequestMapping(value= "/admin/experimental_animal/update/{id}", method = RequestMethod.POST)
	public String updateExperimental_animal_admin(@PathVariable("id") @ModelAttribute("experimental_animal") String id, Experimental_animal p, Model model){
        model.addAttribute("experimental_animal", this.experimental_animalService.getExperimental_animalById(id));
		this.experimental_animalService.updateExperimental_animal(p);
		return "redirect:/admin/experimental_animal/edit/"+id;
	}
    @RequestMapping("/admin/experimental_animal/edit/{id}")
    public String editExperimental_animal_admin_old(@PathVariable("id") String id, Model model){
        model.addAttribute("listUsers", this.userService.listUsers());
        model.addAttribute("experimental_animal", this.experimental_animalService.getExperimental_animalById(id));
        model.addAttribute("listStrains", this.strainService.listStrains());
        model.addAttribute("listPersons", this.personService.listPersons());
        model.addAttribute("listFiles", this.fileService.listFiles());
        return "update_experimental_animal";
    }
}
