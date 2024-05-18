package com.shiyen.art.model;

import java.sql.Timestamp;
import java.util.List;



public class ArtService {
	private ArtDAO_interface dao;

	public ArtService() {
		dao = new ArtDAO();
	}
	public ArtVO addArt(ArtVO artVO) {
		dao.insert(artVO);
		return artVO;
	}


	public List<ArtVO> getAll() {
		return dao.getAll();
	}

	public ArtVO getOneArt(Integer artId) {
		return dao.findByPrimaryKey(artId);
	}

	public void deleteArt(Integer artId) {
		dao.delete(artId);
	}
	public ArtVO updateArt(ArtVO artVO) {
		
		dao.update(artVO);

		return artVO;
	}
}
