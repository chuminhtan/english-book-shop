package com.englishbookshop.service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.dao.UserDAO;
import com.englishbookshop.helper.PersistenceProjectInfo;

public class BaseServices {
	protected EntityManagerFactory entityManagerFactory;
	protected EntityManager entityManager;
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	

	protected BaseServices(HttpServletRequest request, HttpServletResponse response) {
		entityManagerFactory = Persistence.createEntityManagerFactory(PersistenceProjectInfo.PERSISTENCE_UNIT_NAME);
		entityManager = entityManagerFactory.createEntityManager();
		this.request = request;
		this.response = response;
	}
}
