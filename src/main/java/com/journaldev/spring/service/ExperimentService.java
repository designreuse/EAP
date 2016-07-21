package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Experiment;

public interface ExperimentService {

	public void addExperiment(Experiment p);
	public void updateExperiment(Experiment p);
	public List<Experiment> listExperiments();
	public Experiment getExperimentById(String id);
	public void removeExperiment(String id);
	public List<Object[]> listExperiment_id_title();
	
}
