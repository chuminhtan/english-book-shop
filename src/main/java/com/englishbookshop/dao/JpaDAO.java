package com.englishbookshop.dao;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import com.englishbookshop.helper.PersistenceProjectHelper;

public class JpaDAO<E> {
	private static EntityManagerFactory entityManagerFactory;
	protected EntityManager entityManager;

	static {
		entityManagerFactory = Persistence.createEntityManagerFactory(PersistenceProjectHelper.PERSISTENCE_UNIT_NAME);
	}

	public JpaDAO() {
	}

	public E create(E entity) {
		entityManager = entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();

		entityManager.persist(entity);
		entityManager.flush();
		entityManager.refresh(entity);

		entityManager.getTransaction().commit();
		entityManager.close();
		return entity;
	}

	public E update(E entity) {
		entityManager = entityManagerFactory.createEntityManager();

		entityManager.getTransaction().begin();
		entity = entityManager.merge(entity);
		entityManager.getTransaction().commit();

		entityManager.close();

		return entity;
	}

	public E find(Class<E> type, Object id) {
		entityManager = entityManagerFactory.createEntityManager();

		E entity = entityManager.find(type, id);

		if (entity != null) {
			entityManager.refresh(entity);
		}
		entityManager.close();

		return entity;
	}

	public void delete(Class<E> type, Object id) {
		entityManager = entityManagerFactory.createEntityManager();

		entityManager.getTransaction().begin();

		Object reference = entityManager.getReference(type, id);
		System.out.println("REFERENCE: " + reference);
		entityManager.remove(reference);

		entityManager.getTransaction().commit();
		entityManager.close();
	}

	@SuppressWarnings("unchecked")
	public List<E> findWithNamedQuery(String queryName) {
		entityManager = entityManagerFactory.createEntityManager();

		Query query = entityManager.createNamedQuery(queryName);
		List<E> list = query.getResultList();
		entityManager.close();

		return list;
	}

	@SuppressWarnings("unchecked")
	public List<E> findWithNamedQuery(String queryName, int startPosition, int maxResult) {
		entityManager = entityManagerFactory.createEntityManager();

		Query query = entityManager.createNamedQuery(queryName);
		query.setFirstResult(startPosition);
		query.setMaxResults(maxResult);

		List<E> list = query.getResultList();
		entityManager.close();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<E> findWithNamedQuery(String queryName, Map<String, Object> parameters) {
		entityManager = entityManagerFactory.createEntityManager();

		Query query = entityManager.createNamedQuery(queryName);

		for (Map.Entry<String, Object> entry : parameters.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}

		List<E> result = query.getResultList();
		entityManager.close();

		return result;
	}

	public long countWithNamedQuery(String queryNamed) {
		entityManager = entityManagerFactory.createEntityManager();

		Query query = entityManager.createNamedQuery(queryNamed);
		long result = (long) query.getSingleResult();

		entityManager.close();
		return result;
	}
	
	public long countWithNamedQuery(String queryNamed, Map<String, Object> parameters) {
		entityManager = entityManagerFactory.createEntityManager();
		
		Query query = entityManager.createNamedQuery(queryNamed);
		
		for (Map.Entry<String, Object> entry : parameters.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		
		long result = (long) query.getSingleResult();
		entityManager.close();
		
		return result;
	}

	
	public int updateWithNamedQuery(String queryName, Map<String, Object> parameters) {
		entityManager = entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();

		Query query = entityManager.createNamedQuery(queryName);

		for (Map.Entry<String, Object> entry : parameters.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}

		int numUpdated = query.executeUpdate();
		entityManager.getTransaction().commit();
		entityManager.close();
		
		return numUpdated;
	}

	public void close() {
		if (entityManagerFactory != null) {
			entityManagerFactory.close();
		}
	}

}
