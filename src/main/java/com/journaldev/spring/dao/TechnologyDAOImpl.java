package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Announcement;
import com.journaldev.spring.model.Experimental_animal;
import com.journaldev.spring.model.Technology;

@Repository
public class TechnologyDAOImpl implements TechnologyDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(TechnologyDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addTechnology(Technology p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Technology saved successfully, Technology Details="+p);
	}

	@Override
	public void updateTechnology(Technology p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Technology updated successfully, Technology Details="+p);
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Technology> listTechnologys(int startResult, int maxResult) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Technology");     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}
	//-------------------获取前5条技术服务数据----------------------------
	@SuppressWarnings("unchecked")
	public List<Technology> showTop6Technologys() {
        Query query = this.sessionFactory.getCurrentSession().createQuery("from Technology order by time desc");     
        query.setFirstResult(0)  
             .setMaxResults(5);     
        return query.list();  
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Technology> listTechnologys() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Technology> technologysList = session.createQuery("from Technology").list();
		for(Technology p : technologysList){
			logger.info("Technology List::"+p);
		}
		return technologysList;
	}

	@Override
	public Technology getTechnologyById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Technology p = (Technology) session.load(Technology.class, new String(id));
		logger.info("Technology loaded successfully, Technology details="+p);
		return p;
	}
	
	@Override
	public void removeTechnology(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Technology p = (Technology) session.load(Technology.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Technology deleted successfully, Technology details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Technology> selectTechnologys(int startResult, int maxResult,String title_info,String species_info,String abstract_info,String cycle_info) {
		String hql="from Technology ea where ea.title like ?";						
		if(species_info.length() > 0)
		{
			hql=hql+" and ea.target like ?";
		}
		if(abstract_info.length() > 0)
		{
			hql=hql+" and ea.abstract_text like ?";
		}
		if(cycle_info.length() > 0)
		{
			hql=hql+" and ea.cycle like ?";
		}
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);     
		query.setString(0,"%"+title_info+"%");		
		int j=1;		
		if(species_info.length() > 0)
		{
			query.setString(j,"%"+species_info+"%");
			j=j+1;
		}
		if(abstract_info.length() > 0)
		{
			query.setString(j,"%"+abstract_info+"%");
			j=j+1;
		}
		if(cycle_info.length() > 0)
		{
			query.setString(j,"%"+cycle_info+"%"); 	
			j=j+1;
		}
		query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}	
	
	@SuppressWarnings("unchecked")
	@Override
	public int Number_selectTechnologys(String title_info,String species_info,String abstract_info,String cycle_info) {
		String hql="from Technology ea where ea.title like ?";						
		if(species_info.length() > 0)
		{
			hql=hql+" and ea.target like ?";
		}
		if(abstract_info.length() > 0)
		{
			hql=hql+" and ea.abstract_text like ?";
		}
		if(cycle_info.length() > 0)
		{
			hql=hql+" and ea.cycle like ?";
		}
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);     
		query.setString(0,"%"+title_info+"%");		
		int j=1;		
		if(species_info.length() > 0)
		{
			query.setString(j,"%"+species_info+"%");
			j=j+1;
		}
		if(abstract_info.length() > 0)
		{
			query.setString(j,"%"+abstract_info+"%");
			j=j+1;
		}
		if(cycle_info.length() > 0)
		{
			query.setString(j,"%"+cycle_info+"%"); 	
			j=j+1;
		}		
        return query.list().size();  
	}	
}
