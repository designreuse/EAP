package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.UserDAO;
import com.journaldev.spring.model.User;

@Service
public class UserServiceImpl implements UserService {
	
	private UserDAO userDAO;

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	@Transactional
	public void addUser(User p) {
		this.userDAO.addUser(p);
	}

	@Override
	@Transactional
	public void updateUser(User p) {
		this.userDAO.updateUser(p);
	}

	@Override
	@Transactional
	public List<User> listUsers() {
		return this.userDAO.listUsers();
	}

	@Override
	@Transactional
	public User getUserById(String id) {
		return this.userDAO.getUserById(id);
	}
	//根据name查询实体，返回唯一的实体类
	@Override
	@Transactional
	public User getUserByName(String name) {
		return this.userDAO.getUserByName(name);
	}
	
	@Override
	@Transactional
	public void updateUserphoto(String id, String photo_id) {
		this.userDAO.updateUserphoto(id,photo_id);
	}

	@Override
	@Transactional
	public void removeUser(String id) {
		this.userDAO.removeUser(id);
	}

}
