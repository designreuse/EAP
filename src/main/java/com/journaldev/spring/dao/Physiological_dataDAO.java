package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Physiological_data;

public interface Physiological_dataDAO {

	public void addPhysiological_data(Physiological_data p);
	public void updatePhysiological_data(Physiological_data p);
	public List<Physiological_data> listPhysiological_datas();
	public List<Physiological_data> paginationPhysiological_datas(int startResult, int maxResult);
	public Physiological_data getPhysiological_dataById(String id);
	public void removePhysiological_data(String id);
}
