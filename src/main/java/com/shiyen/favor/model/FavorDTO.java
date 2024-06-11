package com.shiyen.favor.model;

import java.sql.Timestamp;
import java.util.List;

import com.shiyen.message.model.MessageDTO;

public class FavorDTO {
	private Integer artId;
	private String artTitle;
	private Timestamp favorTimestamp;

	 public FavorDTO() {
			
		}
	 public FavorDTO(Integer artId, String artTitle,Timestamp favorTimestamp) {
	        this.artId = artId;
	        this.artTitle = artTitle;
	        this.favorTimestamp =favorTimestamp;
	    }
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
	public Timestamp getFavorTimestamp() {
		return favorTimestamp;
	}
	public void setFavorTimestamp(Timestamp favorTimestamp) {
		this.favorTimestamp = favorTimestamp;
	}
	 
}
