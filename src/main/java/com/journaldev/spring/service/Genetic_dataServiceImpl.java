package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.Genetic_dataDAO;
import com.journaldev.spring.model.Genetic_data;

@Service
public class Genetic_dataServiceImpl implements Genetic_dataService {
	
	private Genetic_dataDAO genetic_dataDAO;

	public void setGenetic_dataDAO(Genetic_dataDAO genetic_dataDAO) {
		this.genetic_dataDAO = genetic_dataDAO;
	}

	@Override
	@Transactional
	public void addGenetic_data(Genetic_data p) {
		this.genetic_dataDAO.addGenetic_data(p);
	}

	@Override
	@Transactional
	public void updateGenetic_data(Genetic_data p) {
		this.genetic_dataDAO.updateGenetic_data(p);
	}

	@Override
	@Transactional
	public List<Genetic_data> listGenetic_datas() {
		return this.genetic_dataDAO.listGenetic_datas();
	}

	@Override
	@Transactional
	public List<Genetic_data> paginationGenetic_datas(int startResult, int maxResult) {
		return this.genetic_dataDAO.paginationGenetic_datas(startResult, maxResult);
	}
	
	@Override
	@Transactional
	public Genetic_data getGenetic_dataById(String id) {
		return this.genetic_dataDAO.getGenetic_dataById(id);
	}

	@Override
	@Transactional
	public void removeGenetic_data(String id) {
		this.genetic_dataDAO.removeGenetic_data(id);
	}

}
