package com.mike.label.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "label")
public class LabelVO implements java.io.Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "label_id", insertable = true, updatable = false)
	private Integer labelId;
	@Column(name = "label_genre_id", insertable = true, updatable = false, nullable = false)
	private Integer labelGenreId;
	@Column(name = "label_game_id", insertable = true, updatable = false, nullable = false)
	private Integer labelGameId;
	
	public LabelVO() {
		super();
	}
	public LabelVO(Integer labelId, Integer labelGenreId, Integer labelGameId) {
		this.labelId = labelId;
		this.labelGenreId = labelGenreId;
		this.labelGameId = labelGameId;
	}
	
	public Integer getLabelId() {
		return labelId;
	}
	public void setLabelId(Integer labelId) {
		this.labelId = labelId;
	}
	public Integer getLabelGenreId() {
		return labelGenreId;
	}
	public void setLabelGenreId(Integer labelGenreId) {
		this.labelGenreId = labelGenreId;
	}
	public Integer getLabelGameId() {
		return labelGameId;
	}
	public void setLabelGameId(Integer labelGameId) {
		this.labelGameId = labelGameId;
	}
	
	@Override
	public String toString() {
		String outputStr = "Label: [";
		
		outputStr += "\r labelId="+ this.getLabelId();
		outputStr += "\r labelGenreId="+ this.getLabelGenreId();
		outputStr += "\r labelGame="+ this.getLabelGameId();
		outputStr += "]\r\r";
		
		return outputStr;
	}
}

