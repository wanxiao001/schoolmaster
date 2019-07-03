package com.sm.dao;

import java.util.List;

import com.sm.domain.Comment;
import com.sm.domain.User;

/**
 * DAO
 * @author ThinkPad
 *
 */
public interface UserDao {
	public String login(User user);
	public String register(User user);
	public int findCount();
	public List<User> findByPage(int begin, int pageSize);
	public User look(long id);
	public void delete(long id);
	public List<User> findByName(String username);
	public List<User> LogfindByName(String username);
	public List<User> uFindAll(long id);
	public void update(User user);
	public List<User> findBySkill(String skill);
	public void ustar(long id);
}
