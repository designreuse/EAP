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
@Table(name="equipment")
public class Equipment {

	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	private String name;
	private String version;
	private String classification;
	@ManyToOne
    @JoinColumn(name="organization")	
	private Organization organization;
	@ManyToOne
    @JoinColumn(name="contact")
	private Person contact;
	@ManyToOne
    @JoinColumn(name="image")
	private Files image;
	private String note;
	@ManyToOne
    @JoinColumn(name="issuer")
	private User issuer;
	private String time;
			
	public String getId() 
	{return id;}
	public void setId(String id) 
	{this.id = id;}
	
	public String getName() 
	{return name;}
	public void setName(String name) 
	{this.name = name;}
			
	public String getVersion() 
	{return version;}
	public void setVersion(String version) 
	{this.version = version;}
	
	public String getClassification() 
	{return classification;}
	public void setClassification(String classification) 
	{this.classification = classification;}
	
	public Organization getOrganization() 
	{return organization;}
	public void setOrganization(Organization organization) 
	{this.organization = organization;}
	
	public Person getContact() 
	{return contact;}
	public void setContact(Person contact) 
	{this.contact = contact;}
	
	public Files getImage() 
	{return image;}
	public void setImage(Files image) 
	{this.image = image;}
	
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
		return "id="+id+", name="+name+", organization="+organization+", contact="+contact+", note="+note+", note="+note+", contact="+contact+", issuer="+issuer+", time="+time;
	}

}
