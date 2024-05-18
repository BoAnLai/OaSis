package com.shiyen.favor.model;

import java.util.List;



public interface FavorDAO_interface {
	public Integer insert(FavorVO favorVO);
    public Integer update(FavorVO favorVO);
    public Integer delete(Integer favorId);
    public Long getOneArtFavor(Integer favorArtId);
}
