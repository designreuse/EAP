package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.Autopsy_dataDAO;
import com.journaldev.spring.model.Autopsy_data;

@Service
public class Autopsy_dataServiceImpl implements Autopsy_dataService {
	
	private Autopsy_dataDAO autopsy_dataDAO;

	public void setAutopsy_dataDAO(Autopsy_dataDAO autopsy_dataDAO) {
		this.autopsy_dataDAO = autopsy_dataDAO;
	}

	@Override
	@Transactional
	public void addAutopsy_data(Autopsy_data p) {
		this.autopsy_dataDAO.addAutopsy_data(p);
	}

	@Override
	@Transactional
	public void updateAutopsy_data(Autopsy_data p) {
		this.autopsy_dataDAO.updateAutopsy_data(p);
	}

	@Override
	@Transactional
	public List<Autopsy_data> listAutopsy_datas() {
		return this.autopsy_dataDAO.listAutopsy_datas();
	}

	@Override
	@Transactional
	public List<Autopsy_data> paginationAutopsy_datas(int startResult, int maxResult) {
		return this.autopsy_dataDAO.paginationAutopsy_datas(startResult, maxResult);
	}
	
	@Override
	@Transactional
	public Autopsy_data getAutopsy_dataById(String id) {
		return this.autopsy_dataDAO.getAutopsy_dataById(id);
	}

	@Override
	@Transactional
	public void removeAutopsy_data(String id) {
		this.autopsy_dataDAO.removeAutopsy_data(id);
	}

}
