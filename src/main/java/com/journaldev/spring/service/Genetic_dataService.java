package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Genetic_data;

public interface Genetic_dataService {

	public void addGenetic_data(Genetic_data p);
	public void updateGenetic_data(Genetic_data p);
	public List<Genetic_data> listGenetic_datas();
	public List<Genetic_data> paginationGenetic_datas(int startResult, int maxResult);
	public Genetic_data getGenetic_dataById(String id);
	public void removeGenetic_data(String id);
		
}
