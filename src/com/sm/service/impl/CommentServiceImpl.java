package com.sm.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.sm.dao.CommentDao;
import com.sm.domain.Comment;
import com.sm.service.CommentService;

@Transactional
public class CommentServiceImpl implements CommentService{
	
	private CommentDao commentDao;

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
	
	@Override
	public List<Comment> findComment(long id) {
		return commentDao.findComment(id);
	}
	@Override
	public void save(Comment com) {
		commentDao.save(com);	
	}

}
