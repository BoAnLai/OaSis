package com.lee.waiting.service;

import java.sql.Timestamp;
import java.util.List;

import com.lee.waiting.model.WaitingDaoImpl;
import com.lee.waiting.model.WaitingInterface;
import com.lee.waiting.model.WaitingVO;

public class WaitingService {
	
	public WaitingInterface dao;
	
	public WaitingService() {
		dao=new WaitingDaoImpl();
	}
	
	public WaitingVO addEmp(int userId,java.sql.Timestamp reserve,Integer maxPeople,String gameName) {

		WaitingVO waiVO = new WaitingVO();

		waiVO.setWaitingUserId(userId);
		waiVO.setWaitingReserve(reserve);
		waiVO.setWaitingMaxPeople(maxPeople);
		waiVO.setWaitingGameName(gameName);
		
		dao.insert(waiVO);

		return waiVO;
	}
	
	public WaitingVO getOneEmp(Integer waino) {
		return dao.getOne(waino);
	}
	
	public List<WaitingVO> getAll() {
		return dao.getAll();
	}
	
	public WaitingVO update(Integer waitingid,Integer waitingUserid, Timestamp waitingReserve,Integer maxpeople,String gameName) {
		
		WaitingVO waiVO=new WaitingVO();
		
		waiVO.setWaitingID(waitingid);
		waiVO.setWaitingUserId(waitingUserid);
		waiVO.setWaitingReserve(waitingReserve);
		waiVO.setWaitingMaxPeople(maxpeople);
		waiVO.setWaitingGameName(gameName);
		dao.updateAll(waiVO);
		
		return waiVO;
	}

}
