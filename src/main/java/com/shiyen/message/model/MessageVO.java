package com.shiyen.message.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.mike.user.model.UserVO;
import com.shiyen.art.model.ArtVO;
@Entity
@Table(name = "message")
public class MessageVO implements java.io.Serializable {
	
	@Id
	@Column(name ="message_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer messageId;
	
//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "message_user_id", referencedColumnName = "user_id")
//	private UserVO userVO ;
	@Column(name ="message_user_id")
	private Integer messageUserId;
	
//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "message_art_id", referencedColumnName = "art_id")
//	private ArtVO artVO ;
	@Column(name ="message_art_id")
	private Integer messageArtId;
	
	@Column(name ="message_content",columnDefinition = "mediumtext")
	private String messageContent;
	
	@Column(name ="message_timestamp")
	private Timestamp messageTimestamp;

	public Integer getMessageId() {
		return messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

//	public UserVO getUserVO() {
//		return userVO;
//	}
//
//	public void setUserVO(UserVO userVO) {
//		this.userVO = userVO;
//	}
	
//	public ArtVO getArtVO() {
//		return artVO;
//	}

	public Integer getMessageUserId() {
		return messageUserId;
	}

	public void setMessageUserId(Integer messageUserId) {
		this.messageUserId = messageUserId;
	}

//	public void setArtVO(ArtVO artVO) {
//		this.artVO = artVO;
//	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public Timestamp getMessageTimestamp() {
		return messageTimestamp;
	}

	public void setMessageTimestamp(Timestamp messageTimestamp) {
		this.messageTimestamp = messageTimestamp;
	}

	public Integer getMessageArtId() {
		return messageArtId;
	}

	public void setMessageArtId(Integer messageArtId) {
		this.messageArtId = messageArtId;
	}
	
	
	
}
