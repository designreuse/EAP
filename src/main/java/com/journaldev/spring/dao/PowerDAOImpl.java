package com.journaldev.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Power;

@Repository
public class PowerDAOImpl implements PowerDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(PowerDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	//返回所有的power
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> listPower_ztree() {
		Session session = this.sessionFactory.getCurrentSession();		
		String hsql="select id,pid,name from Power";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hsql);
		List<Object[]> splist=query.list();
		HashMap<String,String> power_list=new HashMap<String,String>();		
		return splist;
	}
	

	//删除某个role的所有power	
	@Override
	public void removeRole_power(String id) {
		Session session = this.sessionFactory.getCurrentSession();
			String sql="DELETE FROM u_role_power WHERE role = '"+id+"'";
			session.createSQLQuery(sql).executeUpdate();
	}

	//给某个role添加一个power	
	@Override
	public void updateRole_power(String id,String role_id,int power_id) {
		Session session = this.sessionFactory.getCurrentSession();
			String sql="INSERT INTO u_role_power (id,role,power) VALUES ('"+id+"','"+role_id+"',"+power_id+")";
			session.createSQLQuery(sql).executeUpdate();
	}
	
	//返回某个role的power
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> listRole_power(String role_id) {
		Session session = this.sessionFactory.getCurrentSession();		
		String hsql="select id,name from Power where pid = '"+role_id+"'";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hsql);
		List<Object[]> list=query.list();
		HashMap<String,String> role_power_list=new HashMap<String,String>();		
		return list;
	}

	@Override
	public void addPower(Power o) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(o);
		logger.info("Power saved successfully, Power Details="+o);
	}

	@Override
	public void updatePower(Power o) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(o);
		logger.info("Power updated successfully, Power Details="+o);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Power> listPowers() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Power> powersList = session.createQuery("from Power").list();
		for(Power o : powersList){
			logger.info("Power List::"+o);
		}
		return powersList;
	}

	@Override
	public Power getPowerById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Power power = (Power) session.load(Power.class, id);
		logger.info("Power loaded successfully, Power details="+power);
		return power;
	}
	
	@Override
	public void removePower(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Power power = (Power) session.load(Power.class, id);
		if(null != power){
			session.delete(power);
		}
		logger.info("Power deleted successfully, power details="+power);
	}

}
