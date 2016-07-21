package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Announcement;

public interface AnnouncementService {

	public void addAnnouncement(Announcement p);
	public void updateAnnouncement(Announcement p);
	public List<Announcement> listAnnouncements(int startResult, int maxResult);
	public List<Announcement> paginationAnnouncements();
	public List<Announcement> listAllAnnouncements();
	public List<Announcement> listAllRecords();
	public Announcement getAnnouncementById(String id);
	public void removeAnnouncement(String id);
	public List<Announcement> listLaws(int startResult, int maxResult);
	public List<Announcement> listStipulatings(int startResult, int maxResult);
	public List<Announcement> listTrainings(int startResult, int maxResult);
	public List<Announcement> listPopularizations(int startResult, int maxResult);
	public List<Announcement> listAllLaws();
	public List<Announcement> listAllTrainings();
	public List<Announcement> paginationTrainings();
}
