package com.lee.waiting.model;
import java.sql.Timestamp;

public class WaitingVO{
	
	private Integer waitingID;
	private Integer waitingUserId;
	private Timestamp waitingReserve;
	private Integer waitingMaxPeople;
	private String WaitingGameName;
	
	public WaitingVO() {}
	
	
	

	public WaitingVO(Integer waitingID, Timestamp waitingReserve) {
		super();
		this.waitingID = waitingID;
		this.waitingReserve = waitingReserve;
	}




	public WaitingVO(Integer waitingID, Integer waitingMaxPeople) {
		super();
		this.waitingID = waitingID;
		this.waitingMaxPeople = waitingMaxPeople;
	}


	
 
	
	

	public WaitingVO(Integer waitingUserId, Timestamp waitingReserve, Integer waitingMaxPeople,
			String waitingGameName) {
		super();
		this.waitingUserId = waitingUserId;
		this.waitingReserve = waitingReserve;
		this.waitingMaxPeople = waitingMaxPeople;
		WaitingGameName = waitingGameName;
	}




	public Integer getWaitingID() {
		return waitingID;
	}

	public void setWaitingID(Integer waitingID) {
		this.waitingID = waitingID;
	}

	public Integer getWaitingUserId() {
		return waitingUserId;
	}

	public void setWaitingUserId(Integer waitingUserId) {
		this.waitingUserId = waitingUserId;
	}

	public Timestamp getWaitingReserve() {
		return waitingReserve;
	}

	public void setWaitingReserve(Timestamp waitingReserve) {
		this.waitingReserve = waitingReserve;
	}

	public Integer getWaitingMaxPeople() {
		return waitingMaxPeople;
	}

	public void setWaitingMaxPeople(Integer waitingMaxPeople) {
		this.waitingMaxPeople = waitingMaxPeople;
	}

	public String getWaitingGameName() {
		return WaitingGameName;
	}




	public void setWaitingGameName(String waitingGameName) {
		WaitingGameName = waitingGameName;
	}




	@Override
	public String toString() {
		return "WaitingVO [waitingID=" + waitingID + ", waitingUserId=" + waitingUserId + ", waitingReserve="
				+ waitingReserve + ", waitingMaxPeople=" + waitingMaxPeople + ", WaitingGameName=" + WaitingGameName
				+ "]";
	}

	

	

	
	
	

}
