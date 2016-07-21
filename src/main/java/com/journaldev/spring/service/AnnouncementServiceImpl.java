package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.AnnouncementDAO;
import com.journaldev.spring.model.Announcement;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {
	
	private AnnouncementDAO announcementDAO;

	public void setAnnouncementDAO(AnnouncementDAO announcementDAO) {
		this.announcementDAO = announcementDAO;
	}

	@Override
	@Transactional
	public void addAnnouncement(Announcement p) {
		this.announcementDAO.addAnnouncement(p);
	}

	@Override
	@Transactional
	public void updateAnnouncement(Announcement p) {
		this.announcementDAO.updateAnnouncement(p);
	}

	@Override
	@Transactional
	public List<Announcement> listAnnouncements(int startResult, int maxResult) {
		return this.announcementDAO.listAnnouncements(startResult, maxResult);
	}
	//新架构使用-------------------获取前15条公告数据查询----------------------------
	@Override
	@Transactional
	public List<Announcement> paginationAnnouncements() {
		return this.announcementDAO.paginationAnnouncements();
	}
	//新架构使用-------------------获取前6条教育培训数据查询----------------------------
	@Override
	@Transactional
	public List<Announcement> paginationTrainings() {
		return this.announcementDAO.paginationTrainings();
	}
	//新架构使用
	@Override
	@Transactional
	public List<Announcement> listAllAnnouncements() {
		return this.announcementDAO.listAllAnnouncements();
	}
	//新架构使用
	@Override
	@Transactional
	public List<Announcement> listAllTrainings() {
		return this.announcementDAO.listAllTrainings();
	}
	//新架构使用
	@Override
	@Transactional
	public List<Announcement> listAllLaws() {
		return this.announcementDAO.listAllLaws();
	}
	
	@Override
	@Transactional
	public List<Announcement> listAllRecords() {
		return this.announcementDAO.listAllRecords();
	}
	
	@Override
	@Transactional
	public List<Announcement> listLaws(int startResult, int maxResult) {
		return this.announcementDAO.listLaws(startResult, maxResult);
	}
	
	@Override
	@Transactional
	public List<Announcement> listStipulatings(int startResult, int maxResult) {
		return this.announcementDAO.listStipulatings(startResult, maxResult);
	}
	@Override
	@Transactional
	public List<Announcement> listTrainings(int startResult, int maxResult) {
		return this.announcementDAO.listTrainings(startResult, maxResult);
	}
	
	@Override
	@Transactional
	public List<Announcement> listPopularizations(int startResult, int maxResult) {
		return this.announcementDAO.listPopularizations(startResult, maxResult);
	}
	
	@Override
	@Transactional
	public Announcement getAnnouncementById(String id) {
		return this.announcementDAO.getAnnouncementById(id);
	}

	@Override
	@Transactional
	public void removeAnnouncement(String id) {
		this.announcementDAO.removeAnnouncement(id);
	}
	


}
