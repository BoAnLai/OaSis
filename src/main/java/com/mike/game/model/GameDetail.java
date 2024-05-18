package com.mike.game.model;

public class GameDetail extends GameVO{
	
	private String[] gameGenreName;

	public GameDetail(GameVO gameVO) {
		this.setGameId(gameVO.getGameId());
		this.setGameName(gameVO.getGameName());
		this.setGameImg(gameVO.getGameImg());
		this.setGameCreatedTimestamp(gameVO.getGameCreatedTimestamp());
	}
	
	public String[] getGameGenreName() {
		return gameGenreName;
	}

	public void setGameGenreName(String[] gameGenreName) {
		this.gameGenreName = gameGenreName;
	}
	
	@Override
	public String toString() {
		String outputStr = "GameDetail: [";
		
		outputStr += "\r gameId: "+ this.getGameId();
		outputStr += "\r gameName: "+ this.getGameName();
		outputStr += "\r gameImg: "+ this.getGameImg();
		outputStr += "\r gameCreatedTimestamp: "+ this.getGameCreatedTimestamp();
		
		outputStr += "\r gameGenreName: [";
		for(String genre:gameGenreName) {
			outputStr += "\r\t"+ genre;			
		}
		outputStr += "\r ]";
		
		outputStr += "]\r\r";
		
		return outputStr;
	}
}