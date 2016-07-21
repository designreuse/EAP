package com.journaldev.spring.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;



/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author pankaj
 *
 */
@Entity
@Table(name="admin")
public class Admin {

	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	@Column(updatable=false)
	private String name;
	private String username;
	private String password;
	private String authority;
	private String enable;
	@ManyToOne
    @JoinColumn(name="organization")
	private Organization organization;
	private String email;
	private String remarks;
	private String last_login;	
	@Column(updatable=false)
	private String register_time;	
	private String phone;	
	//照片id对应file表中的id，该实验动物的照片
	@ManyToOne
    @JoinColumn(name="photo_id",updatable=false)
	private Files photo_id;

	//配置权限
	@ManyToOne
    @JoinColumn(name="authority_id")
	private Authority authority_id;
	
	public String getId() 
	{return id;}
	public void setId(String id) 
	{this.id = id;}

	public String getName() 
	{return name;}
	public void setName(String name) 
	{this.name = name;}

	public String getPassword() 
	{return password;}
	public void setPassword(String password) 
	{this.password = password;}
	
	public String getEnable() 
	{return enable;}
	public void setEnable(String enable) 
	{this.enable = enable;}
	
	public Organization getOrganization() 
	{return organization;}
	public void setOrganization(Organization organization) 
	{this.organization = organization;}
	
	public String getEmail() 
	{return email;}
	public void setEmail(String email) 
	{this.email = email;}
	
	public String getRemarks() 
	{return remarks;}
	public void setRemarks(String remarks) 
	{this.remarks = remarks;}
	
	public String getAuthority() 
	{return authority;}
	public void setAuthority(String authority) 
	{this.authority = authority;}
	
	public String getLast_login() {
		return last_login;
	}
	public void setLast_login(String last_login) {
		this.last_login = last_login;
	}
	
	public Files getPhoto_id() 
	{
		return photo_id;
	}
	public void setPhoto_id(Files photo_id) 
	{
		this.photo_id = photo_id;
	}
	
	@Override
	public String toString(){
		return "id="+id+", name="+name+", password="+password+", authority="+authority+", organization="+organization+", email="+email+", remarks="+remarks+", enable="+enable;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRegister_time() {
		return register_time;
	}
	public void setRegister_time(String register_time) {
		this.register_time = register_time;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}	
	public Authority getAuthority_id() 
	{return authority_id;}
	public void setAuthority_id(Authority authority_id) 
	{this.authority_id = authority_id;}

}
