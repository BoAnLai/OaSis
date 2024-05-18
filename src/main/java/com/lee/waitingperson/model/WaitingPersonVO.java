package com.lee.waitingperson.model;

public class WaitingPersonVO {
	
	private Integer waitingPersonID;
	private Integer waitingPersonWaitingID;
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
