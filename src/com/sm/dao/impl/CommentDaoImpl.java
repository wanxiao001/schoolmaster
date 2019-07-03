package com.sm.dao.impl;

import java.util.Date;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.sm.dao.CommentDao;
import com.sm.domain.Comment;

public class CommentDaoImpl extends HibernateDaoSupport implements CommentDao{
	@Override
	public List<Comment> findComment(long id) {
		String hql="from Comment where userId = ?0";
		List<Comment> list = (List<Comment>)this.getHibernateTemplate().find(hql,id);
		return list;
	}
	@Override
	public void save(Comment com) {
		Date date = new Date();//���ϵͳʱ��.
        com.setCommentTime(new java.sql.Date(date.getTime()));
        this.getHibernateTemplate().save(com);		
	}
}
