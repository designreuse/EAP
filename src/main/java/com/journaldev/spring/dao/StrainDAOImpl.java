package com.journaldev.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Strain;

@Repository
public class StrainDAOImpl implements StrainDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(StrainDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addStrain(Strain p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Strain saved successfully, Strain Details="+p);
	}

	@Override
	public void updateStrain(Strain p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Strain updated successfully, Strain Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Strain> listStrains() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Strain> strainsList = session.createQuery("from Strain").list();
		for(Strain p : strainsList){
			logger.info("Strain List::"+p);
		}
		return strainsList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Strain> paginationStrains(int startResult, int maxResult) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Strain");     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}
	
	@Override
	public Strain getStrainById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Strain p = (Strain) session.load(Strain.class, new String(id));
		logger.info("Strain loaded successfully, Strain details="+p);
		return p;
	}
	
	@Override
	public void removeStrain(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Strain p = (Strain) session.load(Strain.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Strain deleted successfully, Strain details="+p);
	}

	//返回所有品系的id和name
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> listStrain_id_name() {
		Session session = this.sessionFactory.getCurrentSession();		
		String hsql="select id,name from Strain order by time desc";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hsql);
		List<Object[]> stlist=query.list();
		HashMap<String,String> strain_list=new HashMap<String,String>();		
		for(Object[] s:stlist){
			System.out.println(s[0]);
			System.out.println(s[1]);
		}
		return stlist;
	}
}
