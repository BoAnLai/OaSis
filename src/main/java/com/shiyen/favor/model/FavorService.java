package com.shiyen.favor.model;

import java.util.List;

import com.shiyen.art.model.ArtDAO;
import com.shiyen.art.model.ArtVO;

public class FavorService {
	private FavorDAO_interface dao;
	
	public FavorService() {
		dao = new FavorDAO();
	}
	public FavorVO addFavor(FavorVO favorVO) {
		dao.insert(favorVO);
		return favorVO;
	}

	public Long getOneArtFavor(Integer favorArtId) {
		return dao.getOneArtFavor(favorArtId);
	}
	

	public void deleteArt(Integer favorId) {
		dao.delete(favorId);
	}
	public FavorVO updateArt(FavorVO favorVO) {
		
		dao.update(favorVO);

		return favorVO;
	}
}
