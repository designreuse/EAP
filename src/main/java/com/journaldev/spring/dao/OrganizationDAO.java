package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Organization;

public interface OrganizationDAO {

	public void addOrganization(Organization p);
	public void updateOrganization(Organization p);
	public List<Organization> listOrganizations();
	public Organization getOrganizationById(String id);
	public void removeOrganization(String id);
}
