package com.journaldev.spring.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import java.util.*;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;


/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author WangTianshan
 *
 */
@Entity
@Table(name="species")
public class Species {

	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	private String name;
	private String phylum_ch;
	private String phylum_en;
	private String class_ch;
	private String class_en;
	private String order_ch;
	private String order_en;
	private String family_ch;
	private String family_en;
	private String genus_ch;
	private String genus_en;
	private String species_ch;
	private String species_en;
	private String note;
	private String time;
	@ManyToOne
    @JoinColumn(name="issuer")
	private User issuer;
	@ManyToOne
    @JoinColumn(name="organization")
	private Organization organization;

	//1－N关联关系，使用Set来保存关联实体
	@OneToMany(targetEntity=Characteristic_animal.class,mappedBy="species_id")
	@OrderBy("id ASC")
	@Fetch(FetchMode.JOIN)
		private Set<Characteristic_animal> characteristic_animal = new HashSet<Characteristic_animal>();
		public void setCharacteristic_animal(Set<Characteristic_animal> characteristic_animal)
		{
			this.characteristic_animal = characteristic_animal;
		}
		public Set<Characteristic_animal> getCharacteristic_animal()
		{
			return characteristic_animal;
		}

		//1－N关联关系，使用Set来保存关联实体
	@OneToMany(targetEntity=Characteristic_animal.class,mappedBy="species_id")
	@OrderBy("id ASC")
	@Fetch(FetchMode.JOIN)
		private Set<Strain> strain = new HashSet<Strain>();
		public void setStrain(Set<Strain> strain)
		{
			this.strain = strain;
		}
		public Set<Strain> getStrain()
		{
			return strain;
		}

	public String getId() 
	{return id;}
	public void setId(String id) 
	{this.id = id;}
	
	public String getName() 
	{
		return name;
	}
	public void setName(String name) 
	{
		this.name = name;
	}
	
	public String getPhylum_ch() {
		return phylum_ch;
	}
	public void setPhylum_ch(String phylum_ch) {
		this.phylum_ch = phylum_ch;
	}
	public String getPhylum_en() {
		return phylum_en;
	}
	public void setPhylum_en(String phylum_en) {
		this.phylum_en = phylum_en;
	}
	public String getClass_ch() {
		return class_ch;
	}
	public void setClass_ch(String class_ch) {
		this.class_ch = class_ch;
	}
	public String getClass_en() {
		return class_en;
	}
	public void setClass_en(String class_en) {
		this.class_en = class_en;
	}
	public String getOrder_ch() {
		return order_ch;
	}
	public void setOrder_ch(String order_ch) {
		this.order_ch = order_ch;
	}
	public String getOrder_en() {
		return order_en;
	}
	public void setOrder_en(String order_en) {
		this.order_en = order_en;
	}
	public String getFamily_en() {
		return family_en;
	}
	public void setFamily_en(String family_en) {
		this.family_en = family_en;
	}
	public String getFamily_ch() {
		return family_ch;
	}
	public void setFamily_ch(String family_ch) {
		this.family_ch = family_ch;
	}
	public String getGenus_ch() {
		return genus_ch;
	}
	public void setGenus_ch(String genus_ch) {
		this.genus_ch = genus_ch;
	}
	public String getGenus_en() {
		return genus_en;
	}
	public void setGenus_en(String genus_en) {
		this.genus_en = genus_en;
	}
	public String getSpecies_ch() {
		return species_ch;
	}
	public void setSpecies_ch(String species_ch) {
		this.species_ch = species_ch;
	}
	public String getSpecies_en() {
		return species_en;
	}
	public void setSpecies_en(String species_en) {
		this.species_en = species_en;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
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
		return "【读取了1个物种的实体类】";
	}

	
}
