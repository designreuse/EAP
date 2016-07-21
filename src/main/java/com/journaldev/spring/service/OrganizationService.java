package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Organization;

public interface OrganizationService {

	public void addOrganization(Organization o);
	public void updateOrganization(Organization o);
	public List<Organization> listOrganizations();
	public Organization getOrganizationById(String id);
	public void removeOrganization(String id);
	
}
