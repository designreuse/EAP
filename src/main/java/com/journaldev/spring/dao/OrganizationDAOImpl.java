package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Organization;

@Repository
public class OrganizationDAOImpl implements OrganizationDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(OrganizationDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addOrganization(Organization o) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(o);
		logger.info("Organization saved successfully, Organization Details="+o);
	}

	@Override
	public void updateOrganization(Organization o) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(o);
		logger.info("Organization updated successfully, Organization Details="+o);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Organization> listOrganizations() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Organization> organizationsList = session.createQuery("from Organization").list();
		for(Organization o : organizationsList){
			logger.info("Organization List::"+o);
		}
		return organizationsList;
	}

	@Override
	public Organization getOrganizationById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Organization o = (Organization) session.load(Organization.class, new String(id));
		logger.info("Organization loaded successfully, Organization details="+o);
		return o;
	}
	
	@Override
	public void removeOrganization(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Organization o = (Organization) session.load(Organization.class, new String(id));
		if(null != o){
			session.delete(o);
		}
		logger.info("Organization deleted successfully, organization details="+o);
	}

}
