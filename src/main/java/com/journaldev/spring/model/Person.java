package com.journaldev.spring.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;


/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author pankaj
 *
 */
@Entity
@Table(name="person")
public class Person {

	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	private String name;
	@ManyToOne
    @JoinColumn(name="organization")
	private Organization organization;
	private String major;
	private String telephone;
	private String email;
	private String rank;
	private String note;
			
	public String getId() 
	{return id;}
	public void setId(String id) 
	{this.id = id;}
	
	public String getName() 
	{return name;}
	public void setName(String name) 
	{this.name = name;}

	public String getTelephone() 
	{return telephone;}
	public void setTelephone(String telephone) 
	{this.telephone = telephone;}
	
	public Organization getOrganization() 
	{return organization;}
	public void setOrganization(Organization organization) 
	{this.organization = organization;}
	
	public String getEmail() 
	{return email;}
	public void setEmail(String email) 
	{this.email = email;}
	
	public String getMajor() 
	{return major;}
	public void setMajor(String major) 
	{this.major = major;}
	
	public String getRank() 
	{return rank;}
	public void setRank(String rank) 
	{this.rank = rank;}
	
	public String getNote() 
	{return note;}
	public void setNote(String note) 
	{this.note = note;}
	
	@Override
	public String toString(){
		return "id="+id+", name="+name+", organization="+organization+", major="+major+", rank="+rank+", note="+note;
	}


}
