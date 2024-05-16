package com.mike.game.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="game")
public class GameVO implements java.io.Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "game_id", insertable = true, updatable = false)
	private Integer gameId;
	@Column(name = "game_name", insertable = true, updatable = true, unique = true)
	private String gameName;
	@Column(name = "game_img", insertable = true, updatable = true)
	private String gameImg;
	
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
		
	@Override
	public String toString() {
		String outputStr = "Game: [";
		
		outputStr += "\r gameId="+ this.getGameId();
		outputStr += "\r gameName="+ this.getGameName();
		outputStr += "\r gameImg="+ this.getGameImg();
		outputStr += "]\r\r";
		
		return outputStr;
	}
}

