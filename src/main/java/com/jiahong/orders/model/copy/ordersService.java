package com.jiahong.orders.model.copy;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.mike.genre.model.GenreVO;
import com.mike.label.model.LabelVO;
import com.mike.tool.HibernateTool;

public class ordersService {
	
	public ordersVO getGameByGameId(Integer gameId) throws Exception{
		try {	
			Session session = HibernateTool.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			ordersVO game = session.get(ordersVO.class, gameId);
			session.getTransaction().commit();
			return game;
		}catch(Exception e) {
			throw e;
		}				
	}
	
	public List<ordersVO> listAll() throws Exception{
		try {	
			Session session = HibernateTool.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			List<ordersVO> gameList = session.createQuery("SELECT g FROM GameVO g", ordersVO.class).list();
			session.getTransaction().commit();
			return gameList;
		}catch(Exception e) {
			throw e;
		}		
	}
	
	public List<GenreVO> getGenresByGameId(Integer gameId) throws Exception{
		try {	
			Session session = HibernateTool.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			ordersVO game = session.get(ordersVO.class,gameId);
			List<GenreVO> genreList = new ArrayList<GenreVO>();
			
			for(LabelVO label:game.getLabels()) {
				genreList.add(label.getGenre());
			}
			
			session.getTransaction().commit();
			
			return genreList;
		}catch(Exception e) {
			throw e;
		}
	}
}
