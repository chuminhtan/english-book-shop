package com.englishbookshop.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.Query;

public class JpaDAO<E> {
	protected EntityManager entityManager;

	public JpaDAO(EntityManager entityManager) {
		super();
		this.entityManager = entityManager;
	}

	public E create(E entity) {
		entityManager.getTransaction().begin();

		entityManager.persist(entity);
		entityManager.flush();
		entityManager.refresh(entity);

		entityManager.getTransaction().commit();

		return entity;
	}

	public E update(E entity) {
		entityManager.getTransaction().begin();

		entity = entityManager.merge(entity);

		entityManager.getTransaction().commit();

		return entity;
	}

	public E find(Class<E> type, Object id) {
		E entity = entityManager.find(type, id);

		if (entity != null) {
			entityManager.refresh(entity);
		}

		return entity;
	}

	public void delete(Class<E> type, Object id) {
		entityManager.getTransaction().begin();

		Object reference = entityManager.getReference(type, id);
		System.out.println("REFERENCE: " + reference);
		entityManager.remove(reference);

		entityManager.getTransaction().commit();
	}

	public List<E> findWithNamedQuery(String queryName) {

		Query query = entityManager.createNamedQuery(queryName);
		List<E> list = query.getResultList();

		return list;
	}

	public List<E> findWithNamedQuery(String queryName, Map<String, Object> parameters) {
		Query query = entityManager.createNamedQuery(queryName);

		for (Map.Entry<String, Object> entry : parameters.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		
		return query.getResultList();
	}

	public long countWithNamedQuery(String queryNamed) {
		Query query = entityManager.createNamedQuery(queryNamed);
		return (long) query.getSingleResult();
	}

}
