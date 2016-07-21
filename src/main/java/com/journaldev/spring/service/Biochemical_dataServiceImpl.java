package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.Biochemical_dataDAO;
import com.journaldev.spring.model.Biochemical_data;

@Service
public class Biochemical_dataServiceImpl implements Biochemical_dataService {
	
	private Biochemical_dataDAO biochemical_dataDAO;

	public void setBiochemical_dataDAO(Biochemical_dataDAO biochemical_dataDAO) {
		this.biochemical_dataDAO = biochemical_dataDAO;
	}

	@Override
	@Transactional
	public void addBiochemical_data(Biochemical_data p) {
		this.biochemical_dataDAO.addBiochemical_data(p);
	}

	@Override
	@Transactional
	public void updateBiochemical_data(Biochemical_data p) {
		this.biochemical_dataDAO.updateBiochemical_data(p);
	}

	@Override
	@Transactional
	public List<Biochemical_data> listBiochemical_datas() {
		return this.biochemical_dataDAO.listBiochemical_datas();
	}

	@Override
	@Transactional
	public List<Biochemical_data> paginationBiochemical_datas(int startResult, int maxResult) {
		return this.biochemical_dataDAO.paginationBiochemical_datas(startResult, maxResult);
	}
	
	@Override
	@Transactional
	public Biochemical_data getBiochemical_dataById(String id) {
		return this.biochemical_dataDAO.getBiochemical_dataById(id);
	}

	@Override
	@Transactional
	public void removeBiochemical_data(String id) {
		this.biochemical_dataDAO.removeBiochemical_data(id);
	}

}
