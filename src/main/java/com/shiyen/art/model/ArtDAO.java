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
        		+ " FROM message m "
                + " LEFT JOIN user u ON m.message_user_id = u.user_id "
                + " WHERE m.message_art_id = :artId"
                + " ORDER BY m.message_timestamp";
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
	public List<ArtDTO> getAllArtByGameId(Integer gameId) {
		Session session = getSession();
		List<ArtDTO> artDTO = new ArrayList<>();
		String sql ="SELECT a.art_Id, a.art_title,a.art_timestamp,u.user_nickname "
				+ " FROM art a "
				+ " JOIN user u ON a.art_user_id = u.user_id "
				+ " WHERE a.art_game_id = :gameId"
				+ " AND a.art_reply IS  NULL "
				+ " ORDER BY a.art_timestamp";
		NativeQuery<Object[]> query = session.createNativeQuery(sql);
		query.setParameter("gameId", gameId);
		List<Object[]> result = query.getResultList();
        for(Object[] row:result) {
        	Integer artId = (Integer)row[0];
        	String artTitle = (String) row[1];
            Timestamp artTimestamp = (Timestamp) row[2];
            String artUserNickname = (String) row[3];
            
            ArtDTO art = new ArtDTO();
            art.setArtId(artId);
            art.setArtTitle(artTitle);
            art.setArtTimestamp(artTimestamp);
            art.setUserNickname(artUserNickname);
            artDTO.add(art);
            }
        return artDTO;
	}

	@Override
	public List<ArtReplyDTO> getReply(Integer artId) {
		Session session = getSession();
		List<ArtReplyDTO> artReply = new ArrayList<>();
		String sql ="SELECT a.art_Id, a.art_title, a.art_content,a.art_timestamp,u.user_nickname"
				+ " FROM art a "
				+ " JOIN user u ON a.art_user_id = u.user_id "
				+ " WHERE a.art_reply = :artId"
				+ " ORDER BY a.art_timestamp";
		NativeQuery<Object[]> query = session.createNativeQuery(sql);
		query.setParameter("artId", artId); 
		System.out.println(artId);
		List<Object[]> result = query.getResultList();
        for(Object[] row:result) {
        	Integer messageArtId = (Integer)row[0];
        	String artTitle = (String) row[1];
            String artContent = (String) row[2];
            Timestamp artTimestamp = (Timestamp) row[3];
            String artUserNickname = (String) row[4];
            
            List<MessageDTO> messages = new ArrayList<>();
            ArtReplyDTO artReplyDTO = new ArtReplyDTO();
            artReplyDTO.setArtId(messageArtId);
            artReplyDTO.setArtContent(artContent);
            artReplyDTO.setArtTimestamp(artTimestamp);
            artReplyDTO.setUserNickname(artUserNickname);
            System.out.println(artReplyDTO.getArtContent());
            String sql1 ="SELECT m.message_content, m.message_timestamp,u.user_nickname"
    				+ " FROM message m "
    				+ " JOIN user u ON m.message_user_id = u.user_id "
    				+ " WHERE m.message_art_id = :artId"
    				+ " ORDER BY m.message_timestamp";
            NativeQuery<Object[]> query1 = session.createNativeQuery(sql1);
            query1.setParameter("artId", messageArtId); 
            List<Object[]> result1 = query1.getResultList();
            for(Object[] row1:result1) {
                String messageContent = (String) row1[0]; 
                Timestamp messageTimestamp = (Timestamp) row1[1];
                String messageUserNickName = (String) row1[2];
                
                
                MessageDTO messageDTO = new MessageDTO();
                messageDTO.setUserNickname(messageUserNickName);
                messageDTO.setMessageContent(messageContent); 
                messageDTO.setMessageTimestamp(messageTimestamp);
                messages.add(messageDTO);
                
                
            }
            
            artReplyDTO.setMessageDTO(messages);
            artReply.add(artReplyDTO);
        }
           return artReply;
	}

	@Override
	public List<ArtVO> getAll() {
		
		 return getSession().createQuery(
	            "FROM ArtVO ", ArtVO.class)
	            .getResultList();
	}

}
