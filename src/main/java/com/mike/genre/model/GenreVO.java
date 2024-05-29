package com.mike.genre.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.mike.label.model.LabelVO;

@Entity
@Table(name = "genre")
public class GenreVO implements java.io.Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "genre_id", insertable = true, updatable = false)
	private Integer genreId;
	
	@Column(name = "genre_name", insertable = true, updatable = false, unique = true)
	private String genreName;
	
	@OneToMany(mappedBy = "genre", fetch=FetchType.EAGER)
	private List<LabelVO> labels;
	
	
	public GenreVO() {
		super();
	}
	
	public GenreVO(String genreName) {
		this.setGenreName(genreName);
	}

	public GenreVO(Integer genreId, String genreName) {
		this.genreId = genreId;
		this.genreName = genreName;
	}
	
	public Integer getGenreId() {
		return genreId;
	}
	
	public void setGenreId(Integer genreId) {
		this.genreId = genreId;
	}
	
	public String getGenreName() {
		return genreName;
	}
	
	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}
	
	public List<LabelVO> getLabels(){
		return labels;
	}
	
	public void setLabels(List<LabelVO> labels) {
		this.labels = labels;
	}
		
	@Override
	public String toString() {
		String outputStr = "Genre: [";
		
		outputStr += "\r genreId="+ this.getGenreId();
		outputStr += "\r genreName="+ this.getGenreName();
		outputStr += "]\r\r";
		
		return outputStr;
	}
}

