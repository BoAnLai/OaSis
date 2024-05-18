package com.jiahong.comment.model;

import java.util.List;
import java.util.Set;

public class CommentService {

	private CommentDAO_interface dao;

	public CommentService() {
		dao = new CommentJDBCDAO();
	}

	public void insert(CommentVO commentVO) {
		dao.insert(commentVO);
	}

	public void update(CommentVO commentVO) {
		dao.update(commentVO);
	};

	public void delete(Integer commentno) {
		dao.delete(commentno);
	}

	public CommentVO getOneComment(Integer commentno) {
		return dao.findByPrimaryKey(commentno);
	}
	
	public List<CommentVO> getAll() {
		return dao.getAll();
	}

	public Set<CommentVO> getCommentByCommentProductId(Integer commentProductId) {
		return dao.getCommentByCommentProductId(commentProductId);
	};
}
