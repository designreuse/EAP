package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Physiological_data;

@Repository
public class Physiological_dataDAOImpl implements Physiological_dataDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(Physiological_dataDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addPhysiological_data(Physiological_data p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Physiological_data saved successfully, Physiological_data Details="+p);
	}

	@Override
	public void updatePhysiological_data(Physiological_data p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Physiological_data updated successfully, Physiological_data Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Physiological_data> listPhysiological_datas() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Physiological_data> physiological_datasList = session.createQuery("from Physiological_data").list();
		for(Physiological_data p : physiological_datasList){
			logger.info("Physiological_data List::"+p);
		}
		return physiological_datasList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Physiological_data> paginationPhysiological_datas(int startResult, int maxResult) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Physiological_data");     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}
	
	@Override
	public Physiological_data getPhysiological_dataById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Physiological_data p = (Physiological_data) session.load(Physiological_data.class, new String(id));
		logger.info("Physiological_data loaded successfully, Physiological_data details="+p);
		return p;
	}
	
	@Override
	public void removePhysiological_data(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Physiological_data p = (Physiological_data) session.load(Physiological_data.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Physiological_data deleted successfully, Physiological_data details="+p);
	}

}
