package com.journaldev.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import java.util.*;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;


/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author pankaj
 *
 */
@Entity
@Table(name="u_role")
public class Role {

	@Id
	@Column(name="id")
	private String id;
	private String name;
	private String remark;
	//1－N关联关系，使用Set来保存关联实体
	@OneToMany
	@OrderBy("id ASC")
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name="role")
		private Set<Role_power> role_power = new HashSet<Role_power>();
		public void setRole_power(Set<Role_power> role_power)
		{
			this.role_power = role_power;
		}
		public Set<Role_power> getRole_power()
		{
			return role_power;
		}
	public String getId() 
	{return id;}
	public void setId(String id) 
	{this.id = id;}
	
	public String getName() 
	{return name;}
	public void setName(String name) 
	{this.name = name;}

	public String getRemark() 
	{return remark;}
	public void setRemark(String remark) 
	{this.remark = remark;}
	
	@Override
	public String toString(){
		return "读取role的类";
	}
}
