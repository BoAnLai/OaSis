package com.jiahong.product.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.mike.genre.model.GenreVO;
import com.mike.label.model.LabelVO;
import com.mike.tool.HibernateTool;

public class ProductService {
	
	public ProductVO getGameByGameId(Integer gameId) throws Exception{
		try {	
			Session session = HibernateTool.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			ProductVO game = session.get(ProductVO.class, gameId);
			session.getTransaction().commit();
			return game;
		}catch(Exception e) {
			throw e;
		}				
	}
	
	public List<ProductVO> listAll() throws Exception{
		try {	
			Session session = HibernateTool.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			List<ProductVO> gameList = session.createQuery("SELECT g FROM GameVO g", ProductVO.class).list();
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
			
			ProductVO game = session.get(ProductVO.class,gameId);
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
