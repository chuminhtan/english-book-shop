package com.englishbookshop.entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.englishbookshop.entity.Users;

public class UsersTest {
	public static void main(String[] args) {
		Users user1 = new Users();
		user1.setFullName("Nimbus123456");
		user1.setEmail("nimbus124356f@robotic.com");
		user1.setPassword("helloworld");
		

		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("TheEnglishBookShop");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		entityManager.getTransaction().begin();
		entityManager.persist(user1);	 
		entityManager.getTransaction().commit();
	
		entityManager.close();
		entityManagerFactory.close();
		
		System.out.println("The user1 was persisted!");
	}
}
