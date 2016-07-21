package com.journaldev.spring.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.SpeciesDAO;
import com.journaldev.spring.model.Species;

@Service
public class SpeciesServiceImpl implements SpeciesService {
	
	private SpeciesDAO speciesDAO;

	public void setSpeciesDAO(SpeciesDAO speciesDAO) {
		this.speciesDAO = speciesDAO;
	}

	@Override
	@Transactional
	public void addSpecies(Species p) {
		this.speciesDAO.addSpecies(p);
	}

	@Override
	@Transactional
	public void updateSpecies(Species p) {
		this.speciesDAO.updateSpecies(p);
	}

	@Override
	@Transactional
	public List<Species> listSpeciess() {
		return this.speciesDAO.listSpeciess();
	}
	//返回所有物种的id和name
	@Override
	@Transactional
	public List<Object[]> listSpecies_id_name() {
		return this.speciesDAO.listSpecies_id_name();
	}
	
	@Override
	@Transactional
	public List<Species> paginationSpeciess(int startResult, int maxResult) {
		return this.speciesDAO.paginationSpeciess(startResult, maxResult);
	}
	
	@Override
	@Transactional
	public Species getSpeciesById(String id) {
		return this.speciesDAO.getSpeciesById(id);
	}

	@Override
	@Transactional
	public void removeSpecies(String id) {
		this.speciesDAO.removeSpecies(id);
	}

}
