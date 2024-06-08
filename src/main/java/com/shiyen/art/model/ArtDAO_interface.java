package com.shiyen.art.model;

import java.util.List;


public interface ArtDAO_interface {
	public Integer insert(ArtVO artVO);
    public Integer update(ArtVO artVO);
    public Integer delete(Integer artId);
    public ArtDTO getFirstArt(Integer artId);
    public ArtVO getOneArtByArtId(Integer artId);
    public List<ArtVO> getAll();
    public List<ArtVO> getAllByUserId(Integer userId);
    public List<ArtDTO> getAllArtByGameId(Integer gameId);
    public List<ArtReplyDTO> getReply(Integer artId);
}
