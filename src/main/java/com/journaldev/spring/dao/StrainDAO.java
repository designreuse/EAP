package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Strain;

public interface StrainDAO {

	public void addStrain(Strain p);
	public void updateStrain(Strain p);
	public List<Strain> listStrains();
	public List<Strain> paginationStrains(int startResult, int maxResult);
	public Strain getStrainById(String id);
	public void removeStrain(String id);
	public List<Object[]> listStrain_id_name();
}
