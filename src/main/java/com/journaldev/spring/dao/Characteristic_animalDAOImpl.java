package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Characteristic_animal;

@Repository
public class Characteristic_animalDAOImpl implements Characteristic_animalDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(Characteristic_animalDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addCharacteristic_animal(Characteristic_animal p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Characteristic_animal saved successfully, Characteristic_animal Details="+p);
	}

	@Override
	public void updateCharacteristic_animal(Characteristic_animal p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Characteristic_animal updated successfully, Characteristic_animal Details="+p);
	}
	//特色动物列表
	@SuppressWarnings("unchecked")
	@Override
	public List<Characteristic_animal> listCharacteristic_animals() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Characteristic_animal> characteristic_animalsList = session.createQuery("from Characteristic_animal").list();
		for(Characteristic_animal p : characteristic_animalsList){
			logger.info("Characteristic_animal List::"+p);
		}
		return characteristic_animalsList;
	}
	//特色动物数量
	@SuppressWarnings("unchecked")
	@Override
	public long countCharacteristic_animal() {
		Session session = this.sessionFactory.getCurrentSession();
		Query query=session.createQuery("select count(*) from Characteristic_animal");
		long count=(long)query.uniqueResult();
		return count;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Characteristic_animal> paginationCharacteristic_animals(int startResult, int maxResult) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Characteristic_animal");     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}
	
	@Override
	public Characteristic_animal getCharacteristic_animalById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Characteristic_animal p = (Characteristic_animal) session.load(Characteristic_animal.class, new String(id));
		logger.info("Characteristic_animal loaded successfully, Characteristic_animal details="+p);
		return p;
	}
	
	@Override
	public void removeCharacteristic_animal(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Characteristic_animal p = (Characteristic_animal) session.load(Characteristic_animal.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Characteristic_animal deleted successfully, Characteristic_animal details="+p);
	}

}
