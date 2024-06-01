package com.ryan.subs.model;

public interface SubsDAO_interface {

	public void insert(SubsVO subsVO);
    public void update(SubsVO subsVO);
    public SubsVO findByUserId(Integer subsUserId);
    public SubsVO findByPrimaryKey(Integer subsId);


}
