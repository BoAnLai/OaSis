package com.jiahong.comment.model;

import java.sql.Timestamp;

public class CommentVO  implements java.io.Serializable{
	    private int commentId;
	    private int commentProductId;
	    private String commentText;
	    private String commentImg;
	    private Timestamp commentTimestamp;
	    private String commentRateStars;

	    public int getCommentId() {
	        return commentId;
	    }

	    public void setCommentId(int commentId) {
	        this.commentId = commentId;
	    }

	    public int getCommentProductId() {
	        return commentProductId;
	    }

	    public void setCommentProductId(int commentProductId) {
	        this.commentProductId = commentProductId;
	    }

	    public String getCommentText() {
	        return commentText;
	    }

	    public void setCommentText(String commentText) {
	        this.commentText = commentText;
	    }

	    public String getCommentImg() {
	        return commentImg;
	    }

	    public void setCommentImg(String commentImg) {
	        this.commentImg = commentImg;
	    }

	    public Timestamp getCommentTimestamp() {
	        return commentTimestamp;
	    }

	    public void setCommentTimestamp(Timestamp commentTimestamp) {
	        this.commentTimestamp = commentTimestamp;
	    }

	    public String getCommentRateStars() {
	        return commentRateStars;
	    }

	    public void setCommentRateStars(String commentRateStars) {
	        this.commentRateStars = commentRateStars;
	    }

	    @Override
	    public String toString() {
	        return "Comment{" +
	                "commentId=" + commentId +
	                ", commentProductId='" + commentProductId + '\'' +
	                ", commentText='" + commentText + '\'' +
	                ", commentImg='" + commentImg + '\'' +
	                ", commentTimestamp=" + commentTimestamp +
	                ", commentRateStars='" + commentRateStars + '\'' +
	                '}';
	    }
	
}
