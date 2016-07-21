package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Experimental_animal;

@Repository
public class Experimental_animalDAOImpl implements Experimental_animalDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(Experimental_animalDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addExperimental_animal(Experimental_animal p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Experimental_animal saved successfully, Experimental_animal Details="+p);
	}

	@Override
	public void updateExperimental_animal(Experimental_animal p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Experimental_animal updated successfully, Experimental_animal Details="+p);
	}



	//实验动物table_count
	@SuppressWarnings("unchecked")
	@Override
	public long countExperimental_animal_Table(String search) {
		Session session = this.sessionFactory.getCurrentSession();
//		Query query=session.createQuery("select count(*) from Experimental_animal as ea where ea.name like ? "+
//				"or ea.strain_id.name like ? "+
//				"or ea.strain_id.species_id.name like ? "+
//				"or ea.dna_name like ? "+
//				"or ea.time like ?")
//				.setParameter(0, "%"+search+"%")
//				.setParameter(1, "%"+search+"%")
//				.setParameter(2, "%"+search+"%")
//				.setParameter(3, "%"+search+"%")
//				.setParameter(4, "%"+search+"%");
		Query query=session.createQuery("select count(*) from Experimental_animal as ea where ea.name like '%"+search+"%' "+
				"or ea.strain_id.name like '%"+search+"%' "+
				"or ea.strain_id.species_id.name like '%"+search+"%' "+
				"or ea.dna_name like '%"+search+"%' "+
				"or ea.time like '%"+search+"%'");

		long count=(long)query.uniqueResult();
		return count;
	}
	//实验动物table
	@SuppressWarnings("unchecked")
	@Override
	public List<Experimental_animal> Experimental_animals_Table(int startResult, int maxResult,String search,String sort,String order) {
//		Query query = this.sessionFactory.getCurrentSession().createQuery("from Experimental_animal as ea where ea.name like ? "+
//				"or ea.strain_id.name like ? "+
//				"or ea.strain_id.species_id.name like ? "+
//				"or ea.dna_name like ? "+
//				"or ea.time like ? "+
//				"order by ? ,?")
//				.setParameter(0, "%"+search+"%")
//				.setParameter(1, "%"+search+"%")
//				.setParameter(2, "%"+search+"%")
//				.setParameter(3, "%"+search+"%")
//				.setParameter(4, "ea."+sort)
//				.setParameter(5, order);

		Query query = this.sessionFactory.getCurrentSession().createQuery("from Experimental_animal as ea where ea.name like '%"+search+"%' "+
				"or ea.strain_id.name like '%"+search+"%' "+
				"or ea.strain_id.species_id.name like '%"+search+"%' "+
				"or ea.dna_name like '%"+search+"%' "+
				"or ea.time like '%"+search+"%' "+
				"order by ea."+sort+" "+order);
		query.setFirstResult(startResult)
				.setMaxResults(maxResult);
		return query.list();
	}

	//实验动物列表
	@SuppressWarnings("unchecked")
	@Override
	public List<Experimental_animal> listExperimental_animals() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Experimental_animal> experimental_animalsList = session.createQuery("from Experimental_animal").list();
//		for(Experimental_animal p : experimental_animalsList){
//			logger.info("Experimental_animal List");
//		}
		return experimental_animalsList;
	}
	//实验动物数量
	@SuppressWarnings("unchecked")
	@Override
	public long countExperimental_animal() {
		Session session = this.sessionFactory.getCurrentSession();
		Query query=session.createQuery("select count(*) from Experimental_animal");
		long count=(long)query.uniqueResult();
		return count;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Experimental_animal> paginationExperimental_animals(int startResult, int maxResult) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Experimental_animal");     
        query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Experimental_animal> count_experimental_animal() {
		String hql="SELECT COUNT(id) from Experimental_animal group by strain_id";		
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);    
		return query.list();  
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> experimental_animal_strain() {	
		String hql="SELECT strain_id.name from Experimental_animal group by strain_id";	
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);    
		return query.list();  
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Experimental_animal> paginationExperimental_animals_admin(int startResult, int maxResult,String org_id) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Experimental_animal ea where ea.issuer_id.organization.id='"+org_id+"'");    
		query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Experimental_animal> numberExperimental_animals_admin(String org_id) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Experimental_animal ea where ea.issuer_id.organization.id='"+org_id+"'");   
  
        return query.list();  
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Experimental_animal> selectExperimental_animals(int startResult, int maxResult,String name_info,String species_info,String strain_info,String dna_info,String phenotype_info) {
		String hql="from Experimental_animal ea where ea.name like ?";				
		if(species_info.length() > 0)
		{
			hql=hql+" and ea.strain_id.species_id.name like ?";
		}
		if(strain_info.length() > 0)
		{
			hql=hql+" and ea.strain_id.name like ?";
		}
		if(dna_info.length() > 0)
		{
			hql=hql+" and ea.dna_name like ?";
		}
		if(phenotype_info.length() > 0)
		{
			hql=hql+" and ea.phenotype like ?";
		}
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);     
		query.setString(0,"%"+name_info+"%");		
		int j=1;		
		if(species_info.length() > 0)
		{
			query.setString(j,"%"+species_info+"%");
			j=j+1;
		}
		if(strain_info.length() > 0)
		{
			query.setString(j,"%"+strain_info+"%");
			j=j+1;
		}
		if(dna_info.length() > 0)
		{
			query.setString(j,"%"+dna_info+"%");
			j=j+1;
		}
		if(phenotype_info.length() > 0)
		{
			query.setString(j,"%"+phenotype_info+"%"); 	
			j=j+1;
		}
		query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}	
	
	@SuppressWarnings("unchecked")
	@Override
	public int Number_selectExperimental_animals(String name_info,String species_info,String strain_info,String dna_info,String phenotype_info) {
		String hql="from Experimental_animal ea where ea.name like ?";
		int i=0;
		if(species_info.length() > 0)
		{
			hql=hql+" and ea.strain_id.species_id.name like ?";
			i=i+1;
		}
		if(strain_info.length() > 0)
		{
			hql=hql+" and ea.strain_id.name like ?";
			i=i+1;
		}
		if(dna_info.length() > 0)
		{
			hql=hql+" and ea.dna_name like ?";
			i=i+1;
		}
		if(phenotype_info.length() > 0)
		{
			hql=hql+" and ea.phenotype like ?";
			i=i+1;
		}
		System.out.println(hql);
		System.out.println("-==============================-");
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);     
		query.setString(0,"%"+name_info+"%");		
		int j=1;
		
			if(species_info.length() > 0)
			{
				query.setString(j,"%"+species_info+"%");
				j=j+1;
			}
			if(strain_info.length() > 0)
			{
				query.setString(j,"%"+strain_info+"%");
				j=j+1;
			}
			if(dna_info.length() > 0)
			{
				query.setString(j,"%"+dna_info+"%");
				j=j+1;
			}
			if(phenotype_info.length() > 0)
			{
				query.setString(j,"%"+phenotype_info+"%"); 	
				j=j+1;
			}
		
        return query.list().size();  
	}	

	@SuppressWarnings("unchecked")
	@Override
	public List<Experimental_animal> selectExperimental_animals_admin(int startResult, int maxResult,String name_info,String species_info,String strain_info,String dna_info,String phenotype_info,String org_id) {
		String hql="from Experimental_animal ea where ea.issuer_id.organization.id='"+org_id+"' and ea.name like ?";				
		if(species_info.length() > 0)
		{
			hql=hql+" and ea.strain_id.species_id.name like ?";
		}
		if(strain_info.length() > 0)
		{
			hql=hql+" and ea.strain_id.name like ?";
		}
		if(dna_info.length() > 0)
		{
			hql=hql+" and ea.dna_name like ?";
		}
		if(phenotype_info.length() > 0)
		{
			hql=hql+" and ea.phenotype like ?";
		}
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);     
		query.setString(0,"%"+name_info+"%");		
		int j=1;		
		if(species_info.length() > 0)
		{
			query.setString(j,"%"+species_info+"%");
			j=j+1;
		}
		if(strain_info.length() > 0)
		{
			query.setString(j,"%"+strain_info+"%");
			j=j+1;
		}
		if(dna_info.length() > 0)
		{
			query.setString(j,"%"+dna_info+"%");
			j=j+1;
		}
		if(phenotype_info.length() > 0)
		{
			query.setString(j,"%"+phenotype_info+"%"); 	
			j=j+1;
		}
		query.setFirstResult(startResult)  
             .setMaxResults(maxResult);     
        return query.list();  
	}	
	
	@SuppressWarnings("unchecked")
	@Override
	public int Number_selectExperimental_animals_admin(String name_info,String species_info,String strain_info,String dna_info,String phenotype_info,String org_id) {
		String hql="from Experimental_animal ea where ea.issuer_id.organization.id='"+org_id+"' and ea.name like ?";
		int i=0;
		if(species_info.length() > 0)
		{
			hql=hql+" and ea.strain_id.species_id.name like ?";
			i=i+1;
		}
		if(strain_info.length() > 0)
		{
			hql=hql+" and ea.strain_id.name like ?";
			i=i+1;
		}
		if(dna_info.length() > 0)
		{
			hql=hql+" and ea.dna_name like ?";
			i=i+1;
		}
		if(phenotype_info.length() > 0)
		{
			hql=hql+" and ea.phenotype like ?";
			i=i+1;
		}
		System.out.println(hql);
		System.out.println("-==============================-");
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);     
		query.setString(0,"%"+name_info+"%");		
		int j=1;
		
			if(species_info.length() > 0)
			{
				query.setString(j,"%"+species_info+"%");
				j=j+1;
			}
			if(strain_info.length() > 0)
			{
				query.setString(j,"%"+strain_info+"%");
				j=j+1;
			}
			if(dna_info.length() > 0)
			{
				query.setString(j,"%"+dna_info+"%");
				j=j+1;
			}
			if(phenotype_info.length() > 0)
			{
				query.setString(j,"%"+phenotype_info+"%"); 	
				j=j+1;
			}
		
        return query.list().size();  
	}	
	@Override
	public Experimental_animal getExperimental_animalById(String id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Experimental_animal p = (Experimental_animal) session.load(Experimental_animal.class, new String(id));
		logger.info("Experimental_animal loaded successfully, Experimental_animal details="+p);
		return p;
	}
	
	@Override
	public void removeExperimental_animal(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Experimental_animal p = (Experimental_animal) session.load(Experimental_animal.class, new String(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Experimental_animal deleted successfully, Experimental_animal details="+p);
	}

}
