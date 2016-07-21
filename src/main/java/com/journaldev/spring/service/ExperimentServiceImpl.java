package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.ExperimentDAO;
import com.journaldev.spring.model.Experiment;

@Service
public class ExperimentServiceImpl implements ExperimentService {
	
	private ExperimentDAO experimentDAO;

	public void setExperimentDAO(ExperimentDAO experimentDAO) {
		this.experimentDAO = experimentDAO;
	}


	//返回所有实验的id和title
	@Override
	@Transactional
	public List<Object[]> listExperiment_id_title() {
		return this.experimentDAO.listExperiment_id_title();
	}
	
	@Override
	@Transactional
	public void addExperiment(Experiment p) {
		this.experimentDAO.addExperiment(p);
	}

	@Override
	@Transactional
	public void updateExperiment(Experiment p) {
		this.experimentDAO.updateExperiment(p);
	}

	@Override
	@Transactional
	public List<Experiment> listExperiments() {
		return this.experimentDAO.listExperiments();
	}

	@Override
	@Transactional
	public Experiment getExperimentById(String id) {
		return this.experimentDAO.getExperimentById(id);
	}

	@Override
	@Transactional
	public void removeExperiment(String id) {
		this.experimentDAO.removeExperiment(id);
	}

}
