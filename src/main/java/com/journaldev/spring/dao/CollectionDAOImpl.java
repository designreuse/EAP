package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Collection;
import com.journaldev.spring.model.Message;

@Repository
public class CollectionDAOImpl implements CollectionDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(CollectionDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addCollection(Collection p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Collection saved successfully, Collection Details="+p);
	}

	@Override
	public void updateCollection(Collection p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Collection updated successfully, Collection Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Collection> listCollections() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Collection> collectionsList = session.createQuery("from Collection").list();
		for(Collection p : collectionsList){
			logger.info("Collection List::"+p);
		}
		return collectionsList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Collection> paginationCollections(int startResult, int maxResult) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Collection");     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}
	
	@Override
	public Collection getCollectionById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Collection p = (Collection) session.load(Collection.class, new String(id));
		logger.info("Collection loaded successfully, Collection details="+p);
		return p;
	}
	
	@Override
	public void removeCollection(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Collection p = (Collection) session.load(Collection.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Collection deleted successfully, Collection details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Collection> mycollection(String user_id,String classification) {
		Session session = this.sessionFactory.getCurrentSession();
		
			List<Collection> collectionsList = session.createQuery("from Collection where user_id='"+user_id+"' and classification='"+classification+"'").list();
			for(Collection p : collectionsList){
				logger.info("Collection List::"+p);
			}		
			return collectionsList;
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Collection> anybodycollection(String classification) {
		Session session = this.sessionFactory.getCurrentSession();
		
			List<Collection> collectionsList = session.createQuery("from Collection where classification='"+classification+"'").list();
			for(Collection p : collectionsList){
				logger.info("Collection List::"+p);
			}		
			return collectionsList;
		
	}
	
}
