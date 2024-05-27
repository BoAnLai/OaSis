package com.lee.waitingperson.model;

import java.util.List;

public class WaitingPersonService {
	
	public WaitingPersonInterface dao;
	
	public WaitingPersonService() {
		dao=new WaitingPersonDao();
	}
	
	public WaitingPersonVO addPerson(int waitingPersonWaitingID,int waitingPersonUserID) {
		
		
		WaitingPersonVO waipVO=new WaitingPersonVO();
		waipVO.setWaitingPersonWaitingID(waitingPersonWaitingID);
		waipVO.setWaitingPersonUserID(waitingPersonUserID);
	
		dao.insert(waipVO);
		
		return waipVO;
	}
	
	
	public List<WaitingPersonVO> getAll(Integer waitingPersonWaitingID){
		return dao.getAll(waitingPersonWaitingID);
	}
	
	public void delectRoomPerson(Integer waitingPersonID) {
	
		dao.delect(waitingPersonID);
		
	}
	
	public int serchPK(Integer waitingPersonWaitingId,Integer WaitingPersonUserId) {
		
		return dao.serchPK(waitingPersonWaitingId, WaitingPersonUserId);
	}

}
