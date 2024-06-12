package com.shiyen.art.model;

import java.sql.Timestamp;
import java.util.List;

import com.shiyen.message.model.MessageDTO;

public class GameDTO {
	private Integer gameId;
	private String gameName;
    private String gameImg;
    private Long artCounts;
    
    public GameDTO() {
		
	}
    public GameDTO(int gameId, String gameName, String gameImg, Long artCounts) {
    	this.gameId = gameId;
        this.gameName = gameName;
        this.gameImg= gameImg;
        this.artCounts = artCounts;
        
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
	public Long getArtCounts() {
		return artCounts;
	}
	public void setArtCounts(Long artCounts) {
		this.artCounts = artCounts;
	}
    
}
