package com.englishbookshop.dao;

import java.util.List;

public interface IGenericDAO<T> {
	T create(T t);
	
	T update(T t);
	
	T get(Object obj);
	
	void delete(Object obj);
	
	List<T> listAll();
	
	long count();
}
