package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.RoleDAO;
import com.journaldev.spring.model.Role;

@Service
public class RoleServiceImpl implements RoleService {
	
	private RoleDAO roleDAO;

	public void setRoleDAO(RoleDAO roleDAO) {
		this.roleDAO = roleDAO;
	}


	//返回所有角色的id和name
	@Override
	@Transactional
	public List<Object[]> listRole_id_name() {
		return this.roleDAO.listRole_id_name();
	}
	
	@Override
	@Transactional
	public void addRole(Role o) {
		this.roleDAO.addRole(o);
	}

	@Override
	@Transactional
	public void updateRole(Role o) {
		this.roleDAO.updateRole(o);
	}

	@Override
	@Transactional
	public List<Role> listRoles() {
		return this.roleDAO.listRoles();
	}

	@Override
	@Transactional
	public Role getRoleById(String id) {
		return this.roleDAO.getRoleById(id);
	}

	@Override
	@Transactional
	public void removeRole(String id) {
		this.roleDAO.removeRole(id);
	}

}
