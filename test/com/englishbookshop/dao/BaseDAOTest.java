package com.englishbookshop.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.englishbookshop.helper.PersistenceProjectInfo;

public class BaseDAOTest {
	protected static EntityManagerFactory entityManagerFactor;
	protected static EntityManager entityManager;
	
	protected static void setUpBeforeClass() throws Exception {
		entityManagerFactor = Persistence.createEntityManagerFactory(PersistenceProjectInfo.PERSISTENCE_UNIT_NAME);
		entityManager = entityManagerFactor.createEntityManager();
	}
	
	public static void tearDownAfterClass() throws Exception {
		entityManager.close();
		entityManagerFactor.close();
	}
}
