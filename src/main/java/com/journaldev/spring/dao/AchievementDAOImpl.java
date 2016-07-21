package com.journaldev.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Achievement;

@Repository
public class AchievementDAOImpl implements AchievementDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(AchievementDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	@Override
	public void addAchievement(Achievement p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Achievement saved successfully, Achievement Details="+p);
	}

	@Override
	public void updateAchievement(Achievement p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Achievement updated successfully, Achievement Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Achievement> listAchievements() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Achievement> achievementsList = session.createQuery("from Achievement").list();
		for(Achievement p : achievementsList){
			logger.info("Achievement List::"+p);
		}
		return achievementsList;
	}

	@Override
	public Achievement getAchievementById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Achievement p = (Achievement) session.load(Achievement.class, new String(id));
		logger.info("Achievement loaded successfully, Achievement details="+p);
		return p;
	}
	
	@Override
	public void removeAchievement(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Achievement p = (Achievement) session.load(Achievement.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Achievement deleted successfully, Achievement details="+p);
	}

}
