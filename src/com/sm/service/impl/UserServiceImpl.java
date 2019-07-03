package com.sm.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.sm.dao.UserDao;
import com.sm.domain.Comment;
import com.sm.domain.PageBean;
import com.sm.domain.User;
import com.sm.service.UserService;

/**
 * 业务逻辑层
 * @author ThinkPad
 *
 */
@Transactional
public class UserServiceImpl implements UserService{
	
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	@Override
	public String login(User user) {
		if(userDao.login(user).equals("success")) {
			return "success";
		}else {
			return "error";
		}
	}

	public String register(User user) {
		System.out.println("user...");
		if(userDao.LogfindByName(user.getUserName()).isEmpty() == false) {
			System.out.println(user.getUserName());
			return "error";
		}
		System.out.println(user.getPassWord());
		userDao.register(user).equals("success");
		return "success";
	}
	
	public PageBean<User> findByPage(int nowPage){
		PageBean<User> pageBean = new PageBean<User>();
		pageBean.setNowPage(nowPage);
		int pageSize = 12;
		pageBean.setPageSize(pageSize);
		int totalCount = userDao.findCount();
		pageBean.setTotalCount(totalCount);
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		int begin = (nowPage - 1) * pageSize;
		List<User> list = userDao.findByPage(begin, pageSize);
		pageBean.setList(list);
		return pageBean;
	}
	public User look(long id){
		return userDao.look(id);
	}

	@Override
	public void delete(long id) {
		userDao.delete(id);	
	}

	@Override
	public List<User> findByName(String username) {
		return userDao.findByName(username);
	}

	@Override
	public List<User> uFindAll(long id) {
		return userDao.uFindAll(id);
	}

	@Override
	public void update(User user) {
		userDao.update(user);
	}

	@Override
	public List<User> findBySkill(String skill) {
		return userDao.findBySkill(skill);
	}

	@Override
	public void ustar(long id) {
		userDao.ustar(id);
	}
}
