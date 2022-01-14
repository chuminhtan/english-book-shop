package com.englishbookshop.dao;
import javax.persistence.EntityManager;

import org.mindrot.jbcrypt.BCrypt;

import com.englishbookshop.entity.Users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDAO extends JpaDAO<Users> implements IGenericDAO<Users> {
	
	public static final String USERS_FIND_ALL = "Users.findAll";
	public static final String USERS_COUNT = "Users.count";
	public static final String USERS_FIND_BY_EMAIL ="Users.findByEmail";
	public static final String USERS_CHECK_LOGIN ="Users.checkLogin";
	public static final String USERS_UPDATE_NO_PASSWORD = "Users.doNotUpdatePassword";
	
	public UserDAO() {
	}
	
	@Override
	public Users create(Users user) {
		String hashPass = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12));
		user.setPassword(hashPass);
		return super.create(user);
	}
	
	@Override
	public Users update(Users user) {
		String hashedPass = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12));
		user.setPassword(hashedPass);
		System.out.println("======= Hashed Pass: " + hashedPass);
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
	
	public boolean checkLogin(String email, String password) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("email", email);
		
		List<Users> listUsers = super.findWithNamedQuery(USERS_FIND_BY_EMAIL, parameters);
		
		if (listUsers.size() != 1) {
			return false;
		}
		
		Users user = listUsers.get(0);
		String hashPass = user.getPassword();
		boolean isCorrect = BCrypt.checkpw(password, hashPass);

		if (isCorrect) {
			return true;
		}
		
		return false;		
	}
	
	public int updateNoPassword(Users user) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("email", user.getEmail());
		parameters.put("fullName", user.getFullName());
		parameters.put("userId", user.getUserId());	
		return super.updateWithNamedQuery(USERS_UPDATE_NO_PASSWORD, parameters);
	}
}
