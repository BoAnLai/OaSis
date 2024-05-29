package com.mike.genre.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;

import com.mike.game.model.GameVO;
import com.mike.label.model.LabelVO;
import com.mike.tool.HibernateTool;

public class GenreService {

	public static GenreVO getGenreByGenreId(Integer genreId) {
		try {	
			Session session = HibernateTool.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			GenreVO game = session.get(GenreVO.class, genreId);
			session.getTransaction().commit();
			return game;
		}catch(Exception e) {
			throw e;
		}	
	}
	
	public static List<GameVO> getGameListByGenreId(Integer genreId){
		try {	
			Session session = HibernateTool.getSessionFactory().getCurrentSession();
			session.beginTransaction();
						
			GenreVO genre = session.get(GenreVO.class,genreId);
			List<LabelVO> labelList = genre.getLabels();
			
			List<GameVO> gameList = new ArrayList<GameVO>();
			for(LabelVO label:labelList) {
				GameVO game = label.getGame();
				gameList.add(game);
			}
			
			session.getTransaction().commit();
			return gameList;
		}catch(Exception e) {
			throw e;
		}	
		
	}
	
	public static List<GenreVO> listAll(){
		try {	
			Session session = HibernateTool.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			List<GenreVO> genreList = session.createQuery("SELECT ge FROM GenreVO ge ORDER BY ge.id", GenreVO.class).list();
			session.getTransaction().commit();
			return genreList;
		}catch(Exception e) {
			throw e;
		}	
	}
	
}
