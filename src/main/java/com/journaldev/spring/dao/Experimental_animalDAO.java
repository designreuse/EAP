package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Experimental_animal;

public interface Experimental_animalDAO {

	public void addExperimental_animal(Experimental_animal p);
	public void updateExperimental_animal(Experimental_animal p);
	//实验动物列表
	public List<Experimental_animal> listExperimental_animals();
	public List<Experimental_animal> paginationExperimental_animals(int startResult, int maxResult);
	public List<Experimental_animal> paginationExperimental_animals_admin(int startResult, int maxResult,String org_id);
	public List<Experimental_animal> selectExperimental_animals(int startResult, int maxResult, String name_info,String species_info,
			String strain_info, String dna_info, String phenotype_info);
	public Experimental_animal getExperimental_animalById(String id);
	public void removeExperimental_animal(String id);
	public int Number_selectExperimental_animals(String name_info, String species_info,
			String strain_info, String dna_info, String phenotype_info);
	public List<Experimental_animal> count_experimental_animal();
	public List<String> experimental_animal_strain();
	public List<Experimental_animal> selectExperimental_animals_admin(int startResult, int maxResult, String name_info,
			String species_info, String strain_info, String dna_info, String phenotype_info, String org_id);
	public int Number_selectExperimental_animals_admin(String name_info, String species_info, String strain_info,
			String dna_info, String phenotype_info, String org_id);
	public List<Experimental_animal> numberExperimental_animals_admin(String org_id);
	//实验动物数量
	public long countExperimental_animal();

	//实验动物table_count
	long countExperimental_animal_Table(String search);
	//实验动物table
	List<Experimental_animal> Experimental_animals_Table(int startResult, int maxResult,String search,String sort,String order);


}
