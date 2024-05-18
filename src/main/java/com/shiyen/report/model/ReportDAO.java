package com.shiyen.report.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.shiyen.art.model.ArtVO;
import com.shiyen.util.HibernateUtil;

public class ReportDAO implements ReportDAO_interface {
private SessionFactory factory;
	
	public ReportDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	private Session getSession() {
		return factory.getCurrentSession();
	}
	@Override
	public Integer insert(ReportVO reportVO) {
		return (Integer) getSession().save(reportVO);
	}

	@Override
	public Integer update(ReportVO reportVO) {
		try {
			getSession().update(reportVO);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public List<ReportVO> getAll() {
		return getSession().createQuery("FROM ReportVO ORDER BY reportId", 
				ReportVO.class).getResultList();
	}

}
