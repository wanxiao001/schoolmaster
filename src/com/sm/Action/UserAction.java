package com.sm.Action;

import com.sm.domain.PageBean;
import com.sm.domain.User;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sm.service.UserService;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("serial")
public class UserAction extends ActionSupport implements SessionAware, ModelDriven<User>{
	
	int nowPage;
	private String passWord2;
	
	public String getPassWord2() {
		return passWord2;
	}

	public void setPassWord2(String passWord2) {
		this.passWord2 = passWord2;
	}
	long id;
	private Map<String,Object> sessionScope;
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.sessionScope=arg0;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	String fskill;
	public String getFskill() {
		return fskill;
	}

	public void setFskill(String fskill) {
		this.fskill = fskill;
	}
	String username;
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	private User user = new User();
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/*
	 * 登录方法
	 * */
	public String login() {
		if(userService.login(user).equals("success")) {
			List<User> list = userService.findByName(user.getUserName());
			User newUser = list.get(0);
			sessionScope.put("user", newUser);
			sessionScope.put("nowPage", nowPage);
			if(newUser.isAdmin()) {
				return "admin";
			}else {
				return "user";
			}
		}else {
			this.addActionError("用户名或密码错误！");
			return "input";
		}
	}

	/*
	 * 注册方法
	 * */
	public String register(){
		if(userService.register(user).equals("success")) {
			return "register";
		} else {
			this.addActionError("用户名已存在！");
			return "noregister";
		}
	}
	
	/*退出*/
	public String logout() {
		sessionScope.remove("user");
		sessionScope.clear();
		return "logout";
	}
	
	/*登录成功后显示所有用户*/
	public String findAll() {
		if(sessionScope.get("nowPage") == null) setNowPage(1);
		PageBean<User> pageBean = userService.findByPage(nowPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findAll";
	}
	/*查看用户*/
	public String look() {
		user = userService.look(user.getId());
		ActionContext.getContext().put("user", user);
		return "look";
	}
	/*删除用户*/
	public String delete() {
		userService.delete(user.getId());
		return "delete";
	}
	/*根据用户名查找*/
	public String findByName() {
		List<User> list = userService.findByName(username);
		ActionContext.getContext().getValueStack().push(list);
		return "findByName";
	}
	/*用户查看所有*/
	public String userFindAll() {
		User u=(User) sessionScope.get("user");
		List<User> list = userService.uFindAll(u.getId());
		ActionContext.getContext().getValueStack().push(list);
		return "userFindAll";
	}
	/*用户查看其他用户信息*/
	public String ulook() {
		user = userService.look(user.getId());
		ActionContext.getContext().put("user", user);
		return "ulook";
	}
	/*用户查看自己信息*/
	public String self() {
		user = userService.look(user.getId());
		ActionContext.getContext().put("user", user);
		return "self";
	}
	/*用户更新信息*/
	public String update() {
		userService.update(user);
		return "update";
	}
	/*根据skill查找*/
	public String findBySkill() {
		List<User> list = userService.findBySkill(fskill);
		ActionContext.getContext().getValueStack().push(list);
		return "findBySkill";
	}
	/*点赞*/	
	public String ustar() {
		userService.ustar(user.getId());
		return "ustar";
	}
}
