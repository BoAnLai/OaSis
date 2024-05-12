package com.shiyen.art.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;



public class ArtService {
	private ArtDAO_interface dao;

	public ArtService() {
		dao = new ArtJDBCDAO();
	}
	public ArtVO addArt(String artTitle, String artContent ,Timestamp artTimestamp,
			Integer artReply, Integer artFavor, Integer artView) {

		ArtVO artVO = new ArtVO();

		
		artVO.setArtTitle(artTitle);
		artVO.setArtContent(artContent);
		artVO.setArtTimestamp(artTimestamp);
		artVO.setArtReply(artReply);
		artVO.setArtFavor(artFavor);
		artVO.setArtView(artView);
		dao.insert(artVO);

		return artVO;
	}
//	public ArtVO updateEmp(Integer artId, Integer artGameId, Integer artUserId,String artTitle, String artContent ,Timestamp artTimestamp,
//			Integer artReply, Integer artFavor, Integer artView) {
//
//		ArtVO artVO = new ArtVO();
//
//		artVO.setArtId(artId);
//		artVO.setArtGameId(artGameId);
//		artVO.setArtUserId(artUserId);
//		artVO.setArtTitle(artTitle);
//		artVO.setArtContent(artContent);
//		artVO.setArtTimestamp(artTimestamp);
//		artVO.setArtReply(artReply);
//		artVO.setArtFavor(artFavor);
//		artVO.setArtView(artView);
//		dao.update(artVO);
//
//		return artVO;
//	}

	public List<ArtVO> getAll() {
		return dao.getAll();
	}

	public ArtVO getOneArt(Integer artId) {
		return dao.findByPrimaryKey(artId);
	}

	public void deleteArt(Integer artId) {
		dao.delete(artId);
	}
	public ArtVO updateArt(Integer artId , String artTitle, String artContent, Timestamp artTimestamp ,Integer artReply, Integer artFavor, Integer artView) {
		ArtVO artVO = new ArtVO();
		artVO.setArtId(artId);
		artVO.setArtTitle(artTitle);
		artVO.setArtContent(artContent);
		artVO.setArtTimestamp(artTimestamp);
		artVO.setArtReply(artReply);
		artVO.setArtFavor(artFavor);
		artVO.setArtView(artView);
		dao.update(artVO);

		return artVO;
	}
}
