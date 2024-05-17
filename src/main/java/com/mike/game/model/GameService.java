package com.mike.game.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mike.tool.HibernateTool;

public class GameService {
	
	public List<GameVO> listAll() throws Exception{
		try {	
			Session session = HibernateTool.getSessionFactory().getCurrentSession();
			Transaction tx = session.beginTransaction();
			
			List<GameVO> gameList = session.createQuery("SELECT g FROM GameVO g", GameVO.class).list();
//			List<GameVO> gameList = session.createQuery("SELECT g FROM GameVO g", GameVO.class).getResultList();
			session.getTransaction().commit();
			return gameList;
		}catch(Exception e) {
			throw e;
		}		
	}
	
	public GameDetail getByGameId(Integer gameId) {
		try {	
			Session session = HibernateTool.getSessionFactory().getCurrentSession();
			Transaction tx = session.beginTransaction();
			
			GameVO game = session.get(GameVO.class,gameId);
			GameDetail gameDetail = new GameDetail(game);
			
			String hql = "SELECT g.gameName, ge.genreName " +
                    "FROM Label l " +
                    "JOIN l.game g " +
                    "JOIN l.genre ge " +
                    "WHERE g.gameId = :gameId";
			
			List<Object[]> results = session.createQuery(hql)
								.setParameter("gameId",2)
								.getResultList();
			System.out.println(results);
			
			
			session.getTransaction().commit();
			return gameDetail;
		}catch(Exception e) {
			throw e;
		}
	}
}
