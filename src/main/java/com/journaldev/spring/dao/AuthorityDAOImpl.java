package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.User;
import com.journaldev.spring.model.Authority;

@Repository
public class AuthorityDAOImpl implements AuthorityDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(AuthorityDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	//根据user_id查询实体，返回唯一的实体类
	@Override
	public Authority getAuthorityByUser_id(String user_id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Query query=session.createQuery("from Authority where user_id = '"+user_id+"'");
		Authority authority=(Authority)query.uniqueResult();
		return authority;
	}
	@Override
	public void addAuthority(Authority p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("加入权限记录1条");
	}

	@Override
	public void updateAuthority(Authority p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("更新权限记录1条");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Authority> listAuthoritys() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Authority> authoritysList = session.createQuery("from Authority").list();
		for(Authority p : authoritysList){
			logger.info("读取所有权限记录");
		}
		return authoritysList;
	}

	@Override
	public Authority getAuthorityById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Authority p = (Authority) session.load(Authority.class, new String(id));
		logger.info("根据id获取了一条权限记录");
		return p;
	}
	
	@Override
	public void removeAuthority(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Authority p = (Authority) session.load(Authority.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("根据id删除了1条权限记录");
	}

}
