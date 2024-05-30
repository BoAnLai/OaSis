package com.ryan.subs.model;

import java.sql.Date;

//import com.subs.model.SubsVO;

public class SubsService {

	private SubsDAO_interface subsDAO;
	
	public SubsService() {
		subsDAO = new SubsDAOImpl();
	}
	
	public SubsVO insertSubsVO(Integer subsUserId, Integer subsGameId,
							   Integer subsArtId, Date subsDate, Boolean subsStatus) {
		
		SubsVO subsVO = new SubsVO();
		
		subsVO.setSubsUserId(subsUserId);
		subsVO.setSubsGameId(subsGameId);
		subsVO.setSubsArtId(subsArtId);
		subsVO.setSubsDate(subsDate);
		subsVO.setSubsStatus(subsStatus);
		subsDAO.insert(subsVO);
		
		return subsVO;
		
	}
	
	public SubsVO updateSubsVO(Date subsDate, Boolean subsStatus) {
		
		SubsVO subsVO = new SubsVO();
		
		subsVO.setSubsDate(subsDate);
		subsVO.setSubsStatus(subsStatus);
		subsDAO.update(subsVO);

		return subsVO;
	}
	
	public SubsVO findByUserId(Integer subsUserId) {
		return subsDAO.findByUserId(subsUserId);
	}
	
	public SubsVO findByPrimaryKey(Integer subsId) {
		return subsDAO.findByPrimaryKey(subsId);
	}
	
}
