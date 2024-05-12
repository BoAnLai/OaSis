package com.shiyen.art.model;

import java.util.List;

public interface ArtDAO_interface {
	public void insert(ArtVO artVO);
    public void update(ArtVO artVO);
    public void delete(Integer artId);
    public ArtVO findByPrimaryKey(Integer artId);
    public List<ArtVO> getAll();
}
