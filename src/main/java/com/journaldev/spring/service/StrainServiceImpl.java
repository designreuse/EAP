package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.StrainDAO;
import com.journaldev.spring.model.Strain;

@Service
public class StrainServiceImpl implements StrainService {
	
	private StrainDAO strainDAO;

	public void setStrainDAO(StrainDAO strainDAO) {
		this.strainDAO = strainDAO;
	}

	@Override
	@Transactional
	public void addStrain(Strain p) {
		this.strainDAO.addStrain(p);
	}

	@Override
	@Transactional
	public void updateStrain(Strain p) {
		this.strainDAO.updateStrain(p);
	}

	@Override
	@Transactional
	public List<Strain> listStrains() {
		return this.strainDAO.listStrains();
	}

	@Override
	@Transactional
	public List<Strain> paginationStrains(int startResult, int maxResult) {
		return this.strainDAO.paginationStrains(startResult, maxResult);
	}
	
	@Override
	@Transactional
	public Strain getStrainById(String id) {
		return this.strainDAO.getStrainById(id);
	}

	@Override
	@Transactional
	public void removeStrain(String id) {
		this.strainDAO.removeStrain(id);
	}
	
	//返回所有品系的id和name
	@Override
	@Transactional
	public List<Object[]> listStrain_id_name() {
		return this.strainDAO.listStrain_id_name();
	}
}
