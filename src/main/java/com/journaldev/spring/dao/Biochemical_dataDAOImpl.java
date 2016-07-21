package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Biochemical_data;

@Repository
public class Biochemical_dataDAOImpl implements Biochemical_dataDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(Biochemical_dataDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addBiochemical_data(Biochemical_data p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Biochemical_data saved successfully, Biochemical_data Details="+p);
	}

	@Override
	public void updateBiochemical_data(Biochemical_data p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Biochemical_data updated successfully, Biochemical_data Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Biochemical_data> listBiochemical_datas() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Biochemical_data> biochemical_datasList = session.createQuery("from Biochemical_data").list();
		for(Biochemical_data p : biochemical_datasList){
			logger.info("Biochemical_data List::"+p);
		}
		return biochemical_datasList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Biochemical_data> paginationBiochemical_datas(int startResult, int maxResult) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Biochemical_data");     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}
	
	@Override
	public Biochemical_data getBiochemical_dataById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Biochemical_data p = (Biochemical_data) session.load(Biochemical_data.class, new String(id));
		logger.info("Biochemical_data loaded successfully, Biochemical_data details="+p);
		return p;
	}
	
	@Override
	public void removeBiochemical_data(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Biochemical_data p = (Biochemical_data) session.load(Biochemical_data.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Biochemical_data deleted successfully, Biochemical_data details="+p);
	}

}
