package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Message;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addMessage(Message p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Message saved successfully, Message Details="+p);
	}

	@Override
	public void updateMessage(Message p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Message updated successfully, Message Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> listMessages() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Message> messagesList = session.createQuery("from Message").list();
		for(Message p : messagesList){
			logger.info("Message List::"+p);
		}
		return messagesList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> inbox(String addressee_id,int status) {
		Session session = this.sessionFactory.getCurrentSession();
		if(status==1)
		{
			List<Message> messagesList = session.createQuery("from Message where addressee_id='"+addressee_id+"'").list();
			for(Message p : messagesList){
				logger.info("Message List::"+p);
			}
			return messagesList;
		}
		else
		{
			List<Message> messagesList = session.createQuery("from Message m where m.addressee_id='"+addressee_id+"' and m.status=2").list();
			for(Message p : messagesList){
				logger.info("Message List::"+p);
			}
			return messagesList;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> paginationMessages(int startResult, int maxResult) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Message");     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}
	
	@Override
	public Message getMessageById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Message p = (Message) session.load(Message.class, new String(id));
		logger.info("Message loaded successfully, Message details="+p);
		return p;
	}
	
	@Override
	public void removeMessage(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Message p = (Message) session.load(Message.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Message deleted successfully, Message details="+p);
	}

}
