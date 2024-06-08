package com.ryan.subs.model;

import java.sql.Timestamp;
import java.util.List;

//import com.subs.model.SubsVO;

public class SubsService {

	private SubsDAO_interface subsDAO;

	public SubsService() {
		subsDAO = new SubsDAOImpl();
	}

	public SubsVO insertGmaeSubsVO(Integer subsUserId, Integer subsGameId,Boolean subsStatus) {

		SubsVO subsVO = new SubsVO();

		subsVO.setSubsUserId(subsUserId);
		subsVO.setSubsGameId(subsGameId);
		subsVO.setSubsStatus(subsStatus);
		subsDAO.insert(subsVO);

		return subsVO;

	}

	public SubsVO insertArtSubsVO(Integer subsUserId, Integer subsArtId, Boolean subsStatus) {

		SubsVO subsVO = new SubsVO();

		subsVO.setSubsUserId(subsUserId);
		subsVO.setSubsArtId(subsArtId);
		subsVO.setSubsStatus(subsStatus);
		subsDAO.insert(subsVO);

		return subsVO;

	}
	
	

	public SubsVO updateSubsVO(Integer subsId) {

		SubsVO subsUpdate = subsDAO.findByPrimaryKey(subsId);

		if (subsUpdate.getSubsStatus() == true) {
			subsUpdate.setSubsStatus(false);
		} else {
			subsUpdate.setSubsStatus(true);
		}
		subsDAO.update(subsUpdate);
		
		return subsUpdate;
		
	}

	
	public List<SubsVO> findByUserId(Integer subsUserId) {
		return subsDAO.findByUserId(subsUserId);
	}

	public SubsVO findByPrimaryKey(Integer subsId) {
		return subsDAO.findByPrimaryKey(subsId);
	}


}
