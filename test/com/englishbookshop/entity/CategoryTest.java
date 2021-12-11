package com.englishbookshop.entity;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class CategoryTest {

	public static void main(String[] args) {
		Category category1 = new Category("Complete IELTS 4-5");
		
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("TheEnglishBookShop");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		entityManager.getTransaction().begin();
		entityManager.persist(category1);	 
		entityManager.getTransaction().commit();
	
		entityManager.close();
		entityManagerFactory.close();
		
		System.out.println("The category1 was persisted!");
	}
}
