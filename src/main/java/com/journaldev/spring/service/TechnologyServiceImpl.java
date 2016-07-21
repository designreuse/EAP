package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.TechnologyDAO;
import com.journaldev.spring.model.Experimental_animal;
import com.journaldev.spring.model.Technology;

@Service
public class TechnologyServiceImpl implements TechnologyService {
	
	private TechnologyDAO technologyDAO;

	public void setTechnologyDAO(TechnologyDAO technologyDAO) {
		this.technologyDAO = technologyDAO;
	}

	@Override
	@Transactional
	public void addTechnology(Technology p) {
		this.technologyDAO.addTechnology(p);
	}

	@Override
	@Transactional
	public void updateTechnology(Technology p) {
		this.technologyDAO.updateTechnology(p);
	}
	@Override
	@Transactional
	public List<Technology> showTop6Technologys() {
		return this.technologyDAO.showTop6Technologys();
	}
	@Override
	@Transactional
	public List<Technology> listTechnologys(int startResult, int maxResult) {
		return this.technologyDAO.listTechnologys(startResult, maxResult);
	}
	
	
	@Override
	@Transactional
	public List<Technology> listTechnologys() {
		return this.technologyDAO.listTechnologys();
	}

	@Override
	@Transactional
	public Technology getTechnologyById(String id) {
		return this.technologyDAO.getTechnologyById(id);
	}

	@Override
	@Transactional
	public void removeTechnology(String id) {
		this.technologyDAO.removeTechnology(id);
	}

	@Override
	@Transactional
	public List<Technology> selectTechnologys(int startResult, int maxResult, String title_info, String species_info,String abstract_info, String cycle_info) {
		return this.technologyDAO.selectTechnologys(startResult, maxResult,title_info,species_info,abstract_info,cycle_info);
	}

	@Override
	@Transactional
	public int Number_selectTechnologys(String title_info, String species_info,String abstract_info, String cycle_info) {
		return this.technologyDAO.Number_selectTechnologys(title_info,species_info,abstract_info,cycle_info);
	}
	
}
