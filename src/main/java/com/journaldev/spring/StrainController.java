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

import com.journaldev.spring.model.Genetic_data;
import com.journaldev.spring.model.Strain;
import com.journaldev.spring.model.Physiological_data;
import com.journaldev.spring.model.Species;
import com.journaldev.spring.model.Autopsy_data;
import com.journaldev.spring.model.Biochemical_data;
import com.journaldev.spring.model.Collection;
import com.journaldev.spring.service.StrainService;
import com.journaldev.spring.service.SpeciesService;
import com.journaldev.spring.service.FileService;
import com.journaldev.spring.service.Genetic_dataService;
import com.journaldev.spring.service.Physiological_dataService;
import com.journaldev.spring.service.Biochemical_dataService;
import com.journaldev.spring.service.Autopsy_dataService;
import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.OrganizationService;

@Controller
public class StrainController {
	
	private StrainService strainService;
	private SpeciesService speciesService;
	private FileService fileService;
	private Genetic_dataService genetic_dataService;
	private Physiological_dataService physiological_dataService;
	private Biochemical_dataService biochemical_dataService;
	private Autopsy_dataService autopsy_dataService;
	private UserService userService;
	private OrganizationService organizationService;
		
	@Autowired(required=true)
	@Qualifier(value="strainService")
	public void setStrainService(StrainService strain){
		this.strainService = strain;
	}
	@Autowired(required=true)
	@Qualifier(value="speciesService")
	public void setSpeciesService(SpeciesService species){
		this.speciesService = species;
	}
	@Autowired(required=true)
	@Qualifier(value="fileService")
	public void setFileService(FileService file){
		this.fileService = file;
	}
	@Autowired(required=true)
	@Qualifier(value="genetic_dataService")
	public void setGenetic_dataService(Genetic_dataService genetic_data){
		this.genetic_dataService = genetic_data;
	}
	@Autowired(required=true)
	@Qualifier(value="physiological_dataService")
	public void setPhysiological_dataService(Physiological_dataService physiological_data){
		this.physiological_dataService = physiological_data;
	}
	@Autowired(required=true)
	@Qualifier(value="biochemical_dataService")
	public void setBiochemical_dataService(Biochemical_dataService biochemical_data){
		this.biochemical_dataService = biochemical_data;
	}
	@Autowired(required=true)
	@Qualifier(value="autopsy_dataService")
	public void setAutopsy_dataService(Autopsy_dataService autopsy_data){
		this.autopsy_dataService = autopsy_data;
	}
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService as){
		this.userService = as;
	}
	@Autowired(required=true)
	@Qualifier(value="organizationService")
	public void setOrganizationService(OrganizationService organization){
		this.organizationService = organization;
	}

	//获取品系id和name
		@RequestMapping("/strain/getStrain")
		@ResponseBody
	    public List<Object[]> getStrain_list(){			
	    	List<Object[]> strain_list=this.strainService.listStrain_id_name();
	        return strain_list;
	    }
	 //品系详情 
	    @RequestMapping("/show/strain/detail/{id}")
	    public String showStrain(@PathVariable("id") String id, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        model.addAttribute("strain", this.strainService.getStrainById(id));
	        return "show_animals/show_strain";
	    }	
		 //添加品系基本信息
		   @RequestMapping(value ="/admin/add/strain", method = RequestMethod.GET)
		   public String addStrain_admin(Model model){
				//获取当前登录的用户账号
				String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
				//以当前登录的用户账号查询用户实体类，并返回Model
		        model.addAttribute("user", this.userService.getUserByName(name));
		        //新建一个空的实体类
				model.addAttribute("strain", new Strain());
				//单位列表
				model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
		       return "admin_strains/add_strain";
		   }
		 //发布品系基本信息
		   @RequestMapping(value= "/admin/save/strain", method = RequestMethod.POST)
		   public String saveStrain_admin(@ModelAttribute("strain") Strain strain, Model model){
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
				strain.setTime(df.format(new Date()));	
				//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
				String strain_id=randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2;
				strain.setId(strain_id);
				//设置发布人
				strain.setIssuer(this.userService.getUserByName(name));
				//存入数据库
				this.strainService.addStrain(strain);
		        return "redirect:/admin/edit/strain_details/"+strain_id;
		   }
		 //编辑品系基本信息
		   @RequestMapping(value ="/admin/edit/strain/{id}", method = RequestMethod.GET)
		   public String editStrain_admin(@PathVariable("id") String id, Model model){
				//获取当前登录的用户账号
				String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
				//以当前登录的用户账号查询用户实体类，并返回Model
		        model.addAttribute("user", this.userService.getUserByName(name));
		        //获取编辑目标
		        model.addAttribute("strain", this.strainService.getStrainById(id));
				//单位列表
				model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
		       return "admin_strains/edit_strain";
		   }		   
		 //更新品系基本信息
		   @RequestMapping(value= "/admin/update/strain", method = RequestMethod.POST)
		   public String updateStrain_admin(@ModelAttribute("strain") Strain strain, Model model){
				//获取当前登录的用户账号
				String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
				//以当前登录的用户账号查询用户实体类，并返回Model
		        model.addAttribute("user", this.userService.getUserByName(name));
				this.strainService.updateStrain(strain);
				String strain_id=strain.getId();
		        return "redirect:/admin/edit/strain_details/"+strain_id;
		   }
		 //编辑品系详细信息
		   @RequestMapping(value ="/admin/edit/strain_details/{id}", method = RequestMethod.GET)
		   public String editStrain_details_admin(@PathVariable("id") String id, Model model){
				//获取当前登录的用户账号
				String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
				//以当前登录的用户账号查询用户实体类，并返回Model
		        model.addAttribute("user", this.userService.getUserByName(name));
		        //获取编辑目标
		        model.addAttribute("strain", this.strainService.getStrainById(id));
				//单位列表
				model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
		       return "admin_strains/edit_strain_details";
		   }
		   //添加遗传数据
		    @RequestMapping("/admin/add/genetic_data/{strain_id}")
		    public String addGenetic_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("genetic_data", new Genetic_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/genetic_data/add/add_genetic_data";
		    }
		    //发布遗传数据
			@RequestMapping(value= "/admin/save/genetic_data", method = RequestMethod.POST)
			public String saveGenetic_data(@ModelAttribute("genetic_data") Genetic_data genetic_data, Model model){
				Random rand = new Random();
				int randNum1 = rand.nextInt(10000);
				int randNum2 = rand.nextInt(10000);
				String randStr1=Integer.toHexString(randNum1);
				String randStr2=Integer.toHexString(randNum2);
				genetic_data.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
				this.genetic_dataService.addGenetic_data(genetic_data);
				return "submit_success/add_success";
			}
			//编辑遗传数据
			@RequestMapping("/admin/edit/genetic_data/{strain_id}/{id}")
		    public String editGenetic_data(@PathVariable String id, @PathVariable String strain_id, Model model){
		        model.addAttribute("genetic_data", this.genetic_dataService.getGenetic_dataById(id));
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        return "admin_strains/genetic_data/edit/edit_genetic_data";
		    }
			//更新遗传数据
			@RequestMapping(value= "/admin/updata/genetic_data/{id}", method = RequestMethod.POST)
			public String updateGenetic_data(@PathVariable("id") @ModelAttribute("genetic_data") String id, Genetic_data genetic_data, Model model){
				model.addAttribute("genetic_data", this.genetic_dataService.getGenetic_dataById(id));
				this.genetic_dataService.updateGenetic_data(genetic_data);
				return "submit_success/edit_success";
			}
		   //添加生理数据（血液生理数据）
		    @RequestMapping("/admin/add/blood_physiological_data/{strain_id}")
		    public String addBlood_physiological_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("physiological_data", new Physiological_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/physiological_data/add/add_blood_physiological_data";
		    }
		   //添加生理数据（生殖生理数据）
		    @RequestMapping("/admin/add/reproduction_physiological_data/{strain_id}")
		    public String addReproduction_physiological_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("physiological_data", new Physiological_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/physiological_data/add/add_reproduction_physiological_data";
		    }
		   //添加生理数据（生长发育生理数据）
		    @RequestMapping("/admin/add/grow_physiological_data/{strain_id}")
		    public String addGrow_physiological_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("physiological_data", new Physiological_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/physiological_data/add/add_grow_physiological_data";
		    }
		   //添加生理数据（呼吸生理数据）
		    @RequestMapping("/admin/add/breathe_physiological_data/{strain_id}")
		    public String addBreathe_physiological_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("physiological_data", new Physiological_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/physiological_data/add/add_breathe_physiological_data";
		    }
		   //添加生理数据（体温生理数据）
		    @RequestMapping("/admin/add/temperature_physiological_data/{strain_id}")
		    public String addTemperature_physiological_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("physiological_data", new Physiological_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/physiological_data/add/add_temperature_physiological_data";
		    }
		   //添加生理数据（消化生理数据）
		    @RequestMapping("/admin/add/digestive_physiological_data/{strain_id}")
		    public String addDigestive_physiological_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("physiological_data", new Physiological_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/physiological_data/add/add_digestive_physiological_data";
		    }
		   //添加生理数据（免疫生理数据）
		    @RequestMapping("/admin/add/immune_physiological_data/{strain_id}")
		    public String addImmune_physiological_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("physiological_data", new Physiological_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/physiological_data/add/add_immune_physiological_data";
		    }
		   //添加生理数据（心血管生理数据）
		    @RequestMapping("/admin/add/cardiovascular_physiological_data/{strain_id}")
		    public String addCardiovascular_physiological_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("physiological_data", new Physiological_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/physiological_data/add/add_cardiovascular_physiological_data";
		    }
		    //发布生理数据
			@RequestMapping(value= "/admin/save/physiological_data", method = RequestMethod.POST)
			public String savePhysiological_data(@ModelAttribute("physiological_data") Physiological_data physiological_data, Model model){
				Random rand = new Random();
				int randNum1 = rand.nextInt(10000);
				int randNum2 = rand.nextInt(10000);
				String randStr1=Integer.toHexString(randNum1);
				String randStr2=Integer.toHexString(randNum2);
				physiological_data.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
				this.physiological_dataService.addPhysiological_data(physiological_data);
				return "submit_success/add_success";
			}
			//编辑生理数据
			@RequestMapping("/admin/edit/physiological_data/{strain_id}/{id}")
		    public String editPhysiological_data(@PathVariable String id, @PathVariable String strain_id, Model model){
		        model.addAttribute("physiological_data", this.physiological_dataService.getPhysiological_dataById(id));
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        String physiological_classification=this.physiological_dataService.getPhysiological_dataById(id).getPhysiological_classification();
		        String return_url="";
		        if(physiological_classification.equals("blood_physiological_data"))
		        {
		        	return_url="edit_blood_physiological_data";
		        }
		        if(physiological_classification.equals("reproduction_physiological_data"))
		        {
		        	return_url="edit_reproduction_physiological_data";
		        }
		        if(physiological_classification.equals("grow_physiological_data"))
		        {
		        	return_url="edit_grow_physiological_data";
		        }
		        if(physiological_classification.equals("breathe_physiological_data"))
		        {
		        	return_url="edit_breathe_physiological_data";
		        }
		        if(physiological_classification.equals("temperature_physiological_data"))
		        {
		        	return_url="edit_temperature_physiological_data";
		        }
		        if(physiological_classification.equals("digestive_physiological_data"))
		        {
		        	return_url="edit_digestive_physiological_data";
		        }
		        if(physiological_classification.equals("immune_physiological_data"))
		        {
		        	return_url="edit_immune_physiological_data";
		        }
		        if(physiological_classification.equals("cardiovascular_physiological_data"))
		        {
		        	return_url="edit_cardiovascular_physiological_data";
		        }
		        return "admin_strains/physiological_data/edit/"+return_url;
		    }
			//更新生理数据
			@RequestMapping(value= "/admin/updata/physiological_data/{id}", method = RequestMethod.POST)
			public String updatePhysiological_data(@PathVariable("id") @ModelAttribute("physiological_data") String id, Physiological_data physiological_data, Model model){
				model.addAttribute("physiological_data", this.physiological_dataService.getPhysiological_dataById(id));
				this.physiological_dataService.updatePhysiological_data(physiological_data);;
				return "submit_success/edit_success";
			}
			//删除生理数据
			@RequestMapping(value= "/admin/remove/physiological_data/{id}")
			public String removePhysiological_data(@PathVariable("id") @ModelAttribute("physiological_data") String id, Physiological_data physiological_data, Model model){
				this.physiological_dataService.removePhysiological_data(id);
				return "submit_success/edit_success";
			}
		   //添加生化数据（血液生化数据）
		    @RequestMapping("/admin/add/blood_biochemical_data/{strain_id}")
		    public String addBlood__biochemical_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("biochemical_data", new Biochemical_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/biochemical_data/add/add_blood_biochemical_data";
		    }
		   //添加生化数据（尿生化数据）
		    @RequestMapping("/admin/add/urine_biochemical_data/{strain_id}")
		    public String addUrine_biochemical_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("biochemical_data", new Biochemical_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/biochemical_data/add/add_urine_biochemical_data";
		    }
		    //发布生化数据
			@RequestMapping(value= "/admin/save/biochemical_data", method = RequestMethod.POST)
			public String saveBiochemical_data(@ModelAttribute("biochemical_data") Biochemical_data biochemical_data, Model model){
				Random rand = new Random();
				int randNum1 = rand.nextInt(10000);
				int randNum2 = rand.nextInt(10000);
				String randStr1=Integer.toHexString(randNum1);
				String randStr2=Integer.toHexString(randNum2);
				biochemical_data.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
				this.biochemical_dataService.addBiochemical_data(biochemical_data);
				return "submit_success/add_success";
			}
			//编辑生化数据
			@RequestMapping("/admin/edit/biochemical_data/{strain_id}/{id}")
		    public String editBiochemical_data(@PathVariable String id, @PathVariable String strain_id, Model model){
		        model.addAttribute("biochemical_data", this.biochemical_dataService.getBiochemical_dataById(id));
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        String biochemical_classification=this.biochemical_dataService.getBiochemical_dataById(id).getBiochemical_classification();
		        String return_url="";
		        if(biochemical_classification.equals("blood_biochemical_data"))
		        {
		        	return_url="edit_blood_biochemical_data";
		        }
		        if(biochemical_classification.equals("urine_biochemical_data"))
		        {
		        	return_url="edit_urine_biochemical_data";
		        }
		        return "admin_strains/biochemical_data/edit/"+return_url;
		    }
			//更新生化数据
			@RequestMapping(value= "/admin/updata/biochemical_data/{id}", method = RequestMethod.POST)
			public String updateBiochemical_data(@PathVariable("id") @ModelAttribute("biochemical_data") String id, Biochemical_data biochemical_data, Model model){
				model.addAttribute("biochemical_data", this.biochemical_dataService.getBiochemical_dataById(id));
				this.biochemical_dataService.updateBiochemical_data(biochemical_data);;
				return "submit_success/edit_success";
			}
			//删除生化数据
			@RequestMapping(value= "/admin/remove/biochemical_data/{id}")
			public String removeBiochemical_data(@PathVariable("id") @ModelAttribute("biochemical_data") String id, Biochemical_data biochemical_data, Model model){
				this.biochemical_dataService.removeBiochemical_data(id);
				return "submit_success/edit_success";
			}
		   //添加解剖数据（体尺解剖数据）
		    @RequestMapping("/admin/add/body_measurement_autopsy_data/{strain_id}")
		    public String addBody_measurement_autopsy_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("autopsy_data", new Autopsy_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/autopsy_data/add/add_body_measurement_autopsy_data";
		    }
		   //添加解剖数据（骨骼解剖数据）
		    @RequestMapping("/admin/add/skeleton_autopsy_data/{strain_id}")
		    public String addSkeleton_autopsy_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("autopsy_data", new Autopsy_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/autopsy_data/add/add_skeleton_autopsy_data";
		    }
		   //添加解剖数据（脏器重量解剖数据）
		    @RequestMapping("/admin/add/organ_weight_autopsy_data/{strain_id}")
		    public String addOrgan_weight_autopsy_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("autopsy_data", new Autopsy_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/autopsy_data/add/add_organ_weight_autopsy_data";
		    }
		   //添加解剖数据（肠道长度解剖数据）
		    @RequestMapping("/admin/add/intestinal_length_autopsy_data/{strain_id}")
		    public String addIntestinal_length_autopsy_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("autopsy_data", new Autopsy_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/autopsy_data/add/add_intestinal_length_autopsy_data";
		    }
		   //添加解剖数据（乳头解剖数据）
		    @RequestMapping("/admin/add/nipple_autopsy_data/{strain_id}")
		    public String addNipple_autopsy_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("autopsy_data", new Autopsy_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/autopsy_data/add/add_nipple_autopsy_data";
		    }
		   //添加解剖数据（齿式解剖数据）
		    @RequestMapping("/admin/add/dental_formula_autopsy_data/{strain_id}")
		    public String addDental_formula_autopsy_data(@PathVariable("strain_id") String strain_id, Model model){
				model.addAttribute("autopsy_data", new Autopsy_data());
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        model.addAttribute("listStrains", this.strainService.listStrains());
		        return "admin_strains/autopsy_data/add/add_dental_formula_autopsy_data";
		    }
		    //发布解剖数据
			@RequestMapping(value= "/admin/save/autopsy_data", method = RequestMethod.POST)
			public String saveAutopsy_data(@ModelAttribute("autopsy_data") Autopsy_data autopsy_data, Model model){
				Random rand = new Random();
				int randNum1 = rand.nextInt(10000);
				int randNum2 = rand.nextInt(10000);
				String randStr1=Integer.toHexString(randNum1);
				String randStr2=Integer.toHexString(randNum2);
				autopsy_data.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
				this.autopsy_dataService.addAutopsy_data(autopsy_data);
				return "submit_success/add_success";
			}
			//编辑解剖数据
			@RequestMapping("/admin/edit/autopsy_data/{strain_id}/{id}")
		    public String editAutopsy_data(@PathVariable String id, @PathVariable String strain_id, Model model){
		        model.addAttribute("autopsy_data", this.autopsy_dataService.getAutopsy_dataById(id));
		        model.addAttribute("strain", this.strainService.getStrainById(strain_id));
		        String autopsy_classification=this.autopsy_dataService.getAutopsy_dataById(id).getAutopsy_classification();
		        String return_url="";
		        if(autopsy_classification.equals("body_measurement_data"))
		        {
		        	return_url="edit_body_measurement_autopsy_data";
		        }
		        if(autopsy_classification.equals("skeleton_data"))
		        {
		        	return_url="edit_skeleton_autopsy_data";
		        }
		        if(autopsy_classification.equals("organ_weight_data"))
		        {
		        	return_url="edit_organ_weight_autopsy_data";
		        }
		        if(autopsy_classification.equals("intestinal_length_data"))
		        {
		        	return_url="edit_intestinal_length_autopsy_data";
		        }
		        if(autopsy_classification.equals("nipple_data"))
		        {
		        	return_url="edit_nipple_autopsy_data";
		        }
		        if(autopsy_classification.equals("dental_formula_data"))
		        {
		        	return_url="edit_dental_formula_autopsy_data";
		        }
		        return "admin_strains/autopsy_data/edit/"+return_url;
		    }
			//更新解剖数据
			@RequestMapping(value= "/admin/updata/autopsy_data/{id}", method = RequestMethod.POST)
			public String updateAutopsy_data(@PathVariable("id") @ModelAttribute("autopsy_data") String id, Autopsy_data autopsy_data, Model model){
				model.addAttribute("autopsy_data", this.autopsy_dataService.getAutopsy_dataById(id));
				this.autopsy_dataService.updateAutopsy_data(autopsy_data);;
				return "submit_success/edit_success";
			}
			//删除解剖数据
			@RequestMapping(value= "/admin/remove/autopsy_data/{id}")
			public String removeAutopsy_data(@PathVariable("id") @ModelAttribute("autopsy_data") String id, Autopsy_data autopsy_data, Model model){
				this.autopsy_dataService.removeAutopsy_data(id);
				return "submit_success/edit_success";
			}
		//删除品系
			@RequestMapping("/admin/remove/strain/{id}")
		    public String removeStrain_admin(@PathVariable("id") String id){			
		        this.strainService.removeStrain(id);
		        return "submit_success/remove_success";
		    }

}
