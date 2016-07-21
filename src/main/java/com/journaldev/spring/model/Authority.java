package com.journaldev.spring.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;



/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author pankaj
 *
 */
@Entity
@Table(name="authority")
public class Authority {

	@Id
	@Column(name="id")
	private String id;
	@Column(updatable=false)	
	private String name;
	private String announcement;
	private String experiment;
	private String achievement;
	private String law;
	private String experimental_animal;
	private String characteristic_animal;
	private String species;
	private String strain;
	private String characteristic_equipment;
	private String common_equipment;
	private String technology;
	private String training;
	private String user_admin;
	private String authority_admin;
	private String file_admin;
	private String message;
	
	public String getId() 
	{return id;}
	public void setId(String id) 
	{this.id = id;}	
	public String getName() 
	{return name;}
	public void setName(String name) 
	{this.name = name;}
	public String getAnnouncement() {
		return announcement;
	}
	public void setAnnouncement(String announcement) {
		this.announcement = announcement;
	}
	public String getExperiment() {
		return experiment;
	}
	public void setExperiment(String experiment) {
		this.experiment = experiment;
	}
	public String getLaw() {
		return law;
	}
	public void setLaw(String law) {
		this.law = law;
	}
	public String getExperimental_animal() {
		return experimental_animal;
	}
	public void setExperimental_animal(String experimental_animal) {
		this.experimental_animal = experimental_animal;
	}
	
	public String getCharacteristic_animal() {
		return characteristic_animal;
	}
	public void setCharacteristic_animal(String characteristic_animal) {
		this.characteristic_animal = characteristic_animal;
	}
	public String getSpecies() {
		return species;
	}
	public void setSpecies(String species) {
		this.species = species;
	}
	public String getStrain() {
		return strain;
	}
	public void setStrain(String strain) {
		this.strain = strain;
	}
	public String getCharacteristic_equipment() {
		return characteristic_equipment;
	}
	public void setCharacteristic_equipment(String characteristic_equipment) {
		this.characteristic_equipment = characteristic_equipment;
	}
	public String getCommon_equipment() {
		return common_equipment;
	}
	public void setCommon_equipment(String common_equipment) {
		this.common_equipment = common_equipment;
	}
	public String getTechnology() {
		return technology;
	}
	public void setTechnology(String technology) {
		this.technology = technology;
	}
	public String getTraining() {
		return training;
	}
	public void setTraining(String training) {
		this.training = training;
	}
	public String getUser_admin() {
		return user_admin;
	}
	public void setUser_admin(String user_admin) {
		this.user_admin = user_admin;
	}
	public String getAuthority_admin() {
		return authority_admin;
	}
	public void setAuthority_admin(String authority_admin) {
		this.authority_admin = authority_admin;
	}
	public String getFile_admin() {
		return file_admin;
	}
	public void setFile_admin(String file_admin) {
		this.file_admin = file_admin;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	@Override
	public String toString(){
		return "读取权限";
	}
	public String getAchievement() {
		return achievement;
	}
	public void setAchievement(String achievement) {
		this.achievement = achievement;
	}
}
