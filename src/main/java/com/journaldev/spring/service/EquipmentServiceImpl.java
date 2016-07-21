package com.journaldev.spring.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.EquipmentDAO;
import com.journaldev.spring.model.Equipment;

@Service
public class EquipmentServiceImpl implements EquipmentService {
	
	private EquipmentDAO equipmentDAO;

	public void setEquipmentDAO(EquipmentDAO equipmentDAO) {
		this.equipmentDAO = equipmentDAO;
	}

	//特色设备列表
	@Override
	@Transactional
	public List<Equipment> listCharacteristic_equipments() {
		return this.equipmentDAO.listCharacteristic_equipments();
	}
	//特色设备数量
	@Override
	@Transactional
	public long countCharacteristic_equipments() {
		return this.equipmentDAO.countCharacteristic_equipments();
	}
	//常规设备列表
	@Override
	@Transactional
	public List<Equipment> listCommon_equipments() {
		return this.equipmentDAO.listCommon_equipments();
	}
	//常规设备数量
	@Override
	@Transactional
	public long countCommon_equipments() {
		return this.equipmentDAO.countCommon_equipments();
	}

	//返回所有物种的id和name
	@Override
	@Transactional
	public List<Object[]> listEquipment_id_name() {
		return this.equipmentDAO.listEquipment_id_name();
	}
	
	@Override
	@Transactional
	public void addEquipment(Equipment p) {
		this.equipmentDAO.addEquipment(p);
	}

	@Override
	@Transactional
	public void updateEquipment(Equipment p) {
		this.equipmentDAO.updateEquipment(p);
	}

	@Override
	@Transactional
	public List<Equipment> listEquipments() {
		return this.equipmentDAO.listEquipments();
	}

	@Override
	@Transactional
	public Equipment getEquipmentById(String id) {
		return this.equipmentDAO.getEquipmentById(id);
	}

	@Override
	@Transactional
	public void removeEquipment(String id) {
		this.equipmentDAO.removeEquipment(id);
	}

}
