package com.shiyen.art.model;

import java.sql.Timestamp;
import java.util.List;

import com.shiyen.message.model.MessageDTO;

public class ArtReplyDTO {
	private Integer artId;
	private String artContent;
	private Timestamp artTimestamp;
	private String userNickname;
	private List<MessageDTO> messageDTO;
	
	public ArtReplyDTO() {
		
	}
	
	public ArtReplyDTO(Integer artId,String artContent,Timestamp artTimestamp,String userNickname,List<MessageDTO> messageDTO) {
		this.artId= artId;
		this.artContent =artContent;
		this.artTimestamp =artTimestamp;
		this.userNickname = userNickname;
		this.messageDTO =  messageDTO;
	}

	public Integer getArtId() {
		return artId;
	}

	public void setArtId(Integer artId) {
		this.artId = artId;
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

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public List<MessageDTO> getMessageDTO() {
		return messageDTO;
	}

	public void setMessageDTO(List<MessageDTO> messageDTO) {
		this.messageDTO = messageDTO;
	}
	
	
}
