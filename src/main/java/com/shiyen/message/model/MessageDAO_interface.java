package com.shiyen.message.model;

import java.util.List;

import com.shiyen.art.model.ArtVO;

public interface MessageDAO_interface {
	public void insert(MessageVO messageVO);
    public Integer update(MessageVO messageVO);
    public Integer delete(Integer messageId);
    public List<MessageVO> getOneArtMessage(Integer messageArtId);
    
}
