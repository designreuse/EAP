package com.journaldev.spring.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import java.util.*;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;


/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author pankaj
 *
 */
@Entity
@Table(name="organization")
public class Organization {

	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	private String name;
	private String address;
	private String telephone;
	//1－N关联关系，使用Set来保存关联实体
	@OneToMany
	@OrderBy("id ASC")
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name="organization")
		private Set<User> user = new HashSet<User>();
		public void setUser(Set<User> user)
		{
			this.user = user;
		}
		public Set<User> getUser()
		{
			return user;
		}

	public Organization(){}
	public Organization(String name,String address,String telephone)
	{
		this.name=name;
		this.address=address;
		this.telephone=telephone;
	}
	
	public String getId() 
	{return id;}
	public void setId(String id) 
	{this.id = id;}

	
	
	public String getName() 
	{return name;}
	public void setName(String name) 
	{this.name = name;}

	public String getAddress() 
	{return address;}
	public void setAddress(String address) 
	{this.address = address;}
	
	public String getTelephone() 
	{return telephone;}
	public void setTelephone(String telephone) 
	{this.telephone = telephone;}
	
	@Override
	public String toString(){
		return "id="+id+", name="+name+", address="+address+", telephone="+telephone;
	}
}
