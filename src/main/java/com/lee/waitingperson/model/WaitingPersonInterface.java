package com.lee.waitingperson.model;

import java.util.List;

public interface WaitingPersonInterface {
	
	
	void insert(WaitingPersonVO watp);
	
	void delect(WaitingPersonVO watp);
	
	List<WaitingPersonVO>getAll(Integer waitingPersonWaitingID);
	
	List<WaitingPersonVO>getAll();

}
