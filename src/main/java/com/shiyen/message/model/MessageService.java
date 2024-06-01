package com.shiyen.message.model;



public class MessageService {
	private MessageDAO_interface dao;

	public MessageService() {
		dao = new MessageDAO();
	}

	public MessageVO addMessage(MessageVO messageVO) {
		dao.insert(messageVO);
		return messageVO;
	}

	public MessageVO updateMessage(MessageVO messageVO) {

		dao.update(messageVO);

		return messageVO;
	}
	public void deleteMessage(Integer messageId) {
		dao.delete(messageId);
	}
}
