package com.mike.game.model;

import java.util.Set;

import org.hibernate.Session;

import com.mike.genre.model.GenreVO;
import com.mike.label.model.LabelVO;
import com.mike.tool.HibernateTool;

public class TestHibernate {

	public static void main(String[] args) {

			
			GameService gameSvc = new GameService();
			GameVO game;
			try {
				game = gameSvc.getGameByGameId(4);
				System.out.println(game);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		
	} //end main
}
