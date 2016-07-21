package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Strain;

public interface StrainService {

	public void addStrain(Strain p);
	public void updateStrain(Strain p);
	public List<Strain> listStrains();
	public List<Strain> paginationStrains(int startResult, int maxResult);
	public Strain getStrainById(String id);
	public void removeStrain(String id);
	//返回所有品系的id和name
	public List<Object[]> listStrain_id_name();
}
