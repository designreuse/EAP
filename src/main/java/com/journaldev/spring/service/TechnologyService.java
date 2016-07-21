package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Technology;

public interface TechnologyService {

	public void addTechnology(Technology p);
	public void updateTechnology(Technology p);
	public List<Technology> listTechnologys();
	public List<Technology> showTop6Technologys();
	public List<Technology> listTechnologys(int startResult, int maxResult);
	public Technology getTechnologyById(String id);
	public void removeTechnology(String id);
	public List<Technology> selectTechnologys(int startResult, int maxResult, String title_info, String species_info,
			String abstract_info, String cycle_info);
	public int Number_selectTechnologys(String title_info, String species_info, String abstract_info, String cycle_info);
	
}
