package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.FileDAO;
import com.journaldev.spring.model.Files;
import com.journaldev.spring.model.Strain;

@Service
public class FileServiceImpl implements FileService {
	
	private FileDAO fileDAO;

	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}

	@Override
	@Transactional
	public void addFile(Files o) {
		this.fileDAO.addFile(o);
	}

	@Override
	@Transactional
	public void updateFile(Files o) {
		this.fileDAO.updateFile(o);
	}

	@Override
	@Transactional
	public List<Files> listFiles() {
		return this.fileDAO.listFiles();
	}

	@Override
	@Transactional
	public List<Files> paginationFiles(int startResult, int maxResult) {
		return this.fileDAO.paginationFiles(startResult, maxResult);
	}
	
	@Override
	@Transactional
	public Files getFileById(String id) {
		return this.fileDAO.getFileById(id);
	}

	@Override
	@Transactional
	public void removeFile(String id) {
		this.fileDAO.removeFile(id);
	}

}
