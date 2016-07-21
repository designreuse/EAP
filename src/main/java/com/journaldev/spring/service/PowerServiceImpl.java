package com.journaldev.spring.service;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.PowerDAO;
import com.journaldev.spring.model.Power;

@Service
public class PowerServiceImpl implements PowerService {
	
	private PowerDAO powerDAO;

	public void setPowerDAO(PowerDAO powerDAO) {
		this.powerDAO = powerDAO;
	}
	
	//返回所有设备的id、pid和name
	@Override
	@Transactional
	public List<Object[]> listPower_ztree() {
		return this.powerDAO.listPower_ztree();
	}
	//返回某个role的power
	@Override
	@Transactional
	public List<Object[]> listRole_power(String role_id) {
		return this.powerDAO.listRole_power(role_id);
	}
	
	//删除某个role的所有power
	@Override
	@Transactional
	public void removeRole_power(String id) {
		this.powerDAO.removeRole_power(id);
	}


	//给某个role添加一个power	
	@Override
	@Transactional
	public void updateRole_power(String id,String role_id,int power_id) {
		this.powerDAO.updateRole_power(id,role_id,power_id);
	}
	
	@Override
	@Transactional
	public void addPower(Power o) {
		this.powerDAO.addPower(o);
	}

	@Override
	@Transactional
	public void updatePower(Power o) {
		this.powerDAO.updatePower(o);
	}

	@Override
	@Transactional
	public List<Power> listPowers() {
		return this.powerDAO.listPowers();
	}

	@Override
	@Transactional
	public Power getPowerById(int id) {
		return this.powerDAO.getPowerById(id);
	}

	@Override
	@Transactional
	public void removePower(int id) {
		this.powerDAO.removePower(id);
	}

}
