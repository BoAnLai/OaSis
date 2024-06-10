package com.shiyen.favor.model;



import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;

import com.shiyen.art.model.ArtVO;
import com.shiyen.util.HibernateUtil;

public class FavorDAO implements FavorDAO_interface {
	private SessionFactory factory;
	
	public FavorDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	private Session getSession() {
		return factory.getCurrentSession();
	}
	@Override
	
	public Integer insert(FavorVO favorVO) {
		Session session = getSession();
		String hql = "FROM FavorVO WHERE favorArtId = :favorArtId AND favorUserId = :favorUserId";
		Query<FavorVO> query = session.createQuery(hql, FavorVO.class);
		query.setParameter("favorArtId", favorVO.getFavorArtId());
		query.setParameter("favorUserId", favorVO.getFavorUserId());
		FavorVO favor =  query.uniqueResult();
		if(favor == null) {
			getSession().save(favorVO);
			return (Integer) getSession().save(favorVO);
		}else {
			favor.setFavorStatus(0);
			getSession().saveOrUpdate(favor);
			return 0;
		}
		
		
		
	}

	

	
	@Override
	public List<FavorDTO> getFavorByuserId(Integer userId) {
		Session session = getSession();
		List<FavorDTO> favorDTO = new ArrayList<>();
		String sql ="SELECT a.art_id, a.art_Title,f.favor_timestamp "
				+ " FROM favor f "
				+ " Join art a ON f.favor_art_id = a.art_id "
				+ " WHERE f.favor_user_id = :userId AND f.favor_status = :fvaorStatus "
				+ " ORDER BY f.favor_timestamp";
		NativeQuery<Object[]> query = session.createNativeQuery(sql);
		query.setParameter("userId", userId);
		query.setParameter("fvaorStatus", 0);
		List<Object[]> result = query.getResultList();
        for(Object[] row:result) {
        	FavorDTO favor = new FavorDTO();
        	favor.setArtId((Integer)row[0]);
        	favor.setArtTitle((String)row[1]);
        	favor.setFavorTimestamp((Timestamp)row[2]);
        	favorDTO.add(favor);
        }
        return favorDTO;
	}
	@Override
	public Integer delete(FavorVO favorVO) {
		Session session = getSession();
		String hql = "FROM FavorVO WHERE favorArtId = :favorArtId AND favorUserId = :favorUserId";
		Query<FavorVO> query = session.createQuery(hql, FavorVO.class);
		query.setParameter("favorArtId", favorVO.getFavorArtId());
		query.setParameter("favorUserId", favorVO.getFavorUserId());
		FavorVO favor =  query.uniqueResult();
		favor.setFavorStatus(1);
		getSession().saveOrUpdate(favor);
		return 1;
	}
	@Override
	public Integer getfavorStatus(Integer artId, Integer userId) {
		Session session = getSession();
		String hql = "FROM FavorVO WHERE favorArtId = :favorArtId AND favorUserId = :favorUserId";
		Query<FavorVO> query = session.createQuery(hql, FavorVO.class);
		query.setParameter("favorArtId", artId);
		query.setParameter("favorUserId", userId);
		FavorVO favor =  query.uniqueResult();
		Integer	favorStatus = favor.getFavorStatus();
		return favorStatus;
	}

	
	

}
