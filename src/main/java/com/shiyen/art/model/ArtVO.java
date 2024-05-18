package com.shiyen.art.model;

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

@Entity
@Table(name = "art")
public class ArtVO implements java.io.Serializable {
	@Id
	@Column(name ="art_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer artId;
	@Column(name ="art_title")
	private String artTitle;
	@Column(name ="art_content",columnDefinition = "mediumtext")
	private String artContent;
	@Column(name ="art_timestamp")
	private Timestamp artTimestamp;
	@Column(name ="art_reply")
	private Integer artReply;
	@Column(name ="art_favor")
	private Integer artFavor;
	@Column(name ="art_view")
	private Integer artView;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "art_user_id", referencedColumnName = "user_id")
	private UserVO userVO;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "art_game_id", referencedColumnName = "game_id")
	private GameVO gameVO;
	
	
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public GameVO getGameVO() {
		return gameVO;
	}
	public void setGameVO(GameVO gameVO) {
		this.gameVO = gameVO;
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
	@Override
	public String toString() {
		return "ArtVO [artId=" + artId + ", artTitle=" + artTitle + ", artContent=" + artContent + ", artTimestamp="
				+ artTimestamp + ", artReply=" + artReply + ", artFavor=" + artFavor + ", artView=" + artView
				+" ]";
	}
	
	
}
