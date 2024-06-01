package com.mike.label.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.mike.game.model.GameVO;
import com.mike.genre.model.GenreVO;

@Entity
@Table(name = "label")
public class LabelVO implements java.io.Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "label_id", insertable = true, updatable = false)
	private Integer labelId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="label_genre_id",referencedColumnName="genre_id")
	private GenreVO genre;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="label_game_id", referencedColumnName="game_id")
	private GameVO game;
	
	public LabelVO() {
		super();
	}
	
	public Integer getLabelId() {
		return labelId;
	}
	public void setLabelId(Integer labelId) {
		this.labelId = labelId;
	}
	
	public GenreVO getGenre() {
		return genre;
	}
	public void setGenre(GenreVO genre) {
		this.genre = genre;
	}
	
	public GameVO getGame() {
		return game;
	}
	public void setGame(GameVO game) {
		this.game = game;
	}
	
	@Override
	public String toString() {
		String outputStr = "Label: [";
		
		outputStr += "\r labelId="+ this.getLabelId();
		outputStr += "\r labelGenreId="+ this.getGenre().getGenreName();
		outputStr += "\r labelGame="+ this.getGame().getGameName();
		outputStr += "]\r\r";
		
		return outputStr;
	}
}

