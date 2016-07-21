package com.journaldev.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name="experimental_animal")
public class Experimental_animal {

	//id属性，主键，唯一，自增
	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	//实验动物的名称
	private String name;
	//品系的id对应strain表的id，是该实验动物所属的品系
	@ManyToOne
    @JoinColumn(name="strain_id")
	private Strain strain_id;
	//照片id对应file表中的id，该实验动物的照片
	@ManyToOne
    @JoinColumn(name="photo_id")
	private Files photo_id;
	//基因名称
	private String dna_name;
	//制备方式.动物模型制备的相关信息
	private String preparation;
	//制备方式的参考文献.
	private String preparation_ref;
	//表型描述.主要表征
	private String phenotype;
	//主要用途
	private String application;
	//动物模型来源.对该动物模型拥有产权的研究机构或研究组
	private String origin;	
	//储存信息。所储存的研究组及储存形式
	private String save_info;
	//储存量。如生产能力
	private String quantity;
	//备注信息
	private String note;	
	@ManyToOne
    @JoinColumn(name="organization")
	private Organization organization;
	//联系人信息，对应person表中的id
	@ManyToOne
    @JoinColumn(name="contact_id")
	private Person contact_id;
	//发布人信息，对应发布信息的管理员id
	@ManyToOne
    @JoinColumn(name="issuer_id")
	private User issuer_id;
	//发布时间
	private Date time;

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
	
	public Strain getStrain_id() 
	{
		return strain_id;
	}
	public void setStrain_id(Strain strain_id) 
	{
		this.strain_id = strain_id;
	}

	public Files getPhoto_id() 
	{
		return photo_id;
	}
	public void setPhoto_id(Files photo_id) 
	{
		this.photo_id = photo_id;
	}
	
	public String getDna_name() 
	{
		return dna_name;
	}
	public void setDna_name(String dna_name) 
	{
		this.dna_name = dna_name;
	}
	

	public String getApplication() 
	{
		return application;
	}
	public void setApplication(String application) 
	{
		this.application = application;
	}
	
	public String getPreparation() 
	{
		return preparation;
	}
	public void setPreparation(String preparation) 
	{
		this.preparation = preparation;
	}
	
	public String getPreparation_ref() 
	{
		return preparation_ref;
	}
	public void setPreparation_ref(String preparation_ref) 
	{
		this.preparation_ref = preparation_ref;
	}
	
	public String getPhenotype() 
	{
		return phenotype;
	}
	public void setPhenotype(String phenotype) 
	{
		this.phenotype = phenotype;
	}
	
	public String getOrigin() 
	{
		return origin;
	}
	public void setOrigin(String origin) 
	{
		this.origin = origin;
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
	
	public Date getTime()
	{
		return time;
	}
	public void setTime(Date time)
	{
		this.time = time;
	}
	
	public Organization getOrganization() 
	{return organization;}
	public void setOrganization(Organization organization) 
	{this.organization = organization;}
	
	@Override
	public String toString(){
		return "【读取了1条实验动物】";
	}


}
