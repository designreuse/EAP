package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Collection;

public interface CollectionDAO {

	public void addCollection(Collection p);
	public void updateCollection(Collection p);
	public List<Collection> listCollections();
	public List<Collection> paginationCollections(int startResult, int maxResult);
	public Collection getCollectionById(String id);
	public void removeCollection(String id);
	public List<Collection> mycollection(String user_id, String classification);
	public List<Collection> anybodycollection(String classification);
}
