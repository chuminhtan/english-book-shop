package com.englishbookshop.service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.dao.UserDAO;
import com.englishbookshop.helper.PersistenceProjectHelper;

public class BaseServices {
	protected EntityManager entityManager;
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	
	protected BaseServices(EntityManager entityManager, HttpServletRequest request, HttpServletResponse response) {
		this.entityManager = entityManager;
		this.request = request;
		this.response = response;
	}
}
