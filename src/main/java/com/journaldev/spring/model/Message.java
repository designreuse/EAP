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
@Table(name="message")
public class Message {

	//id属性，主键，唯一，自增
	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	
	@ManyToOne
    @JoinColumn(name="sender_id")
	private User sender_id;
	@ManyToOne
    @JoinColumn(name="addressee_id")
	private User addressee_id;
	private String title;
	private String text;	
	private String time;	
	private int status;	
			
	public String getId() 
	{
		return id;
	}
	public void setId(String id) 
	{
		this.id = id;
	}
	public User getSender_id() 
	{
		return sender_id;
	}
	public void setSender_id(User sender_id) 
	{
		this.sender_id = sender_id;
	}
	public User getAddressee_id() 
	{
		return addressee_id;
	}
	public void setAddressee_id(User addressee_id) 
	{
		this.addressee_id = addressee_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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
