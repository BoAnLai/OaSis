package com.lee.waitingperson.model;

import java.util.List;

public interface WaitingPersonInterface {
	
	
	void insert(WaitingPersonVO watp);
	
	void delect(Integer waitingPersonID);
	
	int serchPK(Integer waitingPersonWaitingId,Integer waitingPersonWaitingUserId);
	
	List<WaitingPersonVO>getAll(Integer waitingPersonWaitingID);
	
	List<WaitingPersonVO>getAll();

}
