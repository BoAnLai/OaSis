package com.shiyen.favor.model;

import java.util.List;

import com.shiyen.art.model.ArtVO;



public interface FavorDAO_interface {
	public Integer insert(FavorVO favorVO);
    public Integer delete(FavorVO favorVO);
    public Integer getfavorStatus(Integer artId,Integer userId);
    public List<FavorDTO> getFavorByuserId(Integer userId);
}
