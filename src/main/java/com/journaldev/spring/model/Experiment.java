package com.journaldev.spring.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name="experiment")
public class Experiment {

	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private String id;
	private String title;
	private String team;
	@ManyToOne
    @JoinColumn(name="organization")	
	private Organization organization;
	
	@ManyToOne
    @JoinColumn(name="equipment")	
	private Equipment equipment;
	private String note;
	@ManyToOne
    @JoinColumn(name="issuer")
	private User issuer;
	
	
	private String time;
			
	public String getId() 
	{return id;}
	public void setId(String id) 
	{this.id = id;}
	
	public String getTitle() 
	{return title;}
	public void setTitle(String title) 
	{this.title = title;}
			
	public String getTeam() 
	{return team;}
	public void setTeam(String team) 
	{this.team = team;}
	
	public Organization getOrganization() 
	{return organization;}
	public void setOrganization(Organization organization) 
	{this.organization = organization;}
				
	public Equipment getEquipment() 
	{return equipment;}
	public void setEquipment(Equipment equipment) 
	{this.equipment = equipment;}
	
	public String getNote() 
	{return note;}
	public void setNote(String note) 
	{this.note = note;}
	
	public User getIssuer() 
	{return issuer;}
	public void setIssuer(User issuer) 
	{this.issuer = issuer;}
	
	
	public String getTime() 
	{return time;}
	public void setTime(String time) 
	{this.time = time;}
	
	@Override
	public String toString(){
		return "读取特色实验类";
	}

}
