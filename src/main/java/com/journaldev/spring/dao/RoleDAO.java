package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Role;

public interface RoleDAO {

	public void addRole(Role p);
	public void updateRole(Role p);
	public List<Role> listRoles();
	public Role getRoleById(String id);
	public void removeRole(String id);
	public List<Object[]> listRole_id_name();
}
