package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Autopsy_data;

@Repository
public class Autopsy_dataDAOImpl implements Autopsy_dataDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(Autopsy_dataDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addAutopsy_data(Autopsy_data p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Autopsy_data saved successfully, Autopsy_data Details="+p);
	}

	@Override
	public void updateAutopsy_data(Autopsy_data p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Autopsy_data updated successfully, Autopsy_data Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Autopsy_data> listAutopsy_datas() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Autopsy_data> autopsy_datasList = session.createQuery("from Autopsy_data").list();
		for(Autopsy_data p : autopsy_datasList){
			logger.info("Autopsy_data List::"+p);
		}
		return autopsy_datasList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Autopsy_data> paginationAutopsy_datas(int startResult, int maxResult) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Autopsy_data");     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}
	
	@Override
	public Autopsy_data getAutopsy_dataById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Autopsy_data p = (Autopsy_data) session.load(Autopsy_data.class, new String(id));
		logger.info("Autopsy_data loaded successfully, Autopsy_data details="+p);
		return p;
	}
	
	@Override
	public void removeAutopsy_data(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Autopsy_data p = (Autopsy_data) session.load(Autopsy_data.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Autopsy_data deleted successfully, Autopsy_data details="+p);
	}

}
