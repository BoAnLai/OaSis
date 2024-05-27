package com.lee.waiting.model;

import java.sql.Timestamp;
import org.hibernate.Session;
import org.hibernate.Transaction;
import tool.HibernateUtil;
/*
 * 單利模式:一個JAVA類別在整個執行環境就只有一個物件
 * SessionFectory是重量級，要用單利模式
 * 
 * Session是輕量的，不可共用Thread，可需要的時候就拿
 */
public class WaitingHibernateImpl {
	
	
	public static void main(String[] args) {
		
		
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();//SessionFactory的連線取得寫在HibernateUtil.getSessionFactory()裡面。
		//以上寫法要配合hibernate版本
		
//		Session session=factory.openSession();//呼叫一次就是一條新的session，需要開啟、關閉
//		Session session=factory.getCurrentSession();//取得當前Session並綁定給正在執行的Thread，而且交易結束即自動關閉。
		//同步安全，最適合
		
		session.beginTransaction();//開啟交易 才能使用
		//=======================交易區間=================
		
		String dateString = "2024-06-21 08:30:00";
	    Timestamp timestamp = Timestamp.valueOf(dateString);
		WaitingVO waiVO=new WaitingVO(3,timestamp,5,"搞鬼online");
		session.save(waiVO);
		
		
		//=======================以上====================
		session.getTransaction().commit();//簡化寫法  Transaction tx=session.beginTransaction(); tx.commit(); 兩段拿掉了
//		session.close();
		
	}

}
