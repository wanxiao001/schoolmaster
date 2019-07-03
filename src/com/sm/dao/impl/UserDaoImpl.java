package com.sm.dao.impl;

import java.util.Date;
import java.util.List;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import com.sm.dao.UserDao;
import com.sm.domain.Comment;
import com.sm.domain.User;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao{
	
	@Override
	public String login(User user) {
		String hql="from User where userName=?0 and passWord=?1";
		List<?>list = this.getHibernateTemplate().find(hql, user.getUserName(),user.getPassWord());
		if(!list.isEmpty()) {
			return "success";
		}else {
			return "error";
		}
	}
	@Override
	public String register(User user) {
		Date date = new Date();
        user.setCreatTime(new java.sql.Date(date.getTime()));
		this.getHibernateTemplate().save(user);
		return "success";
	}
	@Override
	public int findCount() {
		String hql = "select count(*) from User";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if(list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	@Override
	public List<User> findByPage(int begin, int pageSize){
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		List<User> list= (List<User>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageSize);
		return list;
	}
	@Override
	public User look(long id) {
		User user = this.getHibernateTemplate().get(User.class, id);
		return user;
	}
	@Override
	public void delete(long id) {
		User user = this.getHibernateTemplate().get(User.class, id);
		this.getHibernateTemplate().delete(user);
	}
	@Override
	public List<User> findByName(String username) {
		String hql="from User where userName like ?0";
		List<User> list = (List<User>)this.getHibernateTemplate().find(hql, "%"+username+"%");
		System.out.println(list.isEmpty());
		return list;
	}
	@Override
	public List<User> LogfindByName(String username) {
		String hql="from User where userName = ?0";
		List<User> list = (List<User>)this.getHibernateTemplate().find(hql, username);
		return list;
	}
	@Override
	public List<User> uFindAll(long id) {
		String hql="from User where master = true and id != ?0";
		List<User> list = (List<User>)this.getHibernateTemplate().find(hql,id);
		return list;
	}
	@Override
	public void update(User user) {
		this.getHibernateTemplate().update(user);
	}
	@Override
	public List<User> findBySkill(String skill) {
		String hql="from User where master = true and skill like ?0";
		List<User> list = (List<User>)this.getHibernateTemplate().find(hql,"%"+skill+"%");
		return list;
	}
	@Override
	public void ustar(long id) {
		User user = this.getHibernateTemplate().get(User.class, id);
		user.setStar(user.getStar()+1);
		this.getHibernateTemplate().update(user);
	}
}
