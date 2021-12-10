import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.englishbookshop.entity.Users;

public class UsersTest {
	public static void main(String[] args) {
		Users user1 = new Users();
		user1.setFullName("Nimbus12345");
		user1.setEmail("nimbus12435@robotic.com");
		user1.setPassword("helloworld");
		
		// create EntityManagerFactory
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("TheEnglishBookShop");
		// create EntityManager
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		// begin Transaction
		entityManager.getTransaction().begin();
	
		// persist entity
		entityManager.persist(user1);
		
		// commit Transaction	 
		entityManager.getTransaction().commit();
		
		// close EntityManager
		entityManager.close();
		
		// close EntityManagerFactory
		entityManagerFactory.close();
		
		System.out.println("The user1 is persisted!");
	}
}
