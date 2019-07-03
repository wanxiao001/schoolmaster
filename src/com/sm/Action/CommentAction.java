package com.sm.Action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sm.domain.Comment;
import com.sm.service.CommentService;

@SuppressWarnings("serial")
public class CommentAction extends ActionSupport implements ModelDriven<Comment>{

	long uId;	
	public long getuId() {
		return uId;
	}
	public void setuId(long uId) {
		this.uId = uId;
	}

	private CommentService commentService;
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	
	private Comment com = new Comment();
	@Override
	public Comment getModel() {
		// TODO Auto-generated method stub
		return com;
	}

	public String findComment() {
		List<Comment> list = commentService.findComment(uId);
		ActionContext.getContext().getValueStack().push(list);
		ActionContext.getContext().put("uId", uId);
		System.out.println("find:"+uId);
		return "findComment";
	}

	public String writeComment1() {
		ActionContext.getContext().put("uId", uId);
		System.out.println("write:"+uId);
		return "writeComment1";
	}
	public String writeComment() {
		commentService.save(com);
		return "writeComment";
	}
	
}
