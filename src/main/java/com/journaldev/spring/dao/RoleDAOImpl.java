package com.journaldev.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Role;

@Repository
public class RoleDAOImpl implements RoleDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(RoleDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	
	//返回所有角色的id和name
		@SuppressWarnings("unchecked")
		@Override
		public List<Object[]> listRole_id_name() {
			Session session = this.sessionFactory.getCurrentSession();		
			String hsql="select id,name from Role";
			Query query = this.sessionFactory.getCurrentSession().createQuery(hsql);
			List<Object[]> splist=query.list();
			HashMap<String,String> equipment_list=new HashMap<String,String>();		
			for(Object[] s:splist){
				System.out.println(s[0]);
				System.out.println(s[1]);
			}
			return splist;
		}

	@Override
	public void addRole(Role o) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(o);
		logger.info("Role saved successfully, Role Details="+o);
	}

	@Override
	public void updateRole(Role o) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(o);
		logger.info("Role updated successfully, Role Details="+o);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> listRoles() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Role> rolesList = session.createQuery("from Role").list();
		for(Role o : rolesList){
			logger.info("Role List::"+o);
		}
		return rolesList;
	}

	@Override
	public Role getRoleById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Role o = (Role) session.load(Role.class, new String(id));
		logger.info("Role loaded successfully, Role details="+o);
		return o;
	}
	
	@Override
	public void removeRole(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Role o = (Role) session.load(Role.class, new String(id));
		if(null != o){
			session.delete(o);
		}
		logger.info("Role deleted successfully, role details="+o);
	}

}
