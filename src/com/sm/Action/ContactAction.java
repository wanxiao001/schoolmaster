package com.sm.Action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sm.domain.Comment;
import com.sm.domain.Contact;
import com.sm.service.ContactService;

@SuppressWarnings("serial")
public class ContactAction extends ActionSupport implements ModelDriven<Contact>{

	long usId;	
	public long getUsId() {
		return usId;
	}
	public void setUsId(long usId) {
		this.usId = usId;
	}
	long uuId;
	
	public long getUuId() {
		return uuId;
	}
	public void setUuId(long uuId) {
		this.uuId = uuId;
	}
	private ContactService contactService;
	public void setContactService(ContactService contactService) {
		this.contactService = contactService;
	}

	private Contact con = new Contact();
	@Override
	public Contact getModel() {
		// TODO Auto-generated method stub
		return con;
	}
	public String toContact() {
		ActionContext.getContext().put("usId", usId);
		return "toContact";
	}
	public String contact() {
		contactService.contact(con);
		return "contact_s";
	}

	public String find_myContact() {
		List<Contact> list = contactService.find(usId);
		ActionContext.getContext().getValueStack().push(list);
		ActionContext.getContext().put("usId", usId);
		System.out.println("find:"+usId);
		return "ok";
	}

	public String find_myyContact() {
		List<Contact> list = contactService.find2(uuId);
		ActionContext.getContext().getValueStack().push(list);
		ActionContext.getContext().put("uuId", uuId);
		return "ok";
	}
	public String delete() {
		ActionContext.getContext().put("usId", usId);
		contactService.delete(con.getId());
		System.out.println("delete:"+usId);
		return "delete";
	}

	public String look_contact() {
		con = contactService.lookContact(con.getId());
		ActionContext.getContext().put("con", con);
		return "look_contact";
	}
}
