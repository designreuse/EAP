package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


import com.journaldev.spring.model.Announcement;
import com.journaldev.spring.model.Equipment;

@Repository
public class AnnouncementDAOImpl implements AnnouncementDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(AnnouncementDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	@Override
	public void addAnnouncement(Announcement p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Announcement saved successfully, Announcement Details="+p);
	}

	@Override
	public void updateAnnouncement(Announcement p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Announcement updated successfully, Announcement Details="+p);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Announcement> listAnnouncements(int startResult, int maxResult) {
		String hsql="from Announcement where classification='平台公告' order by time desc";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hsql);     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);  
        System.out.println(hsql);
        //int a=query.list().size();
        return query.list();  
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Announcement> listLaws(int startResult, int maxResult) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Announcement where classification='法律法规' ");     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Announcement> listStipulatings(int startResult, int maxResult) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Announcement where classification='平台规定' ");     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Announcement> listTrainings(int startResult, int maxResult) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Announcement where classification='培训通知' ");     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Announcement> listPopularizations(int startResult, int maxResult) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Announcement where classification='科普信息' ");     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Announcement> listAllRecords() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Announcement> announcementList = session.createQuery("from Announcement").list();
		for(Announcement p : announcementList){
			logger.info("AllRecords List::"+p);
		}
		return announcementList;
	}
	//新架构使用
	@SuppressWarnings("unchecked")
	@Override
	public List<Announcement> listAllAnnouncements() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Announcement> announcementList = session.createQuery("from Announcement where classification='平台公告' order by time desc").list();
		for(Announcement p : announcementList){
			logger.info("Announcement List::"+p);
		}
		return announcementList;
	}
	//新架构使用
	@SuppressWarnings("unchecked")
	@Override
	public List<Announcement> listAllTrainings() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Announcement> announcementList = session.createQuery("from Announcement where classification='教育培训' order by time desc").list();
		for(Announcement p : announcementList){
			logger.info("Announcement List::"+p);
		}
		return announcementList;
	}
	//新架构使用
		@SuppressWarnings("unchecked")
		@Override
		public List<Announcement> listAllLaws() {
			Session session = this.sessionFactory.getCurrentSession();
			List<Announcement> announcementList = session.createQuery("from Announcement where classification='法律法规' order by time desc").list();
			for(Announcement p : announcementList){
				logger.info("Announcement List::"+p);
			}
			return announcementList;
		}
	//新架构使用-------------------获取前6条公告数据查询----------------------------
	@SuppressWarnings("unchecked")
	public List<Announcement> paginationAnnouncements() {
        Query query = this.sessionFactory.getCurrentSession().createQuery("from Announcement where classification='平台公告' order by time desc");     
        query.setFirstResult(0)  
             .setMaxResults(6);     
        return query.list();  
	}
	//新架构使用-------------------获取前5条教育培训数据查询----------------------------
	@SuppressWarnings("unchecked")
	public List<Announcement> paginationTrainings() {
        Query query = this.sessionFactory.getCurrentSession().createQuery("from Announcement where classification='教育培训' order by time desc");     
        query.setFirstResult(0)  
             .setMaxResults(5);     
        return query.list();  
	}
	
	@Override
	public Announcement getAnnouncementById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Announcement p = (Announcement) session.load(Announcement.class, new String(id));
		logger.info("Announcement loaded successfully, Announcement details="+p);
		return p;
	}
	
	@Override
	public void removeAnnouncement(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Announcement p = (Announcement) session.load(Announcement.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Announcement deleted successfully, Announcement details="+p);
	}

}
