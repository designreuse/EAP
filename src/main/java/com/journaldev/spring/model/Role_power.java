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
@Table(name="u_role_power")
public class Role_power {

	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	//private String role;
	//private String power;
	@ManyToOne
    @JoinColumn(name="role")
	private Role role;
	@ManyToOne
    @JoinColumn(name="power")
	private Power power;
	
	public String getId() 
	{return id;}
	public void setId(String id) 
	{this.id = id;}

	public Role getRole() 
	{return role;}
	public void setRole(Role role) 
	{this.role = role;}
	
	public Power getPower() 
	{return power;}
	public void setPower(Power power) 
	{this.power = power;}
	
	@Override
	public String toString(){
		return "读取Role_Power实体类";
	}
}
