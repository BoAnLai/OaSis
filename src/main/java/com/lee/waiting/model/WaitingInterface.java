package com.lee.waiting.model;

import java.util.List;

public interface WaitingInterface {
	
	void insert(WaitingVO wat);
	
	WaitingVO getOne(Integer watno);
	
	void updateAll(WaitingVO wat);
	
	List<WaitingVO>getAll();
	
	List<WaitingVO>getTotal();
	
	List<WaitingVO>getMyRoom(Integer waitingUserID);
	
	List<WaitingVO>getInRoom(Integer waitingUserID);
	
	

}
