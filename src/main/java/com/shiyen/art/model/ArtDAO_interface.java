package com.shiyen.art.model;

import java.util.List;


public interface ArtDAO_interface {
	public Integer insert(ArtVO artVO);
    public Integer update(ArtVO artVO);
    public Integer delete(Integer artId);
    public ArtDTO findByPrimaryKey(Integer artId);
    public List<ArtVO> getAll();
    public List<ArtVO> getAllArt(Integer gameId);
    public List<ArtVO> getReply();
}
