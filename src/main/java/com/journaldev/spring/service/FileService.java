package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Files;
import com.journaldev.spring.model.Strain;

public interface FileService {

	public void addFile(Files o);
	public void updateFile(Files o);
	public List<Files> listFiles();
	public List<Files> paginationFiles(int startResult, int maxResult);
	public Files getFileById(String id);
	public void removeFile(String id);
	
}
