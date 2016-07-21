package com.journaldev.spring;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.journaldev.spring.model.User;
import com.journaldev.spring.model.Collection;
import com.journaldev.spring.model.Experiment;
import com.journaldev.spring.service.CollectionService;
import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.Experimental_animalService;;

@Controller
public class CollectionController {
	
	private CollectionService collectionService;
	private UserService userService;
	private Experimental_animalService experimental_animalService;
		
	@Autowired(required=true)
	@Qualifier(value="collectionService")
	public void setCollectionService(CollectionService collection){
		this.collectionService = collection;
	}
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService ps){
		this.userService = ps;
	}
	@Autowired(required=true)
	@Qualifier(value="experimental_animalService")
	public void setExperimental_animalService(Experimental_animalService eas){
		this.experimental_animalService = eas;
	}
	
	
   @RequestMapping(value = "/show/collection/{page}", method = RequestMethod.GET)
	   
	   public String showCollections(@PathVariable("page") int page, Model model) {
			model.addAttribute("collection", new Collection());
			model.addAttribute("showCollections", this.collectionService.paginationCollections((page-1)*15,15));
			model.addAttribute("numberCollections", this.collectionService.listCollections().size());
			return "show_collection";
   }
	
   @RequestMapping(value = "/super/collection", method = RequestMethod.GET)
	   
	   public String listCollections(Model model) {
			model.addAttribute("collection", new Collection());
			model.addAttribute("list_sydw",this.collectionService.anybodycollection("sydw")); 
			return "test01";   
    }
   @RequestMapping(value= "/collection/{collection_id}/add/{classification}", method = RequestMethod.POST)
	public String addCollection(@ModelAttribute("collection") Collection p, @PathVariable("collection_id") String collection_id,@PathVariable("classification") String classification){
				
			Random rand = new Random();
			int randNum1 = rand.nextInt(10000);
			int randNum2 = rand.nextInt(10000);
			String randStr1=Integer.toHexString(randNum1);
			String randStr2=Integer.toHexString(randNum2);
			p.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
			this.collectionService.addCollection(p);
			if(classification.equals("sydw"))
		   	{
				return "redirect:/show/experimental_animal/detail/"+collection_id;
			}
			if(classification.equals("jsfw"))
			{
				return "redirect:/show/technology/detail/"+collection_id;
			}
			if(classification.equals("tsdw"))
			{
				return "redirect:/show/characteristic_animal/detail/"+collection_id;
			}
			else
			{
				return "redirect:/";
			}
		
	}
   @RequestMapping("/collection/{id}/remove/{collection_id}/{classification}")
	public String removeCollection(@PathVariable("collection_id") String collection_id,@PathVariable("classification") String classification, @PathVariable("id") String id){
	   	this.collectionService.removeCollection(id);
	   	if(classification.equals("sydw"))
	   	{
		return "redirect:/show/experimental_animal/detail/"+collection_id;
	   	}
	   	if(classification.equals("jsfw"))
	   	{
		return "redirect:/show/technology/detail/"+collection_id;
	   	}
	   	else
	   	{

			return "redirect:/";
	   	}
		
	}
	

 
    @RequestMapping("/super/collection/edit/{id}")
    public String editCollection(@PathVariable("id") String id, Model model){
        model.addAttribute("collection", this.collectionService.getCollectionById(id));
        model.addAttribute("listCollections", this.collectionService.listCollections());
        return "collection";
    }
    
    @RequestMapping("/show/collection/detail/{id}")
    public String detailCollection(@PathVariable("id") String id, Model model){
        model.addAttribute("collection", this.collectionService.getCollectionById(id));
        model.addAttribute("listCollections", this.collectionService.listCollections());
        return "show_collection_detail";
    }
    
    @RequestMapping(value = "/admin/collection/{id}/{name}", method = RequestMethod.GET)
    public String showUserCollections(@PathVariable("id") String id,@PathVariable("name") String name, Model model) {
 	   model.addAttribute("user", this.userService.getUserById(id));
        
        if(this.userService.getUserById(id).getName().equals(name))
        {
        
     	   if(this.userService.getUserById(id).getAuthority().equals("USER")||this.userService.getUserById(id).getAuthority().equals("ADMIN"))
     	   {
     		   model.addAttribute("collection_number_sydw", this.collectionService.mycollection(id, "sydw").size());
     		   model.addAttribute("collection_number_tsdw", this.collectionService.mycollection(id, "tsdw").size());
     		   model.addAttribute("collection_number_cgsb", this.collectionService.mycollection(id, "cgsb").size());
     		   model.addAttribute("collection_number_tssb", this.collectionService.mycollection(id, "tssb").size());
     		   model.addAttribute("collection_number_jszc", this.collectionService.mycollection(id, "jszc").size());
     		   model.addAttribute("collection_number_jcfw", this.collectionService.mycollection(id, "jcfw").size());
     		   model.addAttribute("collection_number_wtsy", this.collectionService.mycollection(id, "wtsy").size());
     		   model.addAttribute("collection_number_tssy", this.collectionService.mycollection(id, "tssy").size());
     		   model.addAttribute("collection_number_kycg", this.collectionService.mycollection(id, "kycg").size());
     		   model.addAttribute("collection_number_pxtz", this.collectionService.mycollection(id, "pxtz").size());
     		   model.addAttribute("collection_number_flfg", this.collectionService.mycollection(id, "flfg").size());
     		   return "collection";
     	   }     	  
     	   else
     	   {
     		   return "index";
     	   }
        }
        else
        {
        		return "index";
        }
    }
    
    @RequestMapping(value = "/collection_list/{id}/{name}/{classification}", method = RequestMethod.GET)
    public String showUserMessagesInbox_noread(@PathVariable("id") String id,@PathVariable("name") String name,@PathVariable("classification") String classification, Model model) {
 	   model.addAttribute("user", this.userService.getUserById(id)); 
        if(this.userService.getUserById(id).getName().equals(name))
        {
     	   if(this.userService.getUserById(id).getAuthority().equals("ADMIN")||this.userService.getUserById(id).getAuthority().equals("USER"))
     	   {
     		   model.addAttribute("collection_list",this.collectionService.mycollection(id, classification));
     		   if(classification.equals("sydw"))
     		   {
     			  model.addAttribute("list_sydw", this.experimental_animalService.listExperimental_animals());
     		   }
     		   return "collection_list/collection_list_"+classification;     		   
     	   }
     	   else
     	   {
     		   return "error";
     	   }
        }
        else
        {
        		return "error";
        }
    }

}
