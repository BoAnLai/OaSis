package com.lee.waitingperson.model;

import java.util.List;
import java.util.Scanner;


public class MainTest {
	
	public static void main(String[] args) {
//		insert();
//		SelectAll();
		SelectTotal();
	}
	
	public static void insert() {
		
		Scanner sc=new Scanner(System.in);
		System.out.println("等待列隊號碼");
		Integer waitingPersonWaitingID=sc.nextInt();
		System.out.println("等待者ID");
		Integer waitingPersinUserID=sc.nextInt();
		
		WaitingPersonVO watp=new WaitingPersonVO(waitingPersonWaitingID,waitingPersinUserID);
		
		WaitingPersonInterface wapi=new WaitingPersonDao();
		wapi.insert(watp);	
	}
	
	public static void SelectAll() {
		
		System.out.println("方法開始");
		WaitingPersonInterface wp=new WaitingPersonDao();
		List<WaitingPersonVO> wpList=wp.getAll(3);
		
		
		for(WaitingPersonVO w:wpList) {
			System.out.println(w);
		}
		System.out.println("查詢完畢!");
	}
	
	public static void SelectTotal() {	
		WaitingPersonInterface wp=new WaitingPersonDao();
		List<WaitingPersonVO> wpList=wp.getAll();
		
		
		for(WaitingPersonVO w:wpList) {
			System.out.println(w);
		}
		System.out.println("查詢完畢!");
	}

}
