package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Files;
import com.journaldev.spring.model.Strain;

@Repository
public class FileDAOImpl implements FileDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(FileDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addFile(Files o) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(o);
		logger.info("File saved successfully, File Details="+o);
	}

	@Override
	public void updateFile(Files o) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(o);
		logger.info("File updated successfully, File Details="+o);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Files> listFiles() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Files> filesList = session.createQuery("from Files").list();
		for(Files o : filesList){
			logger.info("File List::"+o);
		}
		return filesList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Files> paginationFiles(int startResult, int maxResult) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Files");     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}
	
	@Override
	public Files getFileById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Files o = (Files) session.load(Files.class, new String(id));
		logger.info("File loaded successfully, File details="+o);
		return o;
	}
	
	@Override
	public void removeFile(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Files o = (Files) session.load(Files.class, new String(id));
		if(null != o){
			session.delete(o);
		}
		logger.info("File deleted successfully, File details="+o);
	}

}
