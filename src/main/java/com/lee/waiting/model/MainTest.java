package com.lee.waiting.model;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Scanner;


public class MainTest {
	
	
	public static void main(String[] args) throws ParseException {
		
//		getOne();
//		Insert();
//		SelectAll();
		selectMyRoom();
//		UpdateMaxPeople();
//		UpdateReserve();
		
	}
	

		
	
	
	
	public static void Insert() throws ParseException {
		
		Scanner sc=new Scanner(System.in);
		
		System.out.println("請輸入您的使用者ID:");
		int waitingUserId=sc.nextInt();
		
		System.out.println("請輸入您想預約的時間 格式:yyyy-MM-dd/HH:mm");
        String inputTime = sc.next();
        
		System.out.println("請輸入房間人數上限:");
		int waitingMaxPeople=sc.nextInt();
		
		
		Timestamp waitingReserve = null;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd/HH:mm");
        
        java.util.Date parsedDate = dateFormat.parse(inputTime);
        waitingReserve = new Timestamp(parsedDate.getTime());
        
//        WaitingVO wt=new WaitingVO(waitingUserId,waitingReserve,waitingMaxPeople);
        
        
		WaitingInterface wdo=new WaitingDaoImpl();
//		wdo.insert(wt);
		
		System.out.println("新增完成!");
		sc.close();
	}
		
	
	
	public static void SelectAll() {
			
			WaitingInterface wd=new WaitingDaoImpl();
			List<WaitingVO> wtList=wd.getTotal();
			
			
			
			for(WaitingVO w:wtList) {
				
					System.out.println(w);

			}
			System.out.println("查詢完畢!");
		}
	
	public static void getOne() {
		
		Scanner sc=new Scanner(System.in);
		
		System.out.println("請輸入要查詢的組隊ID:");
		int waitingId=sc.nextInt();
		
		
		WaitingInterface wd=new WaitingDaoImpl();
		WaitingVO waiVo= wd.getOne(waitingId);
		System.out.println(waiVo);
	}
	
	
	public static void selectMyRoom() {
		
		Scanner sc=new Scanner(System.in);
		
		System.out.println("請輸入玩家編號:");
		int waitingUserId=sc.nextInt();
		
		
		WaitingInterface wd=new WaitingDaoImpl();
		List<WaitingVO> waiList= wd.getMyRoom(waitingUserId);
		for(WaitingVO w:waiList) {
			
			System.out.println(w);

	}
	}
		
	

}
