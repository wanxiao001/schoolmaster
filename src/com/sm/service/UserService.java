package com.sm.service;

import java.util.List;

import com.sm.domain.Comment;
import com.sm.domain.PageBean;
import com.sm.domain.User;

/**
 * 业务逻辑接口
 * @author ThinkPad
 *
 */
public interface UserService {
	/*登录*/
	public String login(User user);
	/*注册*/
	public String register(User user);
	/*分页查询*/
	public PageBean<User> findByPage(int nowPage);
	/*查看用户*/
	public User look(long id);
	/*删除用户*/
	public void delete(long id);
	/*根据用户名查找*/
	public List<User> findByName(String username);
	/*用户查看所有用户*/
	public List<User> uFindAll(long id);
	/*更新信息*/
	public void update(User user);
	/*根据skill查找*/
	public List<User> findBySkill(String skill);
	/*点赞*/
	public void ustar(long id);	
}
