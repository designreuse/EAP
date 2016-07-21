package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.OrganizationDAO;
import com.journaldev.spring.model.Organization;

@Service
public class OrganizationServiceImpl implements OrganizationService {
	
	private OrganizationDAO organizationDAO;

	public void setOrganizationDAO(OrganizationDAO organizationDAO) {
		this.organizationDAO = organizationDAO;
	}

	@Override
	@Transactional
	public void addOrganization(Organization o) {
		this.organizationDAO.addOrganization(o);
	}

	@Override
	@Transactional
	public void updateOrganization(Organization o) {
		this.organizationDAO.updateOrganization(o);
	}

	@Override
	@Transactional
	public List<Organization> listOrganizations() {
		return this.organizationDAO.listOrganizations();
	}

	@Override
	@Transactional
	public Organization getOrganizationById(String id) {
		return this.organizationDAO.getOrganizationById(id);
	}

	@Override
	@Transactional
	public void removeOrganization(String id) {
		this.organizationDAO.removeOrganization(id);
	}

}
