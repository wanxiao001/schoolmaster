package com.sm.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.sm.dao.ContactDao;
import com.sm.domain.Contact;
import com.sm.service.ContactService;

@Transactional
public class ContactServiceImpl implements ContactService{

	private ContactDao contactDao;
	public void setContactDao(ContactDao contactDao) {
		this.contactDao = contactDao;
	}

	@Override
	public void contact(Contact con) {
		// TODO Auto-generated method stub
		contactDao.contact(con);
	}

	@Override
	public List<Contact> find(long usId) {
		// TODO Auto-generated method stub
		return contactDao.find(usId);
	}

	@Override
	public List<Contact> find2(long uuId) {
		// TODO Auto-generated method stub
		return contactDao.find2(uuId);
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		contactDao.delete(id);
	}

	@Override
	public Contact lookContact(long id) {
		// TODO Auto-generated method stub
		return contactDao.lookContact(id);
	}
	
}
