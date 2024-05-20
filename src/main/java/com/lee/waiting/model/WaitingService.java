package com.lee.waiting.model;

import java.sql.Timestamp;
import java.util.List;

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
	
	public List<WaitingVO> getMyRoom(Integer waitingRoomId) {
		return dao.getMyRoom(waitingRoomId);
	}
	
	public List<WaitingVO> getInRoom(Integer waitingRoomId) {
		return dao.getInRoom(waitingRoomId);
	}
	
	
}
