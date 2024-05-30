package com.mike.game.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;

import com.mike.label.model.LabelVO;

@Entity
@Table(name="game")
public class GameVO implements java.io.Serializable{
	
	@Id
	@Generated(value = GenerationTime.INSERT)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "game_id")
	private Integer gameId;
	
	@Column(name = "game_name", insertable = true, updatable = true, unique = true)
	private String gameName;
	
	@Column(name = "game_img", insertable = true, updatable = true)
	private String gameImg;
	
	@Column(name = "game_created_timestamp")
	private Timestamp gameCreatedTimestamp;
	
	@OneToMany(mappedBy = "game", fetch=FetchType.EAGER)
	private List<LabelVO> labels;
	
	
	public GameVO() {
		super();
	}
	public GameVO(String gameName) {
		this.gameName = gameName;
	}
	public GameVO(Integer gameId, String gameName, String gameImg) {
		this.gameId = gameId;
		this.gameName = gameName;
		this.gameImg = gameImg;
	}
	
	public Integer getGameId() {
		return gameId;
	}
	
	public void setGameId(Integer gameId) {
		this.gameId = gameId;
	}
	
	public String getGameName() {
		return gameName;
	}
	
	public void setGameName(String gameName) {
		this.gameName = gameName;
	}
	
	public String getGameImg() {
		return gameImg;
	}
	
	public void setGameImg(String gameImg) {
		this.gameImg = gameImg;
	}
	
	public Timestamp getGameCreatedTimestamp() {
		return gameCreatedTimestamp;
	}
	
	public void setGameCreatedTimestamp(Timestamp gameCreatedTimestamp) {
		this.gameCreatedTimestamp = gameCreatedTimestamp;
	}
	
	public List<LabelVO> getLabels(){
		return labels;
	}
	
	public void setLabels(List<LabelVO> labels) {
		this.labels = labels;
	}
		
	@Override
	public String toString() {
		String outputStr = "Game: [";
		
		outputStr += "\r gameId="+ this.getGameId();
		outputStr += "\r gameName="+ this.getGameName();
		outputStr += "\r gameImg="+ this.getGameImg();
		outputStr += "\r gameCreatedTimestamp="+ this.getGameCreatedTimestamp();
		outputStr += "]\r\r";
		
		return outputStr;
	}
}

