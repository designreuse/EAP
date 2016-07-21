package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.Experimental_animalDAO;
import com.journaldev.spring.model.Experimental_animal;

@Service
public class Experimental_animalServiceImpl implements Experimental_animalService {
	
	private Experimental_animalDAO experimental_animalDAO;

	public void setExperimental_animalDAO(Experimental_animalDAO experimental_animalDAO) {
		this.experimental_animalDAO = experimental_animalDAO;
	}

	@Override
	@Transactional
	public void addExperimental_animal(Experimental_animal p) {
		this.experimental_animalDAO.addExperimental_animal(p);
	}

	@Override
	@Transactional
	public void updateExperimental_animal(Experimental_animal p) {
		this.experimental_animalDAO.updateExperimental_animal(p);
	}


	//实验动物table_count
	@Override
	@Transactional
	public long countExperimental_animal_Table(String search) {
		return this.experimental_animalDAO.countExperimental_animal_Table(search);
	}
	//实验动物table
	@Override
	@Transactional
	public List<Experimental_animal> Experimental_animals_Table(int startResult, int maxResult,String search,String sort,String order) {
		return this.experimental_animalDAO.Experimental_animals_Table(startResult, maxResult,search,sort,order);
	}


	//实验动物列表
	@Override
	@Transactional
	public List<Experimental_animal> listExperimental_animals() {
		return this.experimental_animalDAO.listExperimental_animals();
	}
	//实验动物数量
	@Override
	@Transactional
	public long countExperimental_animal() {
		return this.experimental_animalDAO.countExperimental_animal();
	}
	@Override
	@Transactional
	public List<Experimental_animal> paginationExperimental_animals(int startResult, int maxResult) {
		return this.experimental_animalDAO.paginationExperimental_animals(startResult, maxResult);
	}

	@Override
	@Transactional
	public List<Experimental_animal> paginationExperimental_animals_admin(int startResult, int maxResult,String org_id) {
		return this.experimental_animalDAO.paginationExperimental_animals_admin(startResult, maxResult,org_id);
	}	
	
	@Override
	@Transactional
	public List<Experimental_animal> numberExperimental_animals_admin(String org_id) {
		return this.experimental_animalDAO.numberExperimental_animals_admin(org_id);
	}	
	
	@Override
	@Transactional
	public List<Experimental_animal> count_experimental_animal() {
		return this.experimental_animalDAO.count_experimental_animal();
	}	
	
	@Override
	@Transactional
	public List<String> experimental_animal_strain() {
		return this.experimental_animalDAO.experimental_animal_strain();
	}
	
	@Override
	@Transactional
	public List<Experimental_animal> selectExperimental_animals(int startResult, int maxResult, String name_info,String species_info, String strain_info, String dna_info, String phenotype_info) {
		return this.experimental_animalDAO.selectExperimental_animals(startResult, maxResult,name_info,species_info,strain_info,dna_info,phenotype_info);
	}

	@Override
	@Transactional
	public int Number_selectExperimental_animals(String name_info,String species_info, String strain_info, String dna_info, String phenotype_info) {
		return this.experimental_animalDAO.Number_selectExperimental_animals(name_info,species_info,strain_info,dna_info,phenotype_info);
	}
	
	
	@Override
	@Transactional
	public List<Experimental_animal> selectExperimental_animals_admin(int startResult, int maxResult, String name_info, String species_info, String strain_info, String dna_info, String phenotype_info, String org_id) {
		return this.experimental_animalDAO.selectExperimental_animals_admin(startResult, maxResult,name_info,species_info,strain_info,dna_info,phenotype_info,org_id);
	}

	@Override
	@Transactional
	public int Number_selectExperimental_animals_admin(String name_info, String species_info, String strain_info,	String dna_info, String phenotype_info, String org_id) {
		return this.experimental_animalDAO.Number_selectExperimental_animals_admin(name_info,species_info,strain_info,dna_info,phenotype_info,org_id);
	}
	
	@Override
	@Transactional
	public Experimental_animal getExperimental_animalById(String id) {
		return this.experimental_animalDAO.getExperimental_animalById(id);
	}

	@Override
	@Transactional
	public void removeExperimental_animal(String id) {
		this.experimental_animalDAO.removeExperimental_animal(id);
	}

}
