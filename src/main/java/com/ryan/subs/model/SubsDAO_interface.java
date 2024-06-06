package com.ryan.subs.model;

import java.util.List;

public interface SubsDAO_interface {

	public void insert(SubsVO subsVO);
    public void update(SubsVO subsVO);
    public List<SubsVO> findByUserId(Integer subsUserId);
    public SubsVO findByPrimaryKey(Integer subsId);


}
