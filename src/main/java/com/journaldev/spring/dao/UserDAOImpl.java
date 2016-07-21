package com.journaldev.spring.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.User;

@Repository
public class UserDAOImpl implements UserDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addUser(User p) {
		Session session = this.sessionFactory.getCurrentSession();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		p.setRegister_time(df.format(new Date()));
		session.persist(p);
		logger.info("User saved successfully, User Details="+p);
	}

	@Override
	public void updateUser(User p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("用户更新成功！！！");
	}

	@Override
	public void updateUserphoto(String id,String photo_id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query=session.createQuery("update User set photo_id = '"+photo_id+"' where id = '"+id+"'");
		query.executeUpdate();
		logger.info("更新用户头像成功！！！"+photo_id+"和"+id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> listUsers() {
		Session session = this.sessionFactory.getCurrentSession();
		List<User> usersList = session.createQuery("from User").list();
		for(User p : usersList){
			logger.info("User List::"+p);
		}
		return usersList;
	}
	//根据name查询实体，返回唯一的实体类
	@Override
	public User getUserByName(String name) {
		Session session = this.sessionFactory.getCurrentSession();		
		Query query=session.createQuery("from User where name = '"+name+"'");
		User user=(User)query.uniqueResult();
		return user;
	}
	@Override
	public User getUserById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		User p = (User) session.load(User.class, new String(id));
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		p.setLast_login(df.format(new Date()));
		logger.info("User loaded successfully, User details="+p);
		return p;
	}

	@Override
	public void removeUser(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		User p = (User) session.load(User.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("User deleted successfully, User details="+p);
	}

}
