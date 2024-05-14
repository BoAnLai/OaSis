package com.lee.waiting.model;

import java.util.List;

public interface WaitingInterface {
	
	void insert(WaitingVO wat);
	
	WaitingVO getOne(Integer watno);
	
	void updateMaxPeople(WaitingVO wat);
	
	void updateReserve(WaitingVO wat);
	
	void updateAll(WaitingVO wat);
	
	List<WaitingVO>getAll();

}
