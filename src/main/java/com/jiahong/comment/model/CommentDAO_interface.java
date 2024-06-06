package com.jiahong.comment.model;

import java.util.List;
import java.util.Set;

public interface CommentDAO_interface {
	      public void insert(CommentVO commentVO);
          public void update(CommentVO commentVO);
          public void delete(Integer commentId);
          public CommentVO findByPrimaryKey(Integer commentId);
	      public List<CommentVO> getAll();
	      //查詢某評價的產品ID
	      public Set<CommentVO> getCommentByCommentProductId(Integer commentProductId);
}
