package com.englishbookshop.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.englishbookshop.helper.PersistenceProjectHelper;

public class BaseDAOTest {
	protected static EntityManagerFactory entityManagerFactor;
	protected static EntityManager entityManager;
	
	protected static void setUpBeforeClass() throws Exception {
		entityManagerFactor = Persistence.createEntityManagerFactory(PersistenceProjectHelper.PERSISTENCE_UNIT_NAME);
		entityManager = entityManagerFactor.createEntityManager();
	}
	
	public static void tearDownAfterClass() throws Exception {
		entityManager.close();
		entityManagerFactor.close();
	}
}
