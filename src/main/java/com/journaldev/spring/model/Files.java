package com.journaldev.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="file")
public class Files {

	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	private String name;
	private String url;
	private String type;
	private String size;
	private String time;
				
	public String getId() 
	{return id;}
	public void setId(String id) 
	{this.id = id;}
	
	public String getName() 
	{return name;}
	public void setName(String name) 
	{this.name = name;}
	
	public String getUrl() 
	{return url;}
	public void setUrl(String url) 
	{this.url = url;}

	public String getType() 
	{return type;}
	public void setType(String type) 
	{this.type = type;}
	
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	@Override
	public String toString(){
		return "id="+id+", name="+name+", url="+url+", type="+type;
	}

}
