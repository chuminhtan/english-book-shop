package com.englishbookshop.dao;
import javax.persistence.EntityManager;

import com.englishbookshop.entity.Users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDAO extends JpaDAO<Users> implements IGenericDAO<Users> {
	
	public static final String USERS_FIND_ALL = "Users.findAll";
	public static final String USERS_COUNT = "Users.count";
	public static final String USERS_FIND_BY_EMAIL ="Users.findByEmail";
	
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
	
	public Users findByEmail(String email) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("email", email);
		List<Users> listUsers = super.findWithNamedQuery(USERS_FIND_BY_EMAIL, parameters);
		
		if (listUsers != null && listUsers.size() > 0) {
			return listUsers.get(0);
		}
		
		return null;
	}
}
