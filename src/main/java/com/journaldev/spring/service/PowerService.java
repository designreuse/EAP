package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Power;

public interface PowerService {

	public void addPower(Power o);
	public void updatePower(Power o);
	public List<Power> listPowers();
	public Power getPowerById(int id);
	public void removePower(int id);
	public List<Object[]> listPower_ztree();
	public List<Object[]> listRole_power(String role_id);
	public void removeRole_power(String id);
	public void updateRole_power(String id,String role_id,int power_id);
}
