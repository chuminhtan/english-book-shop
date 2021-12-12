package com.englishbookshop.service;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.englishbookshop.dao.UserDAO;
import com.englishbookshop.entity.Users;
import com.englishbookshop.helper.PersistenceProjectInfo;

import java.util.List;

import javax.persistence.EntityManager;

public class UserServices {
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private UserDAO userDAO;
	
	public UserServices() {
		entityManagerFactory = Persistence.createEntityManagerFactory(PersistenceProjectInfo.PERSISTENCE_UNIT_NAME);
		entityManager = entityManagerFactory.createEntityManager();
		userDAO = new UserDAO(entityManager);
	}
	
	public List<Users> listAll(){
		return userDAO.listAll();
	}

}
