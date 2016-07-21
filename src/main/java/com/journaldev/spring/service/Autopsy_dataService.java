package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Autopsy_data;

public interface Autopsy_dataService {

	public void addAutopsy_data(Autopsy_data p);
	public void updateAutopsy_data(Autopsy_data p);
	public List<Autopsy_data> listAutopsy_datas();
	public List<Autopsy_data> paginationAutopsy_datas(int startResult, int maxResult);
	public Autopsy_data getAutopsy_dataById(String id);
	public void removeAutopsy_data(String id);
		
}
