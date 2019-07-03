package com.sm.dao.impl;

import java.util.Date;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.sm.dao.ContactDao;
import com.sm.domain.Contact;

public class ContactDaoImpl extends HibernateDaoSupport implements ContactDao{

	@Override
	public void contact(Contact con) {
		// TODO Auto-generated method stub
		Date date = new Date();
        con.setContactTime(new java.sql.Date(date.getTime()));
		this.getHibernateTemplate().save(con);
	}
	@Override
	public List<Contact> find(long usId) {
		// TODO Auto-generated method stub
		String hql="from Contact where userId = ?0";
		List<Contact> list = (List<Contact>)this.getHibernateTemplate().find(hql,usId);
		return list;
	}
	@Override
	public List<Contact> find2(long uuId) {
		// TODO Auto-generated method stub
		String hql="from Contact where uuerId = ?0";
		List<Contact> list = (List<Contact>)this.getHibernateTemplate().find(hql,uuId);
		return list;
	}
	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		Contact con = this.getHibernateTemplate().get(Contact.class, id);
		this.getHibernateTemplate().delete(con);
	}
	@Override
	public Contact lookContact(long id) {
		// TODO Auto-generated method stub
		 Contact con= this.getHibernateTemplate().get(Contact.class,id);
		return con;
	}

}
