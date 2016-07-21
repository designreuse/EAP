package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Biochemical_data;

public interface Biochemical_dataDAO {

	public void addBiochemical_data(Biochemical_data p);
	public void updateBiochemical_data(Biochemical_data p);
	public List<Biochemical_data> listBiochemical_datas();
	public List<Biochemical_data> paginationBiochemical_datas(int startResult, int maxResult);
	public Biochemical_data getBiochemical_dataById(String id);
	public void removeBiochemical_data(String id);
}
