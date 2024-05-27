package com.shiyen.art.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;

import com.shiyen.message.model.MessageDTO;
import com.shiyen.util.HibernateUtil;

public class ArtDAO implements ArtDAO_interface {

	private SessionFactory factory;

	public ArtDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public Integer insert(ArtVO artVO) {
		return (Integer) getSession().save(artVO);

	}

	@Override
	public Integer update(ArtVO artVO) {
		try {
			getSession().update(artVO);
			return 1;
		} catch (Exception e) {
			return -1;
		}

	}

	@Override
	public Integer delete(Integer artId) {
		ArtVO artVO = getSession().get(ArtVO.class, artId);
		if (artVO != null) {
			getSession().delete(artVO);
			return 1;
		} else {
			return -1;
		}

	}

	@Override
	public ArtDTO findByPrimaryKey(Integer artId) {
		Session session = getSession();
		List<MessageDTO> messages = new ArrayList<>();
		ArtDTO artDTO = new ArtDTO();
		String sql = "SELECT m.message_content, m.message_timestamp, u.user_nickname "
        		+ "FROM message m "
                + "LEFT JOIN user u ON m.message_user_id = u.user_id "
                + "WHERE m.message_art_id = :artId";
        NativeQuery<Object[]> query = session.createNativeQuery(sql);
        query.setParameter("artId", artId);    
        List<Object[]> result = query.getResultList();
        if (result != null) {
        	for (Object[] row : result) {
        	    String messageContent = (String) row[0];
        	    Timestamp messageTimestamp = (Timestamp) row[1];
        	    String userNickname = (String) row[2];
        	    
        	    MessageDTO message = new MessageDTO();
        	    
        	    message.setMessageContent(messageContent);
        	    message.setMessageTimestamp(messageTimestamp);
        	    message.setUserNickname(userNickname);
        	    
        	    messages.add(message);
    	   }
        }
		
			String sql1 = "SELECT a.art_id, a.art_title, a.art_content, u.user_nickname "
            		+ "FROM art a "
                    + "LEFT JOIN user u ON a.art_user_id = u.user_id "
                    + "WHERE a.art_id = :artId";
            NativeQuery<Object[]> query1 = session.createNativeQuery(sql1);
            query1.setParameter("artId", artId);    
            Object[] result1 = query1.uniqueResult();
            if (result1 != null) {
                
                artDTO.setArtId((Integer) result1[0]);
                artDTO.setArtTitle((String) result1[1]);
                artDTO.setArtContent((String) result1[2]);
                artDTO.setUserNickname((String) result1[3]);
                artDTO.setMessageDTO(messages);
                return artDTO;
            }
           return artDTO;
    }
    
	

	@Override
	public List<ArtVO> getAllArt(Integer gameId) {
		return getSession().createQuery(
	            "FROM ArtVO a LEFT JOIN FETCH a.gameVO g WHERE g.gameId = :gameId ORDER BY a.artTimestamp DESC", ArtVO.class)
	            .setParameter("gameId", gameId)
	            .getResultList();
	}

	@Override
	public List<ArtVO> getReply() {
		return getSession().createQuery("FROM ArtVO WHERE artReply IS NOT NULL ORDER BY artTimestamp DESC", ArtVO.class)
				.getResultList();
	}

	@Override
	public List<ArtVO> getAll() {
		
		 return getSession().createQuery(
	            "FROM ArtVO ", ArtVO.class)
	            .getResultList();
	}

}
