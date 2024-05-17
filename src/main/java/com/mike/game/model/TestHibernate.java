package com.mike.game.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mike.tool.HibernateTool;

public class TestHibernate {

	public static void main(String[] args) {

		try {	
			Session session = HibernateTool.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			
			
			
			session.getTransaction().commit();
		}catch(Exception e) {
			throw e;
		}
		
	} //end main
}
