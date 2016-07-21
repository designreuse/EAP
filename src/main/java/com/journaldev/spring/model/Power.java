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
@Table(name="u_power")
public class Power {

	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String name;
	private String url;
	private String remark;
	private String note;
	private int pid;
	private int level;
	//1－N关联关系，使用Set来保存关联实体
//	@OneToMany
//	@OrderBy("id ASC")
//	@Fetch(FetchMode.JOIN)
//	@JoinColumn(name="role_power_list")
//		private Set<Role_power> role_power = new HashSet<Role_power>();
//		public void setRole_power(Set<Role_power> role_power)
//		{
//			this.role_power = role_power;
//		}
//		public Set<Role_power> getRole_power()
//		{
//			return role_power;
//		}

	
	public int getId() 
	{return id;}
	public void setId(int id) 
	{this.id = id;}

	
	
	public String getName() 
	{return name;}
	public void setName(String name) 
	{this.name = name;}

	
	@Override
	public String toString(){
		return "读取Power的类";
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
}
