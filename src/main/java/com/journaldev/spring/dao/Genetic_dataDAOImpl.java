package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Genetic_data;

@Repository
public class Genetic_dataDAOImpl implements Genetic_dataDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(Genetic_dataDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addGenetic_data(Genetic_data p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Genetic_data saved successfully, Genetic_data Details="+p);
	}

	@Override
	public void updateGenetic_data(Genetic_data p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Genetic_data updated successfully, Genetic_data Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Genetic_data> listGenetic_datas() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Genetic_data> genetic_datasList = session.createQuery("from Genetic_data").list();
		for(Genetic_data p : genetic_datasList){
			logger.info("Genetic_data List::"+p);
		}
		return genetic_datasList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Genetic_data> paginationGenetic_datas(int startResult, int maxResult) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Genetic_data");     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}
	
	@Override
	public Genetic_data getGenetic_dataById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Genetic_data p = (Genetic_data) session.load(Genetic_data.class, new String(id));
		logger.info("Genetic_data loaded successfully, Genetic_data details="+p);
		return p;
	}
	
	@Override
	public void removeGenetic_data(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Genetic_data p = (Genetic_data) session.load(Genetic_data.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Genetic_data deleted successfully, Genetic_data details="+p);
	}

}
