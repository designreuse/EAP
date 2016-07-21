package com.journaldev.spring.model;


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
import org.hibernate.metamodel.binding.CascadeType;
import org.springframework.beans.factory.annotation.Autowired;


/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author WangTianshan
 *
 */
@Entity
@Table(name="strain")
public class Strain {

	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	private String name;
	//品种的id对应species表的id，是该实验动物所属的品种
	@ManyToOne
    @JoinColumn(name="species_id")
	private Species species_id;
	private String cultivation_year;
	private String introduce_year;
	private String cultivationer;
	private String hereditary_feature;
	private String microbiological_grade;
	private String germplasm_resources;
	@ManyToOne
    @JoinColumn(name="issuer")
	private User issuer;
	@ManyToOne
    @JoinColumn(name="organization")
	private Organization organization;
	private String time;
	//1－N关联关系，使用Set来保存关联实体
	@OneToMany(targetEntity=Experimental_animal.class,mappedBy="strain_id")
	@OrderBy("id ASC")
	@Fetch(FetchMode.JOIN)
	//@JoinColumn(name="strain_id")
		private Set<Experimental_animal> experimental_animal = new HashSet<Experimental_animal>();
		public void setExperimental_animal(Set<Experimental_animal> experimental_animal)
		{
			this.experimental_animal = experimental_animal;
		}
		public Set<Experimental_animal> getExperimental_animal()
		{
			return experimental_animal;
		}
	//1－N关联关系，使用Set来保存关联实体
	@OneToMany(targetEntity=Genetic_data.class,mappedBy="strain_id")
	@OrderBy("id ASC")
	@Fetch(FetchMode.JOIN)
	//@JoinColumn(name="strain_id")
		private Set<Genetic_data> genetic_data = new HashSet<Genetic_data>();
		public void setGenetic_data(Set<Genetic_data> genetic_data)
		{
			this.genetic_data = genetic_data;
		}
		public Set<Genetic_data> getGenetic_data()
		{
			return genetic_data;
		}
	//1－N关联关系，使用Set来保存关联实体
	@OneToMany(targetEntity=Physiological_data.class,mappedBy="strain_id")
	@OrderBy("physiological_classification ASC")
	@Fetch(FetchMode.JOIN)
	//@JoinColumn(name="strain_id")
		private Set<Physiological_data> physiological_data = new HashSet<Physiological_data>();
		public void setPhysiological_data(Set<Physiological_data> physiological_data)
		{
			this.physiological_data = physiological_data;
		}
		public Set<Physiological_data> getPhysiological_data()
		{
			return physiological_data;
		}
	//1－N关联关系，使用Set来保存关联实体
	@OneToMany(targetEntity=Biochemical_data.class,mappedBy="strain_id")
	@OrderBy("biochemical_classification ASC")
	@Fetch(FetchMode.JOIN)
	//@JoinColumn(name="strain_id")
			private Set<Biochemical_data> biochemical_data;
			public void setBiochemical_data(Set<Biochemical_data> biochemical_data)
			{
				this.biochemical_data = biochemical_data;
			}
			public Set<Biochemical_data> getBiochemical_data()
			{
				return biochemical_data;
			}
	//1－N关联关系，使用Set来保存关联实体
	@OneToMany(targetEntity=Autopsy_data.class,mappedBy="strain_id")
	@OrderBy("autopsy_classification ASC")
	@Fetch(FetchMode.JOIN)
	//@JoinColumn(name="strain_id")
			private Set<Autopsy_data> autopsy_data = new HashSet<Autopsy_data>();
			public void setAutopsy_data(Set<Autopsy_data> autopsy_data)
			{
				this.autopsy_data = autopsy_data;
			}
			public Set<Autopsy_data> getAutopsy_data()
			{
				return autopsy_data;
			}

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

	public String getCultivation_year() 
	{
		return cultivation_year;
	}
	public void setCultivation_year(String cultivation_year) 
	{
		this.cultivation_year = cultivation_year;
	}
	public String getIntroduce_year() 
	{
		return introduce_year;
	}
	public void setIntroduce_year(String introduce_year) 
	{
		this.introduce_year = introduce_year;
	}
	public String getCultivationer() 
	{
		return cultivationer;
	}
	public void setCultivationer(String cultivationer) 
	{
		this.cultivationer = cultivationer;
	}
	public String getHereditary_feature() 
	{
		return hereditary_feature;
	}
	public void setHereditary_feature(String hereditary_feature) 
	{
		this.hereditary_feature = hereditary_feature;
	}
	public String getMicrobiological_grade() 
	{
		return microbiological_grade;
	}
	public void setMicrobiological_grade(String microbiological_grade) 
	{
		this.microbiological_grade = microbiological_grade;
	}
	public String getGermplasm_resources() 
	{
		return germplasm_resources;
	}
	public void setGermplasm_resources(String germplasm_resources) 
	{
		this.germplasm_resources = germplasm_resources;
	}
	public String getTime() 
	{
		return time;
	}
	public void setTime(String time) 
	{
		this.time = time;
	}

	public User getIssuer() 
	{return issuer;}
	public void setIssuer(User issuer) 
	{this.issuer = issuer;}
	
	public Organization getOrganization() 
	{return organization;}
	public void setOrganization(Organization organization) 
	{this.organization = organization;}
	
	@Override
	public String toString(){
		return "【读取了1个品系的实体类】";
	}
}
