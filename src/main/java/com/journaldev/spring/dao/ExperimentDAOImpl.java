package com.journaldev.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Experiment;

@Repository
public class ExperimentDAOImpl implements ExperimentDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ExperimentDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	//返回所有实验的id和title
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> listExperiment_id_title() {
		Session session = this.sessionFactory.getCurrentSession();		
		String hsql="select id,title from Experiment order by time desc";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hsql);
		List<Object[]> splist=query.list();
		HashMap<String,String> experiment_list=new HashMap<String,String>();		
		for(Object[] s:splist){
			System.out.println(s[0]);
			System.out.println(s[1]);
		}
		return splist;
	}
	
	@Override
	public void addExperiment(Experiment p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Experiment saved successfully, Experiment Details="+p);
	}

	@Override
	public void updateExperiment(Experiment p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Experiment updated successfully, Experiment Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Experiment> listExperiments() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Experiment> experimentsList = session.createQuery("from Experiment").list();
		for(Experiment p : experimentsList){
			logger.info("Experiment List::"+p);
		}
		return experimentsList;
	}

	@Override
	public Experiment getExperimentById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Experiment p = (Experiment) session.load(Experiment.class, new String(id));
		logger.info("Experiment loaded successfully, Experiment details="+p);
		return p;
	}
	
	@Override
	public void removeExperiment(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Experiment p = (Experiment) session.load(Experiment.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Experiment deleted successfully, Experiment details="+p);
	}

}
