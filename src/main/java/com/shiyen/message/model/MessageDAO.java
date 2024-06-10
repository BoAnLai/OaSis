package com.shiyen.message.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.shiyen.art.model.ArtVO;
import com.shiyen.util.HibernateUtil;

public class MessageDAO implements MessageDAO_interface {
private SessionFactory factory;
	
	public MessageDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	private Session getSession() {
		return factory.getCurrentSession();
	}
	
	@Override
	public void insert(MessageVO messageVO) {	
		getSession().save(messageVO);
	}

	@Override
	public Integer update(MessageVO messageVO) {
		try {
			getSession().update(messageVO);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public Integer delete(Integer messageId) {
		MessageVO messageVO = getSession().get(MessageVO.class, messageId);
		if (messageVO != null) {
			getSession().delete(messageVO);
			return 1;
		} else {
			return -1;
		}
	}

	@Override
	public List<MessageVO> getOneArtMessage(Integer messageArtId) {
		return getSession().createQuery("FROM MessageVO WHERE messageArtId = :value", MessageVO.class)
				.setParameter("value", messageArtId).getResultList();	}
	}
	
