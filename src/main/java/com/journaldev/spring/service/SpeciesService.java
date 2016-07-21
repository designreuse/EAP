package com.journaldev.spring.service;

import java.util.HashMap;
import java.util.List;

import com.journaldev.spring.model.Species;

public interface SpeciesService {

	public void addSpecies(Species p);
	public void updateSpecies(Species p);
	public List<Species> listSpeciess();
	public List<Species> paginationSpeciess(int startResult, int maxResult);
	public Species getSpeciesById(String id);
	public void removeSpecies(String id);
	public List<Object[]> listSpecies_id_name();
		
}
