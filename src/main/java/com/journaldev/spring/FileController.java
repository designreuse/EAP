package com.journaldev.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.Date; 
import java.text.SimpleDateFormat;
import java.io.File;  
import java.io.IOException;  
import java.util.HashMap;  
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;  
import org.springframework.web.bind.annotation.RequestParam;  
import org.springframework.web.multipart.MultipartFile;     
import org.apache.commons.io.FileUtils; 
import org.springframework.stereotype.Controller;

import com.journaldev.spring.model.User;
import com.journaldev.spring.model.Files;
import com.journaldev.spring.model.Strain;
import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.FileService;
/** 
 * SpringMVC中的文件上传 
 * @see 第一步：由于SpringMVC使用的是commons-fileupload实现，故将其组件引入项目中 
 * @see       这里用到的是commons-fileupload-1.2.2.jar和commons-io-2.0.1.jar 
 * @see 第二步：在####-servlet.xml中配置MultipartResolver处理器。可在此加入对上传文件的属性限制 
 * @see 第三步：在Controller的方法中添加MultipartFile参数。该参数用于接收表单中file组件的内容 
 * @see 第四步：编写前台表单。注意enctype="multipart/form-data"以及<input type="file" name="****"/> 
 * @author WangTianshan 
 * @create May 12, 2012 1:26:21 AM 
 */  
@Controller
public class FileController {
	
	private FileService fileService;
	private UserService userService;
	private final static Map<String,Files> filelist = new HashMap<String,Files>();  
	
	@Autowired(required=true)
	@Qualifier(value="fileService")
	public void setFileService(FileService os){
		this.fileService = os;
	}
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService ps){
		this.userService = ps;
	}
	
   @RequestMapping(value = "/super/file/{page}", method = RequestMethod.GET)
	   
	   public String listStrains(@PathVariable("page") int page, Model model){
			model.addAttribute("file", new Strain());
	        model.addAttribute("listFiles", this.fileService.listFiles());
			model.addAttribute("showFiles", this.fileService.paginationFiles((page-1)*15,15));
			model.addAttribute("numberStrains", this.fileService.listFiles().size());
			return "file";   
    }
  
	//For add and update file both
	@RequestMapping(value= "/addfile", method = RequestMethod.POST)
	public String addFile(@ModelAttribute("file") Files o){
		System.out.println(o.getName());
		if(o.getId() == null){
			Random rand = new Random();
			int randNum1 = rand.nextInt(10000);
			int randNum2 = rand.nextInt(10000);
			String randStr1=Integer.toHexString(randNum1);
			String randStr2=Integer.toHexString(randNum2);
			o.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
			this.fileService.addFile(o);
		}else{
			this.fileService.updateFile(o);
		}
		
		return "redirect:/list";
		
	}
	
    @RequestMapping(value="/super/file/create", method = RequestMethod.GET)
    public String createStrain(Model model){
		model.addAttribute("file", new Files());
        model.addAttribute("listFiles", this.fileService.listFiles());
        return "add_file";
    }
    
	
	@RequestMapping(value="/super/file/add", method=RequestMethod.POST)  
    public String addFile(Files file, @RequestParam MultipartFile[] myfiles, HttpServletRequest request) throws IOException{  
        //如果只是上传一个文件，则只需要MultipartFile类型接收文件即可，而且无需显式指定@RequestParam注解  
        //如果想上传多个文件，那么这里就要用MultipartFile[]类型来接收文件，并且还要指定@RequestParam注解  
        //并且上传多个文件时，前台表单中的所有<input type="file"/>的name都应该是myfiles，否则参数里的myfiles无法获取到所有上传的文件 
        for(MultipartFile myfile : myfiles){  
            if(myfile.isEmpty()){  
                System.out.println("文件未上传");  
            }else{  
                System.out.println("文件长度: " + myfile.getSize());  
                System.out.println("文件类型: " + myfile.getContentType());  
                System.out.println("文件名称: " + myfile.getName());  
                System.out.println("文件原名: " + myfile.getOriginalFilename());  
                System.out.println("========================================");  
                String realPath="";
                Random rand = new Random();
    			int randNum1 = rand.nextInt(10000);
    			int randNum2 = rand.nextInt(10000);
    			String randStr1=Integer.toHexString(randNum1);
    			String randStr2=Integer.toHexString(randNum2);
    			file.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2); 
                if(myfile.getContentType().equals("image/jpeg"))
                {
                	//如果用的是Tomcat服务器，则文件会上传到C:\springworkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\test\resources\files
                	realPath = request.getSession().getServletContext().getRealPath("/resources/files/images");  
                	//这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉，我是看它的源码才知道的  
                    FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, myfile.getOriginalFilename()));  
                	file.setType(myfile.getContentType());
                    file.setUrl("resources/files/images/");
                    file.setName(myfile.getOriginalFilename());
                    long filesize=myfile.getSize();
                    filesize=(filesize/1024);
                    file.setSize(Long.toString(filesize));
                    Date nowdate = new Date();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
                    String filetime=sdf.format(nowdate);
                    file.setTime(filetime);
                    
                }
                if(myfile.getContentType().equals("application/pdf"))
                {
                	//如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\WEB-INF\\upload\\文件夹中
                	realPath = request.getSession().getServletContext().getRealPath("/resources/files");  
                	//这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉，我是看它的源码才知道的  
                    FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, myfile.getOriginalFilename()));  
                   
                	file.setType(myfile.getContentType());
                    file.setUrl("resources/files/");
                    file.setName(myfile.getOriginalFilename());
                    long filesize=myfile.getSize();
                    filesize=(filesize/1024);
                    file.setSize(Long.toString(filesize));
                    Date nowdate = new Date();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
                    String filetime=sdf.format(nowdate);
                    file.setTime(filetime);
                    
                }else{
                	//如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\WEB-INF\\upload\\文件夹中
                	realPath = request.getSession().getServletContext().getRealPath("/resources/files");  
                	//这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉，我是看它的源码才知道的  
                    FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, myfile.getOriginalFilename()));  
                   
                	file.setType(myfile.getContentType());
                    file.setUrl("resources/files/");
                    file.setName(myfile.getOriginalFilename());
                    long filesize=myfile.getSize();
                    filesize=(filesize/1024);
                    file.setSize(Long.toString(filesize));
                    Date nowdate = new Date();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
                    String filetime=sdf.format(nowdate);
                    file.setTime(filetime);
                }
                this.fileService.addFile(file);
            }  
        }  
       filelist.put(file.getName(), file); 
        return "redirect:/super/file/1";  
    }  
	@RequestMapping(value = "/edit_face_image/{id}/{name}")
	   public String edit_face_image(@PathVariable("id") String id,@PathVariable("name") String name, Model model) {
		   model.addAttribute("user", this.userService.getUserById(id));
	       if(this.userService.getUserById(id).getName().equals(name))
	       {  
	    	   if(this.userService.getUserById(id).getAuthority().equals("ADMIN")||this.userService.getUserById(id).getAuthority().equals("USER"))
	    	   {
	    		   model.addAttribute("file", new Files());
	    		   return "edit_face_image";
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
	@RequestMapping(value="/face_image/add/{user_id}/{name}", method=RequestMethod.POST)  
    public String addImage(Files file, @RequestParam MultipartFile[] myfiles, HttpServletRequest request, @PathVariable("user_id") String user_id, @PathVariable("name") String name, Model model, User user) throws IOException{  
        for(MultipartFile myfile : myfiles){  
            if(myfile.isEmpty()){  
                System.out.println("文件未上传");  
            }else{  
                System.out.println("文件长度: " + myfile.getSize());  
                System.out.println("文件类型: " + myfile.getContentType());  
                System.out.println("文件名称: " + myfile.getName());  
                System.out.println("文件原名: " + myfile.getOriginalFilename());  
                System.out.println("========================================");  
                String realPath="";
                Random rand = new Random();
    			int randNum1 = rand.nextInt(10000);
    			int randNum2 = rand.nextInt(10000);
    			String randStr1=Integer.toHexString(randNum1);
    			String randStr2=Integer.toHexString(randNum2);
    			String file_id=randStr1+java.util.UUID.randomUUID().toString()+randStr2;
    			file.setId(file_id); 
                if(myfile.getContentType().equals("image/jpeg"))
                {
                	realPath = request.getSession().getServletContext().getRealPath("/resources/files/images");   
                    FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, myfile.getOriginalFilename()));  
                	file.setType(myfile.getContentType());
                    file.setUrl("resources/files/images/");
                    file.setName(myfile.getOriginalFilename());
                    long filesize=myfile.getSize();
                    filesize=(filesize/1024);
                    file.setSize(Long.toString(filesize));
                    Date nowdate = new Date();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
                    String filetime=sdf.format(nowdate);
                    file.setTime(filetime);                    
                }
                
                else{
                	realPath = request.getSession().getServletContext().getRealPath("/resources/files");   
                    FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, myfile.getOriginalFilename()));                    
                	file.setType(myfile.getContentType());
                    file.setUrl("resources/files/");
                    file.setName(myfile.getOriginalFilename());
                    long filesize=myfile.getSize();
                    filesize=(filesize/1024);
                    file.setSize(Long.toString(filesize));
                    Date nowdate = new Date();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
                    String filetime=sdf.format(nowdate);
                    file.setTime(filetime);
                }
                
        		if(this.userService.getUserById(user_id).getName().equals(name))
     	       {       
     	    	   if(this.userService.getUserById(user_id).getAuthority().equals("USER"))
     	    	   {
     	    		 this.fileService.addFile(file);
      	    		 this.userService.updateUserphoto(user_id,file_id);
      	    		 filelist.put(file.getName(), file); 
      	            return "redirect:/admin/index/"+this.userService.getUserById(user_id).getId()+"/"+name;
     	    	   }
     	    	   else if(this.userService.getUserById(user_id).getAuthority().equals("ADMIN"))
     	    	   {
     	    		 this.fileService.addFile(file);
     	    		 this.userService.updateUserphoto(user_id,file_id);
     	    		 filelist.put(file.getName(), file); 
     	            return "redirect:/admin/index_backstage/"+this.userService.getUserById(user_id).getId()+"/"+name;
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
		return name;  
       
    }  
	
    @RequestMapping("/show/file/detail/{id}")
    public String detailFile(@PathVariable("id") String id, Model model){
        model.addAttribute("file", this.fileService.getFileById(id));
        model.addAttribute("listFiles", this.fileService.listFiles());
        return "show_file_detail";
    }

	@RequestMapping("/super/file/remove/{id}")
    public String removemFile(@PathVariable("id") String id){
		
        this.fileService.removeFile(id);
        return "redirect:/super/file/1";
    }
 
    @RequestMapping("/super/file/edit/{id}")
    public String editfile(@PathVariable("id") String id, Model model){
        model.addAttribute("file", this.fileService.getFileById(id));
        model.addAttribute("listFiles", this.fileService.listFiles());
        return "file";
    }

}
