package com.shiyen.message.model;

import org.hibernate.Session;

import com.shiyen.util.HibernateUtil;

public class MessageService {
	private MessageDAO_interface dao;

	public MessageService() {
		dao = new MessageDAO();
	}

	public Integer addMessage(MessageVO messageVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	    try {
	        session.beginTransaction();
	         dao.insert(messageVO);
	        session.getTransaction().commit();
	        return 1;
	        }catch (Exception e) {
		        session.getTransaction().rollback();
		        e.printStackTrace();
		        return null;
		    }
	        
	}

	public MessageVO updateMessage(MessageVO messageVO) {

		dao.update(messageVO);

		return messageVO;
	}
	public void deleteMessage(Integer messageId) {
		dao.delete(messageId);
	}
}
