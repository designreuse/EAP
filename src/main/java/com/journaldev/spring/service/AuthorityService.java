package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Authority;

public interface AuthorityService {

	public void addAuthority(Authority p);
	public void updateAuthority(Authority p);
	public List<Authority> listAuthoritys();
	public Authority getAuthorityById(String id);
	public void removeAuthority(String id);
	//根据user_id查询实体，返回唯一的实体类
	public Authority getAuthorityByUser_id(String user_id);	
}
