package com.englishbookshop.dao;

import java.util.List;

public interface IGenericDAO<E> {
	E create(E t);
	
	E update(E t);
	
	E get(Object obj);
	
	void delete(Object obj);
	
	List<E> listAll();
	
	long count();
}
