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
@Table(name="achievement")
public class Achievement {

	@Id
	@Column(name="id")
	private String id;
	private String title;
	private String team;
	@ManyToOne
    @JoinColumn(name="organization")	
	private Organization organization;
	
	private String note;
	@ManyToOne
    @JoinColumn(name="experiment")
	private Experiment experiment;
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
		
	public String getNote() 
	{return note;}
	public void setNote(String note) 
	{this.note = note;}
	
	public Experiment getExperiment() 
	{return experiment;}
	public void setExperiment(Experiment experiment) 
	{this.experiment = experiment;}
	
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
		return "成果";
	}

}
