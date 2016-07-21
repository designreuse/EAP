package com.journaldev.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Equipment;

@Repository
public class EquipmentDAOImpl implements EquipmentDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(EquipmentDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addEquipment(Equipment p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Equipment saved successfully, Equipment Details="+p);
	}

	@Override
	public void updateEquipment(Equipment p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Equipment updated successfully, Equipment Details="+p);
	}
	//特色设备列表
	@SuppressWarnings("unchecked")
	@Override
	public List<Equipment> listCharacteristic_equipments() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Equipment> characteristic_equipmentsList = session.createQuery("from Equipment where classification = 'characteristic'").list();
		for(Equipment p : characteristic_equipmentsList){
			logger.info("Equipment List::"+p);
		}
		return characteristic_equipmentsList;
	}
	//特色设备数量
	@SuppressWarnings("unchecked")
	@Override
	public long countCharacteristic_equipments() {
		Session session = this.sessionFactory.getCurrentSession();
		Query query=session.createQuery("select count(*) from Equipment where classification = 'characteristic'");
		long count=(long) query.uniqueResult();
		return count;
	}
	//常规设备列表
	@SuppressWarnings("unchecked")
	@Override
	public List<Equipment> listCommon_equipments() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Equipment> common_equipmentsList = session.createQuery("from Equipment where classification = 'common'").list();
		for(Equipment p : common_equipmentsList){
			logger.info("Equipment List::"+p);
		}
		return common_equipmentsList;
	}
	//常规设备数量
	@SuppressWarnings("unchecked")
	@Override
	public long countCommon_equipments() {
		Session session = this.sessionFactory.getCurrentSession();
		Query query=session.createQuery("select count(*) from Equipment where classification = 'common'");
		long count=(long)query.uniqueResult();
		return count;
	}
	
	//返回所有设备的id和name
		@SuppressWarnings("unchecked")
		@Override
		public List<Object[]> listEquipment_id_name() {
			Session session = this.sessionFactory.getCurrentSession();		
			String hsql="select id,name from Equipment order by time desc";
			Query query = this.sessionFactory.getCurrentSession().createQuery(hsql);
			List<Object[]> splist=query.list();
			HashMap<String,String> equipment_list=new HashMap<String,String>();		
			for(Object[] s:splist){
				System.out.println(s[0]);
				System.out.println(s[1]);
			}
			return splist;
		}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Equipment> listEquipments() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Equipment> equipmentsList = session.createQuery("from Equipment").list();
		for(Equipment p : equipmentsList){
			logger.info("Equipment List::"+p);
		}
		return equipmentsList;
	}

	@Override
	public Equipment getEquipmentById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Equipment p = (Equipment) session.load(Equipment.class, new String(id));
		logger.info("Equipment loaded successfully, Equipment details="+p);
		return p;
	}
	
	@Override
	public void removeEquipment(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Equipment p = (Equipment) session.load(Equipment.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Equipment deleted successfully, Equipment details="+p);
	}

}
