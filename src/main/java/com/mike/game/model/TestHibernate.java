package com.mike.game.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class TestHibernate {

	public static void main(String[] args) {
		StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
				.configure()
				.build();
		
		SessionFactory sessionFactory = new MetadataSources(registry)
				.buildMetadata()
				.buildSessionFactory();
		
		Session session = null;
		try {
			session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();

//			GameVO game = new GameVO();
//			game.setGameName("game name");
//			game.setGameImg("img path");
//			session.save(game);
			
			GameVO game = session.get(GameVO.class, 2);
			System.out.println(game);
			
			tx.commit();
		}catch(Exception e){
			session.getTransaction().rollback();
		}finally {
			if(session != null) {
				session.close();				
			}
			sessionFactory.close();			
		}		
	} //end main
}
