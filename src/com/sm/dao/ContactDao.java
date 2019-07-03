package com.sm.dao;

import java.util.List;

import com.sm.domain.Contact;

public interface ContactDao {

	public void contact(Contact con);

	public List<Contact> find(long usId);

	public List<Contact> find2(long uuId);

	public void delete(long id);

	public Contact lookContact(long id);

}
