package com.lee.waiting.model;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;


@Entity//一律選擇javax.persistence(好處:移植到其他JPA框架工具，這些設定都不用再動)，告訴Hibernate這是一個永續類別。
@Table(name = "waiting")//資料庫表格的名稱
public class WaitingVO{
	
	@Id//代表pk的欄位
	@GeneratedValue(strategy = GenerationType.IDENTITY)//自增主見要加入這行
	@Column(name="waiting_id",insertable = false)//insertable:不可自行新增
	private Integer waitingID;
	
	@Column(name="waiting_user_id")
	private Integer waitingUserId;
	
	@Column(name="waiting_reserve")
	private Timestamp waitingReserve;
	
	@Column(name="waiting_maxpeople")
	private Integer waitingMaxPeople;
	
	@Column(name="waiting_game_name")
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
