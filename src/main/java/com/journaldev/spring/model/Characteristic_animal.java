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
@Table(name="characteristic_animal")
public class Characteristic_animal {

	//id属性，主键，唯一，自增
	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	private String name;
	//品种的id对应species表的id，是该实验动物所属的品种
	@ManyToOne
    @JoinColumn(name="species_id")
	private Species species_id;
	//照片id对应file表中的id，该实验动物的照片
	@ManyToOne
    @JoinColumn(name="photo_id")
	private Files photo_id;
	//获取方式.特色动物培养的相关信息及原始文献
	private String preparation;
	//养殖地点
	private String save_place;
	//养殖方式
	private String save_info;	
	//储存量。如生产能力
	private String quantity;
	//备注信息
	private String note;	
	//联系人信息，对应person表中的id
	@ManyToOne
    @JoinColumn(name="contact_id")
	private Person contact_id;
	@ManyToOne
    @JoinColumn(name="organization")
	private Organization organization;
	//发布人信息，对应发布信息的管理员id
	@ManyToOne
    @JoinColumn(name="issuer_id")
	private User issuer_id;
	//发布时间
	private String time;
			
	public String getId() 
	{
		return id;
	}
	public void setId(String id) 
	{
		this.id = id;
	}
	
	public String getName() 
	{
		return name;
	}
	public void setName(String name) 
	{
		this.name = name;
	}
	
	public Species getSpecies_id() 
	{
		return species_id;
	}
	public void setSpecies_id(Species species_id) 
	{
		this.species_id = species_id;
	}	
	
	public Files getPhoto_id() 
	{
		return photo_id;
	}
	public void setPhoto_id(Files photo_id) 
	{
		this.photo_id = photo_id;
	}
		
	public String getPreparation() 
	{
		return preparation;
	}
	public void setPreparation(String preparation) 
	{
		this.preparation = preparation;
	}
	public String getSave_place() 
	{
		return save_place;
	}
	public void setSave_place(String save_place) 
	{
		this.save_place = save_place;
	}			
	public String getSave_info() 
	{
		return save_info;
	}
	public void setSave_info(String save_info) 
	{
		this.save_info = save_info;
	}
	
	public String getQuantity() 
	{
		return quantity;
	}
	public void setQuantity(String quantity) 
	{
		this.quantity = quantity;
	}
	
	public String getNote() 
	{
		return note;
	}
	public void setNote(String note) 
	{
		this.note = note;
	}
	
	public Person getContact_id() 
	{
		return contact_id;
	}
	public void setContact_id(Person contact_id) 
	{
		this.contact_id = contact_id;
	}
	
	public User getIssuer_id() 
	{
		return issuer_id;
	}
	public void setIssuer_id(User issuer_id) 
	{
		this.issuer_id = issuer_id;
	}
	
	public String getTime() 
	{
		return time;
	}
	public void setTime(String time) 
	{
		this.time = time;
	}
	
	public Organization getOrganization() 
	{return organization;}
	public void setOrganization(Organization organization) 
	{this.organization = organization;}
	
	@Override
	public String toString(){
		return "读取了特色动物类";
	}



}
