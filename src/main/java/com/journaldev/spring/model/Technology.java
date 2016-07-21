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
@Table(name="technology")
public class Technology {

	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	private String title;
	private String target;
	private String abstract_text;
	private String cycle;
	private String price_public;
	private String price_private;
	private String note;
	private String contact;
	@ManyToOne
    @JoinColumn(name="organization")	
	private Organization organization;	
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

	
	public Organization getOrganization() 
	{return organization;}
	public void setOrganization(Organization organization) 
	{this.organization = organization;}
	
	public User getIssuer() 
	{return issuer;}
	public void setIssuer(User issuer) 
	{this.issuer = issuer;}
	
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
		return "OK";
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getAbstract_text() {
		return abstract_text;
	}
	public void setAbstract_text(String abstract_text) {
		this.abstract_text = abstract_text;
	}
	public String getCycle() {
		return cycle;
	}
	public void setCycle(String cycle) {
		this.cycle = cycle;
	}
	public String getPrice_public() {
		return price_public;
	}
	public void setPrice_public(String price_public) {
		this.price_public = price_public;
	}
	public String getPrice_private() {
		return price_private;
	}
	public void setPrice_private(String price_private) {
		this.price_private = price_private;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
}
