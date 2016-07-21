package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Files;
import com.journaldev.spring.model.Strain;

public interface FileDAO {

	public void addFile(Files p);
	public void updateFile(Files p);
	public List<Files> listFiles();
	public List<Files> paginationFiles(int startResult, int maxResult);
	public Files getFileById(String id);
	public void removeFile(String id);
}
