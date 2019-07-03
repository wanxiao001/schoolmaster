package com.sm.dao;

import java.util.List;

import com.sm.domain.Comment;

public interface CommentDao {
	public List<Comment> findComment(long id);
	public void save(Comment com);
}
