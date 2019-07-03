package com.sm.service;

import java.util.List;

import com.sm.domain.Contact;

public interface ContactService {

	public void contact(Contact con);

	public List<Contact> find(long usId);

	public List<Contact> find2(long uuId);

	public void delete(long id);

	public Contact lookContact(long id);

}
