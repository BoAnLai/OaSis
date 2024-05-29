package com.shiyen.report.model;

import java.util.List;



public interface ReportDAO_interface {
	public Integer insert(ReportVO reportVO);
    public Integer update(ReportVO reportVO);
    public List<ReportVO> getAll();
}
