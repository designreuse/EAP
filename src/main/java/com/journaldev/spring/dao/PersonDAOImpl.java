package com.journaldev.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Person;

@Repository
public class PersonDAOImpl implements PersonDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(PersonDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addPerson(Person p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Person saved successfully, Person Details="+p);
	}

	@Override
	public void updatePerson(Person p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Person updated successfully, Person Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> listPersons() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Person> personsList = session.createQuery("from Person").list();
		for(Person p : personsList){
			logger.info("Person List::"+p);
		}
		return personsList;
	}

	@Override
	public Person getPersonById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Person p = (Person) session.load(Person.class, new String(id));
		logger.info("Person loaded successfully, Person details="+p);
		return p;
	}
	
	@Override
	public void removePerson(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Person p = (Person) session.load(Person.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Person deleted successfully, Person details="+p);
	}

	//返回所有人的id和name
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> listPerson_id_name() {
		Session session = this.sessionFactory.getCurrentSession();		
		String hsql="select id,name from Person order by name";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hsql);
		List<Object[]> pelist=query.list();
		HashMap<String,String> person_list=new HashMap<String,String>();		
		for(Object[] s:pelist){
			System.out.println(s[0]);
			System.out.println(s[1]);
		}
		return pelist;
	}
}
