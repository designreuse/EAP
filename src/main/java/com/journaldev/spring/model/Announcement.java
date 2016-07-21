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
@Table(name="announcement")
public class Announcement {

	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	private String title;
	private String classification;
	private String note;
	@ManyToOne
    @JoinColumn(name="issuer")
	private User issuer;
	@ManyToOne
    @JoinColumn(name="organization")
	private Organization organization;
	private String time;
			
	public String getId() 
	{return id;}
	public void setId(String id) 
	{this.id = id;}
	
	public String getTitle() 
	{return title;}
	public void setTitle(String title) 
	{this.title = title;}
			
	public String getClassification() 
	{return classification;}
	public void setClassification(String classification) 
	{this.classification = classification;}
		
	public User getIssuer() 
	{return issuer;}
	public void setIssuer(User issuer) 
	{this.issuer = issuer;}
	
	public Organization getOrganization() 
	{return organization;}
	public void setOrganization(Organization organization) 
	{this.organization = organization;}
	
	public String getNote() 
	{return note;}
	public void setNote(String note) 
	{this.note = note;}
	
	public String getTime() 
	{return time;}
	public void setTime(String time) 
	{this.time = time;}
	
	@Override
	public String toString(){
		return "id="+id+", title="+title+", note="+note+", note="+note+", issuer="+issuer+", time="+time;
	}
}
