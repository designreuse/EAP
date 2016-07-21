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
import com.journaldev.spring.model.Message;
import com.journaldev.spring.model.Species;
import com.journaldev.spring.service.MessageService;
import com.journaldev.spring.service.UserService;

@Controller
public class MessageController {
	
	private MessageService messageService;
	private UserService userService;
		
	@Autowired(required=true)
	@Qualifier(value="messageService")
	public void setMessageService(MessageService message){
		this.messageService = message;
	}
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService ps){
		this.userService = ps;
	}
	
   @RequestMapping(value = "/show/message/{page}", method = RequestMethod.GET)
	   
	   public String showMessages(@PathVariable("page") int page, Model model) {
			model.addAttribute("message", new Message());
			model.addAttribute("showMessages", this.messageService.paginationMessages((page-1)*15,15));
			model.addAttribute("numberMessages", this.messageService.listMessages().size());
			return "show_message";
   }

   @RequestMapping(value = "/{user}/message/{id}/{name}", method = RequestMethod.GET)
   public String showUserMessages(@PathVariable("id") String id,@PathVariable("name") String name, Model model) {
	   model.addAttribute("user", this.userService.getUserById(id));
       
       if(this.userService.getUserById(id).getName().equals(name))
       {
       
    	   if(this.userService.getUserById(id).getAuthority().equals("USER"))
    	   {
    		   model.addAttribute("inbox_noread", this.messageService.inbox(id, 2).size());
    		   model.addAttribute("inbox", this.messageService.inbox(id, 1).size());
    		   model.addAttribute("List_inbox_noread",this.messageService.inbox(id, 2));
    		   return "message";
    	   }
    	   if(this.userService.getUserById(id).getAuthority().equals("ADMIN"))
    	   {
    		   model.addAttribute("inbox_noread", this.messageService.inbox(id, 2).size());
    		   model.addAttribute("inbox", this.messageService.inbox(id, 1).size());
    		   model.addAttribute("List_inbox_noread",this.messageService.inbox(id, 2));
    		   return "message";
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
   
   @RequestMapping(value = "/message_number/{user_id}/{name}", method = RequestMethod.GET)
   public String messageNumber(@PathVariable("user_id") String id,@PathVariable("name") String name, Model model) {
	   model.addAttribute("user", this.userService.getUserById(id));
       
       if(this.userService.getUserById(id).getName().equals(name))
       {
       
    	   if(this.userService.getUserById(id).getAuthority().equals("USER"))
    	   {
    		   model.addAttribute("inbox_noread", this.messageService.inbox(id, 2).size());
    		   model.addAttribute("inbox", this.messageService.inbox(id, 1).size());
    		   return "message_number";
    	   }
    	   if(this.userService.getUserById(id).getAuthority().equals("ADMIN"))
    	   {
    		   model.addAttribute("inbox_noread", this.messageService.inbox(id, 2).size());
    		   model.addAttribute("inbox", this.messageService.inbox(id, 1).size());
    		   return "message_number";
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
   
   @RequestMapping(value = "/inbox_noread/{id}/{name}", method = RequestMethod.GET)
   public String showUserMessagesInbox_noread(@PathVariable("id") String id,@PathVariable("name") String name, Model model) {
	   model.addAttribute("user", this.userService.getUserById(id));       
       if(this.userService.getUserById(id).getName().equals(name))
       {       
    	   if(this.userService.getUserById(id).getAuthority().equals("USER"))
    	   {
    		   model.addAttribute("List_inbox_noread",this.messageService.inbox(id, 2));
    		   return "message_inbox_noread";
    	   }
    	   if(this.userService.getUserById(id).getAuthority().equals("ADMIN"))
    	   {
    		   model.addAttribute("List_inbox_noread",this.messageService.inbox(id, 2));
    		   return "message_inbox_noread";
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
   @RequestMapping(value = "/inbox_read/{id}/{name}", method = RequestMethod.GET)
   public String showUserMessagesInbox(@PathVariable("id") String id,@PathVariable("name") String name, Model model) {
	   model.addAttribute("user", this.userService.getUserById(id));       
       if(this.userService.getUserById(id).getName().equals(name))
       {       
    	   if(this.userService.getUserById(id).getAuthority().equals("USER"))
    	   {
    		   model.addAttribute("List_inbox",this.messageService.inbox(id, 1));
    		   return "message_inbox";
    	   }
    	   if(this.userService.getUserById(id).getAuthority().equals("ADMIN"))
    	   {
    		   model.addAttribute("List_inbox",this.messageService.inbox(id, 1));
    		   return "message_inbox";
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
   @RequestMapping(value = "/watch_message/{id}/{user_id}/{name}", method = RequestMethod.GET)
   public String showUserMessage(@PathVariable("id") String id,@PathVariable("user_id") String user_id,@PathVariable("name") String name, Model model) {
	   model.addAttribute("user", this.userService.getUserById(user_id));       
       if(this.userService.getUserById(user_id).getName().equals(name))
       {       
    	   if(this.userService.getUserById(user_id).getAuthority().equals("USER"))
    	   {
    		   model.addAttribute("message", this.messageService.getMessageById(id));
    		   Message m=this.messageService.getMessageById(id);
    		   m.setStatus(1);
   			   this.messageService.updateMessage(m);
    		   return "show_message_detail";
    	   }
    	   if(this.userService.getUserById(user_id).getAuthority().equals("ADMIN"))
    	   {
    		   model.addAttribute("message", this.messageService.getMessageById(id));
    		   Message m=this.messageService.getMessageById(id);
    		   m.setStatus(1);
   			   this.messageService.updateMessage(m);
    		   return "show_message_detail";
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
   @RequestMapping(value = "/super/message", method = RequestMethod.GET)
	   
	   public String listMessages(Model model) {
			model.addAttribute("message", new Message());
	        model.addAttribute("listMessages", this.messageService.listMessages());
			return "message";   
    }


	@RequestMapping(value= "/super/message/add", method = RequestMethod.POST)
	public String addMessage(@ModelAttribute("message") Message p){
		
		if(p.getId() == null){
			Random rand = new Random();
			int randNum1 = rand.nextInt(10000);
			int randNum2 = rand.nextInt(10000);
			String randStr1=Integer.toHexString(randNum1);
			String randStr2=Integer.toHexString(randNum2);
			p.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
			this.messageService.addMessage(p);
		}else{
			this.messageService.updateMessage(p);
		}
		
		return "redirect:/super/message";
		
	}
	
	@RequestMapping("/super/message/remove/{id}")
    public String removeMessage(@PathVariable("id") String id){
		
        this.messageService.removeMessage(id);
        return "redirect:/super/message";
    }
 
    @RequestMapping("/super/message/edit/{id}")
    public String editMessage(@PathVariable("id") String id, Model model){
        model.addAttribute("message", this.messageService.getMessageById(id));
        model.addAttribute("listMessages", this.messageService.listMessages());
        return "message";
    }
    
    @RequestMapping("/show/message/detail/{id}")
    public String detailMessage(@PathVariable("id") String id, Model model){
        model.addAttribute("message", this.messageService.getMessageById(id));
        model.addAttribute("listMessages", this.messageService.listMessages());
        return "show_message_detail";
    }
    @RequestMapping(value = "/write_message/{id}/{name}", method = RequestMethod.GET)
    public String WriteMessage(@PathVariable("id") String id,@PathVariable("name") String name, Model model) {
 	   model.addAttribute("user", this.userService.getUserById(id));       
        if(this.userService.getUserById(id).getName().equals(name))
        {       
     	   if(this.userService.getUserById(id).getAuthority().equals("ADMIN"))
     	   {
     		   model.addAttribute("listUsers", this.userService.listUsers());
     		   model.addAttribute("message", new Message());
     		   return "add_message";
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
    @RequestMapping(value = "/add_message/{id}/{name}", method = RequestMethod.POST)
    public String AddMessage(@PathVariable("id") String id,@PathVariable("name") String name, Model model,@ModelAttribute("message") Message p) {
 	   model.addAttribute("user", this.userService.getUserById(id));       
        if(this.userService.getUserById(id).getName().equals(name))
        {       
     	   if(this.userService.getUserById(id).getAuthority().equals("ADMIN"))
     	   {
     			model.addAttribute("listUsers", this.userService.listUsers());
     			Random rand = new Random();
     			int randNum1 = rand.nextInt(10000);
     			int randNum2 = rand.nextInt(10000);
     			String randStr1=Integer.toHexString(randNum1);
     			String randStr2=Integer.toHexString(randNum2);
     			String uuid=randStr1+java.util.UUID.randomUUID().toString()+randStr2;
     			p.setId(uuid);
     			p.setSender_id(this.userService.getUserById(id));
     			p.setStatus(2);
     			this.messageService.addMessage(p);
     		  	return "redirect:/admin/message/"+id+"/"+name;
     		  	//return "redirect:javascript:sendMessage('"+uuid+"')";
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
    @RequestMapping(value = "/send_message/{id}", method = RequestMethod.GET)
    public String sendMessage(@PathVariable("id") String id, Model model) {
 		model.addAttribute("message", this.messageService.getMessageById(id));
    	return "show_message_detail";     	
    }
}
