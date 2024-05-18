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
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "favor_user_id", referencedColumnName = "user_id")
	private UserVO userVO ;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "favor_art_id", referencedColumnName = "art_id")
	private ArtVO artVO ;
	
	@Column(name ="favor_timestamp")
	private Timestamp favorTimestamp ;

	public Integer getFavorId() {
		return favorId;
	}

	public void setFavorId(Integer favorId) {
		this.favorId = favorId;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	public ArtVO getArtVO() {
		return artVO;
	}

	public void setArtVO(ArtVO artVO) {
		this.artVO = artVO;
	}

	public Timestamp getFavorTimestamp() {
		return favorTimestamp;
	}

	public void setFavorTimestamp(Timestamp favorTimestamp) {
		this.favorTimestamp = favorTimestamp;
	}
	
	
	
}
