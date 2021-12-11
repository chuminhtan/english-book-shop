package com.englishbookshop.dao;
import javax.persistence.EntityManager;

import com.englishbookshop.entity.Users;

import java.util.List;

public class UserDAO extends JpaDAO<Users> implements IGenericDAO<Users> {
	
	public UserDAO(EntityManager entityManager) {
		super(entityManager);
	}
	
	@Override
	public Users create(Users user) {
		return super.create(user);
	}
	
	@Override
	public Users update(Users user) {
		return super.update(user);
	}
	
	@Override
	public Users get(Object obj) {
		//TODO get
		return null;
	}
	
	@Override
	public void delete(Object obj) {
		//TODO delete
	}
	
	@Override
	public List<Users> listAll(){
		//TODO listAll
		return null;
	}
	
	@Override
	public long count() {
		//TODO count
		return 0;
	}
}
