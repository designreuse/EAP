package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.Characteristic_animalDAO;
import com.journaldev.spring.model.Characteristic_animal;

@Service
public class Characteristic_animalServiceImpl implements Characteristic_animalService {
	
	private Characteristic_animalDAO characteristic_animalDAO;

	public void setCharacteristic_animalDAO(Characteristic_animalDAO characteristic_animalDAO) {
		this.characteristic_animalDAO = characteristic_animalDAO;
	}

	@Override
	@Transactional
	public void addCharacteristic_animal(Characteristic_animal p) {
		this.characteristic_animalDAO.addCharacteristic_animal(p);
	}

	@Override
	@Transactional
	public void updateCharacteristic_animal(Characteristic_animal p) {
		this.characteristic_animalDAO.updateCharacteristic_animal(p);
	}

	//特色动物列表
	@Override
	@Transactional
	public List<Characteristic_animal> listCharacteristic_animals() {
		return this.characteristic_animalDAO.listCharacteristic_animals();
	}

	//特色动物数量
	@Override
	@Transactional
	public long countCharacteristic_animal() {
		return this.characteristic_animalDAO.countCharacteristic_animal();
	}
	@Override
	@Transactional
	public List<Characteristic_animal> paginationCharacteristic_animals(int startResult, int maxResult) {
		return this.characteristic_animalDAO.paginationCharacteristic_animals(startResult, maxResult);
	}
	
	@Override
	@Transactional
	public Characteristic_animal getCharacteristic_animalById(String id) {
		return this.characteristic_animalDAO.getCharacteristic_animalById(id);
	}

	@Override
	@Transactional
	public void removeCharacteristic_animal(String id) {
		this.characteristic_animalDAO.removeCharacteristic_animal(id);
	}

}
