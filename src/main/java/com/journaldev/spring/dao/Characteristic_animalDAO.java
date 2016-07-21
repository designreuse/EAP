package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Characteristic_animal;

public interface Characteristic_animalDAO {

	public void addCharacteristic_animal(Characteristic_animal p);
	public void updateCharacteristic_animal(Characteristic_animal p);
	//特色动物列表
	public List<Characteristic_animal> listCharacteristic_animals();
	public List<Characteristic_animal> paginationCharacteristic_animals(int startResult, int maxResult);
	public Characteristic_animal getCharacteristic_animalById(String id);
	public void removeCharacteristic_animal(String id);
	//特色动物数量
	public long countCharacteristic_animal();
}
