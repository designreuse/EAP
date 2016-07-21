package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Role;

public interface RoleService {

	public void addRole(Role o);
	public void updateRole(Role o);
	public List<Role> listRoles();
	public Role getRoleById(String id);
	public void removeRole(String id);
	public List<Object[]> listRole_id_name();
}
