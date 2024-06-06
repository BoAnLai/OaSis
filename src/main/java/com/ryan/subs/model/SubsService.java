package com.ryan.subs.model;


import java.sql.Timestamp;
import java.util.List;


public class SubsService {

	private SubsDAO_interface subsDAO;

	public SubsService() {
		subsDAO = new SubsDAOImpl();
	}

	public SubsVO insertGmaeSubsVO(Integer subsUserId, Integer subsGameId, Timestamp subsTimestamp,
			Boolean subsStatus) {

		SubsVO subsVO = new SubsVO();

		subsVO.setSubsUserId(subsUserId);
		subsVO.setSubsGameId(subsGameId);
		subsVO.setSubsTimestamp(subsTimestamp);
		subsVO.setSubsStatus(subsStatus);
		subsDAO.insert(subsVO);

		return subsVO;

	}

	public SubsVO insertArtSubsVO(Integer subsUserId, Integer subsArtId, Timestamp subsTimestamp,
			Boolean subsStatus) {

		SubsVO subsVO = new SubsVO();

		subsVO.setSubsUserId(subsUserId);
		subsVO.setSubsArtId(subsArtId);
		subsVO.setSubsTimestamp(subsTimestamp);
		subsVO.setSubsStatus(subsStatus);
		subsDAO.insert(subsVO);

		return subsVO;

	}
	
	

	public SubsVO updateSubsVO(Timestamp subsTimestamp, Boolean subsStatus) {

		SubsVO subsVO = new SubsVO();

		subsVO.setSubsTimestamp(subsTimestamp);
		subsVO.setSubsStatus(subsStatus);
		subsDAO.update(subsVO);

		return subsVO;
	}

	
	public List<SubsVO> findByUserId(Integer subsUserId) {
		return subsDAO.findByUserId(subsUserId);
	}

	public SubsVO findByPrimaryKey(Integer subsId) {
		return subsDAO.findByPrimaryKey(subsId);
	}

}
