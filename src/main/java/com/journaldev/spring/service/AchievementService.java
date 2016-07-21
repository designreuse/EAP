package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Achievement;

public interface AchievementService {

	public void addAchievement(Achievement p);
	public void updateAchievement(Achievement p);
	public List<Achievement> listAchievements();
	public Achievement getAchievementById(String id);
	public void removeAchievement(String id);
	
}
