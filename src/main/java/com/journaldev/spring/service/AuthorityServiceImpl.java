package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.AuthorityDAO;
import com.journaldev.spring.model.User;
import com.journaldev.spring.model.Authority;

@Service
public class AuthorityServiceImpl implements AuthorityService {
	
	private AuthorityDAO authorityDAO;

	public void setAuthorityDAO(AuthorityDAO authorityDAO) {
		this.authorityDAO = authorityDAO;
	}

	//根据name查询实体，返回唯一的实体类
	@Override
	@Transactional
	public Authority getAuthorityByUser_id(String name) {
		return this.authorityDAO.getAuthorityByUser_id(name);
	}
	
	@Override
	@Transactional
	public void addAuthority(Authority p) {
		this.authorityDAO.addAuthority(p);
	}

	@Override
	@Transactional
	public void updateAuthority(Authority p) {
		this.authorityDAO.updateAuthority(p);
	}

	@Override
	@Transactional
	public List<Authority> listAuthoritys() {
		return this.authorityDAO.listAuthoritys();
	}

	@Override
	@Transactional
	public Authority getAuthorityById(String id) {
		return this.authorityDAO.getAuthorityById(id);
	}

	@Override
	@Transactional
	public void removeAuthority(String id) {
		this.authorityDAO.removeAuthority(id);
	}

}
