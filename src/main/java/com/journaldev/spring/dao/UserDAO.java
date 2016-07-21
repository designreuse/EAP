package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.User;

public interface UserDAO {

	public void addUser(User p);
	public void updateUser(User p);
	public List<User> listUsers();
	public User getUserById(String id);
	public void removeUser(String id);
	public void updateUserphoto(String id, String photo_id);
	//根据name查询实体，返回唯一的实体类
	public User getUserByName(String name);
}
