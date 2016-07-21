package com.journaldev.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Species;

@Repository
public class SpeciesDAOImpl implements SpeciesDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(SpeciesDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addSpecies(Species p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Species saved successfully, Species Details="+p);
	}

	@Override
	public void updateSpecies(Species p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Species updated successfully, Species Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Species> listSpeciess() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Species> speciessList = session.createQuery("from Species").list();
		for(Species p : speciessList){
			logger.info("Species List::"+p);
		}
		return speciessList;
	}
	//返回所有物种的id和name
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> listSpecies_id_name() {
		Session session = this.sessionFactory.getCurrentSession();		
		String hsql="select id,name from Species order by time desc";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hsql);
		List<Object[]> splist=query.list();
		HashMap<String,String> species_list=new HashMap<String,String>();		
		for(Object[] s:splist){
			System.out.println(s[0]);
			System.out.println(s[1]);
		}
		return splist;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Species> paginationSpeciess(int startResult, int maxResult) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Species");     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}
	
	@Override
	public Species getSpeciesById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Species p = (Species) session.load(Species.class, new String(id));
		logger.info("Species loaded successfully, Species details="+p);
		return p;
	}
	
	@Override
	public void removeSpecies(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Species p = (Species) session.load(Species.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Species deleted successfully, Species details="+p);
	}

}
