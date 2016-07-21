package com.journaldev.spring;

import com.journaldev.spring.common.ExperimentalAnimal_Row;
import com.journaldev.spring.common.ExperimentalAnimal_Table;
import com.journaldev.spring.model.Collection;
import com.journaldev.spring.model.Experimental_animal;
import com.journaldev.spring.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@RestController  //返回json
public class Experimental_animalController_json {
	
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
	

//实验动物列表
   @RequestMapping(value = {"/experimental_animal_table"}, method = RequestMethod.GET)
   public ExperimentalAnimal_Table experimental_animal_table(HttpServletRequest request) throws UnsupportedEncodingException {
	   //获取当前登录的用户账号
	   String name = SecurityContextHolder.getContext().getAuthentication().getName();
	   //初始化表哥尸体
	   ExperimentalAnimal_Table this_table=new ExperimentalAnimal_Table();

	   String sort=request.getParameter("sort");
	   String order=request.getParameter("order");
	   String search=request.getParameter("search");
	   if(request.getParameter("search")!=null && request.getParameter("search")!=""){
		   search=new String(request.getParameter("search").getBytes("iso-8859-1"), "utf-8");
	   }
	   String limit_get=request.getParameter("limit");
	   String offset_get=request.getParameter("offset");
	   int limit=10;
	   int offset=0;

	   if(sort=="" || sort==null){
		   sort="time";
		   order="desc";
	   }else if(sort.equals("species")){
		   sort="strain_id.species_id.name";
	   }else if(sort.equals("strain")){
		   sort="strain_id.name";
	   }else if(sort.equals("gene")){
		   sort="dna_name";
	   }
	   if(order=="" || order==null){
		   order="desc";
	   }
	   if(search=="" || search==null){
		   search="";
	   }
	   if(limit_get=="" || limit_get==null){
		   limit=10;
	   }
	   else{
		   limit=Integer.parseInt(limit_get);
	   }
	   if(limit_get=="" || limit_get==null){
		   offset=0;
	   }
	   else{
		   offset=Integer.parseInt(offset_get);
	   }

	   this_table.setTotal(new Long(this.experimental_animalService.countExperimental_animal_Table(search)).intValue());

	   List<Experimental_animal> this_ea_list=this.experimental_animalService.Experimental_animals_Table(offset, limit,search,sort,order);
	   List<ExperimentalAnimal_Row> this_rows=new ArrayList<>();
	   for(int i=0;i<this_ea_list.size();i++){
		   ExperimentalAnimal_Row this_row=new ExperimentalAnimal_Row();
		   String this_id=this_ea_list.get(i).getId();
		   String this_name=this_ea_list.get(i).getName();
		   String this_species=this_ea_list.get(i).getStrain_id().getSpecies_id().getName();
		   String this_strain=this_ea_list.get(i).getStrain_id().getName();
		   String this_gene=this_ea_list.get(i).getDna_name();
		   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd H:m:s");
		   String this_time=format.format(this_ea_list.get(i).getTime());

		   this_name="<div class=\"herf_font_animal_name\">" +
				   "<a href=\"show/experimental_animal/detail/"+this_id+"\" target=\"_blank\">" +
				   this_name +
				   "</a>" +
				   "</div>";

		   this_row.setId(this_id);
		   this_row.setName(this_name);
		   this_row.setSpecies(this_species);
		   this_row.setStrain(this_strain);
		   this_row.setGene(this_gene);
		   this_row.setTime(this_time);

		   this_rows.add(this_row);
	   }

	   this_table.setRows(this_rows);
	   return this_table;
   }


}
