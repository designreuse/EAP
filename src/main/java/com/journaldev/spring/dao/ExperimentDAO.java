package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Experiment;

public interface ExperimentDAO {

	public void addExperiment(Experiment p);
	public void updateExperiment(Experiment p);
	public List<Experiment> listExperiments();
	public Experiment getExperimentById(String id);
	public void removeExperiment(String id);
	public List<Object[]> listExperiment_id_title();
}
