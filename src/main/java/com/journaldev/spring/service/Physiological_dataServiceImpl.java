package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.Physiological_dataDAO;
import com.journaldev.spring.model.Physiological_data;

@Service
public class Physiological_dataServiceImpl implements Physiological_dataService {
	
	private Physiological_dataDAO physiological_dataDAO;

	public void setPhysiological_dataDAO(Physiological_dataDAO physiological_dataDAO) {
		this.physiological_dataDAO = physiological_dataDAO;
	}

	@Override
	@Transactional
	public void addPhysiological_data(Physiological_data p) {
		this.physiological_dataDAO.addPhysiological_data(p);
	}

	@Override
	@Transactional
	public void updatePhysiological_data(Physiological_data p) {
		this.physiological_dataDAO.updatePhysiological_data(p);
	}

	@Override
	@Transactional
	public List<Physiological_data> listPhysiological_datas() {
		return this.physiological_dataDAO.listPhysiological_datas();
	}

	@Override
	@Transactional
	public List<Physiological_data> paginationPhysiological_datas(int startResult, int maxResult) {
		return this.physiological_dataDAO.paginationPhysiological_datas(startResult, maxResult);
	}
	
	@Override
	@Transactional
	public Physiological_data getPhysiological_dataById(String id) {
		return this.physiological_dataDAO.getPhysiological_dataById(id);
	}

	@Override
	@Transactional
	public void removePhysiological_data(String id) {
		this.physiological_dataDAO.removePhysiological_data(id);
	}

}
