package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.AchievementDAO;
import com.journaldev.spring.model.Achievement;

@Service
public class AchievementServiceImpl implements AchievementService {
	
	private AchievementDAO achievementDAO;

	public void setAchievementDAO(AchievementDAO achievementDAO) {
		this.achievementDAO = achievementDAO;
	}

	@Override
	@Transactional
	public void addAchievement(Achievement p) {
		this.achievementDAO.addAchievement(p);
	}

	@Override
	@Transactional
	public void updateAchievement(Achievement p) {
		this.achievementDAO.updateAchievement(p);
	}

	@Override
	@Transactional
	public List<Achievement> listAchievements() {
		return this.achievementDAO.listAchievements();
	}

	@Override
	@Transactional
	public Achievement getAchievementById(String id) {
		return this.achievementDAO.getAchievementById(id);
	}

	@Override
	@Transactional
	public void removeAchievement(String id) {
		this.achievementDAO.removeAchievement(id);
	}

}
