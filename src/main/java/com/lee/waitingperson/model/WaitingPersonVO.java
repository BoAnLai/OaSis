package com.lee.waitingperson.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="waitingPerson")
public class WaitingPersonVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="waitingPerson_id",insertable = false)
	private Integer waitingPersonID;
	
	@Column(name="waitingPerson_WaitingID")
	private Integer waitingPersonWaitingID;
	
	@Column(name="waitingPerson_UserID")
	private Integer waitingPersonUserID;
	
	public WaitingPersonVO() {}

	public WaitingPersonVO(Integer waitingPersonWaitingID, Integer waitingPersonUserID) {
		super();	
		this.waitingPersonWaitingID = waitingPersonWaitingID;
		this.waitingPersonUserID = waitingPersonUserID;
	}
	
	

	public WaitingPersonVO(Integer waitingPersonID, Integer waitingPersonWaitingID, Integer waitingPersonUserID) {
		super();
		this.waitingPersonID = waitingPersonID;
		this.waitingPersonWaitingID = waitingPersonWaitingID;
		this.waitingPersonUserID = waitingPersonUserID;
	}

	public Integer getWaitingPersonId() {
		return waitingPersonID;
	}

	public void setWaitingPersonId(Integer waitingPersonId) {
		this.waitingPersonID = waitingPersonId;
	}
	
	public Integer getWaitingPersonID() {
		return waitingPersonID;
	}

	public void setWaitingPersonID(Integer waitingPersonId) {
		this.waitingPersonID = waitingPersonId;
	}

	public Integer getWaitingPersonWaitingID() {
		return waitingPersonWaitingID;
	}

	public void setWaitingPersonWaitingID(Integer waitingPersonWaitingID) {
		this.waitingPersonWaitingID = waitingPersonWaitingID;
	}

	public Integer getWaitingPersonUserID() {
		return waitingPersonUserID;
	}

	public void setWaitingPersonUserID(Integer waitingPersonUserID) {
		this.waitingPersonUserID = waitingPersonUserID;
	}

	@Override
	public String toString() {
		return "WaitingPersonVO [waitingPersonId=" + waitingPersonID + ", waitingPersonWaitingID="
				+ waitingPersonWaitingID + ", waitingPersonUserID=" + waitingPersonUserID + "]";
	}
	
	

}
