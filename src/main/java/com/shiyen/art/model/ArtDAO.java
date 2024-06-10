package com.shiyen.art.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;

import com.mike.user.model.UserDTO;
import com.mike.user.model.UserService;
import com.mike.user.model.UserVO;
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

	//修改文章
	public Integer update(ArtVO artVO) {
		try {
			
			ArtVO art = getSession().get(ArtVO.class, artVO.getArtId());
			art.setArtContent(artVO.getArtContent());
			art.setArtTimestamp(artVO.getArtTimestamp());
			getSession().saveOrUpdate(art);
			return 1;
		} catch (Exception e) {
			return -1;
		}

	}

	//刪除文章
	public Integer delete(Integer artId) {
		ArtVO art = getSession().get(ArtVO.class,artId );
		if (art != null) {
			art.setArtStatus(1);
			getSession().saveOrUpdate(art);
			return 1;
		} else {
			return -1;
		}

	}

	//首篇文章
	public ArtDTO getFirstArt(Integer artId) {
		Session session = getSession();
		List<MessageDTO> messages = new ArrayList<>();
		ArtDTO artDTO = new ArtDTO();
		String sql = "SELECT m.message_content, m.message_timestamp,m.message_Status, u.user_nickname "
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
        	    String userNickname = (String) row[3];
        	    
        	    MessageDTO message = new MessageDTO();
        	    switch((Integer)row[2]) {
        		case 0 :{
        			message.setMessageContent(messageContent);
        			 break;
        			}
        		case 1 :{
        			message.setMessageContent("此留言由原作者刪除");
       			 	break;
        		}
        		case 2 :{
        			message.setMessageContent("此留言由管理者刪除");
       			 	break;
        		}
        		}
        	    
        	    message.setMessageTimestamp(messageTimestamp);
        	    message.setUserNickname(userNickname);
        	    
        	    messages.add(message);
    	   }
        }
		
			String sql1 = "SELECT a.art_id, a.art_title, a.art_content,a.art_status ,u.user_id , u.user_avatar "
            		+ " FROM art a "
                    + " LEFT JOIN user u ON a.art_user_id = u.user_id "
                    + " WHERE a.art_id = :artId";
            NativeQuery<Object[]> query1 = session.createNativeQuery(sql1);
            query1.setParameter("artId", artId);    
            Object[] result1 = query1.uniqueResult();
            if (result1 != null) {
                
                artDTO.setArtId((Integer) result1[0]);
                artDTO.setArtTitle((String) result1[1]);
                switch((Integer) result1[3]) {
                	case 0:{
                		artDTO.setArtContent((String) result1[2]);
                		break;
                	}
                	case 1 :{
                		artDTO.setArtContent("此文章由原作者刪除了");
                		break;
                	}
                	case 2 :{
                		artDTO.setArtContent("此文章由管理者刪除了");
                		break;
                	}
                }
                
                UserService userService = new UserService();
                UserVO userVO=userService.getByUserId((Integer) result1[4]);
                UserDTO userDTO = new UserDTO(userVO);
                
                artDTO.setUserNickname(userDTO.getUserName());
                artDTO.setUserAvatar((String) result1[5]);
                artDTO.setMessageDTO(messages);
                return artDTO;
            }
           return artDTO;
    }
    
	

	// 獲得討論區文章
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

	//回復文章
	public List<ArtReplyDTO> getReply(Integer artId) {
		Session session = getSession();
		List<ArtReplyDTO> artReply = new ArrayList<>();
		String sql ="SELECT a.art_Id, a.art_title, a.art_content,a.art_timestamp,a.art_status,u.user_id,u.user_avatar "
				+ " FROM art a "
				+ " JOIN user u ON a.art_user_id = u.user_id "
				+ " WHERE a.art_reply = :artId"
				+ " ORDER BY a.art_timestamp";
		NativeQuery<Object[]> query = session.createNativeQuery(sql);
		query.setParameter("artId", artId); 
		
		List<Object[]> result = query.getResultList();
        for(Object[] row:result) {
            List<MessageDTO> messages = new ArrayList<>();
            ArtReplyDTO artReplyDTO = new ArtReplyDTO();
            Integer messageArtId = (Integer)row[0] ;
            artReplyDTO.setArtId(messageArtId);
            switch ((Integer)row[4]) {
            case 0 :{
            	artReplyDTO.setArtContent((String) row[2]);
            	break;
            }
            case 1 :{
            	artReplyDTO.setArtContent("此文章由原作者刪除");
            	break;
            }
            case 2 :{
            	artReplyDTO.setArtContent("此文章由管理者刪除");
            	break;
            }
            }
            UserService userService = new UserService();
            UserVO userVO=userService.getByUserId((Integer) row[5]);
            UserDTO userDTO = new UserDTO(userVO);
            
            artReplyDTO.setUserNickname(userDTO.getUserName());
            artReplyDTO.setArtTimestamp((Timestamp) row[3]);
            
            artReplyDTO.setUserAvatar((String) row[6]);
            
            String sql1 ="SELECT m.message_content, m.message_timestamp,m.message_status,u.user_nickname "
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
                String messageUserNickName = (String) row1[3];
                
                
                MessageDTO messageDTO = new MessageDTO();
                switch((Integer)row1[2]) {
                case 0:{
                	messageDTO.setMessageContent(messageContent); 
                	break;
                }
                case 1:{
                	messageDTO.setMessageContent("此留言由原作者刪除"); 
                	break;
                }
                case 2:{
                	messageDTO.setMessageContent("此留言由管理者刪除"); 
                	break;
                }
                }
                messageDTO.setUserNickname(messageUserNickName);
                
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

	//獲取個人文章
	public List<ArtVO> getAllByUserId(Integer userId) {
		Session session = getSession();
		List<ArtVO> artVO = new ArrayList<>();
		String sql ="SELECT a.art_Id, a.art_title,art_Content,a.art_timestamp,a.art_reply,a.art_favor,a.art_view,a.art_status"
				+ " FROM art a " 
				+ " WHERE a.art_user_id = :userId AND a.art_status = :artStatus "
				+ " ORDER BY a.art_timestamp";
		NativeQuery<Object[]> query = session.createNativeQuery(sql);
		query.setParameter("userId", userId);
		query.setParameter("artStatus", 0);
		List<Object[]> result = query.getResultList();
        for(Object[] row:result) {
        	Integer artId = (Integer)row[0];
        	String artTitle = (String) row[1];
        	String artContent = (String) row[2];
            Timestamp artTimestamp = (Timestamp) row[3];
            Integer artReply = (Integer) row[4];
            Integer artFavor = (Integer) row[5];
            Integer artView = (Integer) row[6];
            Integer artStatus = (Integer) row[7];
            
            
            
            ArtVO art = new ArtVO();
            art.setArtId(artId);
            art.setArtTitle(artTitle);
            art.setArtContent(artContent);
            art.setArtTimestamp(artTimestamp);
            art.setArtReply(artReply);
            art.setArtFavor(artFavor);
            art.setArtView(artView);
            art.setArtStatus(artStatus);
            artVO.add(art);
            }
        return artVO;
	}

	@Override
	public ArtVO getOneArtByArtId(Integer artId) {
		Session session = getSession();

		String hql = "FROM ArtVO WHERE artId = :artId";
		Query<ArtVO> query = session.createQuery(hql, ArtVO.class);
		query.setParameter("artId", artId);
		ArtVO artVO =  query.uniqueResult();
		return artVO;
	}

}
