package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Equipment;

public interface EquipmentService {

	public void addEquipment(Equipment p);
	public void updateEquipment(Equipment p);
	public List<Equipment> listEquipments();
	public Equipment getEquipmentById(String id);
	public void removeEquipment(String id);
	//特色设备列表
	public List<Equipment> listCharacteristic_equipments();
	//常规设备列表
	public List<Equipment> listCommon_equipments();
	//特色设备数量
	public long countCharacteristic_equipments();
	//常规设备数量
	public long countCommon_equipments();
	//返回所有设备的id和name
	public List<Object[]> listEquipment_id_name();
}
