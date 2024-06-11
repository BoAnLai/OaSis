package com.shiyen.favor.model;

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
@Table(name = "favor")
public class FavorVO implements java.io.Serializable {
	@Id
	@Column(name ="favor_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer favorId;
	
//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "favor_user_id", referencedColumnName = "user_id")
//	private UserVO userVO ;
	@Column(name ="favor_user_id")
	private Integer favorUserId;
	
	@Column(name ="favor_art_id")
	private Integer favorArtId;
	
	@Column(name ="favor_timestamp")
	private Timestamp favorTimestamp ;
	
	@Column(name ="favor_status")
	private Integer favorStatus ;

	public Integer getFavorId() {
		return favorId;
	}

	public void setFavorId(Integer favorId) {
		this.favorId = favorId;
	}

//	public UserVO getUserVO() {
//		return userVO;
//	}
//
//	public void setUserVO(UserVO userVO) {
//		this.userVO = userVO;
//	}

	

	public Timestamp getFavorTimestamp() {
		return favorTimestamp;
	}

	public Integer getFavorArtId() {
		return favorArtId;
	}

	public void setFavorArtId(Integer favorArtId) {
		this.favorArtId = favorArtId;
	}

	public void setFavorTimestamp(Timestamp favorTimestamp) {
		this.favorTimestamp = favorTimestamp;
	}

	public Integer getFavorUserId() {
		return favorUserId;
	}

	public void setFavorUserId(Integer favorUserId) {
		this.favorUserId = favorUserId;
	}

	public Integer getFavorStatus() {
		return favorStatus;
	}

	public void setFavorStatus(Integer favorStatus) {
		this.favorStatus = favorStatus;
	}
	
	
	
}
