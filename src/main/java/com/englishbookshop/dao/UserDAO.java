package com.englishbookshop.dao;
import javax.persistence.EntityManager;

import com.englishbookshop.entity.Users;

import java.util.List;

public class UserDAO extends JpaDAO<Users> implements IGenericDAO<Users> {
	
	public static final String USERS_FIND_ALL = "Users.findAll";
	public static final String USERS_COUNT = "Users.count";
	
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
	public Users get(Object userId) {
		
		return super.find(Users.class, userId);
	}
	
	@Override
	public void delete(Object userId) {
		super.delete(Users.class, userId);
	}
	
	@Override
	public List<Users> listAll(){
		return super.findWithNamedQuery(USERS_FIND_ALL);
	}
	
	@Override
	public long count() {
		return super.countWithNamedQuery(USERS_COUNT);
	}
}
