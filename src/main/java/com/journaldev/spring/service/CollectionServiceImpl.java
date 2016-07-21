package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.CollectionDAO;
import com.journaldev.spring.model.Collection;

@Service
public class CollectionServiceImpl implements CollectionService {
	
	private CollectionDAO collectionDAO;

	public void setCollectionDAO(CollectionDAO collectionDAO) {
		this.collectionDAO = collectionDAO;
	}

	@Override
	@Transactional
	public void addCollection(Collection p) {
		this.collectionDAO.addCollection(p);
	}

	@Override
	@Transactional
	public void updateCollection(Collection p) {
		this.collectionDAO.updateCollection(p);
	}

	@Override
	@Transactional
	public List<Collection> listCollections() {
		return this.collectionDAO.listCollections();
	}

	@Override
	@Transactional
	public List<Collection> paginationCollections(int startResult, int maxResult) {
		return this.collectionDAO.paginationCollections(startResult, maxResult);
	}

	@Override
	@Transactional
	public List<Collection> mycollection(String user_id, String classification) {
		return this.collectionDAO.mycollection(user_id, classification);
	}

	@Override
	@Transactional
	public List<Collection> anybodycollection(String classification) {
		return this.collectionDAO.anybodycollection(classification);
	}
	
	@Override
	@Transactional
	public Collection getCollectionById(String id) {
		return this.collectionDAO.getCollectionById(id);
	}

	@Override
	@Transactional
	public void removeCollection(String id) {
		this.collectionDAO.removeCollection(id);
	}

}
