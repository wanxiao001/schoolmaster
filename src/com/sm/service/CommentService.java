package com.sm.service;

import java.util.List;

import com.sm.domain.Comment;

public interface CommentService {
	public List<Comment> findComment(long id);
	public void save(Comment com);
}
