package com.shiyen.art.model;

import java.sql.Timestamp;

public class ArtVO implements java.io.Serializable {
	private Integer artId;
	private String artTitle;
	private String artContent;
	private Timestamp artTimestamp;
	private Integer artReply;
	private Integer artFavor;
	private Integer artView;
	
	public Integer getArtId() {
		return artId;
	}
	public void setArtId(Integer artId) {
		this.artId = artId;
	}
	
	public String getArtTitle() {
		return artTitle;
	}
	public void setArtTitle(String artTitle) {
		this.artTitle = artTitle;
	}
	public String getArtContent() {
		return artContent;
	}
	public void setArtContent(String artContent) {
		this.artContent = artContent;
	}
	public Timestamp getArtTimestamp() {
		return artTimestamp;
	}
	public void setArtTimestamp(Timestamp artTimestamp) {
		this.artTimestamp = artTimestamp;
	}
	public Integer getArtReply() {
		return artReply;
	}
	public void setArtReply(Integer artReply) {
		this.artReply = artReply;
	}
	public Integer getArtFavor() {
		return artFavor;
	}
	public void setArtFavor(Integer artFavor) {
		this.artFavor = artFavor;
	}
	public Integer getArtView() {
		return artView;
	}
	public void setArtView(Integer artView) {
		this.artView = artView;
	}
	
	
}
