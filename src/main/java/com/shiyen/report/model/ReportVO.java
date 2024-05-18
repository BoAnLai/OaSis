package com.shiyen.report.model;

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
@Table(name = "report")
public class ReportVO implements java.io.Serializable {
	@Id
	@Column(name ="report_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer reportId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "report_user_id", referencedColumnName = "user_id")
	private UserVO userVO ;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "report_art_id", referencedColumnName = "art_id")
	private ArtVO artVO ;
	
	@Column(name ="report_issue")
	private String reportIssue;
	
	@Column(name ="report_timestamp")
	private Timestamp reportTimestamp;
	
	@Column(name ="report_result")
	private boolean reportresult;
	
	@Column(name ="report_reply")
	private String reportReply;

	public Integer getReportId() {
		return reportId;
	}

	public void setReportId(Integer reportId) {
		this.reportId = reportId;
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

	public String getReportIssue() {
		return reportIssue;
	}

	public void setReportIssue(String reportIssue) {
		this.reportIssue = reportIssue;
	}

	public Timestamp getReportTimestamp() {
		return reportTimestamp;
	}

	public void setReportTimestamp(Timestamp reportTimestamp) {
		this.reportTimestamp = reportTimestamp;
	}

	public boolean isReportresult() {
		return reportresult;
	}

	public void setReportresult(boolean reportresult) {
		this.reportresult = reportresult;
	}

	public String getReportReply() {
		return reportReply;
	}

	public void setReportReply(String reportReply) {
		this.reportReply = reportReply;
	}
	
	
}
