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
@Table(name="collection")
public class Collection {

	//id属性，主键，唯一，自增
	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	
	@ManyToOne
    @JoinColumn(name="user_id")
	private User user_id;
	private String classification;
	private String collection_id;	
	private String time;	
			
	public String getId() 
	{
		return id;
	}
	public void setId(String id) 
	{
		this.id = id;
	}
	public User getUser_id() 
	{
		return user_id;
	}
	public void setUser_id(User user_id) 
	{
		this.user_id = user_id;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public String getCollection_id() {
		return collection_id;
	}
	public void setCollection_id(String collection_id) {
		this.collection_id = collection_id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	@Override
	public String toString(){
		return "";
	}

	

}
